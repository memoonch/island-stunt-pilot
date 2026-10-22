package jiglib.collision
{
   import flash.geom.Vector3D;
   import jiglib.cof.JConfig;
   import jiglib.geometry.*;
   import jiglib.math.*;
   import jiglib.physics.MaterialProperties;
   
   public class CollDetectSphereSphere extends CollDetectFunctor
   {
      
      public function CollDetectSphereSphere()
      {
         super();
         name = "SphereSphere";
         type0 = "SPHERE";
         type1 = "SPHERE";
      }
      
      override public function collDetect(info:CollDetectInfo, collArr:Vector.<CollisionInfo>) : void
      {
         var oldDist:Number = NaN;
         var depth:Number = NaN;
         var worldPos:Vector3D = null;
         var collPts:Vector.<CollPointInfo> = null;
         var cpInfo:CollPointInfo = null;
         var collInfo:CollisionInfo = null;
         var mat:MaterialProperties = null;
         var sphere0:JSphere = info.body0 as JSphere;
         var sphere1:JSphere = info.body1 as JSphere;
         var oldDelta:Vector3D = sphere0.oldState.position.subtract(sphere1.oldState.position);
         var newDelta:Vector3D = sphere0.currentState.position.subtract(sphere1.currentState.position);
         var oldDistSq:Number = oldDelta.lengthSquared;
         var newDistSq:Number = newDelta.lengthSquared;
         var radSum:Number = sphere0.radius + sphere1.radius;
         if(Math.min(oldDistSq,newDistSq) < Math.pow(radSum + JConfig.collToll,2))
         {
            oldDist = Math.sqrt(oldDistSq);
            depth = radSum - oldDist;
            if(oldDist > JNumber3D.NUM_TINY)
            {
               oldDelta = JNumber3D.getDivideVector(oldDelta,oldDist);
            }
            else
            {
               oldDelta = JMatrix3D.getRotationMatrix(0,0,1,360 * Math.random()).transformVector(Vector3D.Y_AXIS);
            }
            worldPos = sphere1.oldState.position.add(JNumber3D.getScaleVector(oldDelta,sphere1.radius - 0.5 * depth));
            collPts = new Vector.<CollPointInfo>();
            cpInfo = new CollPointInfo();
            cpInfo.r0 = worldPos.subtract(sphere0.oldState.position);
            cpInfo.r1 = worldPos.subtract(sphere1.oldState.position);
            cpInfo.initialPenetration = depth;
            collPts.push(cpInfo);
            collInfo = new CollisionInfo();
            collInfo.objInfo = info;
            collInfo.dirToBody = oldDelta;
            collInfo.pointInfo = collPts;
            mat = new MaterialProperties();
            mat.restitution = Math.sqrt(sphere0.material.restitution * sphere1.material.restitution);
            mat.friction = Math.sqrt(sphere0.material.friction * sphere1.material.friction);
            collInfo.mat = mat;
            collArr.push(collInfo);
            info.body0.collisions.push(collInfo);
            info.body1.collisions.push(collInfo);
         }
      }
   }
}

