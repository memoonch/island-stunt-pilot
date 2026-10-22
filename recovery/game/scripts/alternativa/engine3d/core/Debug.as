package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   
   use namespace alternativa3d;
   
   public class Debug
   {
      
      private static const boundVertexList:Vertex;
      
      var _temp_1:* = true;
      var _loc1_:Boolean = false;
      var _loc2_:Boolean = _temp_1;
      
      public static const BOUNDS:int = 8;
      
      public static const EDGES:int = 16;
      
      public static const NODES:int = 128;
      
      public static const BONES:int = 512;
      
      if(!_loc1_)
      {
         boundVertexList = Vertex.createList(8);
      }
      
      private static const nodeVertexList:Vertex = Vertex.createList(4);
      
      public function Debug()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(!_loc2_)
         {
            super();
         }
      }
      
      alternativa3d static function drawEdges(param1:Camera3D, param2:Canvas, param3:Face, param4:int) : void
      {
         var _temp_1:* = true;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = _temp_1;
         var _loc7_:* = NaN;
         var _loc9_:Wrapper = null;
         var _loc10_:Vertex = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         §§push(param1.viewSizeX);
         if(_loc14_ || Boolean(param1))
         {
            §§push(Number(§§pop()));
         }
         var _loc5_:* = §§pop();
         §§push(param1.viewSizeY);
         if(!_loc13_)
         {
            §§push(Number(§§pop()));
         }
         var _loc6_:* = §§pop();
         if(!_loc13_)
         {
            param2.gfx.lineStyle(0,param4);
         }
         var _loc8_:Face = param3;
         while(_loc8_ != null)
         {
            _loc9_ = _loc8_.wrapper;
            _loc10_ = _loc9_.vertex;
            loop2:
            while(true)
            {
               if(_loc14_ || Boolean(param2))
               {
                  _loc7_ = 1 / _loc10_.cameraZ;
                  loop3:
                  while(true)
                  {
                     while(true)
                     {
                        if(!_loc13_)
                        {
                           §§push(_loc10_.cameraX);
                           if(!(_loc13_ && Boolean(param2)))
                           {
                              §§push(_loc5_);
                              if(!_loc14_)
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              §§push(_loc7_);
                              if(!_loc14_)
                              {
                                 break loop3;
                              }
                              §§push(§§pop() * §§pop());
                           }
                           _loc11_ = §§pop();
                           if(_loc13_ && Boolean(Debug))
                           {
                              break loop2;
                           }
                        }
                        §§push(_loc10_.cameraY);
                        if(_loc14_ || Boolean(param3))
                        {
                           §§push(_loc6_);
                           if(!(_loc13_ && Boolean(param1)))
                           {
                              break;
                           }
                           break loop3;
                        }
                        addr00f7:
                        §§push(_loc7_);
                        break loop3;
                     }
                     §§push(§§pop() * §§pop());
                     if(!_loc13_)
                     {
                        §§goto(addr00f7);
                     }
                     §§goto(addr00fa);
                  }
                  addr00fa:
                  _loc12_ = §§pop() * §§pop();
                  if(_loc13_ && Boolean(param2))
                  {
                     break;
                  }
               }
               param2.gfx.moveTo(_loc11_,_loc12_);
               break;
            }
            _loc9_ = _loc9_.next;
            if(!(_loc13_ && Boolean(param1)))
            {
               while(_loc9_ != null)
               {
                  _loc10_ = _loc9_.vertex;
                  if(!_loc13_)
                  {
                     §§push(1 / _loc10_.cameraZ);
                     if(_loc14_ || Boolean(param3))
                     {
                        §§push(Number(§§pop()));
                     }
                     _loc7_ = §§pop();
                     if(!(_loc13_ && Boolean(param1)))
                     {
                        param2.gfx.lineTo(_loc10_.cameraX * _loc5_ * _loc7_,_loc10_.cameraY * _loc6_ * _loc7_);
                     }
                  }
                  _loc9_ = _loc9_.next;
               }
               if(_loc14_ || Boolean(Debug))
               {
                  param2.gfx.lineTo(_loc11_,_loc12_);
               }
            }
            _loc8_ = _loc8_.processNext;
         }
      }
      
      alternativa3d static function drawBounds(param1:Camera3D, param2:Canvas, param3:Object3D, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:int = -1, param11:Number = 1) : void
      {
         §§push(false);
         var _loc24_:Boolean = true;
         var _loc25_:* = §§pop();
         var _loc12_:Vertex = null;
         var _loc23_:* = NaN;
         var _loc13_:Vertex = boundVertexList;
         while(true)
         {
            if(!_loc25_)
            {
               _loc13_.x = param4;
               if(_loc25_)
               {
                  break;
               }
            }
            _loc13_.y = param5;
            if(!_loc25_)
            {
               break;
            }
            §§goto(addr0046);
         }
         _loc13_.z = param6;
         addr0046:
         var _loc14_:Vertex = _loc13_.next;
         if(!(_loc25_ && Boolean(param2)))
         {
            _loc14_.x = param7;
            if(_loc24_ || Boolean(param1))
            {
               _loc14_.y = param5;
               if(!(_loc25_ && Boolean(param1)))
               {
                  _loc14_.z = param6;
               }
            }
         }
         var _loc15_:Vertex = _loc14_.next;
         while(true)
         {
            if(!(_loc25_ && Boolean(Debug)))
            {
               _loc15_.x = param4;
               if(_loc25_)
               {
                  break;
               }
               _loc15_.y = param8;
               if(_loc25_)
               {
                  break;
               }
            }
            _loc15_.z = param6;
            break;
         }
         var _loc16_:Vertex = _loc15_.next;
         if(_loc24_ || Boolean(param3))
         {
            _loc16_.x = param7;
            while(true)
            {
               if(!_loc25_)
               {
                  _loc16_.y = param8;
                  if(_loc25_ && Boolean(param3))
                  {
                     break;
                  }
               }
               _loc16_.z = param6;
               break;
            }
         }
         var _loc17_:Vertex = _loc16_.next;
         if(!_loc25_)
         {
            _loc17_.x = param4;
            if(!_loc25_)
            {
               _loc17_.y = param5;
               if(_loc24_ || Boolean(param3))
               {
                  _loc17_.z = param9;
               }
            }
         }
         var _loc18_:Vertex = _loc17_.next;
         while(true)
         {
            if(!(_loc25_ && Boolean(param1)))
            {
               _loc18_.x = param7;
               if(_loc25_)
               {
                  break;
               }
            }
            _loc18_.y = param5;
            if(!(_loc25_ && Boolean(Debug)))
            {
               break;
            }
            §§goto(addr016a);
         }
         _loc18_.z = param9;
         addr016a:
         var _loc19_:Vertex = _loc18_.next;
         if(!(_loc25_ && Boolean(param2)))
         {
            _loc19_.x = param4;
            if(_loc24_ || Boolean(Debug))
            {
               _loc19_.y = param8;
               if(!(_loc25_ && Boolean(param2)))
               {
                  _loc19_.z = param9;
               }
            }
         }
         var _loc20_:Vertex = _loc19_.next;
         while(true)
         {
            if(_loc24_)
            {
               _loc20_.x = param7;
               if(!(_loc24_ || Boolean(param1)))
               {
                  break;
               }
            }
            _loc20_.y = param8;
            if(_loc24_ || Boolean(param1))
            {
               _loc20_.z = param9;
            }
            break;
         }
         _loc12_ = _loc13_;
         while(true)
         {
            if(_loc12_ == null)
            {
               §§push(param1.viewSizeX);
               if(!(_loc25_ && Boolean(Debug)))
               {
                  break;
               }
               §§goto(addr03f9);
            }
            loop13:
            while(true)
            {
               while(true)
               {
                  §§push(_loc12_);
                  §§push(param3.ma);
                  if(_loc24_)
                  {
                     §§push(_loc12_.x);
                     if(_loc25_ && Boolean(param3))
                     {
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     if(!_loc24_)
                     {
                        break loop13;
                     }
                  }
                  §§push(param3.mb);
                  if(!_loc24_)
                  {
                     break;
                  }
                  §§push(_loc12_.y);
                  if(!(_loc25_ && Boolean(param2)))
                  {
                     §§push(§§pop() * §§pop());
                     if(!(_loc24_ || Boolean(param3)))
                     {
                        break;
                     }
                     §§push(§§pop() + §§pop());
                     if(!(_loc24_ || Boolean(param3)))
                     {
                        break loop13;
                     }
                     §§push(param3.mc);
                     if(!(_loc25_ && Boolean(param2)))
                     {
                        break;
                     }
                     §§goto(addr0280);
                  }
                  §§push(§§pop() * §§pop());
                  if(_loc24_)
                  {
                     §§push(§§pop() + §§pop());
                     if(_loc24_ || Boolean(param2))
                     {
                        break loop13;
                     }
                     §§goto(addr0281);
                  }
                  §§goto(addr0280);
               }
               §§goto(addr0267);
            }
            addr0281:
            §§pop().alternativa3d::cameraX = §§pop() + param3.md;
            addr0280:
            if(!(_loc25_ && Boolean(param3)))
            {
               loop15:
               while(true)
               {
                  loop16:
                  while(true)
                  {
                     §§push(_loc12_);
                     §§push(param3.me);
                     if(!(_loc25_ && Boolean(param1)))
                     {
                        loop21:
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
                                    §§push(_loc12_.x);
                                    if(!(_loc25_ && Boolean(Debug)))
                                    {
                                       §§push(§§pop() * §§pop());
                                       if(!_loc24_)
                                       {
                                          break;
                                       }
                                       §§push(param3.mf);
                                       if(_loc25_)
                                       {
                                          break loop23;
                                       }
                                       §§push(_loc12_.y);
                                       if(_loc25_)
                                       {
                                          break loop22;
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(_loc25_)
                                       {
                                          break loop21;
                                       }
                                    }
                                    §§push(§§pop() + §§pop());
                                    if(!(_loc25_ && Boolean(param3)))
                                    {
                                       break;
                                    }
                                    break loop15;
                                 }
                                 §§push(param3.mg);
                                 if(_loc24_)
                                 {
                                    break loop21;
                                 }
                                 break loop16;
                              }
                              §§push(§§pop() + §§pop());
                              if(_loc25_)
                              {
                                 break loop15;
                              }
                           }
                           §§push(§§pop() * §§pop());
                           if(!_loc25_)
                           {
                              break loop23;
                           }
                           break loop16;
                        }
                        §§push(_loc12_.z);
                        break loop22;
                     }
                     §§push(param3.mh);
                     break;
                  }
                  §§push(§§pop() + §§pop());
                  break;
               }
               §§pop().alternativa3d::cameraY = §§pop();
               if(_loc25_ && Boolean(param1))
               {
                  continue;
               }
               §§push(_loc12_);
               §§push(param3.mi);
               if(_loc24_)
               {
                  loop17:
                  while(true)
                  {
                     loop18:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc12_.x);
                           if(_loc24_ || Boolean(Debug))
                           {
                              §§push(§§pop() * §§pop());
                              if(!(_loc24_ || Boolean(param3)))
                              {
                                 break;
                              }
                              §§push(param3.mj);
                              if(!_loc25_)
                              {
                                 §§push(_loc12_.y);
                                 if(!_loc24_)
                                 {
                                    break loop18;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc24_ || Boolean(param2)))
                                 {
                                    break loop17;
                                 }
                              }
                           }
                           while(true)
                           {
                              §§push(§§pop() + §§pop());
                              if(_loc24_)
                              {
                                 §§push(param3.mk);
                                 if(!_loc25_)
                                 {
                                    break loop17;
                                 }
                                 §§goto(addr0390);
                              }
                              §§goto(addr039f);
                           }
                           §§goto(addr03a2);
                        }
                     }
                     §§push(§§pop() * §§pop());
                     if(!(_loc25_ && Boolean(param3)))
                     {
                        addr0390:
                        §§push(§§pop() + §§pop());
                        if(!(_loc24_ || Boolean(param2)))
                        {
                           break loop19;
                        }
                        addr039f:
                        §§push(param3.ml);
                     }
                     addr03a2:
                     §§push(§§pop() + §§pop());
                     break loop19;
                  }
                  §§push(_loc12_.z);
                  break loop18;
               }
               §§pop().alternativa3d::cameraZ = §§pop();
               if(!_loc25_)
               {
                  §§push(_loc12_.cameraZ);
                  if(_loc25_ && Boolean(param2))
                  {
                     break;
                  }
                  if(§§pop() > 0)
                  {
                     continue;
                  }
                  if(_loc25_ && Boolean(param2))
                  {
                     continue;
                  }
               }
            }
            return;
            _loc12_ = _loc12_.next;
         }
         addr03f9:
         var _loc21_:* = §§pop();
         §§push(param1.viewSizeY);
         if(!_loc25_)
         {
            §§push(Number(§§pop()));
         }
         var _loc22_:* = §§pop();
         _loc12_ = _loc13_;
         loop7:
         while(true)
         {
            loop8:
            while(true)
            {
               loop9:
               while(true)
               {
                  loop10:
                  while(true)
                  {
                     if(_loc24_ || Boolean(Debug))
                     {
                        while(true)
                        {
                           if(_loc12_ == null)
                           {
                              if(!(_loc24_ || Boolean(param2)))
                              {
                                 break loop10;
                              }
                              param2.gfx.lineStyle(0,param10 < 0 ? (param3.culling > 0 ? 16776960 : 65280) : uint(param10),param11);
                              param2.gfx.moveTo(_loc13_.cameraX,_loc13_.cameraY);
                           }
                           else
                           {
                              §§push(1 / _loc12_.cameraZ);
                              if(!_loc25_)
                              {
                                 §§push(Number(§§pop()));
                              }
                              _loc23_ = §§pop();
                              if(!(_loc25_ && Boolean(param1)))
                              {
                                 loop11:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc12_);
                                       §§push(_loc12_.cameraX);
                                       if(_loc24_ || Boolean(param3))
                                       {
                                          §§push(_loc21_);
                                          if(_loc25_ && Boolean(param1))
                                          {
                                             break;
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(!_loc24_)
                                          {
                                             break loop11;
                                          }
                                       }
                                       §§push(_loc23_);
                                       break;
                                    }
                                    §§push(§§pop() * §§pop());
                                    break;
                                 }
                                 §§pop().alternativa3d::cameraX = §§pop();
                                 §§push(_loc12_);
                                 §§push(_loc12_.cameraY);
                                 if(_loc24_)
                                 {
                                    §§push(_loc22_);
                                    if(!(_loc25_ && Boolean(param2)))
                                    {
                                       §§push(§§pop() * §§pop());
                                       if(!(_loc24_ || Boolean(param2)))
                                       {
                                          continue;
                                       }
                                       §§push(_loc23_);
                                    }
                                    §§push(§§pop() * §§pop());
                                 }
                                 continue;
                              }
                           }
                           param2.gfx.lineTo(_loc14_.cameraX,_loc14_.cameraY);
                           if(_loc24_)
                           {
                              param2.gfx.lineTo(_loc16_.cameraX,_loc16_.cameraY);
                              param2.gfx.lineTo(_loc15_.cameraX,_loc15_.cameraY);
                              if(!(_loc24_ || Boolean(param1)))
                              {
                                 break loop9;
                              }
                              param2.gfx.lineTo(_loc13_.cameraX,_loc13_.cameraY);
                              if(_loc25_)
                              {
                                 break loop8;
                              }
                              param2.gfx.moveTo(_loc17_.cameraX,_loc17_.cameraY);
                              if(_loc25_)
                              {
                                 break loop7;
                              }
                           }
                           §§pop().alternativa3d::cameraY = §§pop();
                           _loc12_ = _loc12_.next;
                        }
                        break loop7;
                     }
                     param2.gfx.lineTo(_loc18_.cameraX,_loc18_.cameraY);
                     if(!(_loc25_ && Boolean(param1)))
                     {
                        break loop8;
                     }
                     §§goto(addr05bb);
                  }
                  §§goto(addr058e);
               }
               param2.gfx.lineTo(_loc18_.cameraX,_loc18_.cameraY);
               param2.gfx.moveTo(_loc16_.cameraX,_loc16_.cameraY);
               param2.gfx.lineTo(_loc20_.cameraX,_loc20_.cameraY);
               break loop7;
            }
            param2.gfx.lineTo(_loc20_.cameraX,_loc20_.cameraY);
            addr058e:
            param2.gfx.lineTo(_loc19_.cameraX,_loc19_.cameraY);
            param2.gfx.lineTo(_loc17_.cameraX,_loc17_.cameraY);
            param2.gfx.moveTo(_loc13_.cameraX,_loc13_.cameraY);
            addr05bb:
            param2.gfx.lineTo(_loc17_.cameraX,_loc17_.cameraY);
            param2.gfx.moveTo(_loc14_.cameraX,_loc14_.cameraY);
            if(!(_loc25_ && Boolean(Debug)))
            {
               break loop9;
            }
            break;
         }
         param2.gfx.moveTo(_loc15_.cameraX,_loc15_.cameraY);
         if(!(_loc25_ && Boolean(param3)))
         {
            param2.gfx.lineTo(_loc19_.cameraX,_loc19_.cameraY);
         }
      }
      
      alternativa3d static function drawKDNode(param1:Camera3D, param2:Canvas, param3:Object3D, param4:int, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number) : void
      {
         §§push(false);
         var _loc21_:Boolean = true;
         var _loc22_:* = §§pop();
         var _loc13_:Vertex = null;
         var _loc20_:* = NaN;
         var _loc14_:Vertex = nodeVertexList;
         var _loc15_:Vertex = _loc14_.next;
         var _loc16_:Vertex = _loc15_.next;
         var _loc17_:Vertex = _loc16_.next;
         loop2:
         while(true)
         {
            if(_loc21_ || Boolean(param2))
            {
               loop3:
               while(true)
               {
                  loop4:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(param4);
                        if(!(_loc22_ && Boolean(param3)))
                        {
                           §§push(0);
                           if(_loc22_)
                           {
                              break;
                           }
                           if(§§pop() == §§pop())
                           {
                              _loc14_.x = param5;
                              _loc14_.y = param7;
                              _loc14_.z = param11;
                              _loc15_.x = param5;
                              _loc15_.y = param10;
                              while(true)
                              {
                                 if(!_loc22_)
                                 {
                                    _loc15_.z = param11;
                                    if(!_loc22_)
                                    {
                                       _loc16_.x = param5;
                                       if(!_loc22_)
                                       {
                                          _loc16_.y = param10;
                                          addr00a6:
                                          _loc16_.z = param8;
                                          _loc17_.x = param5;
                                          _loc17_.y = param7;
                                          _loc17_.z = param8;
                                          break loop2;
                                       }
                                       break loop4;
                                    }
                                    §§goto(addr019c);
                                 }
                                 §§goto(addr00fc);
                              }
                              §§goto(addr0158);
                           }
                           else
                           {
                              §§push(param4);
                           }
                        }
                        §§push(1);
                        break;
                     }
                     if(§§pop() == §§pop())
                     {
                        _loc14_.x = param9;
                        if(!_loc22_)
                        {
                           _loc14_.y = param5;
                           break;
                        }
                        break loop2;
                     }
                     _loc14_.x = param6;
                     break loop3;
                  }
                  _loc14_.z = param11;
                  _loc15_.x = param6;
                  while(true)
                  {
                     if(!(_loc22_ && Boolean(param3)))
                     {
                        _loc15_.y = param5;
                        addr00fc:
                        _loc15_.z = param11;
                        _loc16_.x = param6;
                        _loc16_.y = param5;
                        _loc16_.z = param8;
                        _loc17_.x = param9;
                        if(_loc21_ || Boolean(param2))
                        {
                           _loc17_.y = param5;
                           if(!_loc22_)
                           {
                              _loc17_.z = param8;
                              break loop2;
                           }
                           break loop3;
                        }
                        §§goto(addr0176);
                     }
                     §§goto(addr0158);
                  }
                  §§goto(addr016a);
               }
               _loc14_.y = param7;
               if(!(_loc22_ && Boolean(Debug)))
               {
                  addr0158:
                  _loc14_.z = param5;
                  _loc15_.x = param9;
                  _loc15_.y = param7;
               }
               addr016a:
               _loc15_.z = param5;
               _loc16_.x = param9;
               addr0176:
               _loc16_.y = param10;
               _loc16_.z = param5;
               _loc17_.x = param6;
               _loc17_.y = param10;
               if(_loc21_ || Boolean(param3))
               {
                  addr019c:
                  _loc17_.z = param5;
               }
               break;
            }
            §§goto(addr00a6);
         }
         _loc13_ = _loc14_;
         for(; _loc13_ != null; _loc13_ = _loc13_.next)
         {
            loop8:
            while(true)
            {
               loop9:
               while(true)
               {
                  §§push(_loc13_);
                  §§push(param3.ma);
                  if(!_loc22_)
                  {
                     §§push(_loc13_.x);
                     if(_loc22_)
                     {
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     if(_loc22_ && Boolean(param3))
                     {
                        break loop8;
                     }
                  }
                  while(true)
                  {
                     §§push(param3.mb);
                     if(_loc21_ || Boolean(Debug))
                     {
                        §§push(_loc13_.y);
                        if(!_loc21_)
                        {
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        if(!(_loc21_ || Boolean(param2)))
                        {
                           break loop9;
                        }
                     }
                     §§push(§§pop() + §§pop());
                     if(_loc21_ || Boolean(param2))
                     {
                        §§push(param3.mc);
                        if(_loc21_)
                        {
                           §§push(_loc13_.z);
                           break;
                        }
                        break loop9;
                     }
                     addr0225:
                     §§push(param3.md);
                     break loop9;
                  }
                  §§push(§§pop() * §§pop());
                  if(_loc22_)
                  {
                     break;
                  }
                  §§push(§§pop() + §§pop());
                  if(_loc22_)
                  {
                     break loop8;
                  }
                  §§goto(addr0225);
               }
               §§push(§§pop() + §§pop());
               break;
            }
            §§pop().alternativa3d::cameraX = §§pop();
            if(!_loc22_)
            {
               loop10:
               while(true)
               {
                  loop11:
                  while(true)
                  {
                     §§push(_loc13_);
                     §§push(param3.me);
                     if(_loc21_ || Boolean(Debug))
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
                                 while(true)
                                 {
                                    §§push(_loc13_.x);
                                    if(!_loc22_)
                                    {
                                       §§push(§§pop() * §§pop());
                                       if(_loc22_)
                                       {
                                          break;
                                       }
                                       §§push(param3.mf);
                                       if(!_loc21_)
                                       {
                                          break loop20;
                                       }
                                       §§push(_loc13_.y);
                                       if(_loc22_ && Boolean(param1))
                                       {
                                          break loop19;
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(!_loc21_)
                                       {
                                          break loop18;
                                       }
                                    }
                                    §§push(§§pop() + §§pop());
                                    if(!(_loc22_ && Boolean(param1)))
                                    {
                                       §§push(param3.mg);
                                       if(!(_loc22_ && Boolean(param3)))
                                       {
                                          break loop18;
                                       }
                                       break loop11;
                                    }
                                    break;
                                 }
                              }
                              §§push(§§pop() + §§pop());
                              if(_loc21_)
                              {
                                 break loop21;
                              }
                              break loop10;
                           }
                           §§push(§§pop() * §§pop());
                           if(_loc21_ || Boolean(param2))
                           {
                              break loop20;
                           }
                           break loop11;
                        }
                        §§push(_loc13_.z);
                        break loop19;
                     }
                     §§push(param3.mh);
                     break;
                  }
                  §§push(§§pop() + §§pop());
                  break;
               }
               §§pop().alternativa3d::cameraY = §§pop();
               if(_loc22_ && Boolean(param1))
               {
                  break;
               }
               loop12:
               while(true)
               {
                  loop13:
                  while(true)
                  {
                     loop15:
                     while(true)
                     {
                        loop16:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(_loc13_);
                              §§push(param3.mi);
                              if(!_loc22_)
                              {
                                 §§push(_loc13_.x);
                                 if(!(_loc21_ || Boolean(Debug)))
                                 {
                                    break;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(_loc22_ && Boolean(param1))
                                 {
                                    break loop12;
                                 }
                                 §§push(param3.mj);
                                 if(_loc22_ && Boolean(Debug))
                                 {
                                    break loop16;
                                 }
                                 §§push(_loc13_.y);
                                 if(!_loc21_)
                                 {
                                    break loop15;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(_loc22_)
                                 {
                                    break loop13;
                                 }
                                 §§push(§§pop() + §§pop());
                                 if(!(_loc21_ || Boolean(param2)))
                                 {
                                    break loop12;
                                 }
                              }
                              §§push(param3.mk);
                              if(!_loc22_)
                              {
                                 break loop16;
                              }
                              break loop13;
                           }
                           §§goto(addr0352);
                        }
                        §§push(_loc13_.z);
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     if(_loc21_ || Boolean(param1))
                     {
                        break;
                     }
                     §§goto(addr0352);
                  }
                  §§push(§§pop() + §§pop());
                  if(_loc21_)
                  {
                     break;
                  }
                  §§goto(addr0353);
               }
               addr0353:
               §§pop().alternativa3d::cameraZ = §§pop() + param3.ml;
               addr0352:
               if(!_loc21_)
               {
                  continue;
               }
               §§push(_loc13_.cameraZ);
               if(_loc22_ && Boolean(param2))
               {
                  §§goto(addr0399);
               }
               if(§§pop() > 0)
               {
                  continue;
               }
               if(!_loc21_)
               {
                  continue;
               }
            }
            return;
         }
         §§push(param1.viewSizeX);
         if(!_loc22_)
         {
            §§push(Number(§§pop()));
         }
         addr0399:
         var _loc18_:* = §§pop();
         §§push(param1.viewSizeY);
         if(!(_loc22_ && Boolean(param3)))
         {
            §§push(Number(§§pop()));
         }
         var _loc19_:* = §§pop();
         _loc13_ = _loc14_;
         while(true)
         {
            if(_loc13_ != null)
            {
               §§push(1 / _loc13_.cameraZ);
               if(!(_loc22_ && Boolean(param2)))
               {
                  §§push(Number(§§pop()));
               }
               _loc20_ = §§pop();
               if(!(_loc22_ && Boolean(param1)))
               {
                  §§push(_loc13_);
                  §§push(_loc13_.cameraX);
                  if(_loc21_)
                  {
                     while(true)
                     {
                        §§push(_loc18_);
                        if(_loc21_ || Boolean(param3))
                        {
                           §§push(§§pop() * §§pop());
                           if(!(_loc21_ || Boolean(param2)))
                           {
                              break;
                           }
                           §§push(_loc20_);
                        }
                        §§push(§§pop() * §§pop());
                        break;
                     }
                  }
                  §§pop().alternativa3d::cameraX = §§pop();
                  if(_loc22_ && Boolean(param2))
                  {
                     break;
                  }
                  §§push(_loc13_);
                  §§push(_loc13_.cameraY);
                  if(_loc21_)
                  {
                     §§push(_loc19_);
                     if(_loc21_)
                     {
                        §§push(§§pop() * §§pop());
                        if(!_loc21_)
                        {
                           continue;
                        }
                        §§push(_loc20_);
                     }
                     §§push(§§pop() * §§pop());
                  }
                  continue;
               }
            }
            param2.gfx.lineStyle(0,param4 == 0 ? 16711680 : (param4 == 1 ? 65280 : 255),param12);
            param2.gfx.moveTo(_loc14_.cameraX,_loc14_.cameraY);
            if(!(_loc22_ && Boolean(param1)))
            {
               param2.gfx.lineTo(_loc15_.cameraX,_loc15_.cameraY);
            }
            param2.gfx.lineTo(_loc16_.cameraX,_loc16_.cameraY);
            if(!(_loc22_ && Boolean(param1)))
            {
               param2.gfx.lineTo(_loc17_.cameraX,_loc17_.cameraY);
               param2.gfx.lineTo(_loc14_.cameraX,_loc14_.cameraY);
            }
            break;
            §§pop().alternativa3d::cameraY = §§pop();
            _loc13_ = _loc13_.next;
         }
      }
      
      alternativa3d static function drawBone(param1:Canvas, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:int) : void
      {
         §§push(false);
         var _loc15_:Boolean = true;
         var _loc16_:* = §§pop();
         var _loc11_:Number = NaN;
         var _loc12_:* = NaN;
         var _loc13_:* = NaN;
         var _loc14_:Number = NaN;
         while(true)
         {
            §§push(param4);
            if(!(_loc16_ && Boolean(param3)))
            {
               §§push(§§pop() - param2);
               if(!(_loc15_ || Boolean(param1)))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc8_:* = §§pop();
         while(true)
         {
            §§push(param5);
            if(!(_loc16_ && Boolean(param2)))
            {
               §§push(§§pop() - param3);
               if(_loc16_ && Boolean(param2))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc9_:* = §§pop();
         var _loc10_:Number = Math.sqrt(_loc8_ * _loc8_ + _loc9_ * _loc9_);
         loop2:
         while(true)
         {
            loop3:
            while(true)
            {
               loop5:
               while(true)
               {
                  loop6:
                  while(true)
                  {
                     loop7:
                     while(true)
                     {
                        loop8:
                        while(true)
                        {
                           loop9:
                           while(true)
                           {
                              §§push(_loc10_);
                              §§push(0.001);
                              if(_loc15_ || Boolean(param2))
                              {
                                 if(§§pop() <= §§pop())
                                 {
                                    break loop6;
                                 }
                                 loop10:
                                 while(true)
                                 {
                                    loop11:
                                    while(true)
                                    {
                                       loop12:
                                       while(true)
                                       {
                                          if(_loc15_)
                                          {
                                             §§push(_loc8_ / _loc10_);
                                             if(_loc16_ && Boolean(param1))
                                             {
                                                break loop11;
                                             }
                                             _loc8_ = §§pop();
                                             if(!_loc15_)
                                             {
                                                break loop6;
                                             }
                                             while(true)
                                             {
                                                §§push(_loc9_);
                                                §§push(_loc10_);
                                                if(_loc15_)
                                                {
                                                   §§push(§§pop() / §§pop());
                                                   if(!(_loc15_ || Boolean(param3)))
                                                   {
                                                      break;
                                                   }
                                                   _loc9_ = §§pop();
                                                   if(_loc16_ && Boolean(Debug))
                                                   {
                                                      break loop5;
                                                   }
                                                   §§push(_loc9_);
                                                   if(!_loc15_)
                                                   {
                                                      break loop12;
                                                   }
                                                   §§push(param6);
                                                }
                                                §§push(§§pop() * §§pop());
                                                break;
                                             }
                                             _loc11_ = §§pop();
                                             if(_loc16_ && Boolean(param3))
                                             {
                                                break loop7;
                                             }
                                             §§push(-_loc8_);
                                             if(!(_loc16_ && Boolean(param2)))
                                             {
                                                §§push(param6);
                                                if(!_loc15_)
                                                {
                                                   break loop10;
                                                }
                                                §§push(§§pop() * §§pop());
                                                if(!_loc15_)
                                                {
                                                   break loop9;
                                                }
                                                §§push(Number(§§pop()));
                                             }
                                             _loc12_ = §§pop();
                                             if(!_loc15_)
                                             {
                                                break loop5;
                                             }
                                          }
                                          §§push(_loc9_);
                                          if(_loc15_ || Boolean(param3))
                                          {
                                             §§push(-§§pop());
                                             break loop11;
                                          }
                                          §§goto(addr014b);
                                       }
                                       §§goto(addr0161);
                                    }
                                    §§push(§§pop() * param6);
                                    if(!_loc15_)
                                    {
                                       break loop8;
                                    }
                                    §§push(Number(§§pop()));
                                    if(!_loc15_)
                                    {
                                       break loop8;
                                    }
                                    addr014b:
                                    _loc13_ = §§pop();
                                    §§push(_loc8_);
                                    §§push(param6);
                                    if(_loc15_ || Boolean(Debug))
                                    {
                                       break;
                                    }
                                 }
                                 addr0161:
                                 _loc14_ = §§pop() * §§pop();
                                 if(!(_loc15_ || Boolean(param2)))
                                 {
                                    break loop3;
                                 }
                                 §§push(_loc10_);
                                 §§push(param6);
                                 if(_loc16_)
                                 {
                                    break loop2;
                                 }
                              }
                              §§push(§§pop() * 2);
                              break loop2;
                           }
                           §§goto(addr0191);
                        }
                        §§goto(addr0184);
                     }
                     §§goto(addr01d9);
                  }
                  §§goto(addr0220);
               }
               §§goto(addr01be);
            }
            §§goto(addr0193);
         }
         if(§§pop() > §§pop())
         {
            addr0184:
            _loc10_ = param6;
            break loop3;
         }
         addr0191:
         _loc10_ /= 2;
         addr0193:
         param1.gfx.lineStyle(1,param7);
         while(true)
         {
            if(!_loc16_)
            {
               param1.gfx.beginFill(param7,0.6);
               if(_loc16_)
               {
                  break;
               }
               param1.gfx.moveTo(param2,param3);
               param1.gfx.lineTo(param2 + _loc8_ * _loc10_ + _loc11_,param3 + _loc9_ * _loc10_ + _loc12_);
            }
            addr01d9:
            param1.gfx.lineTo(param4,param5);
            if(!(_loc16_ && Boolean(param3)))
            {
               break;
            }
            §§goto(addr0217);
         }
         param1.gfx.lineTo(param2 + _loc8_ * _loc10_ + _loc13_,param3 + _loc9_ * _loc10_ + _loc14_);
         addr0217:
         param1.gfx.lineTo(param2,param3);
         addr0220:
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(_loc2_ || _loc1_)
{
   Debug = §§newclass(Debug,Object);
}

