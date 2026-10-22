package jiglib.collision
{
   import flash.geom.Vector3D;
   import jiglib.cof.JConfig;
   import jiglib.geometry.*;
   import jiglib.math.*;
   import jiglib.physics.MaterialProperties;
   import jiglib.physics.RigidBody;
   
   public class CollDetectSphereCapsule extends CollDetectFunctor
   {
      
      public function CollDetectSphereCapsule()
      {
         super();
         name = "SphereCapsule";
         type0 = "SPHERE";
         type1 = "CAPSULE";
      }
      
      override public function collDetect(info:CollDetectInfo, collArr:Vector.<CollisionInfo>) : void
      {
         var tempBody:RigidBody = null;
         var segPos:Vector3D = null;
         var delta:Vector3D = null;
         var dist:Number = NaN;
         var depth:Number = NaN;
         var worldPos:Vector3D = null;
         var collPts:Vector.<CollPointInfo> = null;
         var cpInfo:CollPointInfo = null;
         var collInfo:CollisionInfo = null;
         var mat:MaterialProperties = null;
         if(info.body0.type == "CAPSULE")
         {
            tempBody = info.body0;
            info.body0 = info.body1;
            info.body1 = tempBody;
         }
         var sphere:JSphere = info.body0 as JSphere;
         var capsule:JCapsule = info.body1 as JCapsule;
         if(!sphere.hitTestObject3D(capsule))
         {
            return;
         }
         if(JConfig.aabbDetection && !sphere.boundingBox.overlapTest(capsule.boundingBox))
         {
            return;
         }
         var oldSeg:JSegment = new JSegment(capsule.getBottomPos(capsule.oldState),JNumber3D.getScaleVector(capsule.oldState.getOrientationCols()[1],capsule.length));
         var newSeg:JSegment = new JSegment(capsule.getBottomPos(capsule.currentState),JNumber3D.getScaleVector(capsule.currentState.getOrientationCols()[1],capsule.length));
         var radSum:Number = sphere.radius + capsule.radius;
         var oldObj:Vector.<Number> = new Vector.<Number>(1,true);
         var oldDistSq:Number = oldSeg.pointSegmentDistanceSq(oldObj,sphere.oldState.position);
         var newObj:Vector.<Number> = new Vector.<Number>(1,true);
         var newDistSq:Number = newSeg.pointSegmentDistanceSq(newObj,sphere.currentState.position);
         if(Math.min(oldDistSq,newDistSq) < Math.pow(radSum + JConfig.collToll,2))
         {
            segPos = oldSeg.getPoint(oldObj[0]);
            delta = sphere.oldState.position.subtract(segPos);
            dist = Math.sqrt(oldDistSq);
            depth = radSum - dist;
            if(dist > JNumber3D.NUM_TINY)
            {
               delta = JNumber3D.getDivideVector(delta,dist);
            }
            else
            {
               delta = JMatrix3D.getRotationMatrix(0,0,1,360 * Math.random()).transformVector(Vector3D.Y_AXIS);
            }
            worldPos = segPos.add(JNumber3D.getScaleVector(delta,capsule.radius - 0.5 * depth));
            collPts = new Vector.<CollPointInfo>();
            cpInfo = new CollPointInfo();
            cpInfo.r0 = worldPos.subtract(sphere.oldState.position);
            cpInfo.r1 = worldPos.subtract(capsule.oldState.position);
            cpInfo.initialPenetration = depth;
            collPts.push(cpInfo);
            collInfo = new CollisionInfo();
            collInfo.objInfo = info;
            collInfo.dirToBody = delta;
            collInfo.pointInfo = collPts;
            mat = new MaterialProperties();
            mat.restitution = Math.sqrt(sphere.material.restitution * capsule.material.restitution);
            mat.friction = Math.sqrt(sphere.material.friction * capsule.material.friction);
            collInfo.mat = mat;
            collArr.push(collInfo);
            info.body0.collisions.push(collInfo);
            info.body1.collisions.push(collInfo);
         }
      }
   }
}

