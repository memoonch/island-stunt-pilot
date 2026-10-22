package jiglib.plugin.alternativa3d
{
   import alternativa.engine3d.objects.Mesh;
   import flash.geom.Matrix3D;
   import jiglib.plugin.ISkin3D;
   
   public class a3dMesh implements ISkin3D
   {
      
      private var do3d:Mesh;
      
      public function a3dMesh(pdo3d:Mesh)
      {
         super();
         this.do3d = pdo3d;
      }
      
      public function get transform() : Matrix3D
      {
         return this.do3d.matrix;
      }
      
      public function set transform(m:Matrix3D) : void
      {
         this.do3d.matrix = m;
      }
      
      public function get mesh() : Mesh
      {
         return this.do3d;
      }
   }
}

