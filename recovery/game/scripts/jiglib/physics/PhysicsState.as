package jiglib.physics
{
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import jiglib.math.JMatrix3D;
   
   public class PhysicsState
   {
      
      public var position:Vector3D = new Vector3D();
      
      public var orientation:Matrix3D = new Matrix3D();
      
      public var linVelocity:Vector3D = new Vector3D();
      
      public var rotVelocity:Vector3D = new Vector3D();
      
      public function PhysicsState()
      {
         super();
      }
      
      public function getOrientationCols() : Vector.<Vector3D>
      {
         return JMatrix3D.getCols(this.orientation);
      }
   }
}

