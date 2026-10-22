package jiglib.physics
{
   import flash.geom.Vector3D;
   import jiglib.cof.JConfig;
   import jiglib.collision.CollDetectInfo;
   import jiglib.collision.CollPointInfo;
   import jiglib.collision.CollisionInfo;
   import jiglib.collision.CollisionSystem;
   import jiglib.data.ContactData;
   import jiglib.math.JNumber3D;
   import jiglib.physics.constraint.JConstraint;
   
   public class PhysicsSystem
   {
      
      private static var _currentPhysicsSystem:PhysicsSystem;
      
      private const _maxVelMag:Number = 0.5;
      
      private const _minVelForProcessing:Number = 0.001;
      
      private var _bodies:Vector.<RigidBody>;
      
      private var _activeBodies:Vector.<RigidBody>;
      
      private var _collisions:Vector.<CollisionInfo>;
      
      private var _constraints:Vector.<JConstraint>;
      
      private var _controllers:Vector.<PhysicsController>;
      
      private var _gravityAxis:int;
      
      private var _gravity:Vector3D;
      
      private var _doingIntegration:Boolean;
      
      private var preProcessCollisionFn:Function;
      
      private var preProcessContactFn:Function;
      
      private var processCollisionFn:Function;
      
      private var processContactFn:Function;
      
      private var _cachedContacts:Vector.<ContactData>;
      
      private var _collisionSystem:CollisionSystem;
      
      public function PhysicsSystem()
      {
         super();
         this.setSolverType(JConfig.solverType);
         this._doingIntegration = false;
         this._bodies = new Vector.<RigidBody>();
         this._collisions = new Vector.<CollisionInfo>();
         this._activeBodies = new Vector.<RigidBody>();
         this._constraints = new Vector.<JConstraint>();
         this._controllers = new Vector.<PhysicsController>();
         this._cachedContacts = new Vector.<ContactData>();
         this._collisionSystem = new CollisionSystem();
         this.setGravity(JNumber3D.getScaleVector(Vector3D.Y_AXIS,-10));
      }
      
      public static function getInstance() : PhysicsSystem
      {
         if(!_currentPhysicsSystem)
         {
            trace("version: JigLibFlash fp10 v0.50 (2010-8-12)");
            _currentPhysicsSystem = new PhysicsSystem();
         }
         return _currentPhysicsSystem;
      }
      
      private function getAllExternalForces(dt:Number) : void
      {
         var body:RigidBody = null;
         var controller:PhysicsController = null;
         for each(body in this._bodies)
         {
            body.addExternalForces(dt);
         }
         for each(controller in this._controllers)
         {
            controller.updateController(dt);
         }
      }
      
      public function getCollisionSystem() : CollisionSystem
      {
         return this._collisionSystem;
      }
      
      public function setGravity(gravity:Vector3D) : void
      {
         var body:RigidBody = null;
         this._gravity = gravity;
         if(this._gravity.x == this._gravity.y && this._gravity.y == this._gravity.z)
         {
            this._gravityAxis = -1;
         }
         this._gravityAxis = 0;
         if(Math.abs(this._gravity.y) > Math.abs(this._gravity.z))
         {
            this._gravityAxis = 1;
         }
         if(Math.abs(this._gravity.z) > Math.abs(JNumber3D.toArray(this._gravity)[this._gravityAxis]))
         {
            this._gravityAxis = 2;
         }
         for each(body in this._bodies)
         {
            body.updateGravity(this._gravity,this._gravityAxis);
         }
      }
      
      public function get gravity() : Vector3D
      {
         return this._gravity;
      }
      
      public function get gravityAxis() : int
      {
         return this._gravityAxis;
      }
      
      public function get bodies() : Vector.<RigidBody>
      {
         return this._bodies;
      }
      
      public function addBody(body:RigidBody) : void
      {
         if(!this.findBody(body))
         {
            this._bodies.push(body);
            this._collisionSystem.addCollisionBody(body);
            body.updateGravity(this._gravity,this._gravityAxis);
         }
      }
      
      public function removeBody(body:RigidBody) : void
      {
         if(this.findBody(body))
         {
            this._bodies.splice(this._bodies.indexOf(body),1);
            this._collisionSystem.removeCollisionBody(body);
         }
      }
      
      public function removeAllBodies() : void
      {
         this._bodies.splice(0,this._bodies.length);
         this._collisionSystem.removeAllCollisionBodies();
      }
      
      public function addConstraint(constraint:JConstraint) : void
      {
         if(!this.findConstraint(constraint))
         {
            this._constraints.push(constraint);
         }
      }
      
      public function removeConstraint(constraint:JConstraint) : void
      {
         if(this.findConstraint(constraint))
         {
            this._constraints.splice(this._constraints.indexOf(constraint),1);
         }
      }
      
      public function removeAllConstraints() : void
      {
         this._constraints.splice(0,this._constraints.length);
      }
      
      public function addController(controller:PhysicsController) : void
      {
         if(!this.findController(controller))
         {
            this._controllers.push(controller);
         }
      }
      
      public function removeController(controller:PhysicsController) : void
      {
         if(this.findController(controller))
         {
            this._controllers.splice(this._controllers.indexOf(controller),1);
         }
      }
      
      public function removeAllControllers() : void
      {
         this._controllers.splice(0,this._controllers.length);
      }
      
      public function setSolverType(type:String) : void
      {
         switch(type)
         {
            case "FAST":
               this.preProcessCollisionFn = this.preProcessCollisionFast;
               this.preProcessContactFn = this.preProcessCollisionFast;
               this.processCollisionFn = this.processCollisionFast;
               this.processContactFn = this.processCollisionFast;
               return;
            case "NORMAL":
               this.preProcessCollisionFn = this.preProcessCollisionNormal;
               this.preProcessContactFn = this.preProcessCollisionNormal;
               this.processCollisionFn = this.processCollisionNormal;
               this.processContactFn = this.processCollisionNormal;
               return;
            case "ACCUMULATED":
               this.preProcessCollisionFn = this.preProcessCollisionNormal;
               this.preProcessContactFn = this.preProcessCollisionAccumulated;
               this.processCollisionFn = this.processCollisionNormal;
               this.processContactFn = this.processCollisionAccumulated;
               return;
            default:
               this.preProcessCollisionFn = this.preProcessCollisionNormal;
               this.preProcessContactFn = this.preProcessCollisionNormal;
               this.processCollisionFn = this.processCollisionNormal;
               this.processContactFn = this.processCollisionNormal;
               return;
         }
      }
      
      private function findBody(body:RigidBody) : Boolean
      {
         return this._bodies.indexOf(body) > -1;
      }
      
      private function findConstraint(constraint:JConstraint) : Boolean
      {
         return this._constraints.indexOf(constraint) > -1;
      }
      
      private function findController(controller:PhysicsController) : Boolean
      {
         return this._controllers.indexOf(controller) > -1;
      }
      
      private function preProcessCollisionFast(collision:CollisionInfo, dt:Number) : void
      {
         var ptInfo:CollPointInfo = null;
         var tempV:Vector3D = null;
         var avR0:Vector3D = null;
         var avR1:Vector3D = null;
         var avDepth:Number = NaN;
         collision.satisfied = false;
         var body0:RigidBody = collision.objInfo.body0;
         var body1:RigidBody = collision.objInfo.body1;
         var N:Vector3D = collision.dirToBody;
         var timescale:Number = JConfig.numPenetrationRelaxationTimesteps * dt;
         var approachScale:Number = 0;
         var collision_pointInfo:Vector.<CollPointInfo> = collision.pointInfo;
         var ptNum:int = int(collision_pointInfo.length);
         if(ptNum > 1)
         {
            avR0 = new Vector3D();
            avR1 = new Vector3D();
            avDepth = 0;
            for each(ptInfo in collision_pointInfo)
            {
               avR0 = avR0.add(ptInfo.r0);
               avR1 = avR1.add(ptInfo.r1);
               avDepth += ptInfo.initialPenetration;
            }
            avR0 = JNumber3D.getDivideVector(avR0,Number(ptNum));
            avR1 = JNumber3D.getDivideVector(avR1,Number(ptNum));
            avDepth /= ptNum;
            collision_pointInfo = collision.pointInfo = new Vector.<CollPointInfo>(1,true);
            collision_pointInfo[0] = new CollPointInfo();
            collision_pointInfo[0].r0 = avR0;
            collision_pointInfo[0].r1 = avR1;
            collision_pointInfo[0].initialPenetration = avDepth;
         }
         for each(ptInfo in collision_pointInfo)
         {
            if(!body0.movable)
            {
               ptInfo.denominator = 0;
            }
            else
            {
               tempV = ptInfo.r0.crossProduct(N);
               tempV = body0.worldInvInertia.transformVector(tempV);
               ptInfo.denominator = body0.invMass + N.dotProduct(tempV.crossProduct(ptInfo.r0));
            }
            if(body1.movable)
            {
               tempV = ptInfo.r1.crossProduct(N);
               tempV = body1.worldInvInertia.transformVector(tempV);
               ptInfo.denominator += body1.invMass + N.dotProduct(tempV.crossProduct(ptInfo.r1));
            }
            if(ptInfo.denominator < JNumber3D.NUM_TINY)
            {
               ptInfo.denominator = JNumber3D.NUM_TINY;
            }
            if(ptInfo.initialPenetration > JConfig.allowedPenetration)
            {
               ptInfo.minSeparationVel = (ptInfo.initialPenetration - JConfig.allowedPenetration) / timescale;
            }
            else
            {
               approachScale = -0.1 * (ptInfo.initialPenetration - JConfig.allowedPenetration) / JConfig.allowedPenetration;
               if(approachScale < JNumber3D.NUM_TINY)
               {
                  approachScale = JNumber3D.NUM_TINY;
               }
               else if(approachScale > 1)
               {
                  approachScale = 1;
               }
               ptInfo.minSeparationVel = approachScale * (ptInfo.initialPenetration - JConfig.allowedPenetration) / Math.max(dt,JNumber3D.NUM_TINY);
            }
            if(ptInfo.minSeparationVel > this._maxVelMag)
            {
               ptInfo.minSeparationVel = this._maxVelMag;
            }
         }
      }
      
      private function preProcessCollisionNormal(collision:CollisionInfo, dt:Number) : void
      {
         var ptInfo:CollPointInfo = null;
         var tempV:Vector3D = null;
         collision.satisfied = false;
         var body0:RigidBody = collision.objInfo.body0;
         var body1:RigidBody = collision.objInfo.body1;
         var N:Vector3D = collision.dirToBody;
         var timescale:Number = JConfig.numPenetrationRelaxationTimesteps * dt;
         var approachScale:Number = 0;
         var collision_pointInfo:Vector.<CollPointInfo> = collision.pointInfo;
         for each(ptInfo in collision_pointInfo)
         {
            if(!body0.movable)
            {
               ptInfo.denominator = 0;
            }
            else
            {
               tempV = ptInfo.r0.crossProduct(N);
               tempV = body0.worldInvInertia.transformVector(tempV);
               ptInfo.denominator = body0.invMass + N.dotProduct(tempV.crossProduct(ptInfo.r0));
            }
            if(body1.movable)
            {
               tempV = ptInfo.r1.crossProduct(N);
               tempV = body1.worldInvInertia.transformVector(tempV);
               ptInfo.denominator += body1.invMass + N.dotProduct(tempV.crossProduct(ptInfo.r1));
            }
            if(ptInfo.denominator < JNumber3D.NUM_TINY)
            {
               ptInfo.denominator = JNumber3D.NUM_TINY;
            }
            if(ptInfo.initialPenetration > JConfig.allowedPenetration)
            {
               ptInfo.minSeparationVel = (ptInfo.initialPenetration - JConfig.allowedPenetration) / timescale;
            }
            else
            {
               approachScale = -0.1 * (ptInfo.initialPenetration - JConfig.allowedPenetration) / JConfig.allowedPenetration;
               if(approachScale < JNumber3D.NUM_TINY)
               {
                  approachScale = JNumber3D.NUM_TINY;
               }
               else if(approachScale > 1)
               {
                  approachScale = 1;
               }
               ptInfo.minSeparationVel = approachScale * (ptInfo.initialPenetration - JConfig.allowedPenetration) / Math.max(dt,JNumber3D.NUM_TINY);
            }
            if(ptInfo.minSeparationVel > this._maxVelMag)
            {
               ptInfo.minSeparationVel = this._maxVelMag;
            }
         }
      }
      
      private function preProcessCollisionAccumulated(collision:CollisionInfo, dt:Number) : void
      {
         var tempV:Vector3D = null;
         var ptInfo:CollPointInfo = null;
         var bestDistSq:Number = NaN;
         var bp:BodyPair = null;
         var cachedContact:ContactData = null;
         var distSq:Number = NaN;
         var impulse:Vector3D = null;
         collision.satisfied = false;
         var body0:RigidBody = collision.objInfo.body0;
         var body1:RigidBody = collision.objInfo.body1;
         var N:Vector3D = collision.dirToBody;
         var timescale:Number = JConfig.numPenetrationRelaxationTimesteps * dt;
         var approachScale:Number = 0;
         var numTiny:Number = JNumber3D.NUM_TINY;
         var allowedPenetration:Number = JConfig.allowedPenetration;
         var collision_pointInfo:Vector.<CollPointInfo> = collision.pointInfo;
         for each(ptInfo in collision_pointInfo)
         {
            if(!body0.movable)
            {
               ptInfo.denominator = 0;
            }
            else
            {
               tempV = ptInfo.r0.crossProduct(N);
               tempV = body0.worldInvInertia.transformVector(tempV);
               ptInfo.denominator = body0.invMass + N.dotProduct(tempV.crossProduct(ptInfo.r0));
            }
            if(body1.movable)
            {
               tempV = ptInfo.r1.crossProduct(N);
               tempV = body1.worldInvInertia.transformVector(tempV);
               ptInfo.denominator += body1.invMass + N.dotProduct(tempV.crossProduct(ptInfo.r1));
            }
            if(ptInfo.denominator < numTiny)
            {
               ptInfo.denominator = numTiny;
            }
            if(ptInfo.initialPenetration > allowedPenetration)
            {
               ptInfo.minSeparationVel = (ptInfo.initialPenetration - allowedPenetration) / timescale;
            }
            else
            {
               approachScale = -0.1 * (ptInfo.initialPenetration - allowedPenetration) / allowedPenetration;
               if(approachScale < numTiny)
               {
                  approachScale = numTiny;
               }
               else if(approachScale > 1)
               {
                  approachScale = 1;
               }
               ptInfo.minSeparationVel = approachScale * (ptInfo.initialPenetration - allowedPenetration) / Math.max(dt,numTiny);
            }
            ptInfo.accumulatedNormalImpulse = 0;
            ptInfo.accumulatedNormalImpulseAux = 0;
            ptInfo.accumulatedFrictionImpulse = new Vector3D();
            bestDistSq = 0.04;
            bp = new BodyPair(body0,body1,new Vector3D(),new Vector3D());
            for each(cachedContact in this._cachedContacts)
            {
               if(bp.body0 == cachedContact.pair.body0 && bp.body1 == cachedContact.pair.body1)
               {
                  distSq = cachedContact.pair.body0 == body0 ? cachedContact.pair.r.subtract(ptInfo.r0).lengthSquared : cachedContact.pair.r.subtract(ptInfo.r1).lengthSquared;
                  if(distSq < bestDistSq)
                  {
                     bestDistSq = distSq;
                     ptInfo.accumulatedNormalImpulse = cachedContact.impulse.normalImpulse;
                     ptInfo.accumulatedNormalImpulseAux = cachedContact.impulse.normalImpulseAux;
                     ptInfo.accumulatedFrictionImpulse = cachedContact.impulse.frictionImpulse;
                     if(cachedContact.pair.body0 != body0)
                     {
                        ptInfo.accumulatedFrictionImpulse = JNumber3D.getScaleVector(ptInfo.accumulatedFrictionImpulse,-1);
                     }
                  }
               }
            }
            if(ptInfo.accumulatedNormalImpulse != 0)
            {
               impulse = JNumber3D.getScaleVector(N,ptInfo.accumulatedNormalImpulse);
               impulse = impulse.add(ptInfo.accumulatedFrictionImpulse);
               body0.applyBodyWorldImpulse(impulse,ptInfo.r0);
               body1.applyBodyWorldImpulse(JNumber3D.getScaleVector(impulse,-1),ptInfo.r1);
            }
            if(ptInfo.accumulatedNormalImpulseAux != 0)
            {
               impulse = JNumber3D.getScaleVector(N,ptInfo.accumulatedNormalImpulseAux);
               body0.applyBodyWorldImpulseAux(impulse,ptInfo.r0);
               body1.applyBodyWorldImpulseAux(JNumber3D.getScaleVector(impulse,-1),ptInfo.r1);
            }
         }
      }
      
      private function processCollisionFast(collision:CollisionInfo, dt:Number) : Boolean
      {
         var impulse:Vector3D = null;
         var Vr0:Vector3D = null;
         var Vr1:Vector3D = null;
         var ptInfo:CollPointInfo = null;
         var tempV:Vector3D = null;
         var VR:Vector3D = null;
         var tangent_vel:Vector3D = null;
         var tangent_speed:Number = NaN;
         var T:Vector3D = null;
         var denominator:Number = NaN;
         var impulseToReverse:Number = NaN;
         collision.satisfied = true;
         var body0:RigidBody = collision.objInfo.body0;
         var body1:RigidBody = collision.objInfo.body1;
         var gotOne:Boolean = false;
         var N:Vector3D = collision.dirToBody;
         var deltaVel:Number = 0;
         var normalVel:Number = 0;
         var finalNormalVel:Number = 0;
         var normalImpulse:Number = 0;
         var collision_pointInfo:Vector.<CollPointInfo> = collision.pointInfo;
         for each(ptInfo in collision_pointInfo)
         {
            Vr0 = body0.getVelocity(ptInfo.r0);
            Vr1 = body1.getVelocity(ptInfo.r1);
            if(body1.movable)
            {
               normalVel = Vr0.subtract(Vr1).dotProduct(N);
            }
            else
            {
               normalVel = Vr0.dotProduct(N);
            }
            if(normalVel <= ptInfo.minSeparationVel)
            {
               finalNormalVel = -1 * collision.mat.restitution * normalVel;
               if(finalNormalVel < this._minVelForProcessing)
               {
                  finalNormalVel = ptInfo.minSeparationVel;
               }
               deltaVel = finalNormalVel - normalVel;
               if(deltaVel > this._minVelForProcessing)
               {
                  normalImpulse = deltaVel / ptInfo.denominator;
                  gotOne = true;
                  impulse = JNumber3D.getScaleVector(N,normalImpulse);
                  body0.applyBodyWorldImpulse(impulse,ptInfo.r0);
                  body1.applyBodyWorldImpulse(JNumber3D.getScaleVector(impulse,-1),ptInfo.r1);
                  VR = Vr0.clone();
                  if(body1.movable)
                  {
                     VR = VR.subtract(Vr1);
                  }
                  tangent_vel = VR.subtract(JNumber3D.getScaleVector(N,VR.dotProduct(N)));
                  tangent_speed = tangent_vel.length;
                  if(tangent_speed > this._minVelForProcessing)
                  {
                     T = JNumber3D.getDivideVector(tangent_vel,-tangent_speed);
                     denominator = 0;
                     if(body0.movable)
                     {
                        tempV = ptInfo.r0.crossProduct(T);
                        tempV = body0.worldInvInertia.transformVector(tempV);
                        denominator = body0.invMass + T.dotProduct(tempV.crossProduct(ptInfo.r0));
                     }
                     if(body1.movable)
                     {
                        tempV = ptInfo.r1.crossProduct(T);
                        tempV = body1.worldInvInertia.transformVector(tempV);
                        denominator += body1.invMass + T.dotProduct(tempV.crossProduct(ptInfo.r1));
                     }
                     if(denominator > JNumber3D.NUM_TINY)
                     {
                        impulseToReverse = tangent_speed / denominator;
                        T = JNumber3D.getScaleVector(T,impulseToReverse);
                        body0.applyBodyWorldImpulse(T,ptInfo.r0);
                        body1.applyBodyWorldImpulse(JNumber3D.getScaleVector(T,-1),ptInfo.r1);
                     }
                  }
               }
            }
         }
         if(gotOne)
         {
            body0.setConstraintsAndCollisionsUnsatisfied();
            body1.setConstraintsAndCollisionsUnsatisfied();
         }
         return gotOne;
      }
      
      private function processCollisionNormal(collision:CollisionInfo, dt:Number) : Boolean
      {
         var impulse:Vector3D = null;
         var Vr0:Vector3D = null;
         var Vr1:Vector3D = null;
         var ptInfo:CollPointInfo = null;
         var tempV:Vector3D = null;
         var VR:Vector3D = null;
         var tangent_vel:Vector3D = null;
         var tangent_speed:Number = NaN;
         var T:Vector3D = null;
         var denominator:Number = NaN;
         var impulseToReverse:Number = NaN;
         var impulseFromNormalImpulse:Number = NaN;
         var frictionImpulse:Number = NaN;
         collision.satisfied = true;
         var body0:RigidBody = collision.objInfo.body0;
         var body1:RigidBody = collision.objInfo.body1;
         var gotOne:Boolean = false;
         var N:Vector3D = collision.dirToBody;
         var deltaVel:Number = 0;
         var normalVel:Number = 0;
         var finalNormalVel:Number = 0;
         var normalImpulse:Number = 0;
         var collision_pointInfo:Vector.<CollPointInfo> = collision.pointInfo;
         for each(ptInfo in collision_pointInfo)
         {
            Vr0 = body0.getVelocity(ptInfo.r0);
            Vr1 = body1.getVelocity(ptInfo.r1);
            if(body1.movable)
            {
               normalVel = Vr0.subtract(Vr1).dotProduct(N);
            }
            else
            {
               normalVel = Vr0.dotProduct(N);
            }
            if(normalVel <= ptInfo.minSeparationVel)
            {
               finalNormalVel = -1 * collision.mat.restitution * normalVel;
               if(finalNormalVel < this._minVelForProcessing)
               {
                  finalNormalVel = ptInfo.minSeparationVel;
               }
               deltaVel = finalNormalVel - normalVel;
               if(deltaVel > this._minVelForProcessing)
               {
                  normalImpulse = deltaVel / ptInfo.denominator;
                  gotOne = true;
                  impulse = JNumber3D.getScaleVector(N,normalImpulse);
                  body0.applyBodyWorldImpulse(impulse,ptInfo.r0);
                  body1.applyBodyWorldImpulse(JNumber3D.getScaleVector(impulse,-1),ptInfo.r1);
                  VR = Vr0.clone();
                  if(body1.movable)
                  {
                     VR = VR.subtract(Vr1);
                  }
                  tangent_vel = VR.subtract(JNumber3D.getScaleVector(N,VR.dotProduct(N)));
                  tangent_speed = tangent_vel.length;
                  if(tangent_speed > this._minVelForProcessing)
                  {
                     T = JNumber3D.getScaleVector(JNumber3D.getDivideVector(tangent_vel,tangent_speed),-1);
                     denominator = 0;
                     if(body0.movable)
                     {
                        tempV = ptInfo.r0.crossProduct(T);
                        tempV = body0.worldInvInertia.transformVector(tempV);
                        denominator = body0.invMass + T.dotProduct(tempV.crossProduct(ptInfo.r0));
                     }
                     if(body1.movable)
                     {
                        tempV = ptInfo.r1.crossProduct(T);
                        tempV = body1.worldInvInertia.transformVector(tempV);
                        denominator += body1.invMass + T.dotProduct(tempV.crossProduct(ptInfo.r1));
                     }
                     if(denominator > JNumber3D.NUM_TINY)
                     {
                        impulseToReverse = tangent_speed / denominator;
                        impulseFromNormalImpulse = collision.mat.friction * normalImpulse;
                        if(impulseToReverse < impulseFromNormalImpulse)
                        {
                           frictionImpulse = impulseToReverse;
                        }
                        else
                        {
                           frictionImpulse = collision.mat.friction * normalImpulse;
                        }
                        T = JNumber3D.getScaleVector(T,frictionImpulse);
                        body0.applyBodyWorldImpulse(T,ptInfo.r0);
                        body1.applyBodyWorldImpulse(JNumber3D.getScaleVector(T,-1),ptInfo.r1);
                     }
                  }
               }
            }
         }
         if(gotOne)
         {
            body0.setConstraintsAndCollisionsUnsatisfied();
            body1.setConstraintsAndCollisionsUnsatisfied();
         }
         return gotOne;
      }
      
      private function processCollisionAccumulated(collision:CollisionInfo, dt:Number) : Boolean
      {
         var impulse:Vector3D = null;
         var Vr0:Vector3D = null;
         var Vr1:Vector3D = null;
         var ptInfo:CollPointInfo = null;
         var origAccumulatedNormalImpulse:Number = NaN;
         var actualImpulse:Number = NaN;
         var tempV:Vector3D = null;
         var VR:Vector3D = null;
         var tangent_vel:Vector3D = null;
         var tangent_speed:Number = NaN;
         var T:Vector3D = null;
         var denominator:Number = NaN;
         var impulseToReverse:Number = NaN;
         var frictionImpulseVec:Vector3D = null;
         var origAccumulatedFrictionImpulse:Vector3D = null;
         var AFIMag:Number = NaN;
         var maxAllowedAFIMag:Number = NaN;
         var actualFrictionImpulse:Vector3D = null;
         collision.satisfied = true;
         var gotOne:Boolean = false;
         var N:Vector3D = collision.dirToBody;
         var body0:RigidBody = collision.objInfo.body0;
         var body1:RigidBody = collision.objInfo.body1;
         var deltaVel:Number = 0;
         var normalVel:Number = 0;
         var normalImpulse:Number = 0;
         var collision_pointInfo:Vector.<CollPointInfo> = collision.pointInfo;
         for each(ptInfo in collision_pointInfo)
         {
            Vr0 = body0.getVelocity(ptInfo.r0);
            Vr1 = body1.getVelocity(ptInfo.r1);
            if(body1.movable)
            {
               normalVel = Vr0.subtract(Vr1).dotProduct(N);
            }
            else
            {
               normalVel = Vr0.dotProduct(N);
            }
            deltaVel = -normalVel;
            if(ptInfo.minSeparationVel < 0)
            {
               deltaVel += ptInfo.minSeparationVel;
            }
            if(Math.abs(deltaVel) > this._minVelForProcessing)
            {
               normalImpulse = deltaVel / ptInfo.denominator;
               origAccumulatedNormalImpulse = ptInfo.accumulatedNormalImpulse;
               ptInfo.accumulatedNormalImpulse = Math.max(ptInfo.accumulatedNormalImpulse + normalImpulse,0);
               actualImpulse = ptInfo.accumulatedNormalImpulse - origAccumulatedNormalImpulse;
               impulse = JNumber3D.getScaleVector(N,actualImpulse);
               body0.applyBodyWorldImpulse(impulse,ptInfo.r0);
               body1.applyBodyWorldImpulse(JNumber3D.getScaleVector(impulse,-1),ptInfo.r1);
               gotOne = true;
            }
            Vr0 = body0.getVelocityAux(ptInfo.r0);
            Vr1 = body1.getVelocityAux(ptInfo.r1);
            if(body1.movable)
            {
               normalVel = Vr0.subtract(Vr1).dotProduct(N);
            }
            else
            {
               normalVel = Vr0.dotProduct(N);
            }
            deltaVel = -normalVel;
            if(ptInfo.minSeparationVel > 0)
            {
               deltaVel += ptInfo.minSeparationVel;
            }
            if(Math.abs(deltaVel) > this._minVelForProcessing)
            {
               normalImpulse = deltaVel / ptInfo.denominator;
               origAccumulatedNormalImpulse = ptInfo.accumulatedNormalImpulseAux;
               ptInfo.accumulatedNormalImpulseAux = Math.max(ptInfo.accumulatedNormalImpulseAux + normalImpulse,0);
               actualImpulse = ptInfo.accumulatedNormalImpulseAux - origAccumulatedNormalImpulse;
               impulse = JNumber3D.getScaleVector(N,actualImpulse);
               body0.applyBodyWorldImpulseAux(impulse,ptInfo.r0);
               body1.applyBodyWorldImpulseAux(JNumber3D.getScaleVector(impulse,-1),ptInfo.r1);
               gotOne = true;
            }
            if(ptInfo.accumulatedNormalImpulse > 0)
            {
               Vr0 = body0.getVelocity(ptInfo.r0);
               Vr1 = body1.getVelocity(ptInfo.r1);
               VR = Vr0.clone();
               if(body1.movable)
               {
                  VR = VR.subtract(Vr1);
               }
               tangent_vel = VR.subtract(JNumber3D.getScaleVector(N,VR.dotProduct(N)));
               tangent_speed = tangent_vel.length;
               if(tangent_speed > this._minVelForProcessing)
               {
                  T = JNumber3D.getScaleVector(JNumber3D.getDivideVector(tangent_vel,tangent_speed),-1);
                  denominator = 0;
                  if(body0.movable)
                  {
                     tempV = ptInfo.r0.crossProduct(T);
                     tempV = body0.worldInvInertia.transformVector(tempV);
                     denominator = body0.invMass + T.dotProduct(tempV.crossProduct(ptInfo.r0));
                  }
                  if(body1.movable)
                  {
                     tempV = ptInfo.r1.crossProduct(T);
                     tempV = body1.worldInvInertia.transformVector(tempV);
                     denominator += body1.invMass + T.dotProduct(tempV.crossProduct(ptInfo.r1));
                  }
                  if(denominator > JNumber3D.NUM_TINY)
                  {
                     impulseToReverse = tangent_speed / denominator;
                     frictionImpulseVec = JNumber3D.getScaleVector(T,impulseToReverse);
                     origAccumulatedFrictionImpulse = ptInfo.accumulatedFrictionImpulse.clone();
                     ptInfo.accumulatedFrictionImpulse = ptInfo.accumulatedFrictionImpulse.add(frictionImpulseVec);
                     AFIMag = ptInfo.accumulatedFrictionImpulse.length;
                     maxAllowedAFIMag = collision.mat.friction * ptInfo.accumulatedNormalImpulse;
                     if(AFIMag > JNumber3D.NUM_TINY && AFIMag > maxAllowedAFIMag)
                     {
                        ptInfo.accumulatedFrictionImpulse = JNumber3D.getScaleVector(ptInfo.accumulatedFrictionImpulse,maxAllowedAFIMag / AFIMag);
                     }
                     actualFrictionImpulse = ptInfo.accumulatedFrictionImpulse.subtract(origAccumulatedFrictionImpulse);
                     body0.applyBodyWorldImpulse(actualFrictionImpulse,ptInfo.r0);
                     body1.applyBodyWorldImpulse(JNumber3D.getScaleVector(actualFrictionImpulse,-1),ptInfo.r1);
                  }
               }
            }
         }
         if(gotOne)
         {
            body0.setConstraintsAndCollisionsUnsatisfied();
            body1.setConstraintsAndCollisionsUnsatisfied();
         }
         return gotOne;
      }
      
      private function sortPositionX(body0:RigidBody, body1:RigidBody) : Number
      {
         if(body0.currentState.position.x < body1.currentState.position.x)
         {
            return -1;
         }
         if(body0.currentState.position.x > body1.currentState.position.x)
         {
            return 1;
         }
         return 0;
      }
      
      private function sortPositionY(body0:RigidBody, body1:RigidBody) : Number
      {
         if(body0.currentState.position.y < body1.currentState.position.y)
         {
            return -1;
         }
         if(body0.currentState.position.y > body1.currentState.position.y)
         {
            return 1;
         }
         return 0;
      }
      
      private function sortPositionZ(body0:RigidBody, body1:RigidBody) : Number
      {
         if(body0.currentState.position.z < body1.currentState.position.z)
         {
            return -1;
         }
         if(body0.currentState.position.z > body1.currentState.position.z)
         {
            return 1;
         }
         return 0;
      }
      
      private function doShockStep(dt:Number) : void
      {
         var info:CollisionInfo = null;
         var setImmovable:Boolean = false;
         var body_collisions:Vector.<CollisionInfo> = null;
         var body0:RigidBody = null;
         var body1:RigidBody = null;
         var body:RigidBody = null;
         if(Math.abs(this._gravity.x) > Math.abs(this._gravity.y) && Math.abs(this._gravity.x) > Math.abs(this._gravity.z))
         {
            this._bodies = this._bodies.sort(this.sortPositionX);
            this._collisionSystem.collBody = this._collisionSystem.collBody.sort(this.sortPositionX);
         }
         else if(Math.abs(this._gravity.y) > Math.abs(this._gravity.z) && Math.abs(this._gravity.y) > Math.abs(this._gravity.x))
         {
            this._bodies = this._bodies.sort(this.sortPositionY);
            this._collisionSystem.collBody = this._collisionSystem.collBody.sort(this.sortPositionY);
         }
         else if(Math.abs(this._gravity.z) > Math.abs(this._gravity.x) && Math.abs(this._gravity.z) > Math.abs(this._gravity.y))
         {
            this._bodies = this._bodies.sort(this.sortPositionZ);
            this._collisionSystem.collBody = this._collisionSystem.collBody.sort(this.sortPositionZ);
         }
         var gotOne:Boolean = true;
         while(gotOne)
         {
            gotOne = false;
            for each(body in this._bodies)
            {
               if(body.movable && body.doShockProcessing)
               {
                  if(body.collisions.length == 0 || !body.isActive)
                  {
                     body.internalSetImmovable();
                  }
                  else
                  {
                     setImmovable = false;
                     body_collisions = body.collisions;
                     for each(info in body_collisions)
                     {
                        body0 = info.objInfo.body0;
                        body1 = info.objInfo.body1;
                        if(body0 == body && !body1.movable || body1 == body && !body0.movable)
                        {
                           this.preProcessCollisionFast(info,dt);
                           this.processCollisionNormal(info,dt);
                           setImmovable = true;
                        }
                     }
                     if(setImmovable)
                     {
                        body.internalSetImmovable();
                        gotOne = true;
                     }
                  }
               }
            }
         }
         for each(body in this._bodies)
         {
            body.internalRestoreImmovable();
            body_collisions = body.collisions;
            for each(info in body_collisions)
            {
               this.preProcessCollisionFn(info,dt);
               this.processCollisionFn(info,dt);
            }
         }
      }
      
      private function updateContactCache() : void
      {
         var fricImpulse:Vector3D = null;
         var contact:ContactData = null;
         var collInfo_objInfo:CollDetectInfo = null;
         var collInfo_pointInfo:Vector.<CollPointInfo> = null;
         var body0:RigidBody = null;
         var body1:RigidBody = null;
         var collInfo:CollisionInfo = null;
         var ptInfo:CollPointInfo = null;
         this._cachedContacts = new Vector.<ContactData>(0,true);
         var i:int = 0;
         for each(collInfo in this._collisions)
         {
            collInfo_objInfo = collInfo.objInfo;
            body0 = collInfo_objInfo.body0;
            body1 = collInfo_objInfo.body1;
            collInfo_pointInfo = collInfo.pointInfo;
            this._cachedContacts.fixed = false;
            this._cachedContacts.length += collInfo_pointInfo.length;
            this._cachedContacts.fixed = true;
            for each(ptInfo in collInfo_pointInfo)
            {
               fricImpulse = body0.id > body1.id ? ptInfo.accumulatedFrictionImpulse : JNumber3D.getScaleVector(ptInfo.accumulatedFrictionImpulse,-1);
               this._cachedContacts[int(i++)] = contact = new ContactData();
               contact.pair = new BodyPair(body0,body1,ptInfo.r0,ptInfo.r1);
               contact.impulse = new CachedImpulse(ptInfo.accumulatedNormalImpulse,ptInfo.accumulatedNormalImpulseAux,ptInfo.accumulatedFrictionImpulse);
            }
         }
      }
      
      private function handleAllConstraints(dt:Number, iter:int, forceInelastic:Boolean) : void
      {
         var collInfo:CollisionInfo = null;
         var constraint:JConstraint = null;
         var step:int = 0;
         var flag:Boolean = false;
         var gotOne:Boolean = false;
         var iteration:int = 0;
         var len:int = 0;
         var j:int = 0;
         var origNumCollisions:int = int(this._collisions.length);
         if(this._constraints.length > 0)
         {
            for each(constraint in this._constraints)
            {
               constraint.preApply(dt);
            }
            iteration = JConfig.numConstraintIterations;
            for(step = 0; step < iteration; step++)
            {
               gotOne = false;
               for each(constraint in this._constraints)
               {
                  if(!constraint.satisfied)
                  {
                     flag = constraint.apply(dt);
                     gotOne ||= flag;
                  }
               }
               if(!gotOne)
               {
                  break;
               }
            }
         }
         if(forceInelastic)
         {
            for each(collInfo in this._collisions)
            {
               this.preProcessContactFn(collInfo,dt);
               collInfo.mat.restitution = 0;
               collInfo.satisfied = false;
            }
         }
         else
         {
            for each(collInfo in this._collisions)
            {
               this.preProcessCollisionFn(collInfo,dt);
            }
         }
         for(step = 0; step < iter; step++)
         {
            gotOne = false;
            for each(collInfo in this._collisions)
            {
               if(!collInfo.satisfied)
               {
                  if(forceInelastic)
                  {
                     flag = this.processContactFn(collInfo,dt);
                  }
                  else
                  {
                     flag = this.processCollisionFn(collInfo,dt);
                  }
                  gotOne ||= flag;
               }
            }
            this.tryToActivateAllFrozenObjects();
            len = int(this._collisions.length);
            if(forceInelastic)
            {
               for(j = origNumCollisions; j < len; j++)
               {
                  collInfo = this._collisions[int(j)];
                  collInfo.mat.restitution = 0;
                  collInfo.satisfied = false;
                  this.preProcessContactFn(collInfo,dt);
               }
            }
            else
            {
               for(j = origNumCollisions; j < len; j++)
               {
                  this.preProcessCollisionFn(this._collisions[int(j)],dt);
               }
            }
            origNumCollisions = int(this._collisions.length);
            if(!gotOne)
            {
               break;
            }
         }
      }
      
      public function activateObject(body:RigidBody) : void
      {
         var other_body:RigidBody = null;
         var thisBody_normal:Vector3D = null;
         var collisionInfo:CollisionInfo = null;
         if(!body.movable || body.isActive)
         {
            return;
         }
         body.setActive();
         this._activeBodies.fixed = false;
         this._activeBodies.push(body);
         this._activeBodies.fixed = true;
         var orig_num:int = int(this._collisions.length);
         this._collisionSystem.detectCollisions(body,this._collisions);
         var len:int = int(this._collisions.length);
         for each(collisionInfo in this._collisions)
         {
            other_body = collisionInfo.objInfo.body0;
            thisBody_normal = collisionInfo.dirToBody;
            if(other_body == body)
            {
               other_body = collisionInfo.objInfo.body1;
               thisBody_normal = JNumber3D.getScaleVector(collisionInfo.dirToBody,-1);
            }
            if(!other_body.isActive && other_body.force.dotProduct(thisBody_normal) < -JNumber3D.NUM_TINY)
            {
               this.activateObject(other_body);
            }
         }
      }
      
      private function dampAllActiveBodies() : void
      {
         var activeBody:RigidBody = null;
         for each(activeBody in this._activeBodies)
         {
            activeBody.dampForDeactivation();
         }
      }
      
      private function tryToActivateAllFrozenObjects() : void
      {
         var body:RigidBody = null;
         for each(body in this._bodies)
         {
            if(!body.isActive)
            {
               if(body.getShouldBeActive())
               {
                  this.activateObject(body);
               }
               else if(body.getVelChanged())
               {
                  body.setVelocity(new Vector3D());
                  body.setAngVel(new Vector3D());
                  body.clearVelChanged();
               }
            }
         }
      }
      
      private function activateAllFrozenObjectsLeftHanging() : void
      {
         var other_body:RigidBody = null;
         var body_collisions:Vector.<CollisionInfo> = null;
         var body:RigidBody = null;
         var collisionInfo:CollisionInfo = null;
         for each(body in this._bodies)
         {
            if(body.isActive)
            {
               body.doMovementActivations(this);
               body_collisions = body.collisions;
               if(body_collisions.length > 0)
               {
                  for each(collisionInfo in body_collisions)
                  {
                     other_body = collisionInfo.objInfo.body0;
                     if(other_body == body)
                     {
                        other_body = collisionInfo.objInfo.body1;
                     }
                     if(!other_body.isActive)
                     {
                        body.addMovementActivation(body.currentState.position,other_body);
                     }
                  }
               }
            }
         }
      }
      
      private function updateAllVelocities(dt:Number) : void
      {
         var activeBody:RigidBody = null;
         for each(activeBody in this._activeBodies)
         {
            activeBody.updateVelocity(dt);
         }
      }
      
      private function updateAllPositions(dt:Number) : void
      {
         var activeBody:RigidBody = null;
         for each(activeBody in this._activeBodies)
         {
            activeBody.updatePositionWithAux(dt);
         }
      }
      
      private function notifyAllPostPhysics(dt:Number) : void
      {
         var body:RigidBody = null;
         for each(body in this._bodies)
         {
            body.postPhysics(dt);
         }
      }
      
      private function updateAllObject3D() : void
      {
         var body:RigidBody = null;
         for each(body in this._bodies)
         {
            body.updateObject3D();
         }
      }
      
      private function limitAllVelocities() : void
      {
         var activeBody:RigidBody = null;
         for each(activeBody in this._activeBodies)
         {
            activeBody.limitVel();
            activeBody.limitAngVel();
         }
      }
      
      private function tryToFreezeAllObjects(dt:Number) : void
      {
         var activeBody:RigidBody = null;
         for each(activeBody in this._activeBodies)
         {
            activeBody.tryToFreeze(dt);
         }
      }
      
      private function detectAllCollisions(dt:Number) : void
      {
         var activeBody:RigidBody = null;
         var body:RigidBody = null;
         for each(activeBody in this._activeBodies)
         {
            activeBody.storeState();
         }
         this.updateAllVelocities(dt);
         this.updateAllPositions(dt);
         for each(body in this._bodies)
         {
            body.collisions = new Vector.<CollisionInfo>();
         }
         this._collisions = new Vector.<CollisionInfo>();
         this._collisionSystem.detectAllCollisions(this._activeBodies,this._collisions);
         for each(activeBody in this._activeBodies)
         {
            activeBody.restoreState();
         }
      }
      
      private function findAllActiveBodiesAndCopyStates() : void
      {
         var body:RigidBody = null;
         this._activeBodies = new Vector.<RigidBody>(this._bodies.length,true);
         var i:int = 0;
         for each(body in this._bodies)
         {
            if(body.isActive)
            {
               this._activeBodies[int(i++)] = body;
               if(body.getVelChanged())
               {
                  body.copyCurrentStateToOld();
               }
            }
         }
         this._activeBodies.fixed = false;
         this._activeBodies.length = i;
         this._activeBodies.fixed = true;
      }
      
      public function integrate(dt:Number) : void
      {
         var body:RigidBody = null;
         this._doingIntegration = true;
         this.findAllActiveBodiesAndCopyStates();
         this.getAllExternalForces(dt);
         this.detectAllCollisions(dt);
         this.handleAllConstraints(dt,JConfig.numCollisionIterations,false);
         this.updateAllVelocities(dt);
         this.handleAllConstraints(dt,JConfig.numContactIterations,true);
         if(JConfig.doShockStep)
         {
            this.doShockStep(dt);
         }
         this.dampAllActiveBodies();
         this.tryToFreezeAllObjects(dt);
         this.activateAllFrozenObjectsLeftHanging();
         this.limitAllVelocities();
         this.updateAllPositions(dt);
         this.notifyAllPostPhysics(dt);
         this.updateAllObject3D();
         if(JConfig.solverType == "ACCUMULATED")
         {
            this.updateContactCache();
         }
         for each(body in this._bodies)
         {
            body.clearForces();
         }
         this._doingIntegration = false;
      }
   }
}

