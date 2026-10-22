package alternativa.engine3d.containers
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Canvas;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   
   use namespace alternativa3d;
   
   public class DistanceSortContainer extends Object3DContainer
   {
      
      private static const sortingStack:Vector.<int>;
      
      §§push(false);
      var _loc1_:Boolean = true;
      var _loc2_:* = §§pop();
      if(_loc1_ || _loc1_)
      {
         sortingStack = new Vector.<int>();
      }
      
      public var sortByZ:Boolean = false;
      
      public function DistanceSortContainer()
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(!_loc1_)
         {
            super();
         }
      }
      
      override public function clone() : Object3D
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         var _loc1_:DistanceSortContainer = new DistanceSortContainer();
         if(!(_loc3_ && Boolean(_loc3_)))
         {
            _loc1_.clonePropertiesFrom(this);
         }
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         §§push(false);
         var _loc3_:Boolean = true;
         var _loc4_:* = §§pop();
         if(!_loc4_)
         {
            super.clonePropertiesFrom(param1);
         }
         var _loc2_:DistanceSortContainer = param1 as DistanceSortContainer;
         if(!(_loc4_ && _loc3_))
         {
            this.sortByZ = _loc2_.sortByZ;
         }
      }
      
      override alternativa3d function drawVisibleChildren(param1:Camera3D, param2:Canvas) : void
      {
         §§push(false);
         var _loc16_:Boolean = true;
         var _loc17_:* = §§pop();
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:Object3D = null;
         var _loc8_:* = 0;
         var _loc9_:Number = NaN;
         var _loc10_:* = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         §§push(0);
         if(!(_loc17_ && Boolean(param2)))
         {
            §§push(int(§§pop()));
         }
         var _loc6_:* = §§pop();
         var _loc7_:int = numVisibleChildren - 1;
         loop11:
         while(true)
         {
            loop12:
            while(true)
            {
               loop15:
               while(true)
               {
                  loop22:
                  while(true)
                  {
                     loop23:
                     while(true)
                     {
                        if(_loc16_)
                        {
                           sortingStack[0] = _loc6_;
                           while(true)
                           {
                              if(!_loc17_)
                              {
                                 sortingStack[1] = _loc7_;
                                 if(_loc17_)
                                 {
                                    break;
                                 }
                                 §§push(2);
                                 if(_loc16_)
                                 {
                                    §§push(int(§§pop()));
                                 }
                                 _loc8_ = §§pop();
                                 if(_loc17_)
                                 {
                                    break;
                                 }
                              }
                              if(this.sortByZ)
                              {
                                 break;
                              }
                              §§push(0);
                              if(!_loc16_)
                              {
                                 break loop23;
                              }
                              _loc3_ = §§pop();
                              loop1:
                              while(_loc3_ < numVisibleChildren)
                              {
                                 _loc5_ = visibleChildren[_loc3_];
                                 if(!_loc16_)
                                 {
                                    continue;
                                 }
                                 loop25:
                                 while(true)
                                 {
                                    §§push(_loc5_.md);
                                    §§push(param1.viewSizeX);
                                    if(!(_loc17_ && Boolean(param1)))
                                    {
                                       §§push(§§pop() * §§pop());
                                       §§push(param1.focalLength);
                                       if(_loc17_ && Boolean(param1))
                                       {
                                          break;
                                       }
                                    }
                                    while(true)
                                    {
                                       §§push(§§pop() / §§pop());
                                       if(_loc16_)
                                       {
                                          _loc12_ = §§pop();
                                          if(_loc17_ && Boolean(param2))
                                          {
                                             break;
                                          }
                                          §§push(_loc5_.mh);
                                          §§push(param1.viewSizeY);
                                          if(_loc16_)
                                          {
                                             break loop25;
                                          }
                                          §§push(§§pop() / §§pop());
                                       }
                                       addr0340:
                                       _loc13_ = §§pop();
                                       if(_loc16_)
                                       {
                                          break;
                                       }
                                       continue loop1;
                                    }
                                    loop27:
                                    while(true)
                                    {
                                       loop28:
                                       while(true)
                                       {
                                          §§push(_loc5_);
                                          §§push(_loc12_);
                                          if(!(_loc17_ && Boolean(param1)))
                                          {
                                             §§push(_loc12_);
                                             if(_loc17_)
                                             {
                                                break;
                                             }
                                             §§push(§§pop() * §§pop());
                                             if(!_loc16_)
                                             {
                                                break loop27;
                                             }
                                          }
                                          while(true)
                                          {
                                             §§push(_loc13_);
                                             if(!_loc17_)
                                             {
                                                §§push(_loc13_);
                                                if(!(_loc16_ || Boolean(this)))
                                                {
                                                   break;
                                                }
                                                §§push(§§pop() * §§pop());
                                                if(_loc17_ && Boolean(_loc3_))
                                                {
                                                   break loop28;
                                                }
                                             }
                                             §§push(§§pop() + §§pop());
                                             if(!_loc17_)
                                             {
                                                §§push(_loc5_.ml);
                                                if(_loc16_ || Boolean(param1))
                                                {
                                                   §§push(_loc5_.ml);
                                                   break;
                                                }
                                                break loop28;
                                             }
                                             break loop27;
                                          }
                                          §§push(§§pop() * §§pop());
                                          break;
                                       }
                                       §§push(§§pop() + §§pop());
                                       break;
                                    }
                                    §§pop().alternativa3d::distance = §§pop();
                                    if(_loc16_)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc3_);
                                          if(_loc16_ || Boolean(_loc3_))
                                          {
                                             §§push(§§pop() + 1);
                                             if(_loc17_)
                                             {
                                                break;
                                             }
                                          }
                                          §§push(int(§§pop()));
                                          break;
                                       }
                                       _loc3_ = §§pop();
                                    }
                                    continue loop1;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(_loc16_)
                                 {
                                    §§goto(addr0334);
                                    §§push(param1.focalLength);
                                 }
                                 §§goto(addr0340);
                              }
                              if(!(_loc17_ && Boolean(param1)))
                              {
                                 break loop22;
                              }
                              §§goto(addr03fb);
                           }
                        }
                        loop0:
                        while(true)
                        {
                           §§push(_loc8_);
                           if(_loc17_)
                           {
                              break loop11;
                           }
                           §§push(0);
                           if(!(_loc16_ || Boolean(_loc3_)))
                           {
                              break loop12;
                           }
                           if(§§pop() > §§pop())
                           {
                              _loc7_ = sortingStack[--_loc8_];
                              _loc6_ = sortingStack[--_loc8_];
                              if(_loc17_ && Boolean(this))
                              {
                                 break loop15;
                              }
                              _loc4_ = _loc7_;
                              _loc3_ = int(_loc6_);
                              if(!(_loc16_ || Boolean(this)))
                              {
                                 break loop22;
                              }
                              _loc5_ = visibleChildren[_loc7_ + _loc6_ >> 1];
                              §§push(_loc5_.ml);
                              if(_loc16_)
                              {
                                 §§push(Number(§§pop()));
                              }
                              _loc10_ = §§pop();
                              loop4:
                              while(true)
                              {
                                 loop5:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       _loc9_ = (visibleChildren[_loc3_] as Object3D).ml;
                                       if(_loc9_ <= _loc10_)
                                       {
                                          §§goto(addr015c);
                                       }
                                       else
                                       {
                                          §§push(_loc3_);
                                          if(!(_loc16_ || Boolean(this)))
                                          {
                                             break loop5;
                                          }
                                          §§push(int(§§pop() + 1));
                                          if(!(_loc17_ && Boolean(this)))
                                          {
                                             continue loop5;
                                          }
                                       }
                                       §§goto(addr01de);
                                    }
                                    _loc3_ = §§pop();
                                    while(true)
                                    {
                                       if(§§pop() < §§pop())
                                       {
                                          sortingStack[_loc8_++] = _loc6_;
                                          if(!_loc17_)
                                          {
                                             sortingStack[_loc8_++] = _loc4_;
                                             if(_loc17_ && Boolean(param1))
                                             {
                                                break;
                                             }
                                             if(_loc17_ && Boolean(_loc3_))
                                             {
                                                break loop4;
                                             }
                                          }
                                          if(_loc17_ && Boolean(this))
                                          {
                                             continue loop0;
                                          }
                                       }
                                       §§goto(addr0268);
                                    }
                                    §§goto(addr029a);
                                 }
                                 addr014b:
                                 loop32:
                                 while(true)
                                 {
                                    §§push(int(§§pop()));
                                    if(_loc16_ || Boolean(_loc3_))
                                    {
                                       _loc4_ = §§pop();
                                       while(true)
                                       {
                                          _loc11_ = (visibleChildren[_loc4_] as Object3D).ml;
                                          if(_loc11_ >= _loc10_)
                                          {
                                             §§push(_loc3_);
                                             §§push(_loc4_);
                                             if(!_loc16_)
                                             {
                                                break loop31;
                                             }
                                             if(§§pop() <= §§pop())
                                             {
                                                _loc5_ = visibleChildren[_loc3_];
                                                if(!(_loc17_ && Boolean(param2)))
                                                {
                                                   visibleChildren[_loc3_++] = visibleChildren[_loc4_];
                                                   if(!(_loc17_ && Boolean(param2)))
                                                   {
                                                      visibleChildren[_loc4_--] = _loc5_;
                                                   }
                                                }
                                             }
                                             §§push(_loc3_);
                                             §§push(_loc4_);
                                             if(!_loc16_)
                                             {
                                                break loop31;
                                             }
                                             if(§§pop() <= §§pop())
                                             {
                                                continue loop4;
                                             }
                                             if(!(_loc16_ || Boolean(param2)))
                                             {
                                                break loop32;
                                             }
                                             §§push(_loc6_);
                                          }
                                          else
                                          {
                                             §§push(_loc4_);
                                             if(_loc16_)
                                             {
                                                §§push(§§pop() - 1);
                                             }
                                             §§goto(addr014b);
                                          }
                                          _loc4_ = §§pop();
                                       }
                                       break loop15;
                                       addr015c:
                                    }
                                    §§push(_loc4_);
                                    if(!(_loc17_ && Boolean(_loc3_)))
                                    {
                                       break loop31;
                                    }
                                    addr026b:
                                    if(§§pop() < §§pop())
                                    {
                                       sortingStack[_loc8_++] = _loc3_;
                                       if(_loc16_)
                                       {
                                          sortingStack[_loc8_++] = _loc7_;
                                          addr029a:
                                       }
                                       break loop4;
                                    }
                                    continue loop0;
                                 }
                                 addr0268:
                                 §§goto(addr026b);
                              }
                              continue;
                           }
                           §§goto(addr061a);
                        }
                        break loop12;
                     }
                     §§goto(addr0622);
                  }
                  §§goto(addr03e6);
               }
               §§push(int(_loc6_));
               if(_loc16_)
               {
                  §§goto(addr0433);
               }
               §§goto(addr0608);
            }
            addr0610:
            if(§§pop() > §§pop())
            {
               _loc7_ = sortingStack[--_loc8_];
               addr03fb:
               §§push(sortingStack[--_loc8_]);
               if(!_loc17_)
               {
                  _loc6_ = §§pop();
                  loop16:
                  while(true)
                  {
                     §§push(_loc7_);
                     if(!_loc17_)
                     {
                        §§push(int(§§pop()));
                        if(!(_loc17_ && Boolean(param1)))
                        {
                           _loc4_ = §§pop();
                           break loop15;
                        }
                        while(true)
                        {
                           §§push(0);
                           if(!_loc16_)
                           {
                              break loop16;
                           }
                           §§goto(addr0610);
                        }
                        addr0608:
                     }
                     §§goto(addr0622);
                  }
                  §§goto(addr0690);
               }
               addr0433:
               _loc3_ = §§pop();
               _loc5_ = visibleChildren[_loc7_ + _loc6_ >> 1];
               §§push(_loc5_.distance);
               if(!(_loc17_ && Boolean(_loc3_)))
               {
                  §§push(Number(§§pop()));
               }
               _loc10_ = §§pop();
               loop8:
               while(true)
               {
                  for(; (_loc9_ = (visibleChildren[_loc3_] as Object3D).distance) > _loc10_; _loc3_ = §§pop())
                  {
                     §§push(_loc3_);
                     if(!(_loc17_ && Boolean(_loc3_)))
                     {
                        §§push(§§pop() + 1);
                     }
                     §§push(int(§§pop()));
                     if(!(_loc17_ && Boolean(param2)))
                     {
                        continue;
                     }
                     _loc4_ = §§pop();
                     if(_loc16_ || Boolean(this))
                     {
                        while(true)
                        {
                           while(true)
                           {
                              _loc11_ = (visibleChildren[_loc4_] as Object3D).distance;
                              if(_loc11_ < _loc10_)
                              {
                                 §§push(_loc4_ - 1);
                                 if(!(_loc16_ || Boolean(this)))
                                 {
                                    break;
                                 }
                                 §§push(int(§§pop()));
                                 if(_loc17_)
                                 {
                                    break;
                                 }
                                 §§goto(addr04c0);
                              }
                           }
                           loop18:
                           while(true)
                           {
                              loop19:
                              while(true)
                              {
                                 loop20:
                                 while(true)
                                 {
                                    §§push(_loc4_);
                                    if(_loc16_)
                                    {
                                       if(§§pop() <= §§pop())
                                       {
                                          continue loop8;
                                       }
                                       if(!_loc16_)
                                       {
                                          break;
                                       }
                                       §§push(_loc6_);
                                       if(_loc17_ && Boolean(this))
                                       {
                                          break loop19;
                                       }
                                       §§push(_loc4_);
                                       if(!_loc16_)
                                       {
                                          break loop18;
                                       }
                                    }
                                    addr0582:
                                    if(§§pop() >= §§pop())
                                    {
                                       break;
                                    }
                                    sortingStack[_loc8_++] = _loc6_;
                                    if(!_loc16_)
                                    {
                                       break loop8;
                                    }
                                    sortingStack[_loc8_++] = _loc4_;
                                    while(true)
                                    {
                                       if(_loc16_)
                                       {
                                          if(_loc16_)
                                          {
                                             break loop20;
                                          }
                                          §§goto(addr05ef);
                                       }
                                       §§goto(addr0602);
                                    }
                                    §§goto(addr0606);
                                 }
                                 §§push(_loc3_);
                                 break;
                              }
                              §§push(_loc7_);
                              break;
                           }
                           if(§§pop() < §§pop())
                           {
                              if(!_loc17_)
                              {
                                 sortingStack[_loc8_++] = _loc3_;
                                 if(_loc16_ || Boolean(param2))
                                 {
                                    addr05ef:
                                    sortingStack[_loc8_++] = _loc7_;
                                    addr0602:
                                 }
                                 break loop8;
                              }
                           }
                           addr0606:
                           addr03e6:
                           while(true)
                           {
                              §§goto(addr0608);
                           }
                           §§goto(addr0606);
                        }
                        §§goto(addr0690);
                     }
                     §§push(_loc3_);
                     if(_loc17_)
                     {
                        continue loop19;
                     }
                     §§push(_loc4_);
                     if(_loc16_ || Boolean(param2))
                     {
                        if(§§pop() <= §§pop())
                        {
                           _loc5_ = visibleChildren[_loc3_];
                           if(!(_loc17_ && Boolean(param1)))
                           {
                              visibleChildren[_loc3_++] = visibleChildren[_loc4_];
                              if(_loc16_)
                              {
                                 visibleChildren[_loc4_--] = _loc5_;
                              }
                           }
                        }
                        §§push(_loc3_);
                        continue loop19;
                     }
                     §§goto(addr0582);
                  }
                  continue loop10;
               }
               §§goto(addr0606);
            }
            if(_loc17_)
            {
               break loop13;
            }
            addr061a:
            §§goto(addr0622);
            §§push(int(numVisibleChildren - 1));
         }
         addr068e:
         if(§§pop() >= 0)
         {
            _loc5_ = visibleChildren[_loc3_];
            if(_loc16_)
            {
               _loc5_.draw(param1,param2);
               if(!_loc17_)
               {
                  visibleChildren[_loc3_] = null;
                  if(!(_loc17_ && Boolean(_loc3_)))
                  {
                     addr0663:
                     §§push(_loc3_);
                     if(!(_loc17_ && Boolean(param2)))
                     {
                        addr0672:
                        loop13:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(§§pop() - 1);
                              if(_loc16_ || Boolean(_loc3_))
                              {
                                 addr068b:
                                 §§push(int(§§pop()));
                              }
                              _loc3_ = §§pop();
                              while(true)
                              {
                                 §§goto(addr068e);
                              }
                              addr0622:
                              _loc3_ = §§pop();
                              addr068d:
                              if(!_loc16_)
                              {
                                 break loop13;
                              }
                              §§goto(addr068d);
                           }
                           §§goto(addr0672);
                        }
                        return;
                     }
                     §§goto(addr068b);
                  }
                  §§goto(addr068d);
               }
               §§goto(addr0663);
            }
            §§goto(addr068d);
         }
         break loop13;
         addr0690:
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(!(_loc1_ && Boolean(this)))
{
   DistanceSortContainer = §§newclass(DistanceSortContainer,Object3DContainer);
}

