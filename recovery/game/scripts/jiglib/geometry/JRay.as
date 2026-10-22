package jiglib.geometry
{
   import flash.geom.Vector3D;
   import jiglib.math.JNumber3D;
   
   public class JRay
   {
      
      public var origin:Vector3D;
      
      public var dir:Vector3D;
      
      public function JRay(origin:Vector3D, dir:Vector3D)
      {
         super();
         this.origin = origin;
         this.dir = dir;
      }
      
      public function getOrigin(t:Number) : Vector3D
      {
         return this.origin.add(JNumber3D.getScaleVector(this.dir,t));
      }
   }
}

