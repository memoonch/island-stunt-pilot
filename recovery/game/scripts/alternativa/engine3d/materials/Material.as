package alternativa.engine3d.materials
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Canvas;
   import alternativa.engine3d.core.Face;
   import flash.utils.getQualifiedClassName;
   
   use namespace alternativa3d;
   
   public class Material
   {
      
      public var name:String;
      
      public function Material()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(_loc1_ || Boolean(this))
         {
            super();
         }
      }
      
      public function toString() : String
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         var _loc1_:String = getQualifiedClassName(this);
         §§push("[" + _loc1_.substr(_loc1_.indexOf("::") + 2));
         if(!(_loc3_ && _loc2_))
         {
            while(true)
            {
               §§push(§§pop() + " ");
               if(!(_loc3_ && Boolean(_loc3_)))
               {
                  §§push(§§pop() + this.name);
                  if(_loc3_ && Boolean(this))
                  {
                     break;
                  }
               }
               return §§pop() + "]";
            }
         }
         return §§pop();
      }
      
      alternativa3d function draw(param1:Camera3D, param2:Canvas, param3:Face, param4:Number) : void
      {
         §§push(false);
         var _loc5_:Boolean = true;
         var _loc6_:* = §§pop();
         if(!_loc6_)
         {
            this.clearLinks(param3);
         }
      }
      
      alternativa3d function drawViewAligned(param1:Camera3D, param2:Canvas, param3:Face, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number) : void
      {
         §§push(false);
         var _loc11_:Boolean = true;
         var _loc12_:* = §§pop();
         if(_loc11_ || Boolean(this))
         {
            this.clearLinks(param3);
         }
      }
      
      alternativa3d function clearLinks(param1:Face) : void
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         var _loc2_:Face = null;
         while(param1 != null)
         {
            _loc2_ = param1.processNext;
            if(_loc4_ || _loc3_)
            {
               param1.processNext = null;
            }
            param1 = _loc2_;
         }
      }
   }
}

§§push(false);
true;
§§pop();
if(!(_loc2_ && Boolean(this)))
{
   Material = §§newclass(Material,Object);
}

