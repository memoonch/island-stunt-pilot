package jiglib.plugin.alternativa3d
{
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.primitives.Box;
   import alternativa.engine3d.primitives.Plane;
   import alternativa.engine3d.primitives.Sphere;
   import flash.geom.Vector3D;
   import jiglib.geometry.JBox;
   import jiglib.geometry.JPlane;
   import jiglib.geometry.JSphere;
   import jiglib.geometry.JTerrain;
   import jiglib.math.JMatrix3D;
   import jiglib.physics.RigidBody;
   import jiglib.plugin.AbstractPhysics;
   
   public class a3dPhysics extends AbstractPhysics
   {
      
      private var scene:Object3DContainer;
      
      public function a3dPhysics(pscene:Object3DContainer, speed:Number = 1)
      {
         super(speed);
         this.scene = pscene;
      }
      
      public function getMesh(body:RigidBody) : Mesh
      {
         if(body.skin != null)
         {
            return a3dMesh(body.skin).mesh as Mesh;
         }
         return null;
      }
      
      public function createSphere(material:Material, radius:Number = 1, segmentsW:int = 8, segmentsH:int = 6) : RigidBody
      {
         var sphere:Mesh = new Sphere(radius,segmentsW,segmentsH,false,material);
         this.scene.addChild(sphere);
         var jsphere:JSphere = new JSphere(new a3dMesh(sphere),radius);
         addBody(jsphere);
         return jsphere;
      }
      
      public function createInvisibleSphere(radius:Number = 1) : RigidBody
      {
         var jsphere:JSphere = new JSphere(new a3dMesh(new Mesh()),radius);
         addBody(jsphere);
         return jsphere;
      }
      
      public function createCube(material:Material, width:Number = 10, length:Number = 10, height:Number = 10, segmentsW:int = 1, segmentsL:int = 1, segmentsH:int = 1) : RigidBody
      {
         var cube:Mesh = new Box(width,length,height,segmentsW,segmentsL,segmentsH,false,false,material,material,material,material,material,material);
         this.scene.addChild(cube);
         var jbox:JBox = new JBox(new a3dMesh(cube),width,height,length);
         addBody(jbox);
         return jbox;
      }
      
      public function createInvisibleCube(width:Number = 10, length:Number = 10, height:Number = 10) : RigidBody
      {
         var jbox:JBox = new JBox(new a3dMesh(new Mesh()),width,height,length);
         addBody(jbox);
         return jbox;
      }
      
      public function createGround(material:Material, _width:Number = 1, _length:Number = 1, _wSegments:int = 1, _lSegments:int = 1, level:Number = 0) : RigidBody
      {
         var ground:Mesh = new Plane(_width,_length,_wSegments,_lSegments,true,false,false,material,material);
         this.scene.addChild(ground);
         var jGround:JPlane = new JPlane(new a3dMesh(ground),new Vector3D(0,0,1));
         jGround.setOrientation(JMatrix3D.getRotationMatrixAxis(-90));
         jGround.y = level;
         addBody(jGround);
         return jGround;
      }
      
      public function createTerrain(terrainMesh:Mesh, grid:Number, sw:int, sh:int, skipRender:Boolean = false) : JTerrain
      {
         var terrainMap:a3dTerrain = new a3dTerrain(terrainMesh,grid,sw,sh);
         if(!skipRender)
         {
            this.scene.addChild(terrainMap);
         }
         var terrain:JTerrain = new JTerrain(terrainMap);
         addBody(terrain);
         return terrain;
      }
      
      public function destroyTerrain(t:JTerrain) : void
      {
         this.scene.removeChild(t.terrainMesh as Mesh);
         removeBody(t);
      }
   }
}

