package jiglib.plugin
{
   import flash.geom.Matrix3D;
   
   public interface ISkin3D
   {
      
      function get transform() : Matrix3D;
      
      function set transform(param1:Matrix3D) : void;
   }
}

