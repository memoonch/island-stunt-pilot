package jiglib.geometry
{
   import flash.geom.Vector3D;
   import jiglib.data.CollOutData;
   import jiglib.math.JNumber3D;
   import jiglib.physics.PhysicsState;
   import jiglib.physics.RigidBody;
   import jiglib.plugin.ISkin3D;
   
   public class JPlane extends RigidBody
   {
      
      private var _initNormal:Vector3D;
      
      private var _normal:Vector3D;
      
      private var _distance:Number;
      
      public function JPlane(skin:ISkin3D, initNormal:Vector3D = null)
      {
         super(skin);
         this._initNormal = Boolean(initNormal) ? initNormal.clone() : new Vector3D(0,0,-1);
         this._normal = this._initNormal.clone();
         this._distance = 0;
         movable = false;
         _type = "PLANE";
      }
      
      public function get normal() : Vector3D
      {
         return this._normal;
      }
      
      public function get distance() : Number
      {
         return this._distance;
      }
      
      public function pointPlaneDistance(pt:Vector3D) : Number
      {
         return this._normal.dotProduct(pt) - this._distance;
      }
      
      override public function segmentIntersect(out:CollOutData, seg:JSegment, state:PhysicsState) : Boolean
      {
         var t:Number = NaN;
         out.frac = 0;
         out.position = new Vector3D();
         out.normal = new Vector3D();
         var frac:Number = 0;
         var denom:Number = this._normal.dotProduct(seg.delta);
         if(Math.abs(denom) > JNumber3D.NUM_TINY)
         {
            t = -1 * (this._normal.dotProduct(seg.origin) - this._distance) / denom;
            if(t < 0 || t > 1)
            {
               return false;
            }
            frac = t;
            out.frac = frac;
            out.position = seg.getPoint(frac);
            out.normal = this._normal.clone();
            out.normal.normalize();
            return true;
         }
         return false;
      }
      
      override protected function updateState() : void
      {
         super.updateState();
         this._normal = _currState.orientation.transformVector(this._initNormal);
         this._distance = _currState.position.dotProduct(this._normal);
      }
   }
}

