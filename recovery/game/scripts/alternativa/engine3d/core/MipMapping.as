package alternativa.engine3d.core
{
   public class MipMapping
   {
      
      public static const NONE:int = 0;
      
      public static const OBJECT_DISTANCE:int = 1;
      
      public static const PER_PIXEL:int = 2;
      
      var _temp_1:* = true;
      var _loc1_:Boolean = false;
      var _loc2_:Boolean = _temp_1;
      while(true)
      {
         if(_loc2_)
         {
            NONE = 0;
            if(!_loc2_)
            {
               break;
            }
            OBJECT_DISTANCE = 1;
            if(!_loc2_)
            {
               break;
            }
         }
         PER_PIXEL = 2;
         break;
      }
      
      public function MipMapping()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(_loc1_)
         {
            super();
         }
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(_loc2_ || _loc1_)
{
   this.MipMapping = §§newclass(MipMapping,Object);
}

