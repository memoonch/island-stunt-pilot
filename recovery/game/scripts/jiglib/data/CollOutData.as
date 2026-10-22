package jiglib.data
{
   import flash.geom.Vector3D;
   
   public class CollOutData
   {
      
      public var frac:Number;
      
      public var position:Vector3D;
      
      public var normal:Vector3D;
      
      public function CollOutData(frac:Number = 0, position:Vector3D = null, normal:Vector3D = null)
      {
         super();
         this.frac = isNaN(frac) ? 0 : frac;
         this.position = Boolean(position) ? position : new Vector3D();
         this.normal = Boolean(normal) ? normal : new Vector3D();
      }
   }
}

