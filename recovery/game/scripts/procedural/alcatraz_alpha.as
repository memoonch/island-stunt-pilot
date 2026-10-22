package procedural
{
   import alternativa.engine3d.core.Geometry;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class alcatraz_alpha extends Mesh
   {
      
      private static const colormap:Class = alcatraz_alpha_colormap;
      
      private static const _texture:BitmapData = new colormap().bitmapData;
      
      public function alcatraz_alpha()
      {
         super();
         var material:TextureMaterial = new TextureMaterial(_texture,false,true,MipMapping.NONE);
         var _geo:Geometry = new Geometry();
         _geo.addVertex(-2548.77587891,768.17901611,-1070.90100098,0.29500002,0.852,"v0");
         _geo.addVertex(-2359.50708008,768.17901611,-1071.81494141,0.80500007,0.852,"v1");
         _geo.addVertex(-2376.75708008,1344.62194824,-1101.69299316,0.75800002,0.09099996,"v2");
         _geo.addVertex(-2531.52587891,1344.62194824,-1100.77905273,0.34200001,0.09099996,"v3");
         _geo.addVertex(-2359.45288086,768.17901611,-1400.8840332,0.29500002,0.852,"v4");
         _geo.addVertex(-2548.68701172,768.17901611,-1399.48706055,0.80500007,0.852,"v5");
         _geo.addVertex(-2531.43701172,1344.62194824,-1369.60900879,0.75800002,0.09099996,"v6");
         _geo.addVertex(-2376.70288086,1344.62194824,-1371.00598145,0.34200001,0.09099996,"v7");
         _geo.addVertex(-2264.8269043,768.17901611,-1236.64001465,0.29500002,0.852,"v8");
         _geo.addVertex(-2359.45288086,768.17901611,-1400.8840332,0.80500007,0.852,"v9");
         _geo.addVertex(-2376.70288086,1344.62194824,-1371.00598145,0.75800002,0.09099996,"v10");
         _geo.addVertex(-2299.32788086,1344.62194824,-1236.64001465,0.34200001,0.09099996,"v11");
         _geo.addVertex(-2359.50708008,768.17901611,-1071.81494141,0.29500002,0.852,"v12");
         _geo.addVertex(-2264.8269043,768.17901611,-1236.64001465,0.80500007,0.852,"v13");
         _geo.addVertex(-2299.32788086,1344.62194824,-1236.64001465,0.75800002,0.09099996,"v14");
         _geo.addVertex(-2376.75708008,1344.62194824,-1101.69299316,0.34200001,0.09099996,"v15");
         _geo.addVertex(-2643.33105469,768.17901611,-1234.32897949,0.29500002,0.852,"v16");
         _geo.addVertex(-2548.77587891,768.17901611,-1070.90100098,0.80500007,0.852,"v17");
         _geo.addVertex(-2531.52587891,1344.62194824,-1100.77905273,0.75800002,0.09099996,"v18");
         _geo.addVertex(-2608.83105469,1344.62194824,-1234.32897949,0.34200001,0.09099996,"v19");
         _geo.addVertex(-2548.68701172,768.17901611,-1399.48706055,0.29500002,0.852,"v20");
         _geo.addVertex(-2643.33105469,768.17901611,-1234.32897949,0.80500007,0.852,"v21");
         _geo.addVertex(-2608.83105469,1344.62194824,-1234.32897949,0.75800002,0.09099996,"v22");
         _geo.addVertex(-2531.43701172,1344.62194824,-1369.60900879,0.34200001,0.09099996,"v23");
         _geo.addFaceByIds(["v0","v1","v2"],material);
         _geo.addFaceByIds(["v0","v2","v3"],material);
         _geo.addFaceByIds(["v4","v5","v6"],material);
         _geo.addFaceByIds(["v4","v6","v7"],material);
         _geo.addFaceByIds(["v8","v9","v10"],material);
         _geo.addFaceByIds(["v8","v10","v11"],material);
         _geo.addFaceByIds(["v12","v13","v14"],material);
         _geo.addFaceByIds(["v12","v14","v15"],material);
         _geo.addFaceByIds(["v16","v17","v18"],material);
         _geo.addFaceByIds(["v16","v18","v19"],material);
         _geo.addFaceByIds(["v20","v21","v22"],material);
         _geo.addFaceByIds(["v20","v22","v23"],material);
         _geo.addFaceByIds(["v0","v3","v2"],material);
         _geo.addFaceByIds(["v0","v2","v1"],material);
         _geo.addFaceByIds(["v4","v7","v6"],material);
         _geo.addFaceByIds(["v4","v6","v5"],material);
         _geo.addFaceByIds(["v8","v11","v10"],material);
         _geo.addFaceByIds(["v8","v10","v9"],material);
         _geo.addFaceByIds(["v12","v15","v14"],material);
         _geo.addFaceByIds(["v12","v14","v13"],material);
         _geo.addFaceByIds(["v16","v19","v18"],material);
         _geo.addFaceByIds(["v16","v18","v17"],material);
         _geo.addFaceByIds(["v20","v23","v22"],material);
         _geo.addFaceByIds(["v20","v22","v21"],material);
         geometry = _geo;
      }
   }
}

