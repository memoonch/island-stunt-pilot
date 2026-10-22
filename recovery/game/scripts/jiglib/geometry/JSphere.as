package jiglib.geometry
{
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import jiglib.data.CollOutData;
   import jiglib.math.JMatrix3D;
   import jiglib.physics.PhysicsState;
   import jiglib.physics.RigidBody;
   import jiglib.plugin.ISkin3D;
   
   public class JSphere extends RigidBody
   {
      
      public var name:String;
      
      private var _radius:Number;
      
      public function JSphere(skin:ISkin3D, r:Number)
      {
         super(skin);
         _type = "SPHERE";
         this._radius = r;
         _boundingSphere = this._radius;
         mass = 1;
         this.updateBoundingBox();
      }
      
      public function set radius(r:Number) : void
      {
         this._radius = r;
         _boundingSphere = this._radius;
         setInertia(this.getInertiaProperties(mass));
         setActive();
         this.updateBoundingBox();
      }
      
      public function get radius() : Number
      {
         return this._radius;
      }
      
      override public function segmentIntersect(out:CollOutData, seg:JSegment, state:PhysicsState) : Boolean
      {
         out.frac = 0;
         out.position = new Vector3D();
         out.normal = new Vector3D();
         var frac:Number = 0;
         var r:Vector3D = seg.delta;
         var s:Vector3D = seg.origin.subtract(state.position);
         var radiusSq:Number = this._radius * this._radius;
         var rSq:Number = r.lengthSquared;
         if(rSq < radiusSq)
         {
            out.frac = 0;
            out.position = seg.origin.clone();
            out.normal = out.position.subtract(state.position);
            out.normal.normalize();
            return true;
         }
         var sDotr:Number = s.dotProduct(r);
         var sSq:Number = s.lengthSquared;
         var sigma:Number = sDotr * sDotr - rSq * (sSq - radiusSq);
         if(sigma < 0)
         {
            return false;
         }
         var sigmaSqrt:Number = Math.sqrt(sigma);
         var lambda1:Number = (-sDotr - sigmaSqrt) / rSq;
         var lambda2:Number = (-sDotr + sigmaSqrt) / rSq;
         if(lambda1 > 1 || lambda2 < 0)
         {
            return false;
         }
         frac = Math.max(lambda1,0);
         out.frac = frac;
         out.position = seg.getPoint(frac);
         out.normal = out.position.subtract(state.position);
         out.normal.normalize();
         return true;
      }
      
      override public function getInertiaProperties(m:Number) : Matrix3D
      {
         var Ixx:Number = 0.4 * m * this._radius * this._radius;
         return JMatrix3D.getScaleMatrix(Ixx,Ixx,Ixx);
      }
      
      override protected function updateBoundingBox() : void
      {
         _boundingBox.clear();
         _boundingBox.addSphere(this);
      }
   }
}

