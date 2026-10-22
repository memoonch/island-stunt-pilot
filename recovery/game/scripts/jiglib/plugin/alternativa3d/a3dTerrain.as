package jiglib.plugin.alternativa3d
{
   import alternativa.engine3d.objects.Mesh;
   import jiglib.plugin.ITerrain;
   
   public class a3dTerrain extends Mesh implements ITerrain
   {
      
      private var _dw:Number;
      
      private var _dh:Number;
      
      private var _heights:Array;
      
      private var segmentsW:int;
      
      private var segmentsH:int;
      
      public function a3dTerrain(terrainMesh:Mesh, grid:Number, sw:int, sh:int)
      {
         var _j:int = 0;
         super();
         takeGeometryFrom(terrainMesh.geometry);
         calculateBounds();
         this._dw = this._dh = grid;
         this.segmentsW = sw;
         this.segmentsH = sh;
         var _x:Number = 0;
         var _z:Number = 0;
         var _xi:int = 0;
         var _zi:int = 0;
         this._heights = [];
         for(var _n:int = 0; _n <= this.segmentsH; _n++)
         {
            this._heights[_n] = [];
         }
         for(var _i:int = 0; _i < faces.length; _i++)
         {
            for(_j = 0; _j < faces[_i].vertices.length; _j++)
            {
               _x = Math.round(faces[_i].vertices[_j].x);
               _z = Math.round(faces[_i].vertices[_j].z);
               _x /= grid;
               _x += this.segmentsW / 2;
               _z /= grid;
               _z += this.segmentsH / 2;
               _xi = _x;
               _zi = _z;
               if(!(_xi != _x || _zi != _z))
               {
                  this._heights[_xi][_zi] = faces[_i].vertices[_j].y;
               }
            }
         }
      }
      
      public function get minW() : Number
      {
         return boundMinX;
      }
      
      public function get minH() : Number
      {
         return boundMinZ;
      }
      
      public function get maxW() : Number
      {
         return boundMaxX;
      }
      
      public function get maxH() : Number
      {
         return boundMaxZ;
      }
      
      public function get dw() : Number
      {
         return this._dw;
      }
      
      public function get dh() : Number
      {
         return this._dh;
      }
      
      public function get sw() : int
      {
         return this.segmentsW;
      }
      
      public function get sh() : int
      {
         return this.segmentsH;
      }
      
      public function get heights() : Array
      {
         return this._heights;
      }
   }
}

