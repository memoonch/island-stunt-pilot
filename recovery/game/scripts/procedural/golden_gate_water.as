package procedural
{
   import alternativa.engine3d.core.Geometry;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class golden_gate_water extends Mesh
   {
      
      private static const colormap:Class = golden_gate_water_colormap;
      
      private static const _texture:BitmapData = new colormap().bitmapData;
      
      public function golden_gate_water()
      {
         super();
         var material:TextureMaterial = new TextureMaterial(_texture,false,true,MipMapping.NONE);
         var _geo:Geometry = new Geometry();
         _geo.addVertex(-22951.44921875,0,4210.81201172,0,1,"v0");
         _geo.addVertex(4210.81201172,0,22951.44921875,1,1,"v1");
         _geo.addVertex(22951.44921875,0,-4210.81201172,1,0,"v2");
         _geo.addVertex(-4210.81201172,0,-22951.44921875,0,0,"v3");
         _geo.addFaceByIds(["v0","v1","v2"],material);
         _geo.addFaceByIds(["v0","v2","v3"],material);
         geometry = _geo;
      }
   }
}

