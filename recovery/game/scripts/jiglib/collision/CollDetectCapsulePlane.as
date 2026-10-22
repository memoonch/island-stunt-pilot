package jiglib.collision
{
   import flash.geom.Vector3D;
   import jiglib.cof.JConfig;
   import jiglib.geometry.*;
   import jiglib.math.*;
   import jiglib.physics.MaterialProperties;
   import jiglib.physics.RigidBody;
   
   public class CollDetectCapsulePlane extends CollDetectFunctor
   {
      
      public function CollDetectCapsulePlane()
      {
         super();
         name = "CapsulePlane";
         type0 = "CAPSULE";
         type1 = "PLANE";
      }
      
      override public function collDetect(info:CollDetectInfo, collArr:Vector.<CollisionInfo>) : void
      {
         var tempBody:RigidBody = null;
         var cpInfo:CollPointInfo = null;
         var oldDepth:Number = NaN;
         var worldPos:Vector3D = null;
         var collInfo:CollisionInfo = null;
         var mat:MaterialProperties = null;
         if(info.body0.type == "PLANE")
         {
            tempBody = info.body0;
            info.body0 = info.body1;
            info.body1 = tempBody;
         }
         var capsule:JCapsule = info.body0 as JCapsule;
         var plane:JPlane = info.body1 as JPlane;
         var collPts:Vector.<CollPointInfo> = new Vector.<CollPointInfo>();
         var oldPos:Vector3D = capsule.getBottomPos(capsule.oldState);
         var oldDist:Number = plane.pointPlaneDistance(oldPos);
         var newPos:Vector3D = capsule.getBottomPos(capsule.currentState);
         var newDist:Number = plane.pointPlaneDistance(newPos);
         if(Math.min(oldDist,newDist) < capsule.radius + JConfig.collToll)
         {
            oldDepth = capsule.radius - oldDist;
            worldPos = oldPos.subtract(JNumber3D.getScaleVector(plane.normal,capsule.radius));
            cpInfo = new CollPointInfo();
            cpInfo.r0 = worldPos.subtract(capsule.oldState.position);
            cpInfo.r1 = worldPos.subtract(plane.oldState.position);
            cpInfo.initialPenetration = oldDepth;
            collPts.push(cpInfo);
         }
         oldPos = capsule.getEndPos(capsule.oldState);
         newPos = capsule.getEndPos(capsule.currentState);
         oldDist = plane.pointPlaneDistance(oldPos);
         newDist = plane.pointPlaneDistance(newPos);
         if(Math.min(oldDist,newDist) < capsule.radius + JConfig.collToll)
         {
            oldDepth = capsule.radius - oldDist;
            worldPos = oldPos.subtract(JNumber3D.getScaleVector(plane.normal,capsule.radius));
            cpInfo = new CollPointInfo();
            cpInfo.r0 = worldPos.subtract(capsule.oldState.position);
            cpInfo.r1 = worldPos.subtract(plane.oldState.position);
            cpInfo.initialPenetration = oldDepth;
            collPts.push(cpInfo);
         }
         if(collPts.length > 0)
         {
            collInfo = new CollisionInfo();
            collInfo.objInfo = info;
            collInfo.dirToBody = plane.normal;
            collInfo.pointInfo = collPts;
            mat = new MaterialProperties();
            mat.restitution = Math.sqrt(capsule.material.restitution * plane.material.restitution);
            mat.friction = Math.sqrt(capsule.material.friction * plane.material.friction);
            collInfo.mat = mat;
            collArr.push(collInfo);
            info.body0.collisions.push(collInfo);
            info.body1.collisions.push(collInfo);
         }
      }
   }
}

