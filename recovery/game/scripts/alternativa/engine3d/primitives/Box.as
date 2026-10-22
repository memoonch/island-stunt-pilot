package alternativa.engine3d.primitives
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   
   use namespace alternativa3d;
   
   public class Box extends Mesh
   {
      
      public function Box(param1:Number = 100, param2:Number = 100, param3:Number = 100, param4:uint = 1, param5:uint = 1, param6:uint = 1, param7:Boolean = false, param8:Boolean = false, param9:Material = null, param10:Material = null, param11:Material = null, param12:Material = null, param13:Material = null, param14:Material = null)
      {
         §§push(false);
         var _loc34_:Boolean = true;
         var _loc35_:* = §§pop();
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc17_:int = 0;
         loop27:
         while(true)
         {
            if(_loc34_)
            {
               super();
               if(_loc35_)
               {
                  break;
               }
            }
            loop28:
            while(true)
            {
               loop29:
               while(true)
               {
                  loop101:
                  while(true)
                  {
                     loop102:
                     while(true)
                     {
                        loop103:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(param4);
                              if(!_loc35_)
                              {
                                 §§push(0);
                                 if(_loc35_ && Boolean(param1))
                                 {
                                    break;
                                 }
                                 var _temp_150:* = §§pop() <= §§pop();
                                 §§push(_temp_150);
                                 §§push(_temp_150);
                                 if(_loc35_ && Boolean(param1))
                                 {
                                    break loop103;
                                 }
                                 §§push(Boolean(§§pop()));
                                 if(_loc35_ && Boolean(param3))
                                 {
                                    break loop102;
                                 }
                                 if(§§pop())
                                 {
                                    break loop101;
                                 }
                                 if(!_loc34_)
                                 {
                                    break loop29;
                                 }
                                 §§pop();
                                 if(!_loc34_)
                                 {
                                    break loop27;
                                 }
                                 §§push(param5);
                                 if(!_loc34_)
                                 {
                                    break loop28;
                                 }
                              }
                              §§push(0);
                              if(!(_loc35_ && Boolean(param3)))
                              {
                                 §§push(§§pop() <= §§pop());
                                 if(_loc34_)
                                 {
                                    §§push(Boolean(§§pop()));
                                    if(_loc34_)
                                    {
                                       break loop101;
                                    }
                                 }
                                 break loop29;
                              }
                              break;
                           }
                           §§goto(addr00d5);
                        }
                        §§goto(addr00a4);
                     }
                     §§push(Boolean(§§pop()));
                     break loop103;
                  }
                  var _temp_146:* = §§pop();
                  §§push(_temp_146);
                  §§push(_temp_146);
                  if(!_loc35_)
                  {
                     break loop102;
                  }
                  addr00a4:
                  if(!§§pop())
                  {
                     if(_loc34_)
                     {
                        §§pop();
                        if(!(_loc35_ && Boolean(param1)))
                        {
                           §§push(param6);
                           if(!(_loc35_ && Boolean(param1)))
                           {
                              break loop28;
                           }
                           addr00ec:
                           §§goto(addr00ee);
                           §§push(1);
                        }
                        §§goto(addr00e9);
                     }
                  }
                  §§goto(addr00d7);
               }
               addr00d7:
               if(!Boolean(§§pop()))
               {
                  break loop27;
               }
               if(_loc35_ && Boolean(param3))
               {
                  break loop27;
               }
               §§goto(addr00e9);
            }
            addr00ee:
            §§push(0);
            if(!_loc35_)
            {
               addr00d5:
               §§push(§§pop() <= §§pop());
               break loop29;
            }
            var _loc18_:int = §§pop() + §§pop();
            var _loc19_:int = param5 + 1;
            var _loc20_:int = param6 + 1;
            §§push(param1);
            if(!(_loc35_ && Boolean(this)))
            {
               §§push(§§pop() * 0.5);
               if(_loc34_)
               {
                  §§push(Number(§§pop()));
               }
            }
            var _loc21_:* = §§pop();
            §§push(param2);
            if(_loc34_)
            {
               §§push(§§pop() * 0.5);
               if(!(_loc35_ && Boolean(param2)))
               {
                  §§push(Number(§§pop()));
               }
            }
            var _loc22_:* = §§pop();
            §§push(param3);
            if(_loc34_)
            {
               §§push(§§pop() * 0.5);
               if(_loc34_ || Boolean(param1))
               {
                  §§push(Number(§§pop()));
               }
            }
            var _loc23_:* = §§pop();
            §§push(1 / param4);
            if(_loc34_)
            {
               §§push(Number(§§pop()));
            }
            var _loc24_:* = §§pop();
            §§push(1 / param5);
            if(_loc34_ || Boolean(param1))
            {
               §§push(Number(§§pop()));
            }
            var _loc25_:* = §§pop();
            §§push(1 / param6);
            if(_loc34_ || Boolean(this))
            {
               §§push(Number(§§pop()));
            }
            var _loc26_:* = §§pop();
            §§push(param1);
            if(_loc34_ || Boolean(this))
            {
               §§push(§§pop() / param4);
               if(!_loc35_)
               {
                  §§push(Number(§§pop()));
               }
            }
            var _loc27_:* = §§pop();
            while(true)
            {
               §§push(param2);
               if(_loc34_)
               {
                  §§push(§§pop() / param5);
                  if(_loc35_)
                  {
                     break;
                  }
               }
               §§push(Number(§§pop()));
               break;
            }
            var _loc28_:* = §§pop();
            while(true)
            {
               §§push(param3);
               if(_loc34_)
               {
                  §§push(§§pop() / param6);
                  if(_loc35_)
                  {
                     break;
                  }
               }
               §§push(Number(§§pop()));
               break;
            }
            var _loc29_:* = §§pop();
            var _loc30_:Vector.<Vertex> = new Vector.<Vertex>();
            §§push(0);
            if(!_loc35_)
            {
               §§push(int(§§pop()));
            }
            var _loc31_:* = §§pop();
            if(!_loc35_)
            {
               §§push(0);
               if(_loc34_ || Boolean(this))
               {
                  §§push(int(§§pop()));
               }
               _loc15_ = §§pop();
            }
            loop0:
            while(true)
            {
               §§push(_loc15_);
               if(_loc35_)
               {
                  break;
               }
               loop1:
               while(true)
               {
                  §§push(_loc18_);
                  if(!_loc35_)
                  {
                     if(§§pop() >= §§pop())
                     {
                        §§push(0);
                        break loop0;
                     }
                     _loc16_ = 0;
                     loop98:
                     while(true)
                     {
                        loop99:
                        while(true)
                        {
                           loop100:
                           while(true)
                           {
                              if(_loc34_ || Boolean(param1))
                              {
                                 while(true)
                                 {
                                    §§push(_loc16_);
                                    if(_loc34_ || Boolean(this))
                                    {
                                       §§push(_loc19_);
                                       if(_loc35_ && Boolean(this))
                                       {
                                          break loop99;
                                       }
                                       if(§§pop() < §§pop())
                                       {
                                          _loc30_[_loc31_++] = this.createVertex(_loc15_ * _loc27_ - _loc21_,_loc16_ * _loc28_ - _loc22_,-_loc23_,(param4 - _loc15_) * _loc24_,(param5 - _loc16_) * _loc25_);
                                          if(!_loc34_)
                                          {
                                             break loop1;
                                          }
                                          §§push(_loc16_ + 1);
                                          if(!_loc34_)
                                          {
                                             break loop98;
                                          }
                                          _loc16_ = int(§§pop());
                                          continue;
                                       }
                                       if(_loc34_ || Boolean(param2))
                                       {
                                          §§push(_loc15_ + 1);
                                          if(!(_loc35_ && Boolean(param3)))
                                          {
                                             _loc15_ = int(§§pop());
                                             if(!_loc34_)
                                             {
                                                break loop1;
                                             }
                                             continue loop0;
                                          }
                                          continue loop1;
                                       }
                                    }
                                    else
                                    {
                                       §§push(§§pop() < param5);
                                       if(!_loc35_)
                                       {
                                          §§push(Boolean(§§pop()));
                                       }
                                       if(!§§pop())
                                       {
                                          break loop100;
                                       }
                                       if(!_loc34_)
                                       {
                                          §§push(_loc15_);
                                          if(_loc34_)
                                          {
                                             break loop98;
                                          }
                                          break loop96;
                                       }
                                    }
                                 }
                                 break loop98;
                              }
                              this.createFace(_loc30_[(_loc15_ + 1) * _loc19_ + _loc16_ + 1],_loc30_[(_loc15_ + 1) * _loc19_ + _loc16_],_loc30_[_loc15_ * _loc19_ + _loc16_],_loc30_[_loc15_ * _loc19_ + _loc16_ + 1],0,0,-1,_loc23_,param7,param8,param13);
                              break;
                           }
                           §§goto(addr03bf);
                        }
                        if(§§pop() >= §§pop())
                        {
                           break loop33;
                        }
                        §§push(0);
                        if(!(_loc34_ || Boolean(this)))
                        {
                           break loop32;
                        }
                        §§push(int(§§pop()));
                        if(!_loc34_)
                        {
                           addr03bf:
                           §§push(int(§§pop() + 1));
                           if(_loc35_)
                           {
                              break;
                           }
                           _loc16_ = §§pop();
                           while(true)
                           {
                              §§push(_loc16_);
                              while(true)
                              {
                                 §§push(_loc19_);
                                 if(!(_loc34_ || Boolean(this)))
                                 {
                                    break loop93;
                                 }
                                 continue loop96;
                              }
                              break loop0;
                              _loc16_ = §§pop();
                           }
                           return;
                           addr03c9:
                        }
                        _loc16_ = §§pop();
                        §§goto(addr03c9);
                     }
                     §§push(§§pop() + 1);
                     break loop96;
                  }
                  continue loop96;
               }
               §§push(_loc16_);
               §§push(_loc35_ && Boolean(param3));
               continue loop93;
            }
            _loc15_ = §§pop();
            while(true)
            {
               §§push(_loc15_);
               §§push(_loc18_);
               if(!_loc35_)
               {
                  break loop99;
               }
               break loop93;
            }
            §§goto(addr00e9);
         }
         §§goto(addr00ec);
      }
      
      private function createVertex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Vertex
      {
         §§push(false);
         var _loc7_:Boolean = true;
         var _loc8_:* = §§pop();
         var _loc6_:Vertex = new Vertex();
         _loc6_.x = param1;
         if(_loc7_)
         {
            _loc6_.y = param2;
            _loc6_.z = param3;
            _loc6_.u = param4;
            _loc6_.v = param5;
         }
         _loc6_.next = vertexList;
         if(_loc7_ || Boolean(param2))
         {
            vertexList = _loc6_;
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
         §§push(param9);
         if(_loc14_ || Boolean(this))
         {
            if(§§pop())
            {
               §§push(-param5);
               if(_loc14_)
               {
                  param5 = §§pop();
                  if(!(_loc15_ && Boolean(param2)))
                  {
                     §§push(-param6);
                     if(!_loc15_)
                     {
                        param6 = §§pop();
                        §§push(-param7);
                     }
                     param7 = §§pop();
                  }
                  §§push(param8);
               }
               param8 = -§§pop();
               _loc12_ = param1;
               param1 = param4;
               param4 = _loc12_;
               _loc12_ = param2;
               param2 = param3;
               param3 = _loc12_;
            }
            §§push(param10);
         }
         if(§§pop())
         {
            _loc13_ = new Face();
            _loc13_.material = param11;
            if(_loc14_ || Boolean(param2))
            {
               _loc13_.wrapper = new Wrapper();
               loop0:
               while(true)
               {
                  loop1:
                  while(true)
                  {
                     loop2:
                     while(true)
                     {
                        loop3:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(_loc13_.wrapper);
                              if(!(_loc15_ && Boolean(param3)))
                              {
                                 §§pop().alternativa3d::vertex = param1;
                                 if(_loc15_)
                                 {
                                    break;
                                 }
                                 §§push(_loc13_.wrapper);
                                 if(!_loc14_)
                                 {
                                    break loop0;
                                 }
                                 §§pop().alternativa3d::next = new Wrapper();
                                 if(_loc15_ && Boolean(param2))
                                 {
                                    break loop3;
                                 }
                                 §§push(_loc13_.wrapper);
                                 if(!(_loc15_ && Boolean(this)))
                                 {
                                    §§push(§§pop().alternativa3d::next);
                                    if(!(_loc14_ || Boolean(param3)))
                                    {
                                       break loop2;
                                    }
                                    §§pop().alternativa3d::vertex = param2;
                                    if(!_loc14_)
                                    {
                                       break loop1;
                                    }
                                    §§push(_loc13_.wrapper);
                                    if(!_loc14_)
                                    {
                                       break loop0;
                                    }
                                 }
                              }
                              §§push(§§pop().alternativa3d::next);
                              if(_loc14_ || Boolean(this))
                              {
                                 §§pop().alternativa3d::next = new Wrapper();
                                 break loop1;
                              }
                              §§goto(addr0148);
                           }
                           §§goto(addr016f);
                        }
                        §§goto(addr015d);
                     }
                     §§goto(addr0146);
                  }
                  §§push(_loc13_.wrapper);
                  break;
               }
               addr0148:
               §§push(§§pop().alternativa3d::next);
               if(_loc14_ || Boolean(param2))
               {
                  addr0146:
                  §§push(§§pop().alternativa3d::next);
               }
               §§pop().alternativa3d::vertex = param3;
               if(_loc14_)
               {
                  _loc13_.normalX = param5;
                  _loc13_.normalY = param6;
                  addr015d:
                  _loc13_.normalZ = param7;
                  if(_loc14_)
                  {
                     _loc13_.offset = param8;
                     addr016f:
                     _loc13_.next = faceList;
                  }
                  faceList = _loc13_;
               }
            }
            _loc13_ = new Face();
            loop5:
            while(true)
            {
               loop6:
               while(true)
               {
                  loop7:
                  while(true)
                  {
                     if(!(_loc15_ && Boolean(param1)))
                     {
                        _loc13_.material = param11;
                        if(!_loc15_)
                        {
                           _loc13_.wrapper = new Wrapper();
                           loop8:
                           while(true)
                           {
                              §§push(_loc13_.wrapper);
                              if(!_loc15_)
                              {
                                 §§pop().alternativa3d::vertex = param1;
                                 while(true)
                                 {
                                    §§push(_loc13_.wrapper);
                                    if(!(_loc15_ && Boolean(param3)))
                                    {
                                       §§pop().alternativa3d::next = new Wrapper();
                                       if(_loc15_)
                                       {
                                          break loop6;
                                       }
                                       §§push(_loc13_.wrapper);
                                       if(!_loc14_)
                                       {
                                          break;
                                       }
                                    }
                                    §§push(§§pop().alternativa3d::next);
                                    if(!(_loc15_ && Boolean(param3)))
                                    {
                                       §§pop().alternativa3d::vertex = param3;
                                       if(!(_loc15_ && Boolean(param2)))
                                       {
                                          §§push(_loc13_.wrapper);
                                          if(!(_loc15_ && Boolean(param2)))
                                          {
                                             §§push(§§pop().alternativa3d::next);
                                             if(_loc14_ || Boolean(param3))
                                             {
                                                §§pop().alternativa3d::next = new Wrapper();
                                                §§push(_loc13_.wrapper);
                                                break;
                                             }
                                             break loop8;
                                          }
                                          break;
                                       }
                                       break loop7;
                                    }
                                    break loop8;
                                 }
                              }
                              §§push(§§pop().alternativa3d::next);
                              if(!(_loc15_ && Boolean(param2)))
                              {
                                 break;
                              }
                              addr0249:
                              §§pop().alternativa3d::vertex = param4;
                              if(_loc15_ && Boolean(this))
                              {
                                 break loop6;
                              }
                              _loc13_.normalX = param5;
                              _loc13_.normalY = param6;
                              if(!(_loc14_ || Boolean(param2)))
                              {
                                 break loop5;
                              }
                              _loc13_.normalZ = param7;
                           }
                           §§goto(addr0249);
                        }
                     }
                     _loc13_.offset = param8;
                     if(!_loc15_)
                     {
                        break loop5;
                     }
                     break loop6;
                  }
               }
               faceList = _loc13_;
               break loop7;
            }
            _loc13_.next = faceList;
            break loop6;
         }
         _loc13_ = new Face();
         loop10:
         while(true)
         {
            loop11:
            while(true)
            {
               while(true)
               {
                  if(!(_loc15_ && Boolean(param1)))
                  {
                     _loc13_.material = param11;
                     _loc13_.wrapper = new Wrapper();
                     if(_loc15_ && Boolean(this))
                     {
                        break;
                     }
                     §§push(_loc13_.wrapper);
                     if(_loc14_)
                     {
                        §§pop().alternativa3d::vertex = param1;
                        if(!(_loc14_ || Boolean(param3)))
                        {
                           break loop11;
                        }
                        _loc13_.wrapper.next = new Wrapper();
                        _loc13_.wrapper.next.vertex = param2;
                        if(_loc15_ && Boolean(param3))
                        {
                           break loop10;
                        }
                        _loc13_.wrapper.next.next = new Wrapper();
                        §§push(_loc13_.wrapper);
                     }
                     §§pop().alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param3;
                     loop13:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc13_.wrapper);
                           if(!(_loc15_ && Boolean(param1)))
                           {
                              §§push(§§pop().alternativa3d::next);
                              if(_loc15_ && Boolean(param2))
                              {
                                 break;
                              }
                              §§push(§§pop().alternativa3d::next);
                              if(!(_loc14_ || Boolean(param1)))
                              {
                                 break loop13;
                              }
                              §§pop().alternativa3d::next = new Wrapper();
                              §§push(_loc13_.wrapper);
                           }
                           §§push(§§pop().alternativa3d::next);
                           break;
                        }
                        §§push(§§pop().alternativa3d::next);
                        break;
                     }
                     §§pop().alternativa3d::next.alternativa3d::vertex = param4;
                  }
                  _loc13_.normalX = param5;
                  break loop10;
               }
               §§goto(addr0375);
            }
            _loc13_.next = faceList;
            §§goto(addr0399);
         }
         _loc13_.normalY = param6;
         addr0375:
         _loc13_.normalZ = param7;
         if(!_loc15_)
         {
            _loc13_.offset = param8;
            break loop11;
         }
         addr0399:
         faceList = _loc13_;
      }
      
      override public function clone() : Object3D
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         var _loc1_:Box = new Box();
         if(_loc3_)
         {
            _loc1_.clonePropertiesFrom(this);
         }
         return _loc1_;
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(!_loc1_)
{
   this.Box = §§newclass(Box,Mesh);
}

