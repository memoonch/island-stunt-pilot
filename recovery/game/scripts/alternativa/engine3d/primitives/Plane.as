package alternativa.engine3d.primitives
{
   import alternativa.engine3d.*;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   
   use namespace alternativa3d;
   
   public class Plane extends Mesh
   {
      
      public function Plane(param1:Number = 100, param2:Number = 100, param3:uint = 1, param4:uint = 1, param5:Boolean = true, param6:Boolean = false, param7:Boolean = false, param8:Material = null, param9:Material = null)
      {
         var _temp_1:* = true;
         var _loc24_:Boolean = false;
         var _loc25_:Boolean = _temp_1;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:int = 0;
         loop10:
         while(true)
         {
            loop11:
            while(true)
            {
               loop12:
               while(true)
               {
                  loop38:
                  while(true)
                  {
                     while(true)
                     {
                        if(_loc25_ || Boolean(param2))
                        {
                           super();
                           if(!_loc24_)
                           {
                              §§push(param3);
                              if(!_loc25_)
                              {
                                 break;
                              }
                              §§push(0);
                              if(_loc24_ && Boolean(param1))
                              {
                                 break loop38;
                              }
                              §§push(§§pop() <= §§pop());
                              if(!(_loc24_ && Boolean(param1)))
                              {
                                 §§push(Boolean(§§pop()));
                                 if(!(_loc25_ || Boolean(param3)))
                                 {
                                    break loop12;
                                 }
                              }
                              var _temp_65:* = §§pop();
                              §§push(_temp_65);
                              §§push(_temp_65);
                              if(!(_loc24_ && Boolean(this)))
                              {
                                 §§push(Boolean(§§pop()));
                              }
                              if(§§pop())
                              {
                                 break loop11;
                              }
                              if(_loc24_ && Boolean(this))
                              {
                                 break loop11;
                              }
                              §§pop();
                              if(!_loc25_)
                              {
                                 break loop10;
                              }
                           }
                        }
                        §§push(param4);
                        if(_loc25_ || Boolean(param3))
                        {
                           break;
                        }
                        §§goto(addr00d0);
                     }
                     §§push(0);
                     if(_loc25_)
                     {
                        §§push(§§pop() <= §§pop());
                        if(!(_loc24_ && Boolean(param2)))
                        {
                           break loop12;
                        }
                        break loop11;
                     }
                     break;
                  }
                  §§goto(addr00d2);
               }
               §§push(Boolean(§§pop()));
               break;
            }
            if(§§pop())
            {
               if(_loc25_ || Boolean(param3))
               {
                  break;
               }
            }
            addr00d2:
            var _loc13_:int = param3 + 1;
            var _loc14_:int = param4 + 1;
            addr00d0:
            §§push(param1);
            if(!(_loc24_ && Boolean(this)))
            {
               §§push(§§pop() * 0.5);
               if(_loc25_ || Boolean(this))
               {
                  §§push(Number(§§pop()));
               }
            }
            var _loc15_:* = §§pop();
            while(true)
            {
               §§push(param2);
               if(_loc25_ || Boolean(this))
               {
                  §§push(§§pop() * 0.5);
                  if(_loc24_)
                  {
                     break;
                  }
               }
               §§push(Number(§§pop()));
               break;
            }
            var _loc16_:* = §§pop();
            §§push(1 / param3);
            if(_loc25_ || Boolean(param3))
            {
               §§push(Number(§§pop()));
            }
            var _loc17_:* = §§pop();
            §§push(1 / param4);
            if(!(_loc24_ && Boolean(param1)))
            {
               §§push(Number(§§pop()));
            }
            var _loc18_:* = §§pop();
            while(true)
            {
               §§push(param1);
               if(_loc25_)
               {
                  §§push(§§pop() / param3);
                  if(!(_loc25_ || Boolean(param3)))
                  {
                     break;
                  }
               }
               §§push(Number(§§pop()));
               break;
            }
            var _loc19_:* = §§pop();
            while(true)
            {
               §§push(param2);
               if(!(_loc24_ && Boolean(param2)))
               {
                  §§push(§§pop() / param4);
                  if(_loc24_ && Boolean(param3))
                  {
                     break;
                  }
               }
               §§push(Number(§§pop()));
               break;
            }
            var _loc20_:* = §§pop();
            var _loc21_:Vector.<Vertex> = new Vector.<Vertex>();
            §§push(0);
            if(_loc25_)
            {
               §§push(int(§§pop()));
            }
            var _loc22_:* = §§pop();
            if(!(_loc24_ && Boolean(param1)))
            {
               §§push(0);
               if(_loc25_)
               {
                  §§push(int(§§pop()));
               }
               _loc10_ = §§pop();
            }
            loop0:
            while(true)
            {
               while(true)
               {
                  while(true)
                  {
                     while(true)
                     {
                        while(true)
                        {
                           if(_loc10_ >= _loc13_)
                           {
                              while(true)
                              {
                                 §§push(0);
                                 if(_loc25_)
                                 {
                                    §§push(int(§§pop()));
                                    if(!(_loc25_ || Boolean(this)))
                                    {
                                       break;
                                    }
                                    _loc10_ = §§pop();
                                    if(_loc24_)
                                    {
                                       break loop32;
                                    }
                                 }
                                 else
                                 {
                                    §§goto(addr038c);
                                 }
                                 §§goto(addr039e);
                              }
                              §§goto(addr028d);
                           }
                           else
                           {
                              §§push(0);
                              if(!(_loc24_ && Boolean(this)))
                              {
                                 §§push(int(§§pop()));
                                 if(!(_loc24_ && Boolean(param1)))
                                 {
                                    _loc11_ = §§pop();
                                    if(_loc24_)
                                    {
                                       break loop0;
                                    }
                                    while(true)
                                    {
                                       §§push(_loc11_);
                                       §§push(_loc14_);
                                       if(_loc24_)
                                       {
                                          break;
                                       }
                                       if(§§pop() >= §§pop())
                                       {
                                          §§push(_loc10_ + 1);
                                          if(!(_loc25_ || Boolean(param1)))
                                          {
                                             break loop28;
                                          }
                                          continue loop0;
                                       }
                                       _loc21_[_loc22_++] = this.createVertex(_loc10_ * _loc19_ - _loc15_,_loc11_ * _loc20_ - _loc16_,0,_loc10_ * _loc17_,(param4 - _loc11_) * _loc18_);
                                       if(_loc25_ || Boolean(this))
                                       {
                                          if(_loc25_)
                                          {
                                             §§push(_loc11_ + 1);
                                             if(_loc25_)
                                             {
                                                continue;
                                             }
                                             §§goto(addr03dd);
                                          }
                                       }
                                       else
                                       {
                                          §§goto(addr0465);
                                       }
                                       §§goto(addr048f);
                                       _loc11_ = int(§§pop());
                                    }
                                    §§goto(addr05a0);
                                 }
                                 else
                                 {
                                    §§goto(addr041b);
                                 }
                              }
                           }
                           §§goto(addr05bb);
                        }
                        if(!_loc24_)
                        {
                           break;
                        }
                        break loop30;
                     }
                     §§goto(addr05d2);
                  }
                  §§goto(addr04da);
               }
               _loc10_ = int(§§pop());
               boundMaxX = _loc15_;
               if(_loc25_)
               {
                  break loop30;
               }
               break loop18;
            }
            addr0296:
            loop3:
            while(true)
            {
               while(true)
               {
                  while(true)
                  {
                     loop28:
                     while(true)
                     {
                        loop29:
                        while(true)
                        {
                           loop30:
                           while(true)
                           {
                              loop31:
                              while(true)
                              {
                                 loop32:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc11_);
                                       §§push(_loc14_);
                                       if(!_loc24_)
                                       {
                                          if(§§pop() >= §§pop())
                                          {
                                             _loc10_++;
                                             if(!(_loc24_ && Boolean(param2)))
                                             {
                                                while(true)
                                                {
                                                   §§push(_loc10_);
                                                   if(_loc24_)
                                                   {
                                                      break loop28;
                                                   }
                                                   if(§§pop() >= _loc13_)
                                                   {
                                                      §§push(param5);
                                                      if(!(_loc24_ && Boolean(param2)))
                                                      {
                                                         if(§§pop())
                                                         {
                                                            if(_loc24_)
                                                            {
                                                               break loop29;
                                                            }
                                                            §§push(0);
                                                            if(!(_loc24_ && Boolean(param2)))
                                                            {
                                                               §§push(int(§§pop()));
                                                               if(!_loc25_)
                                                               {
                                                                  break loop3;
                                                               }
                                                            }
                                                            else
                                                            {
                                                               _loc11_ = int(§§pop() + 1);
                                                               §§goto(addr047b);
                                                            }
                                                            §§goto(addr03dd);
                                                         }
                                                         addr05d2:
                                                         §§push(§§findproperty(boundMinX));
                                                         §§push(_loc15_);
                                                         if(_loc25_)
                                                         {
                                                            §§push(-§§pop());
                                                         }
                                                         §§pop().boundMinX = §§pop();
                                                         if(_loc25_ || Boolean(param3))
                                                         {
                                                            §§push(§§findproperty(boundMinY));
                                                            §§push(_loc16_);
                                                            if(!(_loc24_ && Boolean(this)))
                                                            {
                                                               §§push(-§§pop());
                                                            }
                                                            §§pop().boundMinY = §§pop();
                                                            boundMinZ = 0;
                                                            if(!(_loc24_ && Boolean(param1)))
                                                            {
                                                               break loop16;
                                                            }
                                                         }
                                                         break loop18;
                                                      }
                                                      §§goto(addr0500);
                                                   }
                                                   else
                                                   {
                                                      addr028d:
                                                      _loc11_ = 0;
                                                      if(_loc25_)
                                                      {
                                                         §§goto(addr0296);
                                                      }
                                                   }
                                                   §§goto(addr04a3);
                                                }
                                                break loop10;
                                                addr039e:
                                             }
                                             §§goto(addr042c);
                                             §§goto(addr047b);
                                          }
                                          else
                                          {
                                             §§push(_loc10_);
                                             if(_loc25_)
                                             {
                                                §§push(param3);
                                                if(!_loc25_)
                                                {
                                                   break loop31;
                                                }
                                                var _temp_49:* = §§pop() < §§pop();
                                                §§push(_temp_49);
                                                §§push(_temp_49);
                                                if(_loc24_ && Boolean(this))
                                                {
                                                   break;
                                                }
                                                §§push(Boolean(§§pop()));
                                                if(!(_loc25_ || Boolean(param1)))
                                                {
                                                   break;
                                                }
                                                if(§§pop())
                                                {
                                                   §§pop();
                                                   if(!(_loc25_ || Boolean(param2)))
                                                   {
                                                      break loop32;
                                                   }
                                                   §§push(_loc11_);
                                                   §§push(param4);
                                                   if(_loc24_)
                                                   {
                                                      break loop31;
                                                   }
                                                   §§push(§§pop() < §§pop());
                                                }
                                                if(§§pop())
                                                {
                                                   if(!(_loc25_ || Boolean(this)))
                                                   {
                                                      break loop30;
                                                   }
                                                   this.createFace(_loc21_[_loc10_ * _loc14_ + _loc11_],_loc21_[(_loc10_ + 1) * _loc14_ + _loc11_],_loc21_[(_loc10_ + 1) * _loc14_ + _loc11_ + 1],_loc21_[_loc10_ * _loc14_ + _loc11_ + 1],0,0,1,0,param6,param7,param9);
                                                }
                                                §§push(_loc11_ + 1);
                                                if(!_loc25_)
                                                {
                                                   break loop3;
                                                }
                                                §§push(int(§§pop()));
                                                if(!(_loc24_ && Boolean(this)))
                                                {
                                                   _loc11_ = §§pop();
                                                   if(!(_loc25_ || Boolean(param1)))
                                                   {
                                                      break loop29;
                                                   }
                                                   continue;
                                                }
                                                §§goto(addr047d);
                                             }
                                             else
                                             {
                                                §§goto(addr04c9);
                                             }
                                          }
                                       }
                                       §§goto(addr0485);
                                    }
                                    §§goto(addr0510);
                                 }
                                 §§goto(addr05b2);
                              }
                              §§goto(addr04f8);
                           }
                           §§goto(addr0622);
                        }
                        §§goto(addr03ed);
                     }
                     §§goto(addr0517);
                  }
                  §§goto(addr0519);
               }
               break loop9;
            }
            addr03f6:
            _loc10_ = §§pop();
            if(!(_loc24_ && Boolean(param2)))
            {
               loop4:
               while(true)
               {
                  loop24:
                  while(true)
                  {
                     loop25:
                     while(true)
                     {
                        §§push(_loc10_);
                        §§push(_loc13_);
                        if(!(_loc24_ && Boolean(param3)))
                        {
                           if(§§pop() >= §§pop())
                           {
                              if(!(_loc24_ && Boolean(param1)))
                              {
                                 addr04c9:
                                 _loc10_ = 0;
                                 while(true)
                                 {
                                    §§push(_loc10_);
                                    addr05c6:
                                    while(true)
                                    {
                                       §§push(_loc13_);
                                       break loop23;
                                    }
                                    §§goto(addr04c9);
                                    _loc10_ = §§pop();
                                 }
                                 break loop10;
                                 addr05c4:
                              }
                              addr04e2:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(_loc11_);
                                    if(_loc25_)
                                    {
                                       addr0590:
                                       §§push(_loc14_);
                                       if(!(_loc25_ || Boolean(param1)))
                                       {
                                          break loop23;
                                       }
                                       if(§§pop() >= §§pop())
                                       {
                                          if(!(_loc25_ || Boolean(param3)))
                                          {
                                             break loop18;
                                          }
                                          §§push(_loc10_ + 1);
                                          if(!_loc24_)
                                          {
                                             addr05bb:
                                             §§push(int(§§pop()));
                                             if(_loc25_)
                                             {
                                                addr05c2:
                                                _loc10_ = §§pop();
                                                §§goto(addr05c4);
                                             }
                                             §§goto(addr05c6);
                                          }
                                          §§goto(addr05c2);
                                       }
                                       else
                                       {
                                          addr0519:
                                          §§push(_loc10_);
                                          §§push(param3);
                                          if(!(_loc24_ && Boolean(param3)))
                                          {
                                             addr051b:
                                             addr04f8:
                                             addr0500:
                                             addr0510:
                                             §§push(§§pop() < §§pop());
                                             if(_loc25_)
                                             {
                                                §§push(Boolean(§§pop()));
                                             }
                                             var _temp_33:* = §§pop();
                                             §§push(_temp_33);
                                             §§push(_temp_33);
                                             if(_loc25_ || Boolean(param2))
                                             {
                                                §§push(Boolean(§§pop()));
                                             }
                                             if(§§pop())
                                             {
                                                §§pop();
                                                §§push(_loc11_);
                                                break loop25;
                                             }
                                             if(§§pop())
                                             {
                                                this.createFace(_loc21_[(_loc10_ + 1) * _loc14_ + _loc11_ + 1],_loc21_[(_loc10_ + 1) * _loc14_ + _loc11_],_loc21_[_loc10_ * _loc14_ + _loc11_],_loc21_[_loc10_ * _loc14_ + _loc11_ + 1],0,0,-1,0,param6,param7,param8);
                                             }
                                             §§push(_loc11_);
                                             break loop24;
                                          }
                                          §§goto(addr051b);
                                          §§push(§§pop() < §§pop());
                                       }
                                    }
                                    §§goto(addr05bb);
                                 }
                                 addr04da:
                                 _loc11_ = §§pop();
                                 if(!_loc25_)
                                 {
                                    break loop16;
                                 }
                                 §§goto(addr04e2);
                              }
                              break loop23;
                           }
                           §§push(0);
                           if(!(_loc25_ || Boolean(param3)))
                           {
                              continue loop4;
                           }
                           §§push(int(§§pop()));
                           if(!(_loc25_ || Boolean(param1)))
                           {
                              break;
                           }
                           _loc11_ = §§pop();
                           while(true)
                           {
                              addr047d:
                              §§push(_loc11_);
                              §§push(_loc14_);
                              if(!_loc25_)
                              {
                                 break loop23;
                              }
                              if(§§pop() >= §§pop())
                              {
                                 if(!_loc25_)
                                 {
                                    addr0622:
                                    boundMaxY = _loc16_;
                                    if(_loc25_ || Boolean(param2))
                                    {
                                       break loop18;
                                    }
                                    return;
                                 }
                                 §§push(_loc10_ + 1);
                                 if(!(_loc25_ || Boolean(param3)))
                                 {
                                    break loop24;
                                 }
                                 §§push(int(§§pop()));
                                 continue loop4;
                              }
                              addr0465:
                              _loc21_[_loc22_++] = this.createVertex(_loc10_ * _loc19_ - _loc15_,_loc11_ * _loc20_ - _loc16_,0,(param3 - _loc10_) * _loc17_,(param4 - _loc11_) * _loc18_);
                              §§push(_loc11_);
                              if(!(_loc24_ && Boolean(this)))
                              {
                                 continue;
                              }
                              _loc11_ = int(§§pop() + 1);
                           }
                           _loc22_ = §§pop();
                           if(_loc25_ || Boolean(param3))
                           {
                              addr03ed:
                              §§push(0);
                              if(_loc24_)
                              {
                                 break;
                              }
                              §§goto(addr03f6);
                           }
                           §§goto(addr04e2);
                           §§goto(addr0590);
                        }
                        §§goto(addr05a0);
                     }
                     addr0517:
                     §§goto(addr0519);
                  }
                  continue loop18;
                  _loc10_ = §§pop();
               }
               break;
               addr04a3:
            }
            §§goto(addr05c4);
         }
      }
      
      private function createVertex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Vertex
      {
         var _temp_1:* = true;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = _temp_1;
         var _loc6_:Vertex = new Vertex();
         loop0:
         while(true)
         {
            if(!(_loc7_ && Boolean(param3)))
            {
               _loc6_.x = param1;
               _loc6_.y = param2;
               while(true)
               {
                  if(_loc8_)
                  {
                     _loc6_.z = param3;
                     if(_loc7_)
                     {
                        break;
                     }
                     _loc6_.u = param4;
                  }
                  _loc6_.v = param5;
                  _loc6_.next = vertexList;
                  if(_loc8_ || Boolean(this))
                  {
                     break;
                  }
                  break loop0;
               }
            }
            vertexList = _loc6_;
            break;
         }
         return _loc6_;
      }
      
      private function createFace(param1:Vertex, param2:Vertex, param3:Vertex, param4:Vertex, param5:Number, param6:Number, param7:Number, param8:Number, param9:Boolean, param10:Boolean, param11:Material) : void
      {
         §§push(false);
         var _loc14_:Boolean = true;
         var _loc15_:* = §§pop();
         var _loc12_:Vertex = null;
         var _loc13_:Face = null;
         loop0:
         while(true)
         {
            if(!(_loc15_ && Boolean(param1)))
            {
               §§push(param9);
               if(!_loc15_)
               {
                  if(§§pop())
                  {
                     loop1:
                     while(true)
                     {
                        if(!_loc15_)
                        {
                           param5 = -param5;
                           while(true)
                           {
                              if(_loc14_)
                              {
                                 §§push(-param6);
                                 if(_loc15_ && Boolean(param3))
                                 {
                                    break loop1;
                                 }
                                 §§push(Number(§§pop()));
                                 if(_loc15_ && Boolean(param2))
                                 {
                                    break;
                                 }
                                 param6 = §§pop();
                              }
                              §§push(-param7);
                              if(_loc14_)
                              {
                                 §§push(Number(§§pop()));
                                 break;
                              }
                              break loop1;
                           }
                           param7 = §§pop();
                        }
                        §§push(param8);
                        if(!_loc15_)
                        {
                           break;
                        }
                        addr007f:
                        param8 = §§pop();
                        _loc12_ = param1;
                        param1 = param4;
                        param4 = _loc12_;
                        _loc12_ = param2;
                        param2 = param3;
                        param3 = _loc12_;
                     }
                     §§goto(addr007f);
                  }
                  §§push(param10);
               }
               if(!§§pop())
               {
                  _loc13_ = new Face();
                  while(true)
                  {
                     if(_loc14_)
                     {
                        _loc13_.material = param11;
                        _loc13_.wrapper = new Wrapper();
                        §§push(_loc13_.wrapper);
                        if(!(_loc14_ || Boolean(param3)))
                        {
                           break;
                        }
                        §§pop().alternativa3d::vertex = param1;
                     }
                     _loc13_.wrapper.next = new Wrapper();
                     if(_loc14_ || Boolean(param2))
                     {
                        §§push(_loc13_.wrapper);
                        if(!(_loc15_ && Boolean(param2)))
                        {
                           §§pop().alternativa3d::next.alternativa3d::vertex = param2;
                           _loc13_.wrapper.next.next = new Wrapper();
                           §§push(_loc13_.wrapper);
                        }
                        §§push(§§pop().alternativa3d::next);
                        if(_loc14_)
                        {
                           §§push(§§pop().alternativa3d::next);
                        }
                        §§pop().alternativa3d::vertex = param3;
                        if(!(_loc14_ || Boolean(param1)))
                        {
                           break loop0;
                        }
                        §§push(_loc13_.wrapper);
                        if(_loc15_)
                        {
                           break;
                        }
                        §§push(§§pop().alternativa3d::next.alternativa3d::next);
                        if(_loc14_ || Boolean(param3))
                        {
                           §§pop().alternativa3d::next = new Wrapper();
                           §§push(_loc13_.wrapper);
                           break;
                        }
                        §§pop().alternativa3d::vertex = param4;
                        if(_loc14_ || Boolean(param2))
                        {
                           _loc13_.normalX = param5;
                           if(!_loc14_)
                           {
                              break loop0;
                           }
                           _loc13_.normalY = param6;
                           _loc13_.normalZ = param7;
                           _loc13_.offset = param8;
                           if(_loc14_ || Boolean(param2))
                           {
                              _loc13_.next = faceList;
                              if(_loc15_ && Boolean(param1))
                              {
                                 break loop0;
                              }
                           }
                        }
                     }
                     faceList = _loc13_;
                     break loop0;
                  }
                  §§goto(addr0339);
               }
            }
            _loc13_ = new Face();
            _loc13_.material = param11;
            _loc13_.wrapper = new Wrapper();
            loop4:
            while(true)
            {
               loop5:
               while(true)
               {
                  loop9:
                  while(true)
                  {
                     §§push(_loc13_.wrapper);
                     if(_loc14_ || Boolean(this))
                     {
                        §§pop().alternativa3d::vertex = param1;
                        if(_loc15_)
                        {
                           break loop5;
                        }
                        while(true)
                        {
                           §§push(_loc13_.wrapper);
                           if(_loc14_ || Boolean(param2))
                           {
                              §§pop().alternativa3d::next = new Wrapper();
                              if(_loc15_)
                              {
                                 break loop4;
                              }
                              §§push(_loc13_.wrapper);
                              if(!(_loc14_ || Boolean(param1)))
                              {
                                 break;
                              }
                           }
                           §§push(§§pop().alternativa3d::next);
                           if(_loc14_)
                           {
                              §§pop().alternativa3d::vertex = param2;
                              §§push(_loc13_.wrapper);
                              if(!(_loc15_ && Boolean(param3)))
                              {
                                 break;
                              }
                              addr0142:
                              §§push(§§pop().alternativa3d::next);
                              if(_loc14_ || Boolean(param2))
                              {
                                 §§push(§§pop().alternativa3d::next);
                              }
                              break loop9;
                           }
                           addr0137:
                           §§pop().alternativa3d::next = new Wrapper();
                        }
                        §§push(§§pop().alternativa3d::next);
                        if(_loc15_ && Boolean(param1))
                        {
                           break;
                        }
                        §§goto(addr0137);
                        §§push(_loc13_.wrapper);
                     }
                     §§goto(addr0142);
                  }
                  §§pop().alternativa3d::vertex = param3;
                  break;
               }
               _loc13_.normalX = param5;
               if(_loc14_ || Boolean(this))
               {
                  _loc13_.normalY = param6;
                  if(_loc14_)
                  {
                     break;
                  }
               }
               §§goto(addr017d);
            }
            _loc13_.normalZ = param7;
            addr017d:
            _loc13_.offset = param8;
            _loc13_.next = faceList;
            faceList = _loc13_;
            _loc13_ = new Face();
            _loc13_.material = param11;
            if(_loc14_ || Boolean(param2))
            {
               _loc13_.wrapper = new Wrapper();
               loop6:
               while(true)
               {
                  loop7:
                  while(true)
                  {
                     while(true)
                     {
                        if(_loc14_ || Boolean(param2))
                        {
                           §§push(_loc13_.wrapper);
                           if(_loc15_)
                           {
                              break;
                           }
                           §§pop().alternativa3d::vertex = param1;
                           §§push(_loc13_.wrapper);
                           if(!(_loc14_ || Boolean(this)))
                           {
                              break loop7;
                           }
                           §§pop().alternativa3d::next = new Wrapper();
                           §§push(_loc13_.wrapper);
                           if(!(_loc14_ || Boolean(this)))
                           {
                              break loop7;
                           }
                           §§push(§§pop().alternativa3d::next);
                           if(_loc15_)
                           {
                              break loop6;
                           }
                           §§pop().alternativa3d::vertex = param3;
                        }
                        §§push(_loc13_.wrapper);
                        if(_loc14_ || Boolean(param2))
                        {
                           break loop7;
                        }
                        break;
                     }
                     §§goto(addr0237);
                  }
                  §§push(§§pop().alternativa3d::next);
                  if(_loc14_)
                  {
                     break;
                  }
                  §§goto(addr0249);
               }
               §§pop().alternativa3d::next = new Wrapper();
               addr0249:
               addr0237:
               §§push(_loc13_.wrapper.next);
               if(!(_loc15_ && Boolean(param3)))
               {
                  §§push(§§pop().alternativa3d::next);
               }
               §§pop().alternativa3d::vertex = param4;
            }
            _loc13_.normalX = param5;
            _loc13_.normalY = param6;
            _loc13_.normalZ = param7;
            if(_loc14_)
            {
               _loc13_.offset = param8;
            }
            _loc13_.next = faceList;
            faceList = _loc13_;
            break;
         }
      }
      
      override public function clone() : Object3D
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         var _loc1_:Plane = new Plane();
         if(_loc3_)
         {
            _loc1_.clonePropertiesFrom(this);
         }
         return _loc1_;
      }
   }
}

§§push(false);
true;
§§pop();
if(_loc1_ || Boolean(_loc2_))
{
   this.Plane = §§newclass(Plane,Mesh);
}

