package procedural
{
   import alternativa.engine3d.core.Geometry;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class ring_indicator extends Mesh
   {
      
      private static const colormap:Class = ring_indicator_colormap;
      
      private static const _texture:BitmapData = new colormap().bitmapData;
      
      public function ring_indicator()
      {
         super();
         var material:TextureMaterial = new TextureMaterial(_texture,false,true,MipMapping.NONE);
         var _geo:Geometry = new Geometry();
         _geo.addVertex(-240,-240,0,0,1,"v0");
         _geo.addVertex(240,-240,0,1,1,"v1");
         _geo.addVertex(240,240,0,1,0,"v2");
         _geo.addVertex(-240,240,0,0,0,"v3");
         _geo.addFaceByIds(["v0","v1","v2"],material);
         _geo.addFaceByIds(["v0","v2","v3"],material);
         _geo.addFaceByIds(["v0","v3","v2"],material);
         _geo.addFaceByIds(["v0","v2","v1"],material);
         geometry = _geo;
      }
   }
}

