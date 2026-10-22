package jiglib.geometry
{
   import flash.geom.Vector3D;
   import jiglib.data.CollOutData;
   import jiglib.data.PlaneData;
   import jiglib.data.TerrainData;
   import jiglib.math.JNumber3D;
   import jiglib.physics.PhysicsState;
   import jiglib.physics.RigidBody;
   import jiglib.plugin.ITerrain;
   
   public class JTerrain extends RigidBody
   {
      
      private var _terrain:ITerrain;
      
      private var _yUp:Boolean;
      
      public function JTerrain(tr:ITerrain, yUp:Boolean = true)
      {
         super(null);
         this._yUp = yUp;
         this._terrain = tr;
         this.movable = false;
         _type = "TERRAIN";
      }
      
      public function get terrainMesh() : ITerrain
      {
         return this._terrain;
      }
      
      public function getHeightByIndex(i:int, j:int) : Number
      {
         i = this.limiteInt(i,0,this._terrain.sw);
         j = this.limiteInt(j,0,this._terrain.sh);
         return this._terrain.heights[i][j];
      }
      
      public function getHeightAndNormalByPoint(point:Vector3D) : TerrainData
      {
         var plane:PlaneData = null;
         var w:Number = this.limiteInt(point.x,this._terrain.minW,this._terrain.maxW);
         var h:Number = this.limiteInt(point.z,this._terrain.minH,this._terrain.maxH);
         var i0:int = int((w - this._terrain.minW) / this._terrain.dw);
         var j0:int = int((h - this._terrain.minH) / this._terrain.dh);
         i0 = this.limiteInt(i0,0,this._terrain.sw);
         j0 = this.limiteInt(j0,0,this._terrain.sh);
         var i1:int = i0 + 1;
         var j1:int = j0 + 1;
         i1 = this.limiteInt(i1,0,this._terrain.sw);
         j1 = this.limiteInt(j1,0,this._terrain.sh);
         var iFrac:Number = 1 - (w - (i0 * this._terrain.dw + this._terrain.minW)) / this._terrain.dw;
         var jFrac:Number = (h - (j0 * this._terrain.dh + this._terrain.minH)) / this._terrain.dh;
         iFrac = JNumber3D.getLimiteNumber(iFrac,0,1);
         jFrac = JNumber3D.getLimiteNumber(jFrac,0,1);
         var h00:Number = this._yUp ? Number(this._terrain.heights[i0][j0]) : -this._terrain.heights[i0][j0];
         var h01:Number = this._yUp ? Number(this._terrain.heights[i0][j1]) : -this._terrain.heights[i0][j1];
         var h10:Number = this._yUp ? Number(this._terrain.heights[i1][j0]) : -this._terrain.heights[i1][j0];
         var h11:Number = this._yUp ? Number(this._terrain.heights[i1][j1]) : -this._terrain.heights[i1][j1];
         var obj:TerrainData = new TerrainData();
         if(iFrac < jFrac || i0 == i1 || j0 == j1)
         {
            obj.normal = new Vector3D(0,h11 - h10,this._terrain.dh).crossProduct(new Vector3D(this._terrain.dw,h11 - h01,0));
            if(!this._yUp)
            {
               obj.normal.negate();
            }
            obj.normal.normalize();
            plane = new PlaneData(new Vector3D(i1 * this._terrain.dw + this._terrain.minW,h11,j1 * this._terrain.dh + this._terrain.minH),obj.normal);
            obj.height = plane.pointPlaneDistance(point);
         }
         else
         {
            obj.normal = new Vector3D(0,h01 - h00,this._terrain.dh).crossProduct(new Vector3D(this._terrain.dw,h10 - h00,0));
            if(!this._yUp)
            {
               obj.normal.negate();
            }
            obj.normal.normalize();
            plane = new PlaneData(new Vector3D(i0 * this._terrain.dw + this._terrain.minW,h00,j0 * this._terrain.dh + this._terrain.minH),obj.normal);
            obj.height = plane.pointPlaneDistance(point);
         }
         return obj;
      }
      
      public function getHeightByPoint(point:Vector3D) : Number
      {
         return this.getHeightAndNormalByPoint(point).height;
      }
      
      public function getNormalByPoint(point:Vector3D) : Vector3D
      {
         return this.getHeightAndNormalByPoint(point).normal;
      }
      
      public function getSurfacePosByPoint(point:Vector3D) : Vector3D
      {
         return new Vector3D(point.x,this.getHeightAndNormalByPoint(point).height,point.z);
      }
      
      override public function segmentIntersect(out:CollOutData, seg:JSegment, state:PhysicsState) : Boolean
      {
         out.frac = 0;
         out.position = new Vector3D();
         out.normal = new Vector3D();
         var segY:Number = this._yUp ? seg.delta.y : -seg.delta.y;
         if(segY > JNumber3D.NUM_TINY)
         {
            return false;
         }
         var obj1:TerrainData = this.getHeightAndNormalByPoint(seg.origin);
         if(obj1.height < 0)
         {
            return false;
         }
         var obj2:TerrainData = this.getHeightAndNormalByPoint(seg.getEnd());
         if(obj2.height > 0)
         {
            return false;
         }
         var depthEnd:Number = -obj2.height;
         var weightStart:Number = 1 / (JNumber3D.NUM_TINY + obj1.height);
         var weightEnd:Number = 1 / (JNumber3D.NUM_TINY + obj2.height);
         obj1.normal.scaleBy(weightStart);
         obj2.normal.scaleBy(weightEnd);
         out.normal = obj1.normal.add(obj2.normal);
         out.normal.scaleBy(1 / (weightStart + weightEnd));
         out.frac = obj1.height / (obj1.height + depthEnd + JNumber3D.NUM_TINY);
         out.position = seg.getPoint(out.frac);
         return true;
      }
      
      private function limiteInt(num:int, min:int, max:int) : int
      {
         var n:int = num;
         if(n < min)
         {
            n = min;
         }
         else if(n > max)
         {
            n = max;
         }
         return n;
      }
   }
}

