package jiglib.physics
{
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import jiglib.cof.JConfig;
   import jiglib.collision.CollisionInfo;
   import jiglib.data.CollOutData;
   import jiglib.geometry.JAABox;
   import jiglib.geometry.JSegment;
   import jiglib.math.JMatrix3D;
   import jiglib.math.JNumber3D;
   import jiglib.physics.constraint.JConstraint;
   import jiglib.plugin.ISkin3D;
   
   public class RigidBody
   {
      
      private static var idCounter:int = 0;
      
      private var _id:int;
      
      private var _skin:ISkin3D;
      
      protected var _type:String;
      
      protected var _boundingSphere:Number;
      
      protected var _boundingBox:JAABox;
      
      protected var _currState:PhysicsState;
      
      private var _oldState:PhysicsState;
      
      private var _storeState:PhysicsState;
      
      private var _invOrientation:Matrix3D;
      
      private var _currLinVelocityAux:Vector3D;
      
      private var _currRotVelocityAux:Vector3D;
      
      private var _mass:Number;
      
      private var _invMass:Number;
      
      private var _bodyInertia:Matrix3D;
      
      private var _bodyInvInertia:Matrix3D;
      
      private var _worldInertia:Matrix3D;
      
      private var _worldInvInertia:Matrix3D;
      
      private var _force:Vector3D;
      
      private var _torque:Vector3D;
      
      private var _doShockProcessing:Boolean;
      
      private var _linVelDamping:Vector3D;
      
      private var _rotVelDamping:Vector3D;
      
      private var _maxLinVelocities:Number;
      
      private var _maxRotVelocities:Number;
      
      private var _velChanged:Boolean;
      
      private var _activity:Boolean;
      
      private var _movable:Boolean;
      
      private var _origMovable:Boolean;
      
      private var _inactiveTime:Number;
      
      private var _bodiesToBeActivatedOnMovement:Vector.<RigidBody>;
      
      private var _storedPositionForActivation:Vector3D;
      
      private var _lastPositionForDeactivation:Vector3D;
      
      private var _lastOrientationForDeactivation:Matrix3D;
      
      private var _material:MaterialProperties;
      
      private var _rotationX:Number = 0;
      
      private var _rotationY:Number = 0;
      
      private var _rotationZ:Number = 0;
      
      private var _useDegrees:Boolean;
      
      private var _nonCollidables:Vector.<RigidBody>;
      
      private var _constraints:Vector.<JConstraint>;
      
      public var collisions:Vector.<CollisionInfo>;
      
      public var userData:uint;
      
      private var _gravity:Vector3D;
      
      private var _gravityAxis:int;
      
      private var _gravityForce:Vector3D;
      
      public var isActive:Boolean;
      
      public function RigidBody(skin:ISkin3D)
      {
         super();
         this._useDegrees = JConfig.rotationType == "DEGREES" ? true : false;
         this._id = idCounter++;
         this._skin = skin;
         this._material = new MaterialProperties();
         this._bodyInertia = new Matrix3D();
         this._bodyInvInertia = JMatrix3D.getInverseMatrix(this._bodyInertia);
         this._currState = new PhysicsState();
         this._oldState = new PhysicsState();
         this._storeState = new PhysicsState();
         this._currLinVelocityAux = new Vector3D();
         this._currRotVelocityAux = new Vector3D();
         this._force = new Vector3D();
         this._torque = new Vector3D();
         this._invOrientation = JMatrix3D.getInverseMatrix(this._currState.orientation);
         this._linVelDamping = new Vector3D(0.995,0.995,0.995);
         this._rotVelDamping = new Vector3D(0.995,0.995,0.995);
         this._maxLinVelocities = 500;
         this._maxRotVelocities = 50;
         this._doShockProcessing = true;
         this._velChanged = false;
         this._inactiveTime = 0;
         this.isActive = this._activity = true;
         this._movable = true;
         this._origMovable = true;
         this.collisions = new Vector.<CollisionInfo>();
         this._constraints = new Vector.<JConstraint>();
         this._nonCollidables = new Vector.<RigidBody>();
         this._storedPositionForActivation = new Vector3D();
         this._bodiesToBeActivatedOnMovement = new Vector.<RigidBody>();
         this._lastPositionForDeactivation = this._currState.position.clone();
         this._lastOrientationForDeactivation = this._currState.orientation.clone();
         this._type = "Object3D";
         this._boundingSphere = 0;
         this._boundingBox = new JAABox(new Vector3D(),new Vector3D());
         this._boundingBox.clear();
         this.userData = 0;
      }
      
      protected static function formatRotation(angle:Number) : Number
      {
         if(angle >= -180 && angle <= 180)
         {
            return angle;
         }
         var angle2:Number = angle % 360;
         if(angle2 < -180)
         {
            return angle2 + 360;
         }
         if(angle2 > 180)
         {
            return angle2 - 360;
         }
         return angle2;
      }
      
      private function radiansToDegrees(rad:Number) : Number
      {
         return rad * 180 / Math.PI;
      }
      
      private function degreesToRadians(deg:Number) : Number
      {
         return deg * Math.PI / 180;
      }
      
      public function updateRotationValues() : void
      {
         var rotationVector:Vector3D = this._currState.orientation.decompose()[1];
         this._rotationX = formatRotation(this.radiansToDegrees(rotationVector.x));
         this._rotationY = formatRotation(this.radiansToDegrees(rotationVector.y));
         this._rotationZ = formatRotation(this.radiansToDegrees(rotationVector.z));
      }
      
      public function get rotationX() : Number
      {
         return this._rotationX;
      }
      
      public function get rotationY() : Number
      {
         return this._rotationY;
      }
      
      public function get rotationZ() : Number
      {
         return this._rotationZ;
      }
      
      public function set rotationX(px:Number) : void
      {
         this._rotationX = px;
         this.setOrientation(this.createRotationMatrix());
      }
      
      public function set rotationY(py:Number) : void
      {
         this._rotationY = py;
         this.setOrientation(this.createRotationMatrix());
      }
      
      public function set rotationZ(pz:Number) : void
      {
         this._rotationZ = pz;
         this.setOrientation(this.createRotationMatrix());
      }
      
      public function pitch(rot:Number) : void
      {
         this.setOrientation(JMatrix3D.getAppendMatrix3D(this.currentState.orientation,JMatrix3D.getRotationMatrixAxis(rot,Vector3D.X_AXIS)));
      }
      
      public function yaw(rot:Number) : void
      {
         this.setOrientation(JMatrix3D.getAppendMatrix3D(this.currentState.orientation,JMatrix3D.getRotationMatrixAxis(rot,Vector3D.Y_AXIS)));
      }
      
      public function roll(rot:Number) : void
      {
         this.setOrientation(JMatrix3D.getAppendMatrix3D(this.currentState.orientation,JMatrix3D.getRotationMatrixAxis(rot,Vector3D.Z_AXIS)));
      }
      
      private function createRotationMatrix() : Matrix3D
      {
         var matrix3D:Matrix3D = new Matrix3D();
         matrix3D.appendRotation(this._rotationX,Vector3D.X_AXIS);
         matrix3D.appendRotation(this._rotationY,Vector3D.Y_AXIS);
         matrix3D.appendRotation(this._rotationZ,Vector3D.Z_AXIS);
         return matrix3D;
      }
      
      public function setOrientation(orient:Matrix3D) : void
      {
         this._currState.orientation = orient.clone();
         this.updateInertia();
         this.updateState();
      }
      
      public function get x() : Number
      {
         return this._currState.position.x;
      }
      
      public function get y() : Number
      {
         return this._currState.position.y;
      }
      
      public function get z() : Number
      {
         return this._currState.position.z;
      }
      
      public function set x(px:Number) : void
      {
         this._currState.position.x = px;
         this.updateState();
      }
      
      public function set y(py:Number) : void
      {
         this._currState.position.y = py;
         this.updateState();
      }
      
      public function set z(pz:Number) : void
      {
         this._currState.position.z = pz;
         this.updateState();
      }
      
      public function moveTo(pos:Vector3D) : void
      {
         this._currState.position = pos.clone();
         this.updateState();
      }
      
      protected function updateState() : void
      {
         this._currState.linVelocity = new Vector3D();
         this._currState.rotVelocity = new Vector3D();
         this.copyCurrentStateToOld();
         this.updateBoundingBox();
      }
      
      public function setVelocity(vel:Vector3D) : void
      {
         this._currState.linVelocity = vel.clone();
      }
      
      public function setAngVel(angVel:Vector3D) : void
      {
         this._currState.rotVelocity = angVel.clone();
      }
      
      public function setVelocityAux(vel:Vector3D) : void
      {
         this._currLinVelocityAux = vel.clone();
      }
      
      public function setAngVelAux(angVel:Vector3D) : void
      {
         this._currRotVelocityAux = angVel.clone();
      }
      
      public function updateGravity(gravity:Vector3D, gravityAxis:int) : void
      {
         this._gravity = gravity;
         this._gravityAxis = gravityAxis;
         this._gravityForce = JNumber3D.getScaleVector(this._gravity,this._mass);
      }
      
      public function addGravity() : void
      {
         if(!this._movable)
         {
            return;
         }
         this._force = this._force.add(this._gravityForce);
         this._velChanged = true;
      }
      
      public function addExternalForces(dt:Number) : void
      {
         this.addGravity();
      }
      
      public function addWorldTorque(t:Vector3D) : void
      {
         if(!this._movable)
         {
            return;
         }
         this._torque = this._torque.add(t);
         this._velChanged = true;
         this.setActive();
      }
      
      public function addBodyTorque(t:Vector3D) : void
      {
         if(!this._movable)
         {
            return;
         }
         this.addWorldTorque(this._currState.orientation.transformVector(t));
      }
      
      public function addWorldForce(f:Vector3D, p:Vector3D) : void
      {
         if(!this._movable)
         {
            return;
         }
         this._force = this._force.add(f);
         this.addWorldTorque(p.subtract(this._currState.position).crossProduct(f));
         this._velChanged = true;
         this.setActive();
      }
      
      public function addBodyForce(f:Vector3D, p:Vector3D) : void
      {
         if(!this._movable)
         {
            return;
         }
         f = this._currState.orientation.transformVector(f);
         p = this._currState.orientation.transformVector(p);
         this.addWorldForce(f,this._currState.position.add(p));
      }
      
      public function clearForces() : void
      {
         this._force = new Vector3D();
         this._torque = new Vector3D();
      }
      
      public function applyWorldImpulse(impulse:Vector3D, pos:Vector3D) : void
      {
         if(!this._movable)
         {
            return;
         }
         this._currState.linVelocity = this._currState.linVelocity.add(JNumber3D.getScaleVector(impulse,this._invMass));
         var rotImpulse:Vector3D = pos.subtract(this._currState.position).crossProduct(impulse);
         rotImpulse = this._worldInvInertia.transformVector(rotImpulse);
         this._currState.rotVelocity = this._currState.rotVelocity.add(rotImpulse);
         this._velChanged = true;
      }
      
      public function applyWorldImpulseAux(impulse:Vector3D, pos:Vector3D) : void
      {
         if(!this._movable)
         {
            return;
         }
         this._currLinVelocityAux = this._currLinVelocityAux.add(JNumber3D.getScaleVector(impulse,this._invMass));
         var rotImpulse:Vector3D = pos.subtract(this._currState.position).crossProduct(impulse);
         rotImpulse = this._worldInvInertia.transformVector(rotImpulse);
         this._currRotVelocityAux = this._currRotVelocityAux.add(rotImpulse);
         this._velChanged = true;
      }
      
      public function applyBodyWorldImpulse(impulse:Vector3D, delta:Vector3D) : void
      {
         if(!this._movable)
         {
            return;
         }
         this._currState.linVelocity = this._currState.linVelocity.add(JNumber3D.getScaleVector(impulse,this._invMass));
         var rotImpulse:Vector3D = delta.crossProduct(impulse);
         rotImpulse = this._worldInvInertia.transformVector(rotImpulse);
         this._currState.rotVelocity = this._currState.rotVelocity.add(rotImpulse);
         this._velChanged = true;
      }
      
      public function applyBodyWorldImpulseAux(impulse:Vector3D, delta:Vector3D) : void
      {
         if(!this._movable)
         {
            return;
         }
         this._currLinVelocityAux = this._currLinVelocityAux.add(JNumber3D.getScaleVector(impulse,this._invMass));
         var rotImpulse:Vector3D = delta.crossProduct(impulse);
         rotImpulse = this._worldInvInertia.transformVector(rotImpulse);
         this._currRotVelocityAux = this._currRotVelocityAux.add(rotImpulse);
         this._velChanged = true;
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
      
      private function findConstraint(constraint:JConstraint) : Boolean
      {
         return this._constraints.indexOf(constraint) > -1;
      }
      
      public function updateVelocity(dt:Number) : void
      {
         if(!this._movable || !this._activity)
         {
            return;
         }
         this._currState.linVelocity = this._currState.linVelocity.add(JNumber3D.getScaleVector(this._force,this._invMass * dt));
         var rac:Vector3D = JNumber3D.getScaleVector(this._torque,dt);
         rac = this._worldInvInertia.transformVector(rac);
         this._currState.rotVelocity = this._currState.rotVelocity.add(rac);
      }
      
      public function updatePositionWithAux(dt:Number) : void
      {
         var arr:Array = null;
         var rot:Matrix3D = null;
         if(!this._movable || !this._activity)
         {
            this._currLinVelocityAux = new Vector3D();
            this._currRotVelocityAux = new Vector3D();
            return;
         }
         var ga:int = this._gravityAxis;
         if(ga != -1)
         {
            arr = JNumber3D.toArray(this._currLinVelocityAux);
            arr[(ga + 1) % 3] *= 0.1;
            arr[(ga + 2) % 3] *= 0.1;
            JNumber3D.copyFromArray(this._currLinVelocityAux,arr);
         }
         var angMomBefore:Vector3D = this._worldInertia.transformVector(this._currState.rotVelocity);
         this._currState.position = this._currState.position.add(JNumber3D.getScaleVector(this._currState.linVelocity.add(this._currLinVelocityAux),dt));
         var dir:Vector3D = this._currState.rotVelocity.add(this._currRotVelocityAux);
         var ang:Number = dir.length * 180 / Math.PI;
         if(ang > 0)
         {
            dir.normalize();
            ang *= dt;
            rot = JMatrix3D.getRotationMatrix(dir.x,dir.y,dir.z,ang);
            this._currState.orientation = JMatrix3D.getAppendMatrix3D(this._currState.orientation,rot);
            this.updateInertia();
         }
         this._currLinVelocityAux = new Vector3D();
         this._currRotVelocityAux = new Vector3D();
         angMomBefore = this._worldInvInertia.transformVector(angMomBefore);
         this._currState.rotVelocity = angMomBefore.clone();
         this.updateBoundingBox();
      }
      
      public function postPhysics(dt:Number) : void
      {
      }
      
      public function tryToFreeze(dt:Number) : void
      {
         if(!this._movable || !this._activity)
         {
            return;
         }
         if(this._currState.position.subtract(this._lastPositionForDeactivation).length > JConfig.posThreshold)
         {
            this._lastPositionForDeactivation = this._currState.position.clone();
            this._inactiveTime = 0;
            return;
         }
         var ot:Number = JConfig.orientThreshold;
         var deltaMat:Matrix3D = JMatrix3D.getSubMatrix(this._currState.orientation,this._lastOrientationForDeactivation);
         var cols:Vector.<Vector3D> = JMatrix3D.getCols(deltaMat);
         if(cols[0].length > ot || cols[1].length > ot || cols[2].length > ot)
         {
            this._lastOrientationForDeactivation = this._currState.orientation.clone();
            this._inactiveTime = 0;
            return;
         }
         if(this.getShouldBeActive())
         {
            return;
         }
         this._inactiveTime += dt;
         if(this._inactiveTime > JConfig.deactivationTime)
         {
            this._lastPositionForDeactivation = this._currState.position.clone();
            this._lastOrientationForDeactivation = this._currState.orientation.clone();
            this.setInactive();
         }
      }
      
      public function set mass(m:Number) : void
      {
         this._mass = m;
         this._invMass = 1 / m;
         this.setInertia(this.getInertiaProperties(m));
         var physicsSystem:PhysicsSystem = PhysicsSystem.getInstance();
         this.updateGravity(physicsSystem.gravity,physicsSystem.gravityAxis);
      }
      
      public function setInertia(matrix3D:Matrix3D) : void
      {
         this._bodyInertia = matrix3D.clone();
         this._bodyInvInertia = JMatrix3D.getInverseMatrix(this._bodyInertia.clone());
         this.updateInertia();
      }
      
      public function updateInertia() : void
      {
         this._invOrientation = JMatrix3D.getTransposeMatrix(this._currState.orientation);
         this._worldInertia = JMatrix3D.getAppendMatrix3D(this._invOrientation,JMatrix3D.getAppendMatrix3D(this._currState.orientation,this._bodyInertia));
         this._worldInvInertia = JMatrix3D.getAppendMatrix3D(this._invOrientation,JMatrix3D.getAppendMatrix3D(this._currState.orientation,this._bodyInvInertia));
      }
      
      public function get movable() : Boolean
      {
         return this._movable;
      }
      
      public function set movable(mov:Boolean) : void
      {
         if(this._type == "PLANE" || this._type == "TERRAIN")
         {
            return;
         }
         this._movable = mov;
         this.isActive = this._activity = mov;
         this._origMovable = mov;
      }
      
      public function internalSetImmovable() : void
      {
         this._origMovable = this._movable;
         this._movable = false;
      }
      
      public function internalRestoreImmovable() : void
      {
         this._movable = this._origMovable;
      }
      
      public function getVelChanged() : Boolean
      {
         return this._velChanged;
      }
      
      public function clearVelChanged() : void
      {
         this._velChanged = false;
      }
      
      public function setActive(activityFactor:Number = 1) : void
      {
         if(this._movable)
         {
            this.isActive = this._activity = true;
            this._inactiveTime = (1 - activityFactor) * JConfig.deactivationTime;
         }
      }
      
      public function setInactive() : void
      {
         if(this._movable)
         {
            this.isActive = this._activity = false;
         }
      }
      
      public function getVelocity(relPos:Vector3D) : Vector3D
      {
         return this._currState.linVelocity.add(this._currState.rotVelocity.crossProduct(relPos));
      }
      
      public function getVelocityAux(relPos:Vector3D) : Vector3D
      {
         return this._currLinVelocityAux.add(this._currRotVelocityAux.crossProduct(relPos));
      }
      
      public function getShouldBeActive() : Boolean
      {
         return this._currState.linVelocity.length > JConfig.velThreshold || this._currState.rotVelocity.length > JConfig.angVelThreshold;
      }
      
      public function getShouldBeActiveAux() : Boolean
      {
         return this._currLinVelocityAux.length > JConfig.velThreshold || this._currRotVelocityAux.length > JConfig.angVelThreshold;
      }
      
      public function dampForDeactivation() : void
      {
         this._currState.linVelocity.x *= this._linVelDamping.x;
         this._currState.linVelocity.y *= this._linVelDamping.y;
         this._currState.linVelocity.z *= this._linVelDamping.z;
         this._currState.rotVelocity.x *= this._rotVelDamping.x;
         this._currState.rotVelocity.y *= this._rotVelDamping.y;
         this._currState.rotVelocity.z *= this._rotVelDamping.z;
         this._currLinVelocityAux.x *= this._linVelDamping.x;
         this._currLinVelocityAux.y *= this._linVelDamping.y;
         this._currLinVelocityAux.z *= this._linVelDamping.z;
         this._currRotVelocityAux.x *= this._rotVelDamping.x;
         this._currRotVelocityAux.y *= this._rotVelDamping.y;
         this._currRotVelocityAux.z *= this._rotVelDamping.z;
         var r:Number = 0.5;
         var frac:Number = this._inactiveTime / JConfig.deactivationTime;
         if(frac < r)
         {
            return;
         }
         var scale:Number = 1 - (frac - r) / (1 - r);
         if(scale < 0)
         {
            scale = 0;
         }
         else if(scale > 1)
         {
            scale = 1;
         }
         this._currState.linVelocity = JNumber3D.getScaleVector(this._currState.linVelocity,scale);
         this._currState.rotVelocity = JNumber3D.getScaleVector(this._currState.rotVelocity,scale);
      }
      
      public function doMovementActivations(physicsSystem:PhysicsSystem) : void
      {
         var body:RigidBody = null;
         if(this._bodiesToBeActivatedOnMovement.length == 0 || this._currState.position.subtract(this._storedPositionForActivation).length < JConfig.posThreshold)
         {
            return;
         }
         for each(body in this._bodiesToBeActivatedOnMovement)
         {
            physicsSystem.activateObject(body);
         }
         this._bodiesToBeActivatedOnMovement = new Vector.<RigidBody>();
      }
      
      public function addMovementActivation(pos:Vector3D, otherBody:RigidBody) : void
      {
         if(this._bodiesToBeActivatedOnMovement.indexOf(otherBody) > -1)
         {
            return;
         }
         if(this._bodiesToBeActivatedOnMovement.length == 0)
         {
            this._storedPositionForActivation = pos;
         }
         this._bodiesToBeActivatedOnMovement.push(otherBody);
      }
      
      public function setConstraintsAndCollisionsUnsatisfied() : void
      {
         var _constraint:JConstraint = null;
         var _collision:CollisionInfo = null;
         for each(_constraint in this._constraints)
         {
            _constraint.satisfied = false;
         }
         for each(_collision in this.collisions)
         {
            _collision.satisfied = false;
         }
      }
      
      public function segmentIntersect(out:CollOutData, seg:JSegment, state:PhysicsState) : Boolean
      {
         return false;
      }
      
      public function getInertiaProperties(m:Number) : Matrix3D
      {
         return new Matrix3D();
      }
      
      protected function updateBoundingBox() : void
      {
      }
      
      public function hitTestObject3D(obj3D:RigidBody) : Boolean
      {
         var num1:Number = this._currState.position.subtract(obj3D.currentState.position).length;
         var num2:Number = this._boundingSphere + obj3D.boundingSphere;
         if(num1 <= num2)
         {
            return true;
         }
         return false;
      }
      
      private function findNonCollidablesBody(body:RigidBody) : Boolean
      {
         return this._nonCollidables.indexOf(body) > -1;
      }
      
      public function disableCollisions(body:RigidBody) : void
      {
         if(!this.findNonCollidablesBody(body))
         {
            this._nonCollidables.push(body);
         }
      }
      
      public function enableCollisions(body:RigidBody) : void
      {
         if(this.findNonCollidablesBody(body))
         {
            this._nonCollidables.splice(this._nonCollidables.indexOf(body),1);
         }
      }
      
      public function copyCurrentStateToOld() : void
      {
         this._oldState.position = this._currState.position.clone();
         this._oldState.orientation = this._currState.orientation.clone();
         this._oldState.linVelocity = this._currState.linVelocity.clone();
         this._oldState.rotVelocity = this._currState.rotVelocity.clone();
      }
      
      public function storeState() : void
      {
         this._storeState.position = this._currState.position.clone();
         this._storeState.orientation = this._currState.orientation.clone();
         this._storeState.linVelocity = this._currState.linVelocity.clone();
         this._storeState.rotVelocity = this._currState.rotVelocity.clone();
      }
      
      public function restoreState() : void
      {
         this._currState.position = this._storeState.position.clone();
         this._currState.orientation = this._storeState.orientation.clone();
         this._currState.linVelocity = this._storeState.linVelocity.clone();
         this._currState.rotVelocity = this._storeState.rotVelocity.clone();
      }
      
      public function get currentState() : PhysicsState
      {
         return this._currState;
      }
      
      public function get oldState() : PhysicsState
      {
         return this._oldState;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get skin() : ISkin3D
      {
         return this._skin;
      }
      
      public function get boundingSphere() : Number
      {
         return this._boundingSphere;
      }
      
      public function get boundingBox() : JAABox
      {
         return this._boundingBox;
      }
      
      public function get force() : Vector3D
      {
         return this._force;
      }
      
      public function get mass() : Number
      {
         return this._mass;
      }
      
      public function get invMass() : Number
      {
         return this._invMass;
      }
      
      public function get worldInertia() : Matrix3D
      {
         return this._worldInertia;
      }
      
      public function get worldInvInertia() : Matrix3D
      {
         return this._worldInvInertia;
      }
      
      public function get nonCollidables() : Vector.<RigidBody>
      {
         return this._nonCollidables;
      }
      
      public function get doShockProcessing() : Boolean
      {
         return this._doShockProcessing;
      }
      
      public function set doShockProcessing(doShock:Boolean) : void
      {
         this._doShockProcessing = doShock;
      }
      
      public function get constraints() : Vector.<JConstraint>
      {
         return this._constraints;
      }
      
      public function set linVelocityDamping(vel:Vector3D) : void
      {
         this._linVelDamping.x = JNumber3D.getLimiteNumber(vel.x,0,1);
         this._linVelDamping.y = JNumber3D.getLimiteNumber(vel.y,0,1);
         this._linVelDamping.z = JNumber3D.getLimiteNumber(vel.z,0,1);
      }
      
      public function get linVelocityDamping() : Vector3D
      {
         return this._linVelDamping;
      }
      
      public function set rotVelocityDamping(vel:Vector3D) : void
      {
         this._rotVelDamping.x = JNumber3D.getLimiteNumber(vel.x,0,1);
         this._rotVelDamping.y = JNumber3D.getLimiteNumber(vel.y,0,1);
         this._rotVelDamping.z = JNumber3D.getLimiteNumber(vel.z,0,1);
      }
      
      public function get rotVelocityDamping() : Vector3D
      {
         return this._rotVelDamping;
      }
      
      public function set maxLinVelocities(vel:Number) : void
      {
         this._maxLinVelocities = JNumber3D.getLimiteNumber(Math.abs(vel),0,500);
      }
      
      public function get maxLinVelocities() : Number
      {
         return this._maxLinVelocities;
      }
      
      public function set maxRotVelocities(vel:Number) : void
      {
         this._maxRotVelocities = JNumber3D.getLimiteNumber(Math.abs(vel),JNumber3D.NUM_TINY,50);
      }
      
      public function get maxRotVelocities() : Number
      {
         return this._maxRotVelocities;
      }
      
      public function limitVel() : void
      {
         this._currState.linVelocity.x = JNumber3D.getLimiteNumber(this._currState.linVelocity.x,-this._maxLinVelocities,this._maxLinVelocities);
         this._currState.linVelocity.y = JNumber3D.getLimiteNumber(this._currState.linVelocity.y,-this._maxLinVelocities,this._maxLinVelocities);
         this._currState.linVelocity.z = JNumber3D.getLimiteNumber(this._currState.linVelocity.z,-this._maxLinVelocities,this._maxLinVelocities);
      }
      
      public function limitAngVel() : void
      {
         var fx:Number = Math.abs(this._currState.rotVelocity.x) / this._maxRotVelocities;
         var fy:Number = Math.abs(this._currState.rotVelocity.y) / this._maxRotVelocities;
         var fz:Number = Math.abs(this._currState.rotVelocity.z) / this._maxRotVelocities;
         var f:Number = Math.max(fx,fy,fz);
         if(f > 1)
         {
            this._currState.rotVelocity = JNumber3D.getDivideVector(this._currState.rotVelocity,f);
         }
      }
      
      public function getTransform() : Matrix3D
      {
         return Boolean(this._skin) ? this._skin.transform : null;
      }
      
      public function updateObject3D() : void
      {
         if(this._skin != null)
         {
            this._skin.transform = JMatrix3D.getAppendMatrix3D(this._currState.orientation,JMatrix3D.getTranslationMatrix(this._currState.position.x,this._currState.position.y,this._currState.position.z));
         }
      }
      
      public function get material() : MaterialProperties
      {
         return this._material;
      }
      
      public function get restitution() : Number
      {
         return this._material.restitution;
      }
      
      public function set restitution(restitution:Number) : void
      {
         this._material.restitution = JNumber3D.getLimiteNumber(restitution,0,1);
      }
      
      public function get friction() : Number
      {
         return this._material.friction;
      }
      
      public function set friction(friction:Number) : void
      {
         this._material.friction = JNumber3D.getLimiteNumber(friction,0,1);
      }
   }
}

