package jiglib.collision
{
   import flash.geom.Vector3D;
   import jiglib.cof.JConfig;
   import jiglib.data.TerrainData;
   import jiglib.geometry.JSphere;
   import jiglib.geometry.JTerrain;
   import jiglib.math.JNumber3D;
   import jiglib.physics.MaterialProperties;
   import jiglib.physics.RigidBody;
   
   public class CollDetectSphereTerrain extends CollDetectFunctor
   {
      
      public function CollDetectSphereTerrain()
      {
         super();
         name = "SphereTerrain";
         type0 = "SPHERE";
         type1 = "TERRAIN";
      }
      
      override public function collDetect(info:CollDetectInfo, collArr:Vector.<CollisionInfo>) : void
      {
         var tempBody:RigidBody = null;
         var dist:Number = NaN;
         var depth:Number = NaN;
         var Pt:Vector3D = null;
         var collPts:Vector.<CollPointInfo> = null;
         var cpInfo:CollPointInfo = null;
         var collInfo:CollisionInfo = null;
         var mat:MaterialProperties = null;
         if(info.body0.type == "TERRAIN")
         {
            tempBody = info.body0;
            info.body0 = info.body1;
            info.body1 = tempBody;
         }
         var sphere:JSphere = info.body0 as JSphere;
         var terrain:JTerrain = info.body1 as JTerrain;
         var obj:TerrainData = terrain.getHeightAndNormalByPoint(sphere.currentState.position);
         if(obj.height < JConfig.collToll + sphere.radius)
         {
            dist = terrain.getHeightByPoint(sphere.oldState.position);
            depth = sphere.radius - dist;
            Pt = sphere.oldState.position.subtract(JNumber3D.getScaleVector(obj.normal,sphere.radius));
            collPts = new Vector.<CollPointInfo>();
            cpInfo = new CollPointInfo();
            cpInfo.r0 = Pt.subtract(sphere.oldState.position);
            cpInfo.r1 = Pt.subtract(terrain.oldState.position);
            cpInfo.initialPenetration = depth;
            collPts.push(cpInfo);
            collInfo = new CollisionInfo();
            collInfo.objInfo = info;
            collInfo.dirToBody = obj.normal;
            collInfo.pointInfo = collPts;
            mat = new MaterialProperties();
            mat.restitution = Math.sqrt(sphere.material.restitution * terrain.material.restitution);
            mat.friction = Math.sqrt(sphere.material.friction * terrain.material.friction);
            collInfo.mat = mat;
            collArr.push(collInfo);
            info.body0.collisions.push(collInfo);
            info.body1.collisions.push(collInfo);
         }
      }
   }
}

