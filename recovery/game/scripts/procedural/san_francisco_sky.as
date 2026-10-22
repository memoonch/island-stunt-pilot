package procedural
{
   import alternativa.engine3d.core.Geometry;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class san_francisco_sky extends Mesh
   {
      
      private static const colormap:Class = san_francisco_sky_colormap;
      
      private static const _texture:BitmapData = new colormap().bitmapData;
      
      public function san_francisco_sky()
      {
         super();
         var material:TextureMaterial = new TextureMaterial(_texture,false,true,MipMapping.NONE);
         var _geo:Geometry = new Geometry();
         _geo.addVertex(-9479.37011719,4379.34912109,10550.42382813,0.32900003,0,"v0");
         _geo.addVertex(-0.71400005,9169.15820313,49.81000137,0.16500001,0.14899999,"v1");
         _geo.addVertex(9477.94238281,4379.34912109,10550.42382813,0.32900003,0.29699999,"v2");
         _geo.addVertex(-9479.37011719,-217.33999634,10550.42382813,0,0.48499995,"v3");
         _geo.addVertex(-9479.37011719,4379.34912109,10550.42382813,0,0.64899999,"v4");
         _geo.addVertex(9477.94238281,4379.34912109,10550.42382813,0.83000004,0.64899999,"v5");
         _geo.addVertex(9477.94238281,-217.33999634,10550.42382813,0.83000004,0.48499995,"v6");
         _geo.addVertex(9477.94238281,-217.33999634,10550.42382813,0,0.66100001,"v7");
         _geo.addVertex(9477.94238281,4379.34912109,10550.42382813,0,0.824,"v8");
         _geo.addVertex(9477.94238281,4379.34912109,-10450.8046875,0.92000002,0.824,"v9");
         _geo.addVertex(9477.94238281,-217.33999634,-10450.8046875,0.92000002,0.66100001,"v10");
         _geo.addVertex(9477.94238281,-217.33999634,-10450.8046875,0,0.30999994,"v11");
         _geo.addVertex(9477.94238281,4379.34912109,-10450.8046875,0,0.47299999,"v12");
         _geo.addVertex(-9479.37011719,4379.34912109,-10450.8046875,0.83000004,0.47299999,"v13");
         _geo.addVertex(-9479.37011719,-217.33999634,-10450.8046875,0.83000004,0.30999994,"v14");
         _geo.addVertex(-9479.37011719,-217.33999634,-10450.8046875,0,0.83700001,"v15");
         _geo.addVertex(-9479.37011719,4379.34912109,-10450.8046875,0,1,"v16");
         _geo.addVertex(-9479.37011719,4379.34912109,10550.42382813,0.92000002,1,"v17");
         _geo.addVertex(-9479.37011719,-217.33999634,10550.42382813,0.92000002,0.83700001,"v18");
         _geo.addVertex(9477.94238281,4379.34912109,-10450.8046875,0,0.29699999,"v19");
         _geo.addVertex(-9479.37011719,4379.34912109,-10450.8046875,0,0,"v20");
         _geo.addFaceByIds(["v0","v1","v2"],material);
         _geo.addFaceByIds(["v3","v4","v5"],material);
         _geo.addFaceByIds(["v3","v5","v6"],material);
         _geo.addFaceByIds(["v7","v8","v9"],material);
         _geo.addFaceByIds(["v7","v9","v10"],material);
         _geo.addFaceByIds(["v11","v12","v13"],material);
         _geo.addFaceByIds(["v11","v13","v14"],material);
         _geo.addFaceByIds(["v15","v16","v17"],material);
         _geo.addFaceByIds(["v15","v17","v18"],material);
         _geo.addFaceByIds(["v19","v2","v1"],material);
         _geo.addFaceByIds(["v0","v20","v1"],material);
         _geo.addFaceByIds(["v1","v20","v19"],material);
         geometry = _geo;
      }
   }
}

