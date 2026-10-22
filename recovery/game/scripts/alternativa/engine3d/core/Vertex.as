package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   
   use namespace alternativa3d;
   
   public class Vertex
   {
      
      alternativa3d static var collector:Vertex;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var z:Number = 0;
      
      public var u:Number = 0;
      
      public var v:Number = 0;
      
      alternativa3d var next:Vertex;
      
      alternativa3d var value:Vertex;
      
      alternativa3d var cameraX:Number;
      
      alternativa3d var cameraY:Number;
      
      alternativa3d var cameraZ:Number;
      
      alternativa3d var offset:Number;
      
      alternativa3d var transformId:int = 0;
      
      alternativa3d var drawId:int = 0;
      
      alternativa3d var index:int;
      
      public function Vertex()
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(_loc2_)
         {
            super();
         }
      }
      
      alternativa3d static function createList(param1:int) : Vertex
      {
         var _temp_1:* = true;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = _temp_1;
         var _loc3_:Vertex = null;
         var _loc2_:Vertex = collector;
         while(true)
         {
            loop6:
            while(true)
            {
               if(_loc5_)
               {
                  if(_loc2_ != null)
                  {
                     break;
                  }
                  _loc2_ = new Vertex();
                  _loc3_ = _loc2_;
                  loop10:
                  while(true)
                  {
                     if(!(_loc4_ && Boolean(_loc2_)))
                     {
                        while(true)
                        {
                           if(param1 <= 1)
                           {
                              break loop10;
                           }
                           _loc3_.next = new Vertex();
                           if(!(_loc5_ || Boolean(_loc2_)))
                           {
                              break loop10;
                           }
                        }
                        break loop6;
                        addr018e:
                     }
                     _loc3_ = _loc3_.next;
                     if(_loc5_)
                     {
                        §§push(param1);
                        if(!_loc4_)
                        {
                           §§push(§§pop() - 1);
                           if(!(_loc4_ && Boolean(_loc3_)))
                           {
                              §§push(int(§§pop()));
                           }
                        }
                        param1 = §§pop();
                     }
                     §§goto(addr018e);
                  }
                  §§goto(addr0195);
               }
               break;
            }
            _loc3_ = _loc2_;
            break;
         }
         loop0:
         while(true)
         {
            §§push(param1);
            loop1:
            while(true)
            {
               §§push(1);
               loop2:
               while(§§pop() > §§pop())
               {
                  _loc3_.transformId = 0;
                  _loc3_.drawId = 0;
                  §§push(_loc3_.next);
                  if(!(_loc4_ && Boolean(_loc2_)))
                  {
                     if(§§pop() == null)
                     {
                        if(!_loc4_)
                        {
                           while(true)
                           {
                              §§push(param1);
                              if(!(_loc4_ && Boolean(_loc3_)))
                              {
                                 §§push(1);
                                 if(!_loc4_)
                                 {
                                    if(§§pop() <= §§pop())
                                    {
                                       break;
                                    }
                                    _loc3_.next = new Vertex();
                                    §§push(_loc3_.next);
                                    if(_loc4_ && Boolean(_loc3_))
                                    {
                                       break loop1;
                                    }
                                    _loc3_ = §§pop();
                                    if(!(_loc4_ && Boolean(param1)))
                                    {
                                       while(true)
                                       {
                                          §§push(param1);
                                          if(_loc5_)
                                          {
                                             §§push(§§pop() - 1);
                                             if(_loc4_ && Boolean(_loc3_))
                                             {
                                                break;
                                             }
                                          }
                                          §§push(int(§§pop()));
                                          break;
                                       }
                                       param1 = §§pop();
                                    }
                                    continue;
                                 }
                                 continue loop2;
                              }
                              continue loop1;
                           }
                           addr0108:
                           collector = _loc3_.next;
                           _loc3_.transformId = 0;
                           if(!(_loc4_ && Boolean(_loc3_)))
                           {
                              _loc3_.drawId = 0;
                           }
                        }
                        break loop0;
                     }
                     §§push(_loc3_.next);
                  }
                  break loop1;
               }
               if(_loc4_)
               {
                  break loop0;
               }
               §§goto(addr0108);
            }
            _loc3_ = §§pop();
            if(!(_loc4_ && Boolean(param1)))
            {
               §§push(param1);
               if(!(_loc4_ && Boolean(_loc2_)))
               {
                  §§push(§§pop() - 1);
                  if(!(_loc4_ && Boolean(_loc3_)))
                  {
                     §§push(int(§§pop()));
                  }
               }
               param1 = §§pop();
            }
         }
         _loc3_.next = null;
         addr0195:
         return _loc2_;
      }
      
      alternativa3d function create() : Vertex
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         var _loc1_:Vertex = null;
         loop0:
         while(true)
         {
            while(true)
            {
               if(_loc2_)
               {
                  §§push(collector);
                  if(!(_loc2_ || Boolean(this)))
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
            while(true)
            {
               if(_loc2_)
               {
                  collector = _loc1_.next;
                  if(!(_loc2_ || Boolean(_loc1_)))
                  {
                     break;
                  }
               }
               _loc1_.next = null;
               if(!(_loc3_ && Boolean(_loc1_)))
               {
                  _loc1_.transformId = 0;
                  if(_loc2_)
                  {
                     break;
                  }
                  §§goto(addr0088);
               }
               break loop0;
            }
            _loc1_.drawId = 0;
            if(!_loc3_)
            {
               addr0088:
               return _loc1_;
            }
            break;
         }
         return new Vertex();
      }
      
      public function toString() : String
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               loop2:
               while(true)
               {
                  while(true)
                  {
                     §§push("[Vertex " + this.x.toFixed(2));
                     §§push(", ");
                     if(!(_loc2_ && Boolean(_loc2_)))
                     {
                        §§push(§§pop() + §§pop());
                        §§push(this.y);
                        if(!(_loc1_ || _loc1_))
                        {
                           break;
                        }
                        §§push(2);
                        if(!_loc1_)
                        {
                           break loop1;
                        }
                        §§push(§§pop() + §§pop().toFixed(§§pop()));
                        §§push(", ");
                        if(_loc2_)
                        {
                           break loop0;
                        }
                        §§push(§§pop() + §§pop());
                        §§push(this.z);
                        if(!(_loc1_ || Boolean(_loc2_)))
                        {
                           break loop2;
                        }
                        §§push(2);
                        if(!_loc1_)
                        {
                           break loop1;
                        }
                        §§push(§§pop() + §§pop().toFixed(§§pop()));
                        §§push(", ");
                        if(_loc2_ && _loc1_)
                        {
                           break loop0;
                        }
                     }
                     §§push(§§pop() + §§pop());
                     if(_loc1_ || _loc1_)
                     {
                        §§push(this.u);
                        if(!_loc2_)
                        {
                           break loop2;
                        }
                        break;
                     }
                     §§goto(addr00d1);
                  }
                  §§goto(addr00b1);
               }
               §§push(3);
               if(_loc1_ || Boolean(_loc2_))
               {
                  break;
               }
               §§goto(addr00b3);
            }
            §§push(§§pop() + §§pop().toFixed(§§pop()));
            §§push(", ");
            break;
         }
         addr00b3:
         addr00d1:
         addr00b1:
         §§push(§§pop() + §§pop() + this.v.toFixed(3));
         if(!(_loc2_ && Boolean(_loc2_)))
         {
            return §§pop() + "]";
         }
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(!(_loc1_ && Boolean(this)))
{
   Vertex = §§newclass(Vertex,Object);
}

