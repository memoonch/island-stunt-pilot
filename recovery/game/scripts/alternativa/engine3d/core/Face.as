package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.materials.Material;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   
   use namespace alternativa3d;
   
   public class Face
   {
      
      alternativa3d static var collector:Face;
      
      public var material:Material;
      
      alternativa3d var next:Face;
      
      alternativa3d var wrapper:Wrapper;
      
      alternativa3d var normalX:Number;
      
      alternativa3d var normalY:Number;
      
      alternativa3d var normalZ:Number;
      
      alternativa3d var offset:Number;
      
      alternativa3d var processNext:Face;
      
      alternativa3d var processNegative:Face;
      
      alternativa3d var processPositive:Face;
      
      alternativa3d var distance:Number;
      
      alternativa3d var geometry:VG;
      
      public function Face()
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(!_loc1_)
         {
            super();
         }
      }
      
      alternativa3d static function create() : Face
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         var _loc1_:Face = null;
         loop0:
         while(true)
         {
            while(true)
            {
               if(!_loc3_)
               {
                  §§push(collector);
                  if(_loc3_ && _loc2_)
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
            if(!_loc3_)
            {
               collector = _loc1_.next;
               if(!_loc3_)
               {
                  _loc1_.next = null;
                  if(_loc3_ && Boolean(Face))
                  {
                     break;
                  }
               }
               return _loc1_;
            }
            break;
         }
         return new Face();
      }
      
      alternativa3d function create() : Face
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         var _loc1_:Face = null;
         loop0:
         while(true)
         {
            while(true)
            {
               if(!_loc3_)
               {
                  §§push(collector);
                  if(_loc3_ && Boolean(_loc3_))
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
            if(!(_loc3_ && _loc2_))
            {
               collector = _loc1_.next;
               if(_loc2_ || _loc2_)
               {
                  _loc1_.next = null;
                  if(_loc3_)
                  {
                     break;
                  }
               }
            }
            return _loc1_;
         }
         return new Face();
      }
      
      public function get normal() : Vector3D
      {
         var _temp_1:* = true;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = _temp_1;
         var _loc1_:Wrapper = this.wrapper;
         var _loc2_:Vertex = _loc1_.vertex;
         _loc1_ = _loc1_.next;
         var _loc3_:Vertex = _loc1_.vertex;
         _loc1_ = _loc1_.next;
         var _loc4_:Vertex = _loc1_.vertex;
         while(true)
         {
            §§push(_loc3_.x);
            if(_loc16_)
            {
               §§push(§§pop() - _loc2_.x);
               if(!_loc16_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc5_:* = §§pop();
         §§push(_loc3_.y);
         if(!(_loc15_ && Boolean(_loc1_)))
         {
            §§push(§§pop() - _loc2_.y);
            if(_loc16_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc6_:* = §§pop();
         while(true)
         {
            §§push(_loc3_.z);
            if(!_loc15_)
            {
               §§push(§§pop() - _loc2_.z);
               if(!_loc16_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc7_:* = §§pop();
         §§push(_loc4_.x);
         if(!_loc15_)
         {
            §§push(§§pop() - _loc2_.x);
            if(_loc16_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc8_:* = §§pop();
         while(true)
         {
            §§push(_loc4_.y);
            if(_loc16_)
            {
               §§push(§§pop() - _loc2_.y);
               if(_loc15_ && Boolean(_loc1_))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc9_:* = §§pop();
         while(true)
         {
            §§push(_loc4_.z);
            if(!_loc15_)
            {
               §§push(§§pop() - _loc2_.z);
               if(!_loc16_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc10_:* = §§pop();
         while(true)
         {
            §§push(_loc10_);
            if(_loc16_)
            {
               loop5:
               while(true)
               {
                  while(true)
                  {
                     §§push(_loc6_);
                     if(!(_loc15_ && Boolean(this)))
                     {
                        §§push(§§pop() * §§pop());
                        if(!_loc16_)
                        {
                           break;
                        }
                        §§push(_loc9_);
                        if(!_loc16_)
                        {
                           break loop5;
                        }
                     }
                     §§push(§§pop() * _loc7_);
                     break loop5;
                  }
               }
               §§push(§§pop() - §§pop());
               if(!_loc15_)
               {
                  break loop6;
               }
               break;
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc11_:* = §§pop();
         §§push(_loc8_);
         if(_loc16_)
         {
            while(true)
            {
               §§push(_loc7_);
               if(!_loc15_)
               {
                  §§push(§§pop() * §§pop());
                  if(!_loc16_)
                  {
                     break;
                  }
                  §§push(_loc10_);
                  if(!_loc15_)
                  {
                     §§push(§§pop() * _loc5_);
                  }
               }
               §§push(§§pop() - §§pop());
               if(!_loc15_)
               {
                  break;
               }
            }
         }
         var _loc12_:* = §§pop();
         loop8:
         while(true)
         {
            §§push(_loc9_);
            if(_loc16_)
            {
               while(true)
               {
                  §§push(_loc5_);
                  if(!_loc15_)
                  {
                     §§push(§§pop() * §§pop());
                     if(_loc15_)
                     {
                        break;
                     }
                     §§push(_loc8_);
                     if(!_loc15_)
                     {
                        §§push(§§pop() * _loc6_);
                     }
                  }
                  §§push(§§pop() - §§pop());
                  if(_loc16_ || Boolean(_loc2_))
                  {
                     break;
                  }
                  break loop8;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc13_:* = §§pop();
         §§push(_loc11_);
         if(!(_loc15_ && Boolean(_loc1_)))
         {
            loop10:
            while(true)
            {
               while(true)
               {
                  §§push(_loc11_);
                  if(_loc16_ || Boolean(_loc3_))
                  {
                     §§push(§§pop() * §§pop());
                     if(!_loc16_)
                     {
                        break;
                     }
                     loop12:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc12_);
                           if(_loc16_)
                           {
                              §§push(_loc12_);
                              if(_loc15_)
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(!_loc15_)
                              {
                                 §§push(§§pop() + §§pop());
                                 if(!_loc16_)
                                 {
                                    break loop10;
                                 }
                                 §§push(_loc13_);
                                 if(_loc15_)
                                 {
                                    break loop12;
                                 }
                              }
                           }
                           §§push(_loc13_);
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        break;
                     }
                  }
                  break loop12;
               }
            }
            §§push(Number(§§pop()));
            break loop11;
         }
         var _loc14_:* = §§pop();
         if(!_loc15_)
         {
            loop14:
            while(true)
            {
               loop15:
               while(true)
               {
                  loop16:
                  while(true)
                  {
                     loop17:
                     while(true)
                     {
                        §§push(_loc14_);
                        if(_loc16_ || Boolean(_loc3_))
                        {
                           §§push(0.001);
                           if(!_loc15_)
                           {
                              if(§§pop() <= §§pop())
                              {
                                 break;
                              }
                              loop18:
                              while(true)
                              {
                                 loop19:
                                 while(true)
                                 {
                                    if(_loc16_ || Boolean(_loc2_))
                                    {
                                       §§push(1 / Math.sqrt(_loc14_));
                                       if(!_loc16_)
                                       {
                                          break loop16;
                                       }
                                       §§push(Number(§§pop()));
                                       if(_loc15_ && Boolean(_loc2_))
                                       {
                                          break;
                                       }
                                       _loc14_ = §§pop();
                                       if(_loc15_)
                                       {
                                          break loop18;
                                       }
                                    }
                                    while(true)
                                    {
                                       §§push(_loc11_);
                                       if(!_loc15_)
                                       {
                                          §§push(_loc14_);
                                          if(_loc15_ && Boolean(_loc2_))
                                          {
                                             break loop15;
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(!(_loc16_ || Boolean(_loc1_)))
                                          {
                                             break;
                                          }
                                       }
                                       §§push(Number(§§pop()));
                                       break loop19;
                                    }
                                    §§goto(addr025a);
                                 }
                                 _loc11_ = §§pop();
                                 if(!_loc15_)
                                 {
                                    break;
                                 }
                                 break loop17;
                              }
                              addr025a:
                              §§push(_loc12_);
                              §§push(_loc14_);
                              if(!(_loc16_ || Boolean(_loc1_)))
                              {
                                 break loop15;
                              }
                           }
                           §§push(§§pop() * §§pop());
                           if(_loc15_)
                           {
                              break loop14;
                           }
                        }
                        _loc12_ = §§pop();
                        if(_loc16_ || Boolean(this))
                        {
                           §§push(_loc13_);
                           break loop16;
                        }
                        break;
                     }
                  }
                  §§push(_loc14_);
                  break;
               }
               §§push(§§pop() * §§pop());
               break;
            }
            _loc13_ = §§pop();
         }
         return new Vector3D(_loc11_,_loc12_,_loc13_,_loc2_.x * _loc11_ + _loc2_.y * _loc12_ + _loc2_.z * _loc13_);
      }
      
      public function get vertices() : Vector.<Vertex>
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         var _loc1_:Vector.<Vertex> = new Vector.<Vertex>();
         §§push(0);
         if(_loc4_)
         {
            §§push(int(§§pop()));
         }
         var _loc2_:* = §§pop();
         var _loc3_:Wrapper = this.wrapper;
         while(_loc3_ != null)
         {
            _loc1_[_loc2_] = _loc3_.vertex;
            if(_loc4_)
            {
               while(true)
               {
                  §§push(_loc2_);
                  if(_loc4_)
                  {
                     §§push(§§pop() + 1);
                     if(_loc5_ && Boolean(this))
                     {
                        break;
                     }
                  }
                  §§push(int(§§pop()));
                  break;
               }
               _loc2_ = §§pop();
               if(!_loc4_)
               {
                  break;
               }
            }
            _loc3_ = _loc3_.next;
         }
         return _loc1_;
      }
      
      public function getUV(param1:Vector3D) : Point
      {
         §§push(false);
         var _loc32_:Boolean = true;
         var _loc33_:* = §§pop();
         var _loc2_:Vertex = this.wrapper.vertex;
         var _loc3_:Vertex = this.wrapper.next.vertex;
         §§push(this.wrapper.next);
         if(!_loc33_)
         {
            §§push(§§pop().alternativa3d::next);
         }
         var _loc4_:Vertex = §§pop().alternativa3d::vertex;
         while(true)
         {
            §§push(_loc3_.x);
            if(!_loc33_)
            {
               §§push(§§pop() - _loc2_.x);
               if(_loc33_ && Boolean(_loc3_))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc5_:* = §§pop();
         while(true)
         {
            §§push(_loc3_.y);
            if(!(_loc33_ && Boolean(_loc2_)))
            {
               §§push(§§pop() - _loc2_.y);
               if(!(_loc32_ || Boolean(this)))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc6_:* = §§pop();
         §§push(_loc3_.z);
         if(!_loc33_)
         {
            §§push(§§pop() - _loc2_.z);
            if(!(_loc33_ && Boolean(_loc3_)))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc7_:* = §§pop();
         §§push(_loc3_.u);
         if(_loc32_)
         {
            §§push(§§pop() - _loc2_.u);
            if(_loc32_ || Boolean(_loc3_))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc8_:* = §§pop();
         §§push(_loc3_.v);
         if(!_loc33_)
         {
            §§push(§§pop() - _loc2_.v);
            if(!_loc33_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc9_:* = §§pop();
         while(true)
         {
            §§push(_loc4_.x);
            if(_loc32_ || Boolean(this))
            {
               §§push(§§pop() - _loc2_.x);
               if(_loc33_ && Boolean(_loc2_))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc10_:* = §§pop();
         while(true)
         {
            §§push(_loc4_.y);
            if(!_loc33_)
            {
               §§push(§§pop() - _loc2_.y);
               if(!_loc32_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc11_:* = §§pop();
         §§push(_loc4_.z);
         if(!(_loc33_ && Boolean(_loc3_)))
         {
            §§push(§§pop() - _loc2_.z);
            if(_loc32_ || Boolean(param1))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc12_:* = §§pop();
         §§push(_loc4_.u);
         if(!_loc33_)
         {
            §§push(§§pop() - _loc2_.u);
            if(!(_loc33_ && Boolean(_loc2_)))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc13_:* = §§pop();
         while(true)
         {
            §§push(_loc4_.v);
            if(_loc32_)
            {
               §§push(§§pop() - _loc2_.v);
               if(!_loc32_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc14_:* = §§pop();
         while(true)
         {
            loop6:
            while(true)
            {
               while(true)
               {
                  §§push(-this.normalX);
                  §§push(_loc11_);
                  if(_loc32_ || Boolean(param1))
                  {
                     §§push(§§pop() * §§pop());
                     if(_loc32_ || Boolean(param1))
                     {
                        §§push(§§pop() * _loc7_);
                        if(_loc33_ && Boolean(_loc2_))
                        {
                           break;
                        }
                     }
                     §§push(_loc10_);
                     if(!(_loc32_ || Boolean(this)))
                     {
                        break loop6;
                     }
                     §§push(§§pop() * this.normalY * _loc7_);
                     if(!(_loc32_ || Boolean(param1)))
                     {
                        continue loop7;
                     }
                  }
                  while(true)
                  {
                     §§push(§§pop() + §§pop());
                     §§push(this.normalX);
                     if(!_loc33_)
                     {
                        §§push(§§pop() + §§pop() * _loc6_ * _loc12_);
                        if(!_loc32_)
                        {
                           break;
                        }
                        §§push(_loc5_);
                        if(!_loc33_)
                        {
                           continue loop7;
                        }
                        §§goto(addr0225);
                     }
                     else
                     {
                        §§goto(addr01f3);
                     }
                  }
                  §§goto(addr024b);
               }
               §§goto(addr024a);
            }
            §§push(this.normalZ);
            if(!_loc33_)
            {
               addr0225:
               §§goto(addr0226);
               §§push(§§pop() - §§pop() * §§pop());
            }
            §§goto(addr0242);
         }
         loop7:
         while(true)
         {
            while(true)
            {
               §§push(this.normalY);
               if(_loc32_)
               {
                  §§push(§§pop() * §§pop() * _loc12_);
                  if(!_loc32_)
                  {
                     break loop7;
                  }
                  §§push(§§pop() - §§pop());
                  if(!(_loc33_ && Boolean(this)))
                  {
                     §§push(_loc10_);
                     if(!(_loc33_ && Boolean(_loc3_)))
                     {
                        addr0238:
                        §§push(_loc6_);
                        if(_loc32_)
                        {
                           §§push(§§pop() * §§pop());
                           break loop6;
                        }
                        §§push(§§pop() * §§pop());
                        if(!_loc33_)
                        {
                           break;
                        }
                     }
                     break loop7;
                  }
                  §§push(_loc5_);
                  if(!(_loc32_ || Boolean(param1)))
                  {
                     break;
                  }
                  §§push(_loc11_);
               }
               §§goto(addr0238);
            }
            addr0242:
            §§push(§§pop() * this.normalZ);
            break;
         }
         addr024b:
         §§push(§§pop() + §§pop());
         if(!_loc33_)
         {
            addr024a:
            §§push(Number(§§pop()));
         }
         var _loc15_:* = §§pop();
         loop9:
         while(true)
         {
            §§push(this.normalY);
            if(!(_loc33_ && Boolean(param1)))
            {
               loop10:
               while(true)
               {
                  while(true)
                  {
                     §§push(-§§pop());
                     if(!(_loc33_ && Boolean(_loc3_)))
                     {
                        §§push(_loc12_);
                        if(_loc33_)
                        {
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        if(_loc33_ && Boolean(param1))
                        {
                           break loop10;
                        }
                     }
                     §§push(_loc11_);
                     if(_loc32_ || Boolean(_loc2_))
                     {
                        break;
                     }
                     addr029e:
                     §§push(§§pop() + §§pop());
                     if(_loc32_)
                     {
                        break loop10;
                     }
                     break loop9;
                  }
                  §§push(§§pop() * this.normalZ);
                  if(_loc32_)
                  {
                     §§goto(addr029e);
                  }
                  §§goto(addr02a7);
               }
               addr02a7:
               §§push(§§pop() / _loc15_);
               if(!(_loc32_ || Boolean(_loc2_)))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc16_:* = §§pop();
         loop12:
         while(true)
         {
            loop13:
            while(true)
            {
               §§push(this.normalX);
               if(_loc32_ || Boolean(param1))
               {
                  §§push(_loc12_);
                  if(!(_loc32_ || Boolean(_loc3_)))
                  {
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  if(_loc33_ && Boolean(this))
                  {
                     break loop12;
                  }
               }
               while(true)
               {
                  §§push(_loc10_);
                  if(_loc32_ || Boolean(param1))
                  {
                     break loop13;
                  }
                  addr031c:
                  §§push(§§pop() / §§pop());
                  if(!_loc33_)
                  {
                     break;
                  }
                  break loop12;
               }
               addr0323:
               §§push(Number(§§pop()));
               break loop12;
            }
            while(true)
            {
               §§push(§§pop() * this.normalZ);
               if(_loc32_ || Boolean(this))
               {
                  §§push(§§pop() - §§pop());
                  if(!(_loc32_ || Boolean(_loc3_)))
                  {
                     break;
                  }
                  §§push(_loc15_);
               }
               §§goto(addr031c);
            }
            §§goto(addr0323);
         }
         var _loc17_:* = §§pop();
         loop14:
         while(true)
         {
            loop15:
            while(true)
            {
               §§push(this.normalX);
               if(_loc32_ || Boolean(param1))
               {
                  §§push(-§§pop());
                  if(!_loc33_)
                  {
                     loop54:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc11_);
                           if(!_loc33_)
                           {
                              §§push(§§pop() * §§pop());
                              if(!_loc32_)
                              {
                                 break;
                              }
                              §§push(_loc10_);
                              if(!(_loc32_ || Boolean(param1)))
                              {
                                 break loop54;
                              }
                           }
                           §§push(§§pop() * this.normalY);
                           if(!(_loc33_ && Boolean(this)))
                           {
                              break loop54;
                           }
                           break loop15;
                        }
                     }
                     §§push(§§pop() + §§pop());
                     if(!_loc33_)
                     {
                        break loop55;
                     }
                  }
                  break loop14;
               }
               §§push(_loc15_);
               break;
            }
            §§push(§§pop() / §§pop());
            if(_loc32_ || Boolean(param1))
            {
               §§push(Number(§§pop()));
            }
            break;
         }
         var _loc18_:* = §§pop();
         while(true)
         {
            §§push(_loc2_.x);
            if(!_loc33_)
            {
               loop17:
               while(true)
               {
                  loop18:
                  while(true)
                  {
                     §§push(this.normalY);
                     if(_loc32_ || Boolean(this))
                     {
                        loop19:
                        while(true)
                        {
                           loop20:
                           while(true)
                           {
                              loop22:
                              while(true)
                              {
                                 loop23:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(§§pop() * §§pop());
                                       §§push(_loc12_);
                                       if(!(_loc33_ && Boolean(_loc2_)))
                                       {
                                          §§push(§§pop() * §§pop());
                                          §§push(this.normalX);
                                          if(_loc33_)
                                          {
                                             break;
                                          }
                                          §§push(_loc2_.y);
                                          if(_loc32_)
                                          {
                                             §§push(§§pop() * §§pop());
                                             if(!(_loc32_ || Boolean(param1)))
                                             {
                                                break loop23;
                                             }
                                             §§push(§§pop() * _loc12_);
                                             if(_loc33_)
                                             {
                                                break loop22;
                                             }
                                             §§push(§§pop() - §§pop());
                                             if(!_loc32_)
                                             {
                                                break loop18;
                                             }
                                             §§push(_loc2_.x);
                                             §§push(_loc11_);
                                             if(_loc32_ || Boolean(this))
                                             {
                                                §§push(§§pop() * §§pop());
                                                if(_loc33_)
                                                {
                                                   break loop20;
                                                }
                                                §§push(this.normalZ);
                                             }
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(_loc32_ || Boolean(_loc3_))
                                          {
                                             §§push(§§pop() - §§pop());
                                             §§push(_loc10_);
                                             §§push(_loc2_.y);
                                             if(!(_loc32_ || Boolean(_loc2_)))
                                             {
                                                break loop19;
                                             }
                                             §§push(§§pop() * §§pop());
                                          }
                                       }
                                       §§push(this.normalZ);
                                       break loop19;
                                    }
                                    §§goto(addr0430);
                                 }
                                 §§goto(addr046a);
                              }
                              §§goto(addr042c);
                           }
                           §§push(_loc2_.z);
                           if(_loc32_ || Boolean(this))
                           {
                              §§goto(addr0463);
                              §§push(§§pop() * §§pop());
                           }
                           §§goto(addr046d);
                        }
                        addr042c:
                        addr0430:
                        while(true)
                        {
                           addr046a:
                           §§push(§§pop() + §§pop() * §§pop());
                           §§push(this.normalX);
                           §§push(_loc11_);
                           if(!(_loc33_ && Boolean(_loc3_)))
                           {
                              §§push(§§pop() * §§pop());
                              if(_loc32_)
                              {
                                 break loop20;
                              }
                              addr0463:
                              §§push(§§pop() + §§pop());
                              §§push(_loc10_);
                              §§push(this.normalY);
                           }
                           §§push(§§pop() * §§pop());
                           §§push(_loc2_.z);
                           break;
                        }
                        addr046d:
                        §§push(§§pop() * §§pop());
                        if(!_loc32_)
                        {
                           break loop17;
                        }
                     }
                     §§push(§§pop() - §§pop());
                     break;
                  }
                  §§push(_loc15_);
                  break;
               }
               §§push(§§pop() / §§pop());
               if(_loc33_ && Boolean(_loc2_))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc19_:* = §§pop();
         loop25:
         while(true)
         {
            while(true)
            {
               §§push(this.normalY);
               if(!(_loc33_ && Boolean(_loc3_)))
               {
                  §§push(_loc7_);
                  if(_loc33_ && Boolean(_loc3_))
                  {
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  if(!(_loc32_ || Boolean(_loc2_)))
                  {
                     break loop25;
                  }
               }
               §§push(_loc6_);
               if(!_loc32_)
               {
                  break;
               }
               §§push(§§pop() * this.normalZ);
               if(_loc32_)
               {
                  break;
               }
               §§goto(addr04dc);
            }
            §§push(§§pop() - §§pop());
            if(!(_loc33_ && Boolean(_loc2_)))
            {
               break;
            }
            §§goto(addr04ec);
         }
         addr04dc:
         addr04ec:
         §§push(§§pop() / _loc15_);
         if(_loc32_ || Boolean(_loc3_))
         {
            §§push(Number(§§pop()));
         }
         var _loc20_:* = §§pop();
         §§push(this.normalX);
         if(_loc32_)
         {
            loop27:
            while(true)
            {
               while(true)
               {
                  §§push(-§§pop());
                  if(_loc32_ || Boolean(_loc2_))
                  {
                     §§push(_loc7_);
                     if(!(_loc33_ && Boolean(param1)))
                     {
                        §§push(§§pop() * §§pop());
                        if(!(_loc32_ || Boolean(this)))
                        {
                           break loop27;
                        }
                        §§push(_loc5_);
                        if(_loc33_)
                        {
                           break;
                        }
                        §§push(§§pop() * this.normalZ);
                        if(!_loc32_)
                        {
                           break;
                        }
                     }
                     §§push(§§pop() + §§pop());
                     if(!(_loc32_ || Boolean(param1)))
                     {
                        break loop27;
                     }
                  }
                  §§push(_loc15_);
                  break;
               }
               §§push(§§pop() / §§pop());
               if(_loc32_)
               {
                  break;
               }
            }
         }
         var _loc21_:* = §§pop();
         loop29:
         while(true)
         {
            while(true)
            {
               §§push(this.normalX);
               if(!_loc33_)
               {
                  §§push(_loc6_);
                  if(_loc33_)
                  {
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  if(_loc33_)
                  {
                     break loop29;
                  }
               }
               §§push(_loc5_);
               if(_loc32_ || Boolean(_loc3_))
               {
                  break;
               }
               addr0584:
               §§push(§§pop() - §§pop());
               if(!(_loc33_ && Boolean(param1)))
               {
                  break loop29;
               }
               §§goto(addr059c);
            }
            §§push(§§pop() * this.normalY);
            if(!_loc33_)
            {
               §§goto(addr0584);
            }
            §§goto(addr0595);
         }
         addr0595:
         §§push(§§pop() / _loc15_);
         if(!_loc33_)
         {
            addr059c:
            §§push(Number(§§pop()));
         }
         var _loc22_:* = §§pop();
         loop31:
         while(true)
         {
            loop32:
            while(true)
            {
               loop49:
               while(true)
               {
                  loop50:
                  while(true)
                  {
                     loop51:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(this.normalX);
                           if(!_loc33_)
                           {
                              §§push(§§pop() * _loc2_.y);
                              if(!_loc32_)
                              {
                                 break;
                              }
                              while(true)
                              {
                                 §§push(_loc7_);
                                 if(_loc32_)
                                 {
                                    §§push(§§pop() * §§pop());
                                    if(_loc33_)
                                    {
                                       break loop51;
                                    }
                                    §§push(_loc2_.x);
                                    §§push(this.normalY);
                                    if(!(_loc33_ && Boolean(param1)))
                                    {
                                       §§push(§§pop() * §§pop());
                                       if(_loc33_)
                                       {
                                          break;
                                       }
                                       §§push(§§pop() - §§pop() * _loc7_);
                                       §§push(_loc2_.x * _loc6_);
                                       §§push(this.normalZ);
                                    }
                                    §§push(§§pop() + §§pop() * §§pop());
                                    §§push(_loc5_);
                                 }
                                 §§push(§§pop() * _loc2_.y * this.normalZ);
                                 if(_loc33_)
                                 {
                                    break loop50;
                                 }
                                 §§push(§§pop() - §§pop());
                                 if(!_loc33_)
                                 {
                                    §§push(this.normalX);
                                    if(!(_loc33_ && Boolean(_loc3_)))
                                    {
                                       §§push(_loc6_);
                                       if(!(_loc33_ && Boolean(param1)))
                                       {
                                          §§push(§§pop() * §§pop());
                                          if(!_loc33_)
                                          {
                                             §§push(_loc2_.z);
                                             if(_loc32_)
                                             {
                                                §§push(§§pop() * §§pop());
                                                break;
                                             }
                                             break loop31;
                                          }
                                          break loop32;
                                       }
                                       break loop31;
                                    }
                                    break loop49;
                                 }
                              }
                           }
                           §§push(_loc5_);
                           if(!_loc33_)
                           {
                              break loop32;
                           }
                           break loop49;
                        }
                        §§goto(addr0658);
                     }
                     §§goto(addr0657);
                  }
                  §§goto(addr0656);
               }
               §§goto(addr0653);
            }
            §§push(this.normalY);
            break;
         }
         addr0656:
         addr0657:
         addr0658:
         §§push(§§pop() * §§pop() * _loc2_.z);
         if(!(_loc33_ && Boolean(_loc3_)))
         {
            addr0653:
            §§push(§§pop() + §§pop());
            §§push(_loc15_);
         }
         var _loc23_:Number = §§pop() / §§pop();
         §§push(_loc8_);
         if(!(_loc33_ && Boolean(_loc2_)))
         {
            loop33:
            while(true)
            {
               while(true)
               {
                  §§push(_loc16_);
                  if(!_loc33_)
                  {
                     §§push(§§pop() * §§pop());
                     if(!(_loc32_ || Boolean(_loc3_)))
                     {
                        break;
                     }
                     §§push(_loc13_);
                     if(!_loc32_)
                     {
                        break loop33;
                     }
                  }
                  §§push(§§pop() * _loc20_);
                  break loop33;
               }
            }
            §§push(§§pop() + §§pop());
            if(!_loc33_)
            {
               §§push(Number(§§pop()));
            }
            break loop34;
         }
         var _loc24_:* = §§pop();
         §§push(_loc8_);
         if(!_loc33_)
         {
            while(true)
            {
               §§push(_loc17_);
               if(_loc32_)
               {
                  §§push(§§pop() * §§pop());
                  if(_loc33_)
                  {
                     break;
                  }
                  §§push(_loc13_);
                  if(!_loc33_)
                  {
                     §§push(§§pop() * _loc21_);
                  }
               }
               §§push(§§pop() + §§pop());
               if(_loc32_ || Boolean(this))
               {
                  §§push(Number(§§pop()));
               }
               break;
            }
         }
         var _loc25_:* = §§pop();
         §§push(_loc8_);
         if(!_loc33_)
         {
            while(true)
            {
               §§push(_loc18_);
               if(_loc32_)
               {
                  §§push(§§pop() * §§pop());
                  if(!_loc32_)
                  {
                     break;
                  }
                  §§push(_loc13_);
                  if(_loc32_ || Boolean(this))
                  {
                     §§push(§§pop() * _loc22_);
                  }
               }
               §§push(§§pop() + §§pop());
               if(_loc32_ || Boolean(param1))
               {
                  §§push(Number(§§pop()));
               }
               break;
            }
         }
         var _loc26_:* = §§pop();
         loop37:
         while(true)
         {
            §§push(_loc8_);
            if(!(_loc33_ && Boolean(this)))
            {
               loop38:
               while(true)
               {
                  while(true)
                  {
                     §§push(_loc19_);
                     if(_loc32_)
                     {
                        §§push(§§pop() * §§pop());
                        if(_loc33_)
                        {
                           break;
                        }
                        §§push(_loc13_);
                        if(_loc33_)
                        {
                           break loop38;
                        }
                     }
                     §§push(§§pop() * _loc23_);
                     if(!(_loc33_ && Boolean(_loc2_)))
                     {
                        break loop38;
                     }
                     addr0750:
                     §§push(§§pop() + §§pop());
                     if(!(_loc32_ || Boolean(param1)))
                     {
                        break loop37;
                     }
                  }
                  §§goto(addr0750);
               }
               §§push(§§pop() + §§pop());
               if(_loc32_ || Boolean(_loc3_))
               {
                  break loop39;
               }
               break;
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc27_:* = §§pop();
         §§push(_loc9_);
         if(_loc32_ || Boolean(param1))
         {
            loop40:
            while(true)
            {
               while(true)
               {
                  §§push(_loc16_);
                  if(!_loc33_)
                  {
                     §§push(§§pop() * §§pop());
                     if(_loc33_ && Boolean(_loc3_))
                     {
                        break;
                     }
                     §§push(_loc14_);
                     if(!_loc32_)
                     {
                        break loop40;
                     }
                  }
                  §§push(§§pop() * _loc20_);
                  break loop40;
               }
            }
            §§push(§§pop() + §§pop());
            if(!(_loc33_ && Boolean(this)))
            {
               break loop41;
            }
         }
         var _loc28_:* = §§pop();
         loop42:
         while(true)
         {
            §§push(_loc9_);
            if(_loc32_ || Boolean(param1))
            {
               while(true)
               {
                  §§push(_loc17_);
                  if(!(_loc33_ && Boolean(param1)))
                  {
                     §§push(§§pop() * §§pop());
                     if(_loc33_ && Boolean(this))
                     {
                        break loop42;
                     }
                     §§push(_loc14_);
                     if(_loc33_ && Boolean(param1))
                     {
                        break;
                     }
                  }
                  §§push(§§pop() * _loc21_);
                  break;
               }
               §§push(§§pop() + §§pop());
               if(!_loc32_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc29_:* = §§pop();
         loop44:
         while(true)
         {
            while(true)
            {
               §§push(_loc9_);
               if(!_loc33_)
               {
                  §§push(_loc18_);
                  if(!_loc32_)
                  {
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  if(!_loc32_)
                  {
                     break loop44;
                  }
               }
               §§push(_loc14_);
               if(_loc32_ || Boolean(_loc3_))
               {
                  §§push(§§pop() * _loc22_);
               }
               break;
            }
            §§push(§§pop() + §§pop());
            if(_loc32_)
            {
               break;
            }
            continue loop46;
         }
         var _loc30_:Number = §§pop();
         loop46:
         while(true)
         {
            loop47:
            while(true)
            {
               §§push(_loc9_);
               if(!_loc33_)
               {
                  while(true)
                  {
                     §§push(_loc19_);
                     if(!(_loc33_ && Boolean(_loc3_)))
                     {
                        §§push(§§pop() * §§pop());
                        if(!(_loc32_ || Boolean(param1)))
                        {
                           break;
                        }
                        §§push(_loc14_);
                        if(_loc33_ && Boolean(_loc3_))
                        {
                           break loop47;
                        }
                     }
                     §§push(§§pop() * _loc23_);
                     if(!_loc33_)
                     {
                        §§push(§§pop() + §§pop());
                        if(!_loc33_)
                        {
                           break;
                        }
                        break loop46;
                     }
                     break loop47;
                  }
               }
               §§push(_loc2_.v);
               break;
            }
            §§push(§§pop() + §§pop());
            if(_loc32_)
            {
               §§push(Number(§§pop()));
            }
            break;
         }
         var _loc31_:* = §§pop();
         return new Point(_loc24_ * param1.x + _loc25_ * param1.y + _loc26_ * param1.z + _loc27_,_loc28_ * param1.x + _loc29_ * param1.y + _loc30_ * param1.z + _loc31_);
      }
      
      public function toString() : String
      {
         return "[Face]";
      }
      
      alternativa3d function calculateBestSequenceAndNormal() : void
      {
         §§push(false);
         var _loc21_:Boolean = true;
         var _loc22_:* = §§pop();
         var _loc1_:Wrapper = null;
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:* = NaN;
         var _loc6_:* = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:* = NaN;
         var _loc9_:* = NaN;
         var _loc10_:* = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:* = NaN;
         var _loc13_:* = NaN;
         var _loc14_:* = NaN;
         var _loc15_:* = NaN;
         var _loc16_:Wrapper = null;
         var _loc17_:Wrapper = null;
         var _loc18_:Wrapper = null;
         var _loc19_:Wrapper = null;
         var _loc20_:Wrapper = null;
         loop5:
         while(true)
         {
            while(true)
            {
               while(true)
               {
                  if(_loc21_ || Boolean(_loc1_))
                  {
                     §§push(this.wrapper);
                     if(_loc22_ && Boolean(_loc1_))
                     {
                        break;
                     }
                     while(true)
                     {
                        §§push(§§pop().alternativa3d::next);
                        if(_loc21_)
                        {
                           §§push(§§pop().alternativa3d::next);
                           if(_loc22_)
                           {
                              break;
                           }
                        }
                        §§push(§§pop().alternativa3d::next);
                        break;
                     }
                     if(§§pop() == null)
                     {
                        continue loop39;
                     }
                     if(!_loc21_)
                     {
                        break loop5;
                     }
                  }
                  §§push(-1e+22);
                  if(_loc21_ || Boolean(_loc3_))
                  {
                     §§push(Number(§§pop()));
                  }
                  _loc15_ = §§pop();
                  break loop5;
               }
               §§goto(addr00af);
            }
            _loc1_ = this.wrapper;
            _loc2_ = _loc1_.vertex;
            _loc1_ = _loc1_.next;
            _loc3_ = _loc1_.vertex;
            _loc1_ = _loc1_.next;
            _loc4_ = _loc1_.vertex;
            while(true)
            {
               loop33:
               while(true)
               {
                  loop38:
                  while(true)
                  {
                     loop39:
                     while(true)
                     {
                        loop40:
                        while(true)
                        {
                           if(!_loc22_)
                           {
                              while(true)
                              {
                                 loop42:
                                 while(true)
                                 {
                                    loop49:
                                    while(true)
                                    {
                                       loop53:
                                       while(true)
                                       {
                                          §§push(_loc3_.x - _loc2_.x);
                                          if(_loc21_ || Boolean(_loc1_))
                                          {
                                             _loc5_ = §§pop();
                                             if(!(_loc21_ || Boolean(_loc2_)))
                                             {
                                                break loop38;
                                             }
                                             §§push(_loc3_.y);
                                             if(_loc21_)
                                             {
                                                while(true)
                                                {
                                                   §§push(_loc2_.y);
                                                   if(!_loc22_)
                                                   {
                                                      §§push(§§pop() - §§pop());
                                                      if(!(_loc21_ || Boolean(this)))
                                                      {
                                                         break loop33;
                                                      }
                                                      _loc6_ = §§pop();
                                                      _loc7_ = _loc3_.z - _loc2_.z;
                                                      if(!_loc21_)
                                                      {
                                                         continue loop35;
                                                      }
                                                      §§push(_loc4_.x);
                                                      if(_loc21_)
                                                      {
                                                         §§push(_loc2_.x);
                                                         if(_loc22_ && Boolean(_loc2_))
                                                         {
                                                            break loop49;
                                                         }
                                                         _loc8_ = §§pop() - §§pop();
                                                         §§push(_loc4_.y - _loc2_.y);
                                                         if(!(_loc21_ || Boolean(_loc3_)))
                                                         {
                                                            break loop42;
                                                         }
                                                         _loc9_ = §§pop();
                                                         §§push(_loc4_.z);
                                                         if(_loc22_ && Boolean(this))
                                                         {
                                                            break loop39;
                                                         }
                                                         §§push(_loc2_.z);
                                                         if(_loc21_)
                                                         {
                                                            addr0527:
                                                            §§push(§§pop() - §§pop());
                                                            if(!(_loc22_ && Boolean(_loc3_)))
                                                            {
                                                               break loop42;
                                                            }
                                                            break loop53;
                                                         }
                                                         continue loop43;
                                                      }
                                                   }
                                                   else
                                                   {
                                                      §§goto(addr05a4);
                                                   }
                                                   §§goto(addr05b2);
                                                }
                                                §§goto(addr0610);
                                             }
                                             else
                                             {
                                                §§goto(addr0570);
                                             }
                                          }
                                          §§goto(addr0527);
                                       }
                                       §§goto(addr0688);
                                    }
                                    §§goto(addr060e);
                                 }
                                 _loc10_ = §§pop();
                                 if(_loc22_)
                                 {
                                    break loop38;
                                 }
                                 §§push(_loc10_ * _loc6_);
                                 if(_loc22_)
                                 {
                                    break loop43;
                                 }
                                 loop50:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc9_);
                                       §§push(_loc7_);
                                       if(!_loc22_)
                                       {
                                          _loc11_ = §§pop() - §§pop() * §§pop();
                                          §§push(_loc8_ * _loc7_);
                                          §§push(_loc10_);
                                          if(!_loc21_)
                                          {
                                             break;
                                          }
                                          §§push(_loc5_);
                                          if(_loc22_)
                                          {
                                             break loop50;
                                          }
                                       }
                                       addr0570:
                                       _loc12_ = §§pop() - §§pop() * §§pop();
                                       §§push(_loc9_);
                                       if(!(_loc22_ && Boolean(this)))
                                       {
                                          §§push(_loc5_);
                                          if(_loc22_ && Boolean(_loc3_))
                                          {
                                             break;
                                          }
                                          §§push(§§pop() * §§pop());
                                          §§push(_loc8_);
                                          §§push(_loc6_);
                                          if(!_loc22_)
                                          {
                                             break loop50;
                                          }
                                          §§goto(addr05e5);
                                       }
                                       §§goto(addr0642);
                                    }
                                    §§goto(addr0671);
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(!_loc21_)
                                 {
                                    continue loop43;
                                 }
                                 addr05a4:
                                 while(true)
                                 {
                                    §§push(§§pop() - §§pop());
                                    if(_loc21_)
                                    {
                                       §§push(Number(§§pop()));
                                       if(!_loc21_)
                                       {
                                          break;
                                       }
                                    }
                                    addr05b2:
                                    _loc13_ = §§pop();
                                    §§push(_loc11_);
                                    if(!_loc22_)
                                    {
                                       §§push(§§pop() * _loc11_);
                                       if(!(_loc21_ || Boolean(_loc2_)))
                                       {
                                          break loop43;
                                       }
                                       §§push(_loc12_);
                                       if(!(_loc22_ && Boolean(_loc3_)))
                                       {
                                          continue loop43;
                                       }
                                       §§goto(addr05f4);
                                    }
                                    else
                                    {
                                       §§goto(addr0651);
                                    }
                                 }
                                 §§goto(addr0610);
                              }
                              loop43:
                              while(true)
                              {
                                 loop44:
                                 while(true)
                                 {
                                    §§push(_loc12_);
                                    if(_loc21_)
                                    {
                                       addr05e5:
                                       §§push(§§pop() * §§pop());
                                       if(_loc22_ && Boolean(this))
                                       {
                                          break;
                                       }
                                       §§push(§§pop() + §§pop());
                                       if(_loc22_)
                                       {
                                          break loop43;
                                       }
                                       §§push(_loc13_);
                                       §§push(_loc13_);
                                    }
                                    while(true)
                                    {
                                       §§push(§§pop() * §§pop());
                                       if(_loc21_ || Boolean(this))
                                       {
                                          break loop44;
                                       }
                                       §§goto(addr0687);
                                    }
                                 }
                                 addr0610:
                                 _loc14_ = §§pop() + §§pop();
                                 addr060e:
                                 while(true)
                                 {
                                    if(_loc21_ || Boolean(_loc1_))
                                    {
                                       if(_loc14_ <= 0)
                                       {
                                          continue loop35;
                                       }
                                       if(_loc22_ && Boolean(this))
                                       {
                                          break;
                                       }
                                    }
                                    addr0642:
                                    loop47:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(1 / Math.sqrt(_loc14_));
                                          if(!(_loc22_ && Boolean(this)))
                                          {
                                             addr0651:
                                             _loc14_ = §§pop();
                                             if(_loc22_)
                                             {
                                                break;
                                             }
                                             §§push(_loc11_);
                                             if(_loc22_ && Boolean(_loc1_))
                                             {
                                                break loop47;
                                             }
                                          }
                                          §§push(_loc14_);
                                          if(!_loc22_)
                                          {
                                             addr0671:
                                             §§push(§§pop() * §§pop());
                                             break loop43;
                                          }
                                          break loop40;
                                       }
                                       §§goto(addr0675);
                                    }
                                    §§goto(addr0685);
                                 }
                              }
                              _loc11_ = §§pop();
                              addr0675:
                              §§push(_loc12_);
                              if(!(_loc21_ || Boolean(_loc3_)))
                              {
                                 break loop39;
                              }
                              addr0688:
                              _loc12_ = §§pop() * _loc14_;
                              addr0687:
                              addr0685:
                           }
                           §§push(_loc13_);
                           §§push(_loc14_);
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        break;
                     }
                     §§push(Number(§§pop()));
                     break loop33;
                  }
                  §§goto(addr0707);
               }
               _loc13_ = §§pop();
               if(_loc22_ && Boolean(_loc2_))
               {
                  break loop38;
               }
               this.normalX = _loc11_;
               this.normalY = _loc12_;
               this.normalZ = _loc13_;
               if(_loc22_)
               {
                  break loop38;
               }
               continue loop35;
            }
            loop34:
            while(true)
            {
               loop35:
               while(true)
               {
                  loop36:
                  while(true)
                  {
                     §§push(this);
                     §§push(_loc2_.x);
                     if(_loc21_)
                     {
                        while(true)
                        {
                           §§push(_loc11_);
                           if(!_loc22_)
                           {
                              §§push(§§pop() * §§pop());
                              if(_loc22_)
                              {
                                 break;
                              }
                              §§push(_loc2_.y);
                              if(!_loc22_)
                              {
                                 §§push(_loc12_);
                                 if(!_loc21_)
                                 {
                                    break loop36;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(_loc22_)
                                 {
                                    break loop35;
                                 }
                              }
                           }
                           §§push(§§pop() + §§pop());
                           if(!_loc22_)
                           {
                              break;
                           }
                           break loop34;
                        }
                     }
                     §§push(_loc2_.z);
                     if(_loc21_)
                     {
                        break loop35;
                     }
                     addr0704:
                     §§push(§§pop() + §§pop());
                     break loop34;
                  }
                  §§goto(addr0704);
               }
               §§push(_loc13_);
               break loop36;
            }
            §§pop().alternativa3d::offset = §§pop();
            addr0707:
            return;
         }
         addr00af:
         _loc1_ = this.wrapper;
         loop0:
         while(true)
         {
            while(true)
            {
               if(_loc1_ == null)
               {
                  if(!(_loc22_ && Boolean(_loc1_)))
                  {
                     break loop0;
                  }
                  §§goto(addr037c);
               }
               else
               {
                  §§push(_loc1_.next);
                  if(!_loc22_)
                  {
                     if(§§pop() != null)
                     {
                        if(_loc22_)
                        {
                           break loop0;
                        }
                        §§push(_loc1_.next);
                        if(_loc21_ || Boolean(_loc3_))
                        {
                           addr00ed:
                           _loc19_ = §§pop();
                           loop8:
                           while(true)
                           {
                              while(true)
                              {
                                 if(!(_loc22_ && Boolean(this)))
                                 {
                                    §§push(_loc19_.next);
                                    if(_loc22_)
                                    {
                                       break;
                                    }
                                    if(§§pop() == null)
                                    {
                                       §§push(this.wrapper);
                                       break loop8;
                                    }
                                 }
                                 §§push(_loc19_.next);
                                 break;
                              }
                              §§push(§§pop());
                              break;
                           }
                           _loc20_ = §§pop();
                           _loc2_ = _loc1_.vertex;
                           _loc3_ = _loc19_.vertex;
                           _loc4_ = _loc20_.vertex;
                           loop10:
                           while(true)
                           {
                              loop11:
                              while(true)
                              {
                                 loop17:
                                 while(true)
                                 {
                                    loop18:
                                    while(true)
                                    {
                                       loop19:
                                       while(true)
                                       {
                                          loop20:
                                          while(true)
                                          {
                                             loop22:
                                             while(true)
                                             {
                                                loop23:
                                                while(true)
                                                {
                                                   loop24:
                                                   while(true)
                                                   {
                                                      loop25:
                                                      while(true)
                                                      {
                                                         loop26:
                                                         while(true)
                                                         {
                                                            loop27:
                                                            while(true)
                                                            {
                                                               §§push(_loc3_.x);
                                                               if(_loc21_ || Boolean(this))
                                                               {
                                                                  _loc5_ = §§pop() - _loc2_.x;
                                                                  §§push(_loc3_.y);
                                                                  if(!(_loc21_ || Boolean(_loc3_)))
                                                                  {
                                                                     break loop25;
                                                                  }
                                                                  §§push(_loc2_.y);
                                                                  if(!_loc21_)
                                                                  {
                                                                     break loop24;
                                                                  }
                                                                  §§push(§§pop() - §§pop());
                                                                  if(_loc21_)
                                                                  {
                                                                     _loc6_ = Number(§§pop());
                                                                     while(true)
                                                                     {
                                                                        if(!(_loc22_ && Boolean(_loc2_)))
                                                                        {
                                                                           §§push(_loc3_.z);
                                                                           if(!_loc21_)
                                                                           {
                                                                              break loop23;
                                                                           }
                                                                           §§push(_loc2_.z);
                                                                           if(!_loc21_)
                                                                           {
                                                                              break loop22;
                                                                           }
                                                                           _loc7_ = §§pop() - §§pop();
                                                                           §§push(_loc4_.x);
                                                                           if(!(_loc21_ || Boolean(this)))
                                                                           {
                                                                              break loop20;
                                                                           }
                                                                           §§push(_loc2_.x);
                                                                           if(_loc22_ && Boolean(_loc1_))
                                                                           {
                                                                              break loop13;
                                                                           }
                                                                           §§push(§§pop() - §§pop());
                                                                           if(_loc22_)
                                                                           {
                                                                              break loop19;
                                                                           }
                                                                           _loc8_ = §§pop();
                                                                           if(!(_loc21_ || Boolean(this)))
                                                                           {
                                                                              break;
                                                                           }
                                                                        }
                                                                        §§push(_loc4_.y);
                                                                        §§push(_loc2_.y);
                                                                        if(_loc21_)
                                                                        {
                                                                           §§push(§§pop() - §§pop());
                                                                           if(_loc21_ || Boolean(_loc2_))
                                                                           {
                                                                              _loc9_ = §§pop();
                                                                              if(!(_loc22_ && Boolean(_loc1_)))
                                                                              {
                                                                                 break;
                                                                              }
                                                                              break loop18;
                                                                           }
                                                                           break loop26;
                                                                        }
                                                                        break loop27;
                                                                     }
                                                                     §§push(_loc4_.z);
                                                                     §§push(_loc2_.z);
                                                                     if(_loc22_ && Boolean(this))
                                                                     {
                                                                        break loop17;
                                                                     }
                                                                     §§push(§§pop() - §§pop());
                                                                     if(_loc22_ && Boolean(this))
                                                                     {
                                                                        break loop11;
                                                                     }
                                                                     §§push(Number(§§pop()));
                                                                     if(!_loc21_)
                                                                     {
                                                                        break loop10;
                                                                     }
                                                                  }
                                                               }
                                                               _loc10_ = §§pop();
                                                               if(_loc21_ || Boolean(_loc1_))
                                                               {
                                                                  §§push(_loc10_);
                                                                  break loop19;
                                                               }
                                                               break loop18;
                                                            }
                                                            §§goto(addr023d);
                                                         }
                                                         §§goto(addr02df);
                                                      }
                                                      §§goto(addr0348);
                                                   }
                                                   §§goto(addr02e1);
                                                }
                                                §§goto(addr0339);
                                             }
                                             §§goto(addr025d);
                                          }
                                          §§goto(addr02cc);
                                       }
                                       addr023d:
                                       §§push(§§pop() * _loc6_);
                                       if(!_loc22_)
                                       {
                                          §§push(_loc9_);
                                          §§push(_loc7_);
                                          if(_loc21_)
                                          {
                                             while(true)
                                             {
                                                §§push(§§pop() * §§pop());
                                                if(_loc21_ || Boolean(_loc2_))
                                                {
                                                   addr025d:
                                                   §§push(§§pop() - §§pop());
                                                   if(_loc21_ || Boolean(_loc2_))
                                                   {
                                                      _loc11_ = §§pop();
                                                      §§push(_loc8_);
                                                      §§push(_loc7_);
                                                      break loop17;
                                                   }
                                                   §§goto(addr02db);
                                                }
                                                §§goto(addr02e1);
                                             }
                                             §§goto(addr02e2);
                                          }
                                          §§goto(addr02ca);
                                       }
                                       §§goto(addr02e2);
                                    }
                                    §§goto(addr0289);
                                 }
                                 §§push(§§pop() * §§pop());
                                 break;
                              }
                              §§push(_loc10_);
                              §§push(_loc5_);
                              if(_loc21_)
                              {
                                 §§push(§§pop() * §§pop());
                                 if(_loc21_)
                                 {
                                    §§push(§§pop() - §§pop());
                                    break;
                                 }
                                 §§goto(addr02a9);
                              }
                              §§goto(addr02f4);
                           }
                           _loc12_ = §§pop();
                           addr0289:
                           loop12:
                           while(true)
                           {
                              loop13:
                              while(true)
                              {
                                 loop14:
                                 while(true)
                                 {
                                    §§push(_loc9_);
                                    if(!(_loc22_ && Boolean(_loc2_)))
                                    {
                                       loop15:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc5_);
                                             if(!(_loc22_ && Boolean(this)))
                                             {
                                                addr02a9:
                                                §§push(§§pop() * §§pop());
                                                if(!(_loc21_ || Boolean(_loc2_)))
                                                {
                                                   break;
                                                }
                                                §§push(_loc8_);
                                                §§push(_loc6_);
                                                if(_loc22_ && Boolean(_loc2_))
                                                {
                                                   break loop15;
                                                }
                                                §§push(§§pop() * §§pop());
                                             }
                                             §§push(§§pop() - §§pop());
                                             break;
                                          }
                                          addr02e2:
                                          addr02cc:
                                          §§push(Number(§§pop()));
                                          if(!(_loc22_ && Boolean(_loc3_)))
                                          {
                                             addr02db:
                                             _loc13_ = §§pop();
                                             addr02e1:
                                             addr02df:
                                             §§push(_loc11_ * _loc11_);
                                          }
                                          §§push(_loc12_);
                                          §§push(_loc12_);
                                          if(_loc22_ && Boolean(_loc2_))
                                          {
                                             break;
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(!(_loc22_ && Boolean(_loc1_)))
                                          {
                                             §§push(§§pop() + §§pop());
                                             if(_loc21_ || Boolean(this))
                                             {
                                                §§push(_loc13_);
                                                if(_loc21_ || Boolean(this))
                                                {
                                                   §§push(_loc13_);
                                                   break;
                                                }
                                                break loop13;
                                             }
                                             break loop14;
                                          }
                                          §§goto(addr0325);
                                       }
                                       addr0325:
                                       §§push(§§pop() + §§pop() * §§pop());
                                       if(!(_loc21_ || Boolean(this)))
                                       {
                                          break loop12;
                                       }
                                    }
                                    §§push(Number(§§pop()));
                                    break loop12;
                                 }
                                 §§goto(addr0339);
                              }
                              if(§§pop() > §§pop())
                              {
                                 if(_loc21_)
                                 {
                                    addr0348:
                                    _loc15_ = Number(_loc14_);
                                 }
                                 _loc16_ = _loc1_;
                              }
                              continue loop0;
                           }
                           _loc14_ = §§pop();
                           addr0339:
                           §§push(_loc14_);
                           §§push(_loc15_);
                           break loop13;
                        }
                     }
                     else
                     {
                        §§push(this.wrapper);
                        if(_loc21_)
                        {
                           §§goto(addr00ed);
                           §§push(§§pop());
                        }
                        else
                        {
                           §§goto(addr037f);
                        }
                     }
                     §§goto(addr0387);
                  }
               }
               §§goto(addr038f);
            }
            _loc1_ = _loc1_.next;
            _loc17_ = §§pop();
            if(!(_loc22_ && Boolean(_loc2_)))
            {
               loop1:
               while(true)
               {
                  §§push(_loc17_.next);
                  do
                  {
                     if(§§pop() == null)
                     {
                        break loop1;
                     }
                     §§push(_loc17_.next);
                  }
                  while(!_loc21_);
                  _loc17_ = §§pop();
               }
            }
            _loc18_ = this.wrapper;
            loop29:
            while(true)
            {
               loop30:
               while(true)
               {
                  if(!(_loc22_ && Boolean(_loc1_)))
                  {
                     loop3:
                     while(true)
                     {
                        §§push(_loc18_.next);
                        if(!(_loc22_ && Boolean(_loc2_)))
                        {
                           while(true)
                           {
                              var _temp_31:* = §§pop() != _loc16_;
                              §§push(_temp_31);
                              §§push(_temp_31);
                              if(_loc21_)
                              {
                                 §§push(Boolean(§§pop()));
                              }
                              if(§§pop())
                              {
                                 §§pop();
                                 if(!(_loc21_ || Boolean(_loc2_)))
                                 {
                                    break loop30;
                                 }
                                 §§push(_loc18_.next != null);
                                 if(!_loc22_)
                                 {
                                    §§push(Boolean(§§pop()));
                                 }
                              }
                              if(!§§pop())
                              {
                                 if(_loc21_)
                                 {
                                    addr0431:
                                    _loc17_.next = this.wrapper;
                                    if(!_loc22_)
                                    {
                                       break loop29;
                                    }
                                    break loop30;
                                 }
                                 break loop29;
                              }
                              §§push(_loc18_.next);
                              if(!_loc22_)
                              {
                                 continue loop3;
                              }
                           }
                           break loop6;
                        }
                        §§goto(addr041d);
                        _loc18_ = §§pop();
                     }
                     break loop6;
                  }
                  §§goto(addr0431);
               }
               this.wrapper = _loc16_;
               break loop6;
            }
            _loc18_.next = null;
            if(_loc21_)
            {
               break loop30;
            }
            break loop6;
         }
         if(_loc16_ != this.wrapper)
         {
            addr037c:
            addr037f:
            §§push(this.wrapper.next);
            if(!_loc22_)
            {
               addr0387:
               §§push(§§pop().alternativa3d::next);
               if(!_loc22_)
               {
                  addr038f:
                  §§push(§§pop().alternativa3d::next);
               }
            }
            break loop7;
         }
         break loop6;
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(_loc2_ || Boolean(this))
{
   Face = §§newclass(Face,Object);
}

