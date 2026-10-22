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
   
   public class Sphere extends Mesh
   {
      
      public function Sphere(param1:Number = 100, param2:uint = 8, param3:uint = 8, param4:Boolean = false, param5:Material = null)
      {
         var _temp_1:* = true;
         var _loc19_:Boolean = false;
         var _loc20_:Boolean = _temp_1;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc12_:Vertex = null;
         var _loc13_:Vertex = null;
         var _loc14_:Vertex = null;
         var _loc15_:* = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:* = NaN;
         super();
         loop8:
         while(true)
         {
            loop9:
            while(true)
            {
               while(true)
               {
                  §§push(param2);
                  if(_loc20_)
                  {
                     §§push(3);
                     if(_loc19_)
                     {
                        break;
                     }
                     §§push(§§pop() < §§pop());
                     if(!(_loc19_ && Boolean(param1)))
                     {
                        §§push(Boolean(§§pop()));
                        if(_loc19_ && Boolean(param2))
                        {
                           break loop9;
                        }
                        var _temp_31:* = §§pop();
                        §§push(_temp_31);
                        §§push(_temp_31);
                        if(_loc20_)
                        {
                           §§push(Boolean(§§pop()));
                        }
                        if(§§pop())
                        {
                           break loop8;
                        }
                        if(_loc19_ && Boolean(param3))
                        {
                           break loop8;
                        }
                     }
                     §§pop();
                     §§push(param3);
                  }
                  §§push(2);
                  break;
               }
               §§push(§§pop() < §§pop());
               if(!_loc19_)
               {
                  break;
               }
               break loop8;
            }
            §§push(Boolean(§§pop()));
            break;
         }
         if(§§pop())
         {
            return;
         }
         while(true)
         {
            §§push(param1);
            if(_loc20_ || Boolean(param1))
            {
               if(§§pop() < 0)
               {
                  if(_loc19_)
                  {
                     break;
                  }
                  §§push(0);
                  if(_loc20_ || Boolean(param2))
                  {
                  }
                  addr00d1:
                  §§push(Number(§§pop()));
               }
               else
               {
                  §§push(param1);
                  if(_loc20_)
                  {
                     §§push(Number(§§pop()));
                     if(_loc20_)
                     {
                        §§goto(addr00d1);
                     }
                  }
               }
            }
            param1 = §§pop();
            break;
         }
         var _loc6_:Object = new Object();
         while(true)
         {
            §§push(Math.PI * 2);
            if(_loc20_)
            {
               §§push(§§pop() / param2);
               if(_loc19_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc7_:* = §§pop();
         while(true)
         {
            §§push(Math.PI * 2);
            if(!_loc19_)
            {
               §§push(§§pop() / (param3 << 1));
               if(!_loc20_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc8_:* = §§pop();
         if(!(_loc19_ && Boolean(param2)))
         {
            _loc10_ = 0;
         }
         loop0:
         while(true)
         {
            §§push(_loc10_);
            loop1:
            while(true)
            {
               §§push(param3);
               loop2:
               while(true)
               {
                  if(§§pop() > §§pop())
                  {
                     break loop1;
                  }
                  loop14:
                  while(true)
                  {
                     §§push(_loc8_);
                     if(_loc20_ || Boolean(param3))
                     {
                        §§push(_loc10_);
                        if(!(_loc19_ && Boolean(this)))
                        {
                           §§push(§§pop() * §§pop());
                           if(!_loc19_)
                           {
                              _loc15_ = §§pop();
                              loop15:
                              while(true)
                              {
                                 loop16:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       if(!_loc19_)
                                       {
                                          §§push(Math.sin(_loc15_) * param1);
                                          if(_loc19_ && Boolean(param2))
                                          {
                                             break;
                                          }
                                          _loc16_ = §§pop();
                                          if(!_loc20_)
                                          {
                                             break loop16;
                                          }
                                          _loc17_ = Math.cos(_loc15_) * param1;
                                          §§push(0);
                                          if(!_loc20_)
                                          {
                                             break loop0;
                                          }
                                          §§push(uint(§§pop()));
                                          if(!_loc20_)
                                          {
                                             break loop15;
                                          }
                                          _loc9_ = §§pop();
                                       }
                                       §§goto(addr019c);
                                    }
                                 }
                                 while(true)
                                 {
                                    §§push(_loc9_);
                                    if(!(_loc20_ || Boolean(param1)))
                                    {
                                       break loop2;
                                    }
                                    §§push(param2);
                                    if(!(_loc19_ && Boolean(param3)))
                                    {
                                       if(§§pop() > §§pop())
                                       {
                                          break loop14;
                                       }
                                       §§push(_loc7_);
                                       if(!_loc19_)
                                       {
                                          addr01ab:
                                          §§push(§§pop() * _loc9_);
                                       }
                                       break loop17;
                                    }
                                    continue loop2;
                                 }
                                 addr0215:
                                 §§goto(addr0215);
                                 addr019c:
                              }
                              addr020c:
                              _loc9_ = uint(§§pop() + 1);
                              if(_loc20_)
                              {
                                 break loop16;
                              }
                              break loop1;
                           }
                           addr01ac:
                           §§push(Number(§§pop()));
                           if(_loc20_)
                           {
                              _loc18_ = §§pop();
                              §§push(this);
                              §§push(-Math.sin(_loc18_));
                              if(_loc20_ || Boolean(param1))
                              {
                                 §§push(_loc16_);
                                 if(!_loc19_)
                                 {
                                    addr01d7:
                                    §§push(§§pop() * §§pop());
                                    §§push(Math.cos(_loc18_) * _loc16_);
                                 }
                                 §§push(_loc17_);
                                 §§push(_loc9_ / param2);
                                 §§push(_loc10_ / param3);
                                 §§push(_loc9_ + "_");
                                 if(_loc20_ || Boolean(this))
                                 {
                                    §§push(§§pop() + _loc10_);
                                 }
                                 §§pop().createVertex(§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),_loc6_);
                                 §§push(_loc9_);
                                 break loop15;
                              }
                              §§goto(addr01d7);
                           }
                           §§goto(addr020c);
                        }
                        §§goto(addr01ab);
                     }
                     §§goto(addr01ac);
                  }
                  §§push(_loc10_);
                  if(_loc19_ && Boolean(param1))
                  {
                     break;
                  }
                  continue loop0;
               }
            }
            §§push(0);
            break;
            _loc10_ = uint(§§pop() + 1);
         }
         var _loc11_:* = uint(§§pop());
         loop18:
         while(true)
         {
            §§push(1);
            if(!_loc19_)
            {
               _loc9_ = uint(§§pop());
               while(true)
               {
                  §§push(_loc9_);
                  while(true)
                  {
                     §§push(param2);
                     addr041a:
                     while(true)
                     {
                        if(§§pop() > §§pop())
                        {
                           break loop18;
                        }
                        §§push(0);
                     }
                     §§goto(addr03ec);
                  }
                  addr0414:
                  §§push(uint(§§pop() + 1));
                  _loc9_ = §§pop();
               }
               break;
               addr0417:
            }
            §§push(uint(§§pop()));
            if(_loc20_ || Boolean(param1))
            {
               addr0283:
               _loc10_ = §§pop();
               while(true)
               {
                  while(true)
                  {
                     if(!(_loc19_ && Boolean(param3)))
                     {
                        loop7:
                        while(true)
                        {
                           §§push(_loc10_);
                           §§push(param3);
                           if(_loc20_)
                           {
                              if(§§pop() >= §§pop())
                              {
                                 addr03ec:
                                 if(_loc20_ || Boolean(param2))
                                 {
                                    addr03fa:
                                    §§push(uint(_loc9_));
                                    if(_loc19_)
                                    {
                                       continue loop5;
                                    }
                                    _loc11_ = §§pop();
                                    if(_loc20_)
                                    {
                                       §§push(_loc9_);
                                       if(_loc20_)
                                       {
                                          break loop5;
                                       }
                                       continue loop5;
                                    }
                                    addr045d:
                                    addr042b:
                                    §§push(§§findproperty(boundMinX));
                                    §§push(param1);
                                    if(!(_loc19_ && Boolean(this)))
                                    {
                                       §§push(-§§pop());
                                    }
                                    §§pop().boundMinX = §§pop();
                                    if(!_loc19_)
                                    {
                                       addr0445:
                                       §§push(§§findproperty(boundMinY));
                                       §§push(param1);
                                       if(_loc20_)
                                       {
                                          §§push(-§§pop());
                                       }
                                       §§pop().boundMinY = §§pop();
                                       §§push(§§findproperty(boundMinZ));
                                       §§push(param1);
                                       if(_loc20_)
                                       {
                                          §§push(-§§pop());
                                       }
                                       §§pop().boundMinZ = §§pop();
                                    }
                                    boundMaxX = param1;
                                    if(!(_loc19_ && Boolean(this)))
                                    {
                                       boundMaxY = param1;
                                    }
                                    boundMaxZ = param1;
                                 }
                                 §§goto(addr0484);
                              }
                              else
                              {
                                 §§push(_loc10_);
                                 if(!(_loc19_ && Boolean(param2)))
                                 {
                                    addr02a8:
                                    §§push(param3);
                                    if(_loc20_)
                                    {
                                       if(§§pop() < §§pop() - 1)
                                       {
                                          if(_loc20_)
                                          {
                                             _loc12_ = _loc6_[_loc11_ + "_" + _loc10_];
                                             _loc13_ = _loc6_[_loc11_ + "_" + (_loc10_ + 1)];
                                             _loc14_ = _loc6_[_loc9_ + "_" + (_loc10_ + 1)];
                                             if(_loc20_)
                                             {
                                                if(param4)
                                                {
                                                   if(!(_loc19_ && Boolean(param3)))
                                                   {
                                                      this.createFace(_loc12_,_loc14_,_loc13_,param5);
                                                      if(_loc20_)
                                                      {
                                                         addr031f:
                                                      }
                                                      addr0330:
                                                      §§push(_loc10_);
                                                      if(!(_loc19_ && Boolean(param1)))
                                                      {
                                                         addr0340:
                                                         if(§§pop() > 0)
                                                         {
                                                            if(_loc19_ && Boolean(param2))
                                                            {
                                                               break loop18;
                                                            }
                                                            _loc12_ = _loc6_[_loc9_ + "_" + (_loc10_ + 1)];
                                                            _loc13_ = _loc6_[_loc9_ + "_" + _loc10_];
                                                            _loc14_ = _loc6_[_loc11_ + "_" + _loc10_];
                                                            if(!_loc19_)
                                                            {
                                                               if(param4)
                                                               {
                                                                  if(_loc20_ || Boolean(param3))
                                                                  {
                                                                     this.createFace(_loc12_,_loc14_,_loc13_,param5);
                                                                     if(_loc20_)
                                                                     {
                                                                        addr03b4:
                                                                     }
                                                                     addr03c5:
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc10_);
                                                                           if(_loc20_ || Boolean(param2))
                                                                           {
                                                                              addr03d5:
                                                                              §§push(§§pop() + 1);
                                                                              if(!_loc19_)
                                                                              {
                                                                                 continue loop7;
                                                                              }
                                                                              §§goto(addr0414);
                                                                           }
                                                                           _loc9_ = §§pop();
                                                                           §§goto(addr0417);
                                                                        }
                                                                        §§goto(addr0340);
                                                                     }
                                                                     §§goto(addr042b);
                                                                  }
                                                                  §§goto(addr03b4);
                                                               }
                                                               this.createFace(_loc12_,_loc13_,_loc14_,param5);
                                                               §§goto(addr03c5);
                                                            }
                                                            §§goto(addr03b4);
                                                         }
                                                         §§goto(addr03c5);
                                                      }
                                                      §§goto(addr03d5);
                                                   }
                                                   §§goto(addr031f);
                                                }
                                                this.createFace(_loc12_,_loc13_,_loc14_,param5);
                                             }
                                             §§goto(addr0330);
                                          }
                                          §§goto(addr03fa);
                                       }
                                       §§goto(addr0330);
                                    }
                                    §§goto(addr041a);
                                 }
                              }
                              §§goto(addr0403);
                           }
                           §§goto(addr041a);
                           _loc10_ = uint(§§pop());
                        }
                        break loop18;
                     }
                     §§goto(addr03fa);
                  }
                  §§goto(addr0283);
               }
               addr0484:
               return;
            }
            §§goto(addr02a8);
         }
         calculateNormals(true);
         while(true)
         {
            if(!_loc19_)
            {
               break loop21;
            }
            §§goto(addr0445);
         }
         §§goto(addr045d);
      }
      
      private function createVertex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:String, param7:Object) : Vertex
      {
         §§push(false);
         var _loc9_:Boolean = true;
         var _loc10_:* = §§pop();
         var _loc8_:Vertex = new Vertex();
         _loc8_.x = param1;
         _loc8_.y = param2;
         _loc8_.z = param3;
         _loc8_.u = param4;
         _loc8_.v = param5;
         while(true)
         {
            if(_loc9_ || Boolean(param3))
            {
               _loc8_.next = vertexList;
               vertexList = _loc8_;
               if(_loc10_)
               {
                  break;
               }
            }
            param7[param6] = _loc8_;
            break;
         }
         return _loc8_;
      }
      
      private function createFace(param1:Vertex, param2:Vertex, param3:Vertex, param4:Material) : void
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         var _loc5_:Face = new Face();
         _loc5_.material = param4;
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               while(true)
               {
                  if(!(_loc6_ && Boolean(param1)))
                  {
                     _loc5_.wrapper = new Wrapper();
                     §§push(_loc5_.wrapper);
                     if(_loc7_ || Boolean(param1))
                     {
                        §§pop().alternativa3d::vertex = param1;
                        if(!_loc7_)
                        {
                           break;
                        }
                        §§push(_loc5_.wrapper);
                        if(!(_loc7_ || Boolean(param1)))
                        {
                           break loop1;
                        }
                     }
                     §§pop().alternativa3d::next = new Wrapper();
                     while(true)
                     {
                        §§push(_loc5_.wrapper);
                        if(!_loc6_)
                        {
                           §§push(§§pop().alternativa3d::next);
                           if(_loc6_)
                           {
                              break;
                           }
                           §§pop().alternativa3d::vertex = param2;
                           §§push(_loc5_.wrapper);
                           if(_loc6_)
                           {
                              break loop1;
                           }
                        }
                        §§push(§§pop().alternativa3d::next);
                        if(!_loc6_)
                        {
                           break;
                        }
                        break loop0;
                     }
                     §§pop().alternativa3d::next = new Wrapper();
                  }
                  §§push(_loc5_.wrapper);
                  break loop1;
               }
               §§goto(addr00d6);
            }
            §§push(§§pop().alternativa3d::next);
            if(!(_loc6_ && Boolean(this)))
            {
               break;
            }
            §§goto(addr00c5);
         }
         addr00c5:
         §§pop().alternativa3d::next.alternativa3d::vertex = param3;
         _loc5_.next = faceList;
         faceList = _loc5_;
         addr00d6:
      }
      
      override public function clone() : Object3D
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         var _loc1_:Sphere = new Sphere();
         if(!(_loc2_ && Boolean(this)))
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
if(_loc1_)
{
   this.Sphere = §§newclass(Sphere,Mesh);
}

