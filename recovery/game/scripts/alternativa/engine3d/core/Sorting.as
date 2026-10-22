package alternativa.engine3d.core
{
   public class Sorting
   {
      
      public static const NONE:int = 0;
      
      public static const AVERAGE_Z:int = 1;
      
      public static const DYNAMIC_BSP:int = 2;
      
      var _temp_1:* = true;
      var _loc1_:Boolean = false;
      var _loc2_:Boolean = _temp_1;
      while(true)
      {
         if(!_loc1_)
         {
            NONE = 0;
            if(_loc2_)
            {
               AVERAGE_Z = 1;
               if(_loc1_ && _loc2_)
               {
                  break;
               }
            }
         }
         DYNAMIC_BSP = 2;
         break;
      }
      
      public function Sorting()
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(!(_loc1_ && _loc2_))
         {
            super();
         }
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(_loc2_)
{
   Sorting = §§newclass(Sorting,Object);
}

