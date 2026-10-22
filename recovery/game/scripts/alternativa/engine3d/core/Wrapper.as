package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   
   use namespace alternativa3d;
   
   public class Wrapper
   {
      
      alternativa3d static var collector:Wrapper;
      
      alternativa3d var next:Wrapper;
      
      alternativa3d var vertex:Vertex;
      
      public function Wrapper()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(_loc1_ || Boolean(this))
         {
            super();
         }
      }
      
      alternativa3d static function create() : Wrapper
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         var _loc1_:Wrapper = null;
         loop0:
         while(true)
         {
            while(true)
            {
               if(_loc3_ || _loc3_)
               {
                  §§push(collector);
                  if(!(_loc3_ || Boolean(Wrapper)))
                  {
                     break;
                  }
                  if(§§pop() == null)
                  {
                     break loop0;
                  }
               }
               §§push(collector);
               break;
            }
            _loc1_ = §§pop();
            if(_loc3_ || _loc3_)
            {
               collector = collector.next;
               if(!(_loc3_ || _loc2_))
               {
                  break;
               }
               _loc1_.next = null;
               if(!_loc3_)
               {
                  break;
               }
            }
            return _loc1_;
         }
         return new Wrapper();
      }
      
      alternativa3d function create() : Wrapper
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         var _loc1_:Wrapper = null;
         loop0:
         while(true)
         {
            while(true)
            {
               if(!_loc2_)
               {
                  §§push(collector);
                  if(!_loc3_)
                  {
                     break;
                  }
                  if(§§pop() == null)
                  {
                     break loop0;
                  }
               }
               §§push(collector);
               break;
            }
            _loc1_ = §§pop();
            if(_loc3_ || _loc3_)
            {
               collector = collector.next;
               if(_loc2_)
               {
                  break;
               }
            }
            _loc1_.next = null;
            if(_loc3_)
            {
               return _loc1_;
            }
            break;
         }
         return new Wrapper();
      }
   }
}

§§push(false);
true;
§§pop();
if(!_loc2_)
{
   Wrapper = §§newclass(Wrapper,Object);
}

