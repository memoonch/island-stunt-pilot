package jiglib.collision
{
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import jiglib.data.CollOutBodyData;
   import jiglib.geometry.JSegment;
   import jiglib.math.*;
   import jiglib.physics.RigidBody;
   
   public class CollisionSystem
   {
      
      private var detectionFunctors:Dictionary;
      
      public var collBody:Vector.<RigidBody>;
      
      public function CollisionSystem()
      {
         super();
         this.collBody = new Vector.<RigidBody>();
         this.detectionFunctors = new Dictionary(true);
         this.detectionFunctors["BOX_BOX"] = new CollDetectBoxBox();
         this.detectionFunctors["BOX_SPHERE"] = new CollDetectSphereBox();
         this.detectionFunctors["BOX_CAPSULE"] = new CollDetectCapsuleBox();
         this.detectionFunctors["BOX_PLANE"] = new CollDetectBoxPlane();
         this.detectionFunctors["BOX_TERRAIN"] = new CollDetectBoxTerrain();
         this.detectionFunctors["SPHERE_BOX"] = new CollDetectSphereBox();
         this.detectionFunctors["SPHERE_SPHERE"] = new CollDetectSphereSphere();
         this.detectionFunctors["SPHERE_CAPSULE"] = new CollDetectSphereCapsule();
         this.detectionFunctors["SPHERE_PLANE"] = new CollDetectSpherePlane();
         this.detectionFunctors["SPHERE_TERRAIN"] = new CollDetectSphereTerrain();
         this.detectionFunctors["CAPSULE_CAPSULE"] = new CollDetectCapsuleCapsule();
         this.detectionFunctors["CAPSULE_BOX"] = new CollDetectCapsuleBox();
         this.detectionFunctors["CAPSULE_SPHERE"] = new CollDetectSphereCapsule();
         this.detectionFunctors["CAPSULE_PLANE"] = new CollDetectCapsulePlane();
         this.detectionFunctors["CAPSULE_TERRAIN"] = new CollDetectCapsuleTerrain();
         this.detectionFunctors["PLANE_BOX"] = new CollDetectBoxPlane();
         this.detectionFunctors["PLANE_SPHERE"] = new CollDetectSpherePlane();
         this.detectionFunctors["PLANE_CAPSULE"] = new CollDetectCapsulePlane();
         this.detectionFunctors["TERRAIN_SPHERE"] = new CollDetectSphereTerrain();
         this.detectionFunctors["TERRAIN_BOX"] = new CollDetectBoxTerrain();
         this.detectionFunctors["TERRAIN_CAPSULE"] = new CollDetectCapsuleTerrain();
      }
      
      public function addCollisionBody(body:RigidBody) : void
      {
         if(!this.findBody(body))
         {
            this.collBody.push(body);
         }
      }
      
      public function removeCollisionBody(body:RigidBody) : void
      {
         if(this.findBody(body))
         {
            this.collBody.splice(this.collBody.indexOf(body),1);
         }
      }
      
      public function removeAllCollisionBodies() : void
      {
         this.collBody.splice(0,this.collBody.length);
      }
      
      public function detectCollisions(body:RigidBody, collArr:Vector.<CollisionInfo>) : void
      {
         var info:CollDetectInfo = null;
         var fu:CollDetectFunctor = null;
         var _collBody:RigidBody = null;
         if(!body.isActive)
         {
            return;
         }
         for each(_collBody in this.collBody)
         {
            if(body != _collBody && this.checkCollidables(body,_collBody) && this.detectionFunctors[body.type + "_" + _collBody.type] != undefined)
            {
               info = new CollDetectInfo();
               info.body0 = body;
               info.body1 = _collBody;
               fu = this.detectionFunctors[info.body0.type + "_" + info.body1.type];
               fu.collDetect(info,collArr);
            }
         }
      }
      
      public function detectAllCollisions(bodies:Vector.<RigidBody>, collArr:Vector.<CollisionInfo>) : void
      {
         var info:CollDetectInfo = null;
         var fu:CollDetectFunctor = null;
         var bodyID:int = 0;
         var bodyType:String = null;
         var _body:RigidBody = null;
         var _collBody:RigidBody = null;
         for each(_body in bodies)
         {
            bodyID = _body.id;
            bodyType = _body.type;
            for each(_collBody in this.collBody)
            {
               if(_body != _collBody)
               {
                  if(!(_collBody.isActive && bodyID > _collBody.id))
                  {
                     if(this.checkCollidables(_body,_collBody) && this.detectionFunctors[bodyType + "_" + _collBody.type] != undefined)
                     {
                        info = new CollDetectInfo();
                        info.body0 = _body;
                        info.body1 = _collBody;
                        fu = this.detectionFunctors[info.body0.type + "_" + info.body1.type];
                        fu.collDetect(info,collArr);
                     }
                  }
               }
            }
         }
      }
      
      public function segmentIntersect(out:CollOutBodyData, seg:JSegment, ownerBody:RigidBody) : Boolean
      {
         var _collBody:RigidBody = null;
         out.frac = JNumber3D.NUM_HUGE;
         out.position = new Vector3D();
         out.normal = new Vector3D();
         var obj:CollOutBodyData = new CollOutBodyData();
         for each(_collBody in this.collBody)
         {
            if(_collBody != ownerBody && this.segmentBounding(seg,_collBody))
            {
               if(_collBody.segmentIntersect(obj,seg,_collBody.currentState))
               {
                  if(obj.frac < out.frac)
                  {
                     out.position = obj.position;
                     out.normal = obj.normal;
                     out.frac = obj.frac;
                     out.rigidBody = _collBody;
                  }
               }
            }
         }
         if(out.frac > 1)
         {
            return false;
         }
         if(out.frac < 0)
         {
            out.frac = 0;
         }
         else if(out.frac > 1)
         {
            out.frac = 1;
         }
         return true;
      }
      
      public function segmentBounding(seg:JSegment, obj:RigidBody) : Boolean
      {
         var num1:Number = NaN;
         var num2:Number = NaN;
         var pos:Vector3D = seg.getPoint(0.5);
         var r:Number = seg.delta.length / 2;
         if(obj.type != "PLANE" && obj.type != "TERRAIN")
         {
            num1 = pos.subtract(obj.currentState.position).length;
            num2 = r + obj.boundingSphere;
            if(num1 <= num2)
            {
               return true;
            }
            return false;
         }
         return true;
      }
      
      private function findBody(body:RigidBody) : Boolean
      {
         return this.collBody.indexOf(body) > -1;
      }
      
      private function checkCollidables(body0:RigidBody, body1:RigidBody) : Boolean
      {
         if(body0.nonCollidables.length == 0 && body1.nonCollidables.length == 0)
         {
            return true;
         }
         if(body0.nonCollidables.indexOf(body1) > -1)
         {
            return false;
         }
         if(body1.nonCollidables.indexOf(body0) > -1)
         {
            return false;
         }
         return true;
      }
   }
}

