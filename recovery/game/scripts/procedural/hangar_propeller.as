package procedural
{
   import alternativa.engine3d.core.Geometry;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class hangar_propeller extends Mesh
   {
      
      private static const colormap:Class = hangar_propeller_colormap;
      
      private static const _texture:BitmapData = new colormap().bitmapData;
      
      public function hangar_propeller()
      {
         super();
         var material:TextureMaterial = new TextureMaterial(_texture,false,true,MipMapping.NONE);
         var _geo:Geometry = new Geometry();
         _geo.addVertex(17.51600075,4.68200016,-186.727005,0.025,0.98199999,"v0");
         _geo.addVertex(5.56799984,3.11400008,-148.27400208,0.025,0.02099997,"v1");
         _geo.addVertex(11.29100037,42.85900116,-144.875,0.98600006,0.02099997,"v2");
         _geo.addVertex(23.23900032,44.42699814,-183.32899475,0.98600006,0.98199999,"v3");
         _geo.addFaceByIds(["v0","v1","v1"],material);
         _geo.addFaceByIds(["v0","v1","v2"],material);
         _geo.addFaceByIds(["v0","v2","v3"],material);
         geometry = _geo;
      }
   }
}

