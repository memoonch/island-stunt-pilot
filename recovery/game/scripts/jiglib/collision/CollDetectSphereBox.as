package jiglib.collision
{
   import flash.geom.Vector3D;
   import jiglib.cof.JConfig;
   import jiglib.geometry.*;
   import jiglib.math.*;
   import jiglib.physics.MaterialProperties;
   import jiglib.physics.RigidBody;
   
   public class CollDetectSphereBox extends CollDetectFunctor
   {
      
      public function CollDetectSphereBox()
      {
         super();
         name = "SphereBox";
         type0 = "SPHERE";
         type1 = "BOX";
      }
      
      override public function collDetect(info:CollDetectInfo, collArr:Vector.<CollisionInfo>) : void
      {
         var tempBody:RigidBody = null;
         var dir:Vector3D = null;
         var collPts:Vector.<CollPointInfo> = null;
         var cpInfo:CollPointInfo = null;
         var collInfo:CollisionInfo = null;
         var mat:MaterialProperties = null;
         if(info.body0.type == "BOX")
         {
            tempBody = info.body0;
            info.body0 = info.body1;
            info.body1 = tempBody;
         }
         var sphere:JSphere = info.body0 as JSphere;
         var box:JBox = info.body1 as JBox;
         if(!sphere.hitTestObject3D(box))
         {
            return;
         }
         if(JConfig.aabbDetection && !sphere.boundingBox.overlapTest(box.boundingBox))
         {
            return;
         }
         var oldBoxPoint:Vector.<Vector3D> = Vector.<Vector3D>([new Vector3D()]);
         var newBoxPoint:Vector.<Vector3D> = Vector.<Vector3D>([new Vector3D()]);
         var oldDist:Number = box.getDistanceToPoint(box.oldState,oldBoxPoint,sphere.oldState.position);
         var newDist:Number = box.getDistanceToPoint(box.currentState,newBoxPoint,sphere.currentState.position);
         var _oldBoxPosition:Vector3D = oldBoxPoint[0];
         var oldDepth:Number = sphere.radius - oldDist;
         var newDepth:Number = sphere.radius - newDist;
         if(Math.max(oldDepth,newDepth) > -JConfig.collToll)
         {
            collPts = new Vector.<CollPointInfo>();
            if(oldDist < -JNumber3D.NUM_TINY)
            {
               dir = _oldBoxPosition.subtract(sphere.oldState.position).subtract(_oldBoxPosition);
               dir.normalize();
            }
            else if(oldDist > JNumber3D.NUM_TINY)
            {
               dir = sphere.oldState.position.subtract(_oldBoxPosition);
               dir.normalize();
            }
            else
            {
               dir = sphere.oldState.position.subtract(box.oldState.position);
               dir.normalize();
            }
            cpInfo = new CollPointInfo();
            cpInfo.r0 = _oldBoxPosition.subtract(sphere.oldState.position);
            cpInfo.r1 = _oldBoxPosition.subtract(box.oldState.position);
            cpInfo.initialPenetration = oldDepth;
            collPts.push(cpInfo);
            collInfo = new CollisionInfo();
            collInfo.objInfo = info;
            collInfo.dirToBody = dir;
            collInfo.pointInfo = collPts;
            mat = new MaterialProperties();
            mat.restitution = Math.sqrt(sphere.material.restitution * box.material.restitution);
            mat.friction = Math.sqrt(sphere.material.friction * box.material.friction);
            collInfo.mat = mat;
            collArr.push(collInfo);
            info.body0.collisions.push(collInfo);
            info.body1.collisions.push(collInfo);
         }
      }
   }
}

