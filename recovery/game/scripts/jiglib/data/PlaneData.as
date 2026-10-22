package jiglib.data
{
   import flash.geom.Vector3D;
   
   public class PlaneData
   {
      
      private var _position:Vector3D;
      
      private var _normal:Vector3D;
      
      private var _distance:Number;
      
      public function PlaneData(position:Vector3D, normal:Vector3D)
      {
         super();
         this._position = position.clone();
         this._normal = normal.clone();
         this._distance = this._position.dotProduct(this._normal);
      }
      
      public function get position() : Vector3D
      {
         return this._position;
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
   }
}

