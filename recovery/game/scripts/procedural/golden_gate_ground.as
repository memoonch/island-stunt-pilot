package procedural
{
   import alternativa.engine3d.core.Geometry;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class golden_gate_ground extends Mesh
   {
      
      private static const colormap:Class = golden_gate_ground_colormap;
      
      private static const _texture:BitmapData = new colormap().bitmapData;
      
      public function golden_gate_ground()
      {
         super();
         var material:TextureMaterial = new TextureMaterial(_texture,false,true,MipMapping.NONE);
         var _geo:Geometry = new Geometry();
         _geo.addVertex(-15966.72070313,861.71899414,-1892.62695313,0.95400006,0.44299996,"v0");
         _geo.addVertex(-15966.72070313,1052.90795898,4104.41601563,0.55400002,0.12999994,"v1");
         _geo.addVertex(-10415.42382813,939.57299805,3023.51196289,0.34900001,0.52099997,"v2");
         _geo.addVertex(-10066.32617188,923.29101563,-907.76000977,0.59600002,0.74300003,"v3");
         _geo.addVertex(-8614.921875,923.29101563,2540.16210938,0.29200003,0.65399998,"v4");
         _geo.addVertex(-8116.25976563,-40.63100052,3083.36303711,0.21700001,0.68699998,"v5");
         _geo.addVertex(-6016.26123047,-30.64800072,1876.49499512,0.19400001,0.87400001,"v6");
         _geo.addVertex(-6391.21289063,883.63598633,1324.48596191,0.26300001,0.84899998,"v7");
         _geo.addVertex(-13749.88867188,765.5579834,9040.93554688,0.108,0.01899993,"v8");
         _geo.addVertex(-13448.93945313,-3.12700009,9711.09570313,0.037,0.02799994,"v9");
         _geo.addVertex(-13050.68554688,-43.99200058,9535.30273438,0.028,0.06199998,"v10");
         _geo.addVertex(-9923.33007813,869.07299805,6608.86181641,0.083,0.36899996,"v11");
         _geo.addVertex(-9816.36914063,7.02400017,7388.17382813,0.012,0.36299998,"v12");
         _geo.addVertex(-6396.91210938,883.63598633,-219.22999573,0.36700001,0.92799997,"v13");
         _geo.addVertex(-5970.87207031,0,-249.30999756,0.33500001,0.98400003,"v14");
         _geo.addVertex(-10080.87890625,-7.15999985,-1613.44604492,0.63000005,0.80799997,"v15");
         _geo.addVertex(-15966.72070313,-16.14299965,-2626.97802734,0.99000007,0.50800002,"v16");
         _geo.addVertex(-6852.62402344,7.21600008,-715.19598389,0.41000003,0.95499998,"v17");
         _geo.addFaceByIds(["v0","v1","v2"],material);
         _geo.addFaceByIds(["v0","v2","v3"],material);
         _geo.addFaceByIds(["v4","v5","v6"],material);
         _geo.addFaceByIds(["v4","v6","v7"],material);
         _geo.addFaceByIds(["v8","v9","v10"],material);
         _geo.addFaceByIds(["v8","v10","v11"],material);
         _geo.addFaceByIds(["v10","v12","v11"],material);
         _geo.addFaceByIds(["v3","v2","v4"],material);
         _geo.addFaceByIds(["v3","v4","v13"],material);
         _geo.addFaceByIds(["v7","v13","v4"],material);
         _geo.addFaceByIds(["v14","v13","v7"],material);
         _geo.addFaceByIds(["v14","v7","v6"],material);
         _geo.addFaceByIds(["v11","v12","v5"],material);
         _geo.addFaceByIds(["v11","v5","v4"],material);
         _geo.addFaceByIds(["v0","v3","v15"],material);
         _geo.addFaceByIds(["v0","v15","v16"],material);
         _geo.addFaceByIds(["v3","v13","v17"],material);
         _geo.addFaceByIds(["v3","v17","v15"],material);
         _geo.addFaceByIds(["v17","v13","v14"],material);
         _geo.addFaceByIds(["v4","v2","v11"],material);
         _geo.addFaceByIds(["v11","v2","v1"],material);
         _geo.addFaceByIds(["v11","v1","v8"],material);
         geometry = _geo;
      }
   }
}

