package procedural
{
   import alternativa.engine3d.core.Geometry;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class san_francisco_ground extends Mesh
   {
      
      private static const colormap:Class = san_francisco_ground_colormap;
      
      private static const _texture:BitmapData = new colormap().bitmapData;
      
      public function san_francisco_ground()
      {
         super();
         var material:TextureMaterial = new TextureMaterial(_texture,false,true,MipMapping.NONE);
         var _geo:Geometry = new Geometry();
         _geo.addVertex(-9714.35546875,0,10764.92578125,0.049,1,"v0");
         _geo.addVertex(9714.35546875,0,10764.92675781,0.95100003,1,"v1");
         _geo.addVertex(9714.35546875,0,-10764.92675781,0.95100003,0,"v2");
         _geo.addVertex(-9714.35546875,0,-10764.92578125,0.049,0,"v3");
         _geo.addFaceByIds(["v0","v1","v2"],material);
         _geo.addFaceByIds(["v0","v2","v3"],material);
         geometry = _geo;
      }
   }
}

