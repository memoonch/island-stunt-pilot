package procedural
{
   import alternativa.engine3d.core.Geometry;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class alcatraz_water extends Mesh
   {
      
      private static const colormap:Class = alcatraz_water_colormap;
      
      private static const _texture:BitmapData = new colormap().bitmapData;
      
      public function alcatraz_water()
      {
         super();
         var material:TextureMaterial = new TextureMaterial(_texture,false,true,MipMapping.NONE);
         var _geo:Geometry = new Geometry();
         _geo.addVertex(-17002.71875,0,16885.78125,0,0.99699998,"v0");
         _geo.addVertex(17002.71875,0,16885.78125,1,0.99699998,"v1");
         _geo.addVertex(17002.71875,0,-16885.78125,1,0.00299996,"v2");
         _geo.addVertex(-17002.71875,0,-16885.78125,0,0.00299996,"v3");
         _geo.addFaceByIds(["v0","v1","v2"],material);
         _geo.addFaceByIds(["v0","v2","v3"],material);
         geometry = _geo;
      }
   }
}

