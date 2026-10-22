package procedural
{
   import alternativa.engine3d.core.Geometry;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class propeller extends Mesh
   {
      
      private static const colormap:Class = propeller_colormap;
      
      private static const _texture:BitmapData = new colormap().bitmapData;
      
      public function propeller()
      {
         super();
         var material:TextureMaterial = new TextureMaterial(_texture,false,true,MipMapping.NONE);
         var _geo:Geometry = new Geometry();
         _geo.addVertex(-21.66699982,22.13800049,0,0.54900002,0.94999999,"v0");
         _geo.addVertex(22.13800049,21.66699982,0,0.54900002,0.45999998,"v1");
         _geo.addVertex(21.66699982,-22.13800049,0,0.059,0.45999998,"v2");
         _geo.addVertex(-22.13800049,-21.66699982,0,0.059,0.94999999,"v3");
         _geo.addFaceByIds(["v0","v1","v2"],material);
         _geo.addFaceByIds(["v0","v2","v3"],material);
         _geo.addFaceByIds(["v0","v3","v2"],material);
         _geo.addFaceByIds(["v0","v2","v1"],material);
         geometry = _geo;
      }
   }
}

