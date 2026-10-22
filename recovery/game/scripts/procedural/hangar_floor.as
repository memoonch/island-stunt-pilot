package procedural
{
   import alternativa.engine3d.core.Geometry;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class hangar_floor extends Mesh
   {
      
      private static const colormap:Class = hangar_floor_colormap;
      
      private static const _texture:BitmapData = new colormap().bitmapData;
      
      public function hangar_floor()
      {
         super();
         var material:TextureMaterial = new TextureMaterial(_texture,false,true,MipMapping.NONE);
         var _geo:Geometry = new Geometry();
         _geo.addVertex(-197.79600525,0,381.98699951,0.26200002,0.95899999,"v0");
         _geo.addVertex(197.79600525,0,381.98699951,0.73800004,0.95899999,"v1");
         _geo.addVertex(197.79600525,0,-381.98699951,0.73800004,0.04099995,"v2");
         _geo.addVertex(-197.79600525,0,-381.98699951,0.26200002,0.04099995,"v3");
         _geo.addFaceByIds(["v0","v1","v2"],material);
         _geo.addFaceByIds(["v0","v2","v3"],material);
         geometry = _geo;
      }
   }
}

