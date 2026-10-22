package alternativa.engine3d.containers
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Canvas;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.VG;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   
   use namespace alternativa3d;
   
   public class ConflictContainer extends Object3DContainer
   {
      
      public var resolveByAABB:Boolean = true;
      
      public var resolveByOOBB:Boolean = true;
      
      public var threshold:Number = 0.01;
      
      public function ConflictContainer()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(!(_loc2_ && Boolean(this)))
         {
            super();
         }
      }
      
      override public function clone() : Object3D
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         var _loc1_:ConflictContainer = new ConflictContainer();
         if(!(_loc2_ && Boolean(_loc1_)))
         {
            _loc1_.clonePropertiesFrom(this);
         }
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         if(_loc4_ || _loc3_)
         {
            super.clonePropertiesFrom(param1);
         }
         var _loc2_:ConflictContainer = param1 as ConflictContainer;
         while(true)
         {
            if(_loc4_)
            {
               this.resolveByAABB = _loc2_.resolveByAABB;
               if(_loc4_ || Boolean(_loc2_))
               {
                  this.resolveByOOBB = _loc2_.resolveByOOBB;
                  if(!_loc4_)
                  {
                     break;
                  }
               }
            }
            this.threshold = _loc2_.threshold;
            break;
         }
      }
      
      override alternativa3d function draw(param1:Camera3D, param2:Canvas) : void
      {
         var _temp_1:* = true;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = _temp_1;
         var _loc3_:Canvas = null;
         var _loc4_:* = 0;
         var _loc6_:VG = null;
         var _loc5_:VG = collectVG(param1);
         loop2:
         while(true)
         {
            loop3:
            while(true)
            {
               while(true)
               {
                  if(!(_loc9_ && Boolean(param2)))
                  {
                     if(_loc5_ != null)
                     {
                        if(!(_loc9_ && Boolean(param1)))
                        {
                           §§push(param1.debug);
                           if(!(_loc9_ && Boolean(param2)))
                           {
                              §§push(Boolean(§§pop()));
                              if(!(_loc10_ || Boolean(param2)))
                              {
                                 break;
                              }
                           }
                           var _temp_18:* = §§pop();
                           §§push(_temp_18);
                           §§push(_temp_18);
                           if(!(_loc9_ && Boolean(param1)))
                           {
                              §§push(Boolean(§§pop()));
                           }
                           if(!§§pop())
                           {
                              break;
                           }
                           if(_loc9_)
                           {
                              break loop3;
                           }
                           §§pop();
                           if(!(_loc10_ || Boolean(param2)))
                           {
                              break loop2;
                           }
                        }
                     }
                     else
                     {
                        §§goto(addr0305);
                     }
                  }
                  while(true)
                  {
                     §§push(param1.checkInDebug(this));
                     if(!_loc9_)
                     {
                        var _temp_21:* = §§pop();
                        §§push(_temp_21);
                        §§push(_temp_21);
                        if(!(_loc10_ || Boolean(param1)))
                        {
                           break;
                        }
                        var _loc7_:* = §§pop();
                        while(true)
                        {
                           if(_loc10_)
                           {
                              §§push(int(§§pop()));
                              if(_loc9_)
                              {
                                 break;
                              }
                           }
                           _loc4_ = §§pop();
                           §§push(_loc7_);
                           break;
                        }
                     }
                     §§push(0);
                     break;
                  }
                  §§push(§§pop() > §§pop());
                  if(!_loc9_)
                  {
                     break loop3;
                  }
                  break;
               }
               if(§§pop())
               {
                  break loop2;
               }
               §§goto(addr0125);
            }
            §§push(Boolean(§§pop()));
            break loop9;
         }
         §§push(param2.getChildCanvas(true,false));
         if(_loc10_)
         {
            _loc3_ = §§pop();
            if(_loc10_)
            {
               §§push(_loc4_);
               if(!_loc9_)
               {
                  §§push(§§pop() & Debug.BOUNDS);
               }
               if(Boolean(§§pop()))
               {
                  if(!_loc9_)
                  {
                     Debug.drawBounds(param1,_loc3_,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
                  }
               }
            }
            addr0125:
            §§push(param2.getChildCanvas(false,true,this,alpha,blendMode,colorTransform,filters));
         }
         _loc3_ = §§pop();
         while(true)
         {
            while(true)
            {
               while(true)
               {
                  if(!(_loc9_ && Boolean(param1)))
                  {
                     _loc3_.numDraws = 0;
                     if(!_loc10_)
                     {
                        break;
                     }
                     if(_loc5_.next != null)
                     {
                        if(!(_loc10_ || Boolean(param1)))
                        {
                           continue loop6;
                        }
                     }
                     else
                     {
                        _loc5_.draw(param1,_loc3_,this.threshold,this);
                        if(_loc9_)
                        {
                           break loop6;
                        }
                        §§goto(addr02a5);
                     }
                  }
                  calculateInverseMatrix();
                  if(_loc9_ && Boolean(param1))
                  {
                     break;
                  }
                  continue loop6;
               }
               §§goto(addr0194);
            }
            §§goto(addr0305);
         }
         loop6:
         while(true)
         {
            loop7:
            while(true)
            {
               if(this.resolveByAABB)
               {
                  addr0194:
                  _loc6_ = _loc5_;
                  while(true)
                  {
                     if(_loc6_ != null)
                     {
                        _loc6_.calculateAABB(ima,imb,imc,imd,ime,imf,img,imh,imi,imj,imk,iml);
                        if(_loc9_ && Boolean(_loc3_))
                        {
                           break loop5;
                        }
                        continue;
                     }
                     if(!(_loc10_ || Boolean(this)))
                     {
                        break loop5;
                     }
                     this.drawAABBGeometry(param1,_loc3_,_loc5_);
                     if(_loc9_ && Boolean(this))
                     {
                        break loop7;
                     }
                     _loc6_ = _loc6_.next;
                  }
                  §§goto(addr0305);
               }
               else if(this.resolveByOOBB)
               {
                  if(_loc9_ && Boolean(param2))
                  {
                     break loop6;
                  }
                  _loc6_ = _loc5_;
                  if(!(_loc9_ && Boolean(this)))
                  {
                     while(true)
                     {
                        if(_loc6_ == null)
                        {
                           if(_loc9_)
                           {
                              break;
                           }
                        }
                        else
                        {
                           _loc6_.calculateOOBB(this);
                           if(!_loc9_)
                           {
                              continue;
                           }
                        }
                        this.drawOOBBGeometry(param1,_loc3_,_loc5_);
                        break;
                        _loc6_ = _loc6_.next;
                     }
                  }
               }
               else
               {
                  this.drawConflictGeometry(param1,_loc3_,_loc5_);
                  if(!(_loc10_ || Boolean(this)))
                  {
                     addr02a5:
                     _loc5_.destroy();
                     break loop6;
                  }
               }
               break loop6;
            }
            _loc3_.removeChildren(_loc3_.numDraws);
            if(!(_loc9_ && Boolean(_loc3_)))
            {
               break loop5;
            }
            §§goto(addr0305);
         }
         if(_loc3_.numDraws > 0)
         {
            if(!_loc9_)
            {
               break loop7;
            }
         }
         else
         {
            _loc7_ = param2;
            §§push(_loc7_.alternativa3d::numDraws);
            if(!_loc9_)
            {
               §§push(§§pop() - 1);
            }
            var _loc8_:* = §§pop();
            if(_loc10_ || Boolean(param1))
            {
               _loc7_.alternativa3d::numDraws = _loc8_;
            }
         }
         addr0305:
      }
      
      alternativa3d function drawAABBGeometry(param1:Camera3D, param2:Canvas, param3:VG) : void
      {
         §§push(false);
         var _loc18_:Boolean = true;
         var _loc19_:* = §§pop();
         var _loc4_:* = NaN;
         var _loc5_:* = NaN;
         var _loc6_:* = NaN;
         var _loc7_:* = false;
         var _loc8_:* = false;
         var _loc10_:VG = null;
         var _loc11_:* = false;
         var _loc12_:VG = null;
         var _loc13_:VG = null;
         var _loc14_:VG = null;
         var _loc15_:VG = null;
         var _loc16_:* = NaN;
         var _loc17_:Number = NaN;
         var _loc9_:VG = param3;
         loop0:
         while(true)
         {
            loop11:
            while(true)
            {
               if(_loc9_ != null)
               {
                  loop34:
                  while(true)
                  {
                     loop35:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc9_.boundMinX);
                           if(_loc18_ || Boolean(param1))
                           {
                              _loc4_ = §§pop();
                              if(_loc19_)
                              {
                                 break;
                              }
                              §§push(_loc4_);
                              if(!_loc18_)
                              {
                                 break loop35;
                              }
                              §§push(this.threshold);
                              if(_loc19_)
                              {
                                 break loop34;
                              }
                              §§push(§§pop() - §§pop());
                           }
                           _loc5_ = Number(§§pop());
                           if(_loc18_)
                           {
                              §§push(_loc4_);
                              if(!(_loc19_ && Boolean(param1)))
                              {
                                 §§push(this.threshold);
                                 break loop34;
                              }
                              break loop35;
                           }
                           continue loop13;
                        }
                        _loc10_ = param3;
                        loop1:
                        for(; _loc10_ != null; _loc10_ = §§pop())
                        {
                           if(_loc9_ != _loc10_)
                           {
                              while(true)
                              {
                                 if(!(_loc19_ && Boolean(param2)))
                                 {
                                    loop38:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          addr01cb:
                                          §§push(_loc10_.boundMaxX);
                                          if(_loc18_)
                                          {
                                             while(true)
                                             {
                                                §§push(_loc6_);
                                                if(_loc18_)
                                                {
                                                   if(§§pop() > §§pop())
                                                   {
                                                      §§push(_loc10_.boundMinX);
                                                      §§push(_loc5_);
                                                      if(_loc18_)
                                                      {
                                                         if(§§pop() < §§pop())
                                                         {
                                                            break loop1;
                                                         }
                                                         addr010a:
                                                         addr010a:
                                                         §§push(_loc10_.next);
                                                         if(!(_loc19_ && Boolean(param3)))
                                                         {
                                                            continue loop1;
                                                         }
                                                         §§goto(addr0b0a);
                                                      }
                                                      addr01f9:
                                                      §§push(§§pop() + §§pop());
                                                      if(_loc18_)
                                                      {
                                                         break;
                                                      }
                                                      break loop38;
                                                   }
                                                   _loc11_ = true;
                                                   §§goto(addr010a);
                                                }
                                                §§goto(addr01f9);
                                             }
                                             addr0200:
                                             §§push(Number(§§pop()));
                                             break loop38;
                                          }
                                          while(true)
                                          {
                                             §§push(this.threshold);
                                             if(_loc18_ || Boolean(param3))
                                             {
                                                §§push(§§pop() - §§pop());
                                                if(!(_loc18_ || Boolean(this)))
                                                {
                                                   break;
                                                }
                                                _loc5_ = §§pop();
                                                §§push(_loc4_);
                                                if(_loc19_)
                                                {
                                                   break;
                                                }
                                                §§push(this.threshold);
                                             }
                                             §§goto(addr01f9);
                                          }
                                          §§goto(addr0200);
                                       }
                                       addr0215:
                                       _loc10_ = param3;
                                       loop2:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             loop71:
                                             while(true)
                                             {
                                                loop72:
                                                while(true)
                                                {
                                                   loop73:
                                                   while(true)
                                                   {
                                                      if(_loc10_ == null)
                                                      {
                                                         if(_loc19_ && Boolean(param3))
                                                         {
                                                            break loop0;
                                                         }
                                                         addr02ae:
                                                         §§push(_loc10_ == null);
                                                         if(_loc19_)
                                                         {
                                                            break loop71;
                                                         }
                                                         var _temp_80:* = §§pop();
                                                         §§push(_temp_80);
                                                         §§push(_temp_80);
                                                         if(_loc18_ || Boolean(param1))
                                                         {
                                                            §§push(Boolean(§§pop()));
                                                         }
                                                         if(§§pop())
                                                         {
                                                            if(_loc18_)
                                                            {
                                                               §§pop();
                                                               break loop2;
                                                            }
                                                            §§goto(addr02d6);
                                                         }
                                                         §§goto(addr02d7);
                                                      }
                                                      else
                                                      {
                                                         if(_loc9_ == _loc10_)
                                                         {
                                                            continue loop2;
                                                         }
                                                         if(!(_loc18_ || Boolean(param1)))
                                                         {
                                                            break loop2;
                                                         }
                                                         loop74:
                                                         while(true)
                                                         {
                                                            loop75:
                                                            while(true)
                                                            {
                                                               while(true)
                                                               {
                                                                  while(true)
                                                                  {
                                                                     §§push(_loc10_.boundMinX);
                                                                     §§push(_loc5_);
                                                                     if(!_loc19_)
                                                                     {
                                                                        if(§§pop() >= §§pop())
                                                                        {
                                                                           if(_loc19_ && Boolean(param3))
                                                                           {
                                                                              break loop73;
                                                                           }
                                                                           §§push(true);
                                                                           if(!_loc18_)
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(Boolean(§§pop()));
                                                                           if(_loc19_ && Boolean(param1))
                                                                           {
                                                                              break loop72;
                                                                           }
                                                                           _loc11_ = §§pop();
                                                                           continue loop2;
                                                                        }
                                                                        §§push(_loc10_.boundMaxX);
                                                                        §§push(_loc6_);
                                                                        if(!_loc18_)
                                                                        {
                                                                           break loop74;
                                                                        }
                                                                     }
                                                                     if(§§pop() <= §§pop())
                                                                     {
                                                                        continue loop2;
                                                                     }
                                                                     if(!(_loc18_ || Boolean(param2)))
                                                                     {
                                                                        break loop75;
                                                                     }
                                                                     §§goto(addr02ae);
                                                                  }
                                                                  §§goto(addr02d6);
                                                               }
                                                               §§goto(addr02d7);
                                                            }
                                                         }
                                                         §§goto(addr031b);
                                                      }
                                                   }
                                                   §§goto(addr036a);
                                                }
                                                §§goto(addr02f4);
                                             }
                                             §§goto(addr02f1);
                                          }
                                          _loc10_ = _loc10_.next;
                                          _loc11_ = §§pop();
                                          §§goto(addr036a);
                                       }
                                       addr02d6:
                                       addr02d7:
                                       while(true)
                                       {
                                          if(Boolean(_loc11_))
                                          {
                                             if(!_loc19_)
                                             {
                                                addr02f4:
                                                §§push(true);
                                                if(_loc18_ || Boolean(param2))
                                                {
                                                   addr02f1:
                                                   _loc7_ = §§pop();
                                                   §§push(false);
                                                }
                                                §§push(Boolean(§§pop()));
                                                if(_loc18_)
                                                {
                                                   _loc8_ = §§pop();
                                                   break loop0;
                                                }
                                                break loop42;
                                             }
                                             addr032d:
                                             §§push(_loc4_);
                                             if(!(_loc18_ || Boolean(param2)))
                                             {
                                                break;
                                             }
                                             §§push(this.threshold);
                                          }
                                          else
                                          {
                                             _loc4_ = _loc9_.boundMinY;
                                             §§push(_loc4_);
                                             §§push(this.threshold);
                                             if(_loc18_ || Boolean(param2))
                                             {
                                                addr031b:
                                                §§push(§§pop() - §§pop());
                                                if(_loc18_ || Boolean(param1))
                                                {
                                                   §§push(Number(§§pop()));
                                                }
                                                _loc5_ = §§pop();
                                                §§goto(addr032d);
                                             }
                                          }
                                          §§push(§§pop() + §§pop());
                                          if(!(_loc19_ && Boolean(param1)))
                                          {
                                             break;
                                          }
                                          addr0350:
                                          _loc6_ = §§pop();
                                          if(_loc18_)
                                          {
                                             §§push(false);
                                             if(_loc18_ || Boolean(this))
                                             {
                                                §§push(Boolean(§§pop()));
                                             }
                                             break loop42;
                                          }
                                          addr036a:
                                          _loc10_ = param3;
                                          loop3:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      if(_loc10_ == null)
                                                      {
                                                         if(!(_loc19_ && Boolean(this)))
                                                         {
                                                            addr03e1:
                                                            while(true)
                                                            {
                                                               §§push(_loc10_ == null);
                                                               if(_loc18_)
                                                               {
                                                                  §§push(Boolean(§§pop()));
                                                                  if(_loc19_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  var _temp_74:* = §§pop();
                                                                  §§push(_temp_74);
                                                                  §§push(_temp_74);
                                                                  if(!(_loc19_ && Boolean(param3)))
                                                                  {
                                                                     §§push(Boolean(§§pop()));
                                                                  }
                                                                  if(§§pop())
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        if(!_loc19_)
                                                                        {
                                                                           §§pop();
                                                                           §§push(_loc11_);
                                                                           if(!(_loc19_ && Boolean(this)))
                                                                           {
                                                                              break loop3;
                                                                           }
                                                                           break;
                                                                        }
                                                                        §§goto(addr042a);
                                                                     }
                                                                     §§goto(addr04b5);
                                                                  }
                                                                  §§goto(addr041e);
                                                               }
                                                               §§goto(addr0423);
                                                            }
                                                            §§goto(addr043b);
                                                         }
                                                         else
                                                         {
                                                            §§goto(addr049c);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         if(_loc9_ == _loc10_)
                                                         {
                                                            continue loop3;
                                                         }
                                                         §§push(_loc10_.boundMaxY);
                                                         §§push(_loc6_);
                                                         if(_loc18_ || Boolean(param2))
                                                         {
                                                            if(§§pop() <= §§pop())
                                                            {
                                                               §§push(true);
                                                               if(!(_loc18_ || Boolean(param3)))
                                                               {
                                                                  break loop3;
                                                               }
                                                               _loc11_ = §§pop();
                                                               continue loop3;
                                                            }
                                                            §§push(_loc10_.boundMinY);
                                                            if(_loc19_)
                                                            {
                                                               break;
                                                            }
                                                            §§push(_loc5_);
                                                            if(!_loc19_)
                                                            {
                                                               if(§§pop() >= §§pop())
                                                               {
                                                                  continue loop3;
                                                               }
                                                               §§goto(addr03e1);
                                                            }
                                                         }
                                                      }
                                                      §§goto(addr047e);
                                                   }
                                                   §§goto(addr0485);
                                                }
                                                §§goto(addr04b7);
                                             }
                                             _loc10_ = _loc10_.next;
                                             §§push(§§pop() + §§pop());
                                             break loop46;
                                          }
                                          addr041e:
                                          if(Boolean(§§pop()))
                                          {
                                             addr0423:
                                             §§push(false);
                                             if(!_loc19_)
                                             {
                                                addr042a:
                                                _loc7_ = §§pop();
                                                §§push(true);
                                                if(_loc18_ || Boolean(param2))
                                                {
                                                   addr043b:
                                                   §§push(Boolean(§§pop()));
                                                   if(_loc18_ || Boolean(param3))
                                                   {
                                                      _loc8_ = §§pop();
                                                      continue loop13;
                                                   }
                                                }
                                                else
                                                {
                                                   addr04b4:
                                                   §§push(Boolean(§§pop()));
                                                }
                                             }
                                             addr04b5:
                                             _loc11_ = §§pop();
                                          }
                                          else
                                          {
                                             loop45:
                                             while(true)
                                             {
                                                loop46:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(_loc9_.boundMaxY);
                                                      if(!(_loc19_ && Boolean(this)))
                                                      {
                                                         _loc4_ = Number(§§pop());
                                                         if(_loc19_ && Boolean(this))
                                                         {
                                                            break;
                                                         }
                                                         §§push(_loc4_);
                                                         §§push(this.threshold);
                                                         if(!_loc18_)
                                                         {
                                                            break loop44;
                                                         }
                                                         §§push(§§pop() - §§pop());
                                                         if(!_loc18_)
                                                         {
                                                            break loop46;
                                                         }
                                                         §§push(Number(§§pop()));
                                                         if(!_loc18_)
                                                         {
                                                            break loop45;
                                                         }
                                                      }
                                                      _loc5_ = §§pop();
                                                      if(!(_loc19_ && Boolean(param1)))
                                                      {
                                                         addr049c:
                                                         §§push(_loc4_);
                                                         §§push(this.threshold);
                                                         break loop44;
                                                      }
                                                   }
                                                   §§goto(addr04b3);
                                                }
                                                §§push(Number(§§pop()));
                                                break;
                                             }
                                             _loc6_ = §§pop();
                                             if(_loc18_ || Boolean(this))
                                             {
                                                addr04b3:
                                                §§goto(addr04b4);
                                                §§push(false);
                                             }
                                          }
                                          addr04b7:
                                          _loc10_ = param3;
                                          loop48:
                                          while(true)
                                          {
                                             if(_loc18_)
                                             {
                                                loop4:
                                                while(true)
                                                {
                                                   if(_loc10_ != null)
                                                   {
                                                      if(_loc9_ != _loc10_)
                                                      {
                                                         if(_loc18_ || Boolean(param1))
                                                         {
                                                            loop49:
                                                            while(true)
                                                            {
                                                               while(true)
                                                               {
                                                                  loop51:
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc10_.boundMinY);
                                                                        §§push(_loc5_);
                                                                        if(!(_loc19_ && Boolean(this)))
                                                                        {
                                                                           if(§§pop() >= §§pop())
                                                                           {
                                                                              if(!_loc18_)
                                                                              {
                                                                                 break loop4;
                                                                              }
                                                                              §§push(true);
                                                                              if(!_loc18_)
                                                                              {
                                                                                 break loop48;
                                                                              }
                                                                              §§push(Boolean(§§pop()));
                                                                              if(_loc18_ || Boolean(this))
                                                                              {
                                                                                 _loc11_ = §§pop();
                                                                                 continue loop4;
                                                                              }
                                                                              §§goto(addr05cb);
                                                                           }
                                                                           else
                                                                           {
                                                                              §§push(_loc10_.boundMaxY);
                                                                              §§push(_loc6_);
                                                                              if(!(_loc19_ && Boolean(param3)))
                                                                              {
                                                                                 if(§§pop() > §§pop())
                                                                                 {
                                                                                    break loop4;
                                                                                 }
                                                                                 continue loop4;
                                                                              }
                                                                           }
                                                                        }
                                                                        addr05af:
                                                                        §§push(§§pop() - §§pop());
                                                                        break loop51;
                                                                     }
                                                                     §§goto(addr05ce);
                                                                  }
                                                                  _loc5_ = §§pop();
                                                                  §§push(_loc4_);
                                                                  §§push(this.threshold);
                                                                  break loop49;
                                                               }
                                                               _loc6_ = Number(§§pop());
                                                               §§push(false);
                                                               if(_loc18_ || Boolean(param1))
                                                               {
                                                                  addr05cb:
                                                                  §§push(Boolean(§§pop()));
                                                               }
                                                               _loc11_ = §§pop();
                                                               addr05ce:
                                                               _loc10_ = param3;
                                                               loop5:
                                                               for(; _loc10_ != null; _loc10_ = _loc10_.next)
                                                               {
                                                                  if(_loc9_ != _loc10_)
                                                                  {
                                                                     loop52:
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           while(true)
                                                                           {
                                                                              while(true)
                                                                              {
                                                                                 §§push(_loc10_.boundMaxZ);
                                                                                 if(_loc18_)
                                                                                 {
                                                                                    §§push(_loc6_);
                                                                                    if(_loc18_ || Boolean(param1))
                                                                                    {
                                                                                       if(§§pop() <= §§pop())
                                                                                       {
                                                                                          if(_loc18_ || Boolean(this))
                                                                                          {
                                                                                             _loc11_ = true;
                                                                                             continue loop5;
                                                                                          }
                                                                                          §§goto(addr06ff);
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          §§push(_loc10_.boundMinZ);
                                                                                          §§push(_loc5_);
                                                                                          if(!_loc19_)
                                                                                          {
                                                                                             if(§§pop() < §§pop())
                                                                                             {
                                                                                                break loop5;
                                                                                             }
                                                                                             continue loop5;
                                                                                          }
                                                                                       }
                                                                                    }
                                                                                    addr06f2:
                                                                                    §§push(§§pop() - §§pop());
                                                                                 }
                                                                                 _loc5_ = Number(§§pop());
                                                                                 break;
                                                                              }
                                                                              addr06f6:
                                                                              §§push(_loc4_);
                                                                              §§push(this.threshold);
                                                                              break loop52;
                                                                           }
                                                                           §§goto(addr06fd);
                                                                        }
                                                                        _loc10_ = param3;
                                                                        loop6:
                                                                        while(_loc10_ != null)
                                                                        {
                                                                           if(_loc9_ != _loc10_)
                                                                           {
                                                                              loop55:
                                                                              while(true)
                                                                              {
                                                                                 while(true)
                                                                                 {
                                                                                    §§push(_loc10_.boundMinZ);
                                                                                    if(!(_loc19_ && Boolean(this)))
                                                                                    {
                                                                                       §§push(_loc5_);
                                                                                       if(_loc19_ && Boolean(param1))
                                                                                       {
                                                                                          break;
                                                                                       }
                                                                                       if(§§pop() >= §§pop())
                                                                                       {
                                                                                          _loc11_ = true;
                                                                                          if(_loc18_)
                                                                                          {
                                                                                             break loop55;
                                                                                          }
                                                                                          addr07b5:
                                                                                          addr07cf:
                                                                                          §§push(false);
                                                                                          if(!_loc19_)
                                                                                          {
                                                                                             §§push(Boolean(§§pop()));
                                                                                             if(!(_loc19_ && Boolean(param2)))
                                                                                             {
                                                                                                _loc7_ = §§pop();
                                                                                                addr07cd:
                                                                                                §§push(false);
                                                                                             }
                                                                                             §§push(Boolean(§§pop()));
                                                                                          }
                                                                                          _loc8_ = §§pop();
                                                                                          continue loop13;
                                                                                       }
                                                                                       §§push(_loc10_.boundMaxZ);
                                                                                    }
                                                                                    §§push(_loc6_);
                                                                                    break;
                                                                                 }
                                                                                 if(§§pop() > §§pop())
                                                                                 {
                                                                                    break loop6;
                                                                                 }
                                                                                 break;
                                                                              }
                                                                           }
                                                                           break loop55;
                                                                           _loc10_ = §§pop();
                                                                        }
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc10_ == null);
                                                                           if(!_loc19_)
                                                                           {
                                                                              var _temp_53:* = §§pop();
                                                                              §§push(_temp_53);
                                                                              §§push(_temp_53);
                                                                              if(_loc18_ || Boolean(param3))
                                                                              {
                                                                                 §§push(Boolean(§§pop()));
                                                                              }
                                                                              loop58:
                                                                              while(true)
                                                                              {
                                                                                 while(true)
                                                                                 {
                                                                                    if(§§pop())
                                                                                    {
                                                                                       §§pop();
                                                                                       if(_loc19_ && Boolean(param2))
                                                                                       {
                                                                                          break;
                                                                                       }
                                                                                       §§push(_loc11_);
                                                                                       if(_loc19_ && Boolean(param2))
                                                                                       {
                                                                                          break loop58;
                                                                                       }
                                                                                       §§push(Boolean(§§pop()));
                                                                                    }
                                                                                    if(!§§pop())
                                                                                    {
                                                                                       §§push(_loc9_.next);
                                                                                       continue loop0;
                                                                                    }
                                                                                    if(!_loc19_)
                                                                                    {
                                                                                       break;
                                                                                    }
                                                                                    §§goto(addr07cd);
                                                                                 }
                                                                                 §§goto(addr07b5);
                                                                              }
                                                                           }
                                                                           break loop58;
                                                                        }
                                                                        §§goto(addr07cf);
                                                                     }
                                                                     addr06fd:
                                                                     _loc6_ = §§pop() + §§pop();
                                                                     addr0700:
                                                                     _loc11_ = false;
                                                                     addr06ff:
                                                                     break loop53;
                                                                  }
                                                               }
                                                               loop61:
                                                               while(true)
                                                               {
                                                                  while(true)
                                                                  {
                                                                     loop63:
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc10_ == null);
                                                                        if(!_loc19_)
                                                                        {
                                                                           var _temp_59:* = Boolean(§§pop());
                                                                           §§push(_temp_59);
                                                                           §§push(_temp_59);
                                                                           if(!(_loc19_ && Boolean(param2)))
                                                                           {
                                                                              §§push(Boolean(§§pop()));
                                                                           }
                                                                           while(true)
                                                                           {
                                                                              if(§§pop())
                                                                              {
                                                                                 §§pop();
                                                                                 if(!(_loc18_ || Boolean(param3)))
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(Boolean(_loc11_));
                                                                                 if(!(_loc18_ || Boolean(param1)))
                                                                                 {
                                                                                    break loop63;
                                                                                 }
                                                                              }
                                                                              if(!§§pop())
                                                                              {
                                                                                 §§push(_loc9_.boundMaxZ);
                                                                                 if(_loc18_)
                                                                                 {
                                                                                    _loc4_ = Number(§§pop());
                                                                                    if(!_loc19_)
                                                                                    {
                                                                                       break;
                                                                                    }
                                                                                    break loop53;
                                                                                 }
                                                                                 break loop54;
                                                                              }
                                                                              if(_loc19_ && Boolean(param3))
                                                                              {
                                                                                 break loop61;
                                                                              }
                                                                              §§push(false);
                                                                           }
                                                                           §§push(_loc4_);
                                                                           §§push(this.threshold);
                                                                           if(!_loc18_)
                                                                           {
                                                                              break loop52;
                                                                           }
                                                                           §§goto(addr06f2);
                                                                        }
                                                                        §§push(Boolean(§§pop()));
                                                                        if(_loc19_)
                                                                        {
                                                                           break;
                                                                        }
                                                                        _loc7_ = §§pop();
                                                                        if(_loc18_ || Boolean(param1))
                                                                        {
                                                                           §§push(false);
                                                                           if(_loc18_)
                                                                           {
                                                                              §§push(Boolean(§§pop()));
                                                                              if(_loc18_ || Boolean(param1))
                                                                              {
                                                                                 break;
                                                                              }
                                                                           }
                                                                           §§goto(addr0700);
                                                                        }
                                                                        §§goto(addr06ff);
                                                                     }
                                                                     _loc8_ = §§pop();
                                                                     if(!(_loc19_ && Boolean(param3)))
                                                                     {
                                                                        break loop61;
                                                                     }
                                                                     break;
                                                                  }
                                                                  §§goto(addr06f6);
                                                               }
                                                               continue loop13;
                                                            }
                                                            §§push(§§pop() + §§pop());
                                                            break loop50;
                                                         }
                                                         break;
                                                      }
                                                      continue;
                                                   }
                                                   addr0542:
                                                   var _temp_69:* = _loc10_ == null;
                                                   §§push(_temp_69);
                                                   §§push(_temp_69);
                                                   if(_loc18_)
                                                   {
                                                      §§push(Boolean(§§pop()));
                                                   }
                                                   while(true)
                                                   {
                                                      if(§§pop())
                                                      {
                                                         §§pop();
                                                         if(!(_loc18_ || Boolean(param3)))
                                                         {
                                                            break;
                                                         }
                                                         §§push(_loc11_);
                                                         if(_loc19_ && Boolean(param3))
                                                         {
                                                            break loop48;
                                                         }
                                                         §§push(Boolean(§§pop()));
                                                      }
                                                      if(!§§pop())
                                                      {
                                                         §§push(_loc9_.boundMinZ);
                                                         if(!_loc18_)
                                                         {
                                                            break loop51;
                                                         }
                                                         §§push(Number(§§pop()));
                                                         if(!_loc18_)
                                                         {
                                                            break loop50;
                                                         }
                                                         _loc4_ = §§pop();
                                                         §§push(_loc4_);
                                                         §§push(this.threshold);
                                                         if(_loc19_)
                                                         {
                                                            break loop49;
                                                         }
                                                         §§goto(addr05af);
                                                      }
                                                   }
                                                   §§goto(addr05ce);
                                                   _loc10_ = _loc10_.next;
                                                }
                                                §§goto(addr0542);
                                             }
                                             _loc7_ = false;
                                             §§push(true);
                                             if(_loc18_ || Boolean(this))
                                             {
                                                break;
                                             }
                                             addr058b:
                                             _loc8_ = §§pop();
                                             continue loop13;
                                          }
                                          §§goto(addr058b);
                                       }
                                       §§goto(addr0350);
                                    }
                                    _loc6_ = §§pop();
                                    if(_loc18_ || Boolean(param2))
                                    {
                                       addr0212:
                                       _loc11_ = false;
                                       break loop39;
                                    }
                                    break loop11;
                                 }
                                 §§goto(addr0a4d);
                              }
                              §§goto(addr0a86);
                           }
                           §§goto(addr010a);
                        }
                        loop78:
                        while(true)
                        {
                           §§push(_loc10_ == null);
                           if(!(_loc19_ && Boolean(param3)))
                           {
                              var _temp_87:* = Boolean(§§pop());
                              while(true)
                              {
                                 §§push(_temp_87);
                                 §§push(_temp_87);
                                 if(_loc18_)
                                 {
                                    loop80:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          if(§§pop())
                                          {
                                             §§pop();
                                             if(_loc19_ && Boolean(this))
                                             {
                                                break;
                                             }
                                             §§push(_loc11_);
                                             if(!(_loc19_ && Boolean(param1)))
                                             {
                                                §§push(Boolean(§§pop()));
                                                if(_loc19_ && Boolean(param1))
                                                {
                                                   continue loop27;
                                                }
                                             }
                                             else
                                             {
                                                §§goto(addr0941);
                                             }
                                          }
                                          if(§§pop())
                                          {
                                             §§push(true);
                                             if(_loc18_ || Boolean(this))
                                             {
                                                _loc7_ = §§pop();
                                                if(!(_loc18_ || Boolean(param3)))
                                                {
                                                   break loop78;
                                                }
                                                §§push(false);
                                                if(!(_loc18_ || Boolean(param3)))
                                                {
                                                   break loop80;
                                                }
                                                _loc8_ = Boolean(§§pop());
                                                continue loop13;
                                             }
                                             §§goto(addr0212);
                                          }
                                          else
                                          {
                                             _loc4_ = _loc9_.boundMaxX;
                                             if(!_loc18_)
                                             {
                                                continue loop15;
                                             }
                                             §§push(_loc4_);
                                             if(!(_loc18_ || Boolean(param1)))
                                             {
                                                break loop38;
                                             }
                                             §§goto(addr01cb);
                                          }
                                       }
                                       §§goto(addr0215);
                                    }
                                    §§goto(addr095e);
                                 }
                                 §§goto(addr0980);
                              }
                           }
                           §§goto(addr099c);
                        }
                        §§goto(addr0a72);
                     }
                     _loc6_ = Number(§§pop());
                     if(_loc18_)
                     {
                        §§push(false);
                        if(_loc18_ || Boolean(param3))
                        {
                           §§push(Boolean(§§pop()));
                        }
                        _loc11_ = §§pop();
                        if(!_loc19_)
                        {
                           break loop36;
                        }
                     }
                     continue loop13;
                  }
                  §§push(§§pop() + §§pop());
                  break loop35;
               }
               continue loop13;
            }
            _loc9_ = §§pop();
            _loc15_.destroy();
            §§goto(addr09e3);
         }
         loop12:
         while(true)
         {
            while(true)
            {
               loop14:
               while(true)
               {
                  if(_loc9_ != null)
                  {
                     if(!_loc19_)
                     {
                        loop7:
                        for(; param3 != null; param3 = _loc12_)
                        {
                           §§push(param3.next);
                           if(!(_loc19_ && Boolean(param2)))
                           {
                              _loc12_ = §§pop();
                              loop17:
                              while(true)
                              {
                                 loop18:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc7_);
                                       if(!_loc19_)
                                       {
                                          if(§§pop())
                                          {
                                             addr084d:
                                             §§push(param3.boundMinX);
                                             if(!_loc18_)
                                             {
                                                break loop18;
                                             }
                                             _loc16_ = §§pop();
                                             §§push(_loc7_);
                                             if(_loc19_ && Boolean(this))
                                             {
                                                break loop17;
                                             }
                                          }
                                          else
                                          {
                                             §§push(_loc8_);
                                             if(!(_loc19_ && Boolean(param2)))
                                             {
                                                if(§§pop())
                                                {
                                                   §§push(param3.boundMinY);
                                                }
                                                else
                                                {
                                                   §§push(param3.boundMinZ);
                                                   if(!(_loc18_ || Boolean(param3)))
                                                   {
                                                      break;
                                                   }
                                                   §§push(Number(§§pop()));
                                                }
                                                §§goto(addr084d);
                                             }
                                          }
                                       }
                                       if(!§§pop())
                                       {
                                          §§push(_loc8_);
                                          break loop17;
                                       }
                                       §§goto(addr089c);
                                       §§push(param3.boundMaxX);
                                    }
                                    §§goto(addr08a1);
                                 }
                                 while(true)
                                 {
                                    §§push(Number(§§pop()));
                                    if(!_loc18_)
                                    {
                                       §§goto(addr0895);
                                    }
                                    §§goto(addr089c);
                                 }
                                 §§goto(addr08cb);
                              }
                              loop19:
                              while(true)
                              {
                                 if(§§pop())
                                 {
                                    while(true)
                                    {
                                       §§push(param3.boundMaxY);
                                       if(!_loc19_)
                                       {
                                          break loop18;
                                       }
                                       addr08cb:
                                       §§push(_loc5_);
                                       break;
                                    }
                                 }
                                 else
                                 {
                                    while(true)
                                    {
                                       §§push(param3.boundMaxZ);
                                       if(!_loc19_)
                                       {
                                          addr0895:
                                          §§push(Number(§§pop()));
                                          if(_loc19_)
                                          {
                                             break;
                                          }
                                       }
                                       addr089c:
                                       _loc17_ = §§pop();
                                       addr08a1:
                                       §§push(_loc17_);
                                       §§push(_loc6_);
                                       if(!(_loc19_ && Boolean(this)))
                                       {
                                          if(§§pop() <= §§pop())
                                          {
                                             §§push(_loc16_);
                                             break;
                                          }
                                          param3.next = _loc15_;
                                          if(!_loc18_)
                                          {
                                             break loop19;
                                          }
                                          _loc15_ = param3;
                                          continue loop7;
                                       }
                                    }
                                    §§goto(addr08cb);
                                 }
                                 if(§§pop() < §§pop())
                                 {
                                    break;
                                 }
                                 param3.next = _loc14_;
                                 _loc14_ = param3;
                                 continue loop7;
                              }
                              param3.next = _loc13_;
                              _loc13_ = param3;
                              continue;
                           }
                           addr0ad0:
                           _loc12_ = §§pop();
                           if(!_loc19_)
                           {
                              _loc14_.draw(param1,param2,this.threshold,this);
                              loop24:
                              while(true)
                              {
                                 if(_loc18_)
                                 {
                                    addr0aec:
                                    _loc14_.destroy();
                                 }
                                 _loc14_ = _loc12_;
                                 while(true)
                                 {
                                    if(_loc14_ == null)
                                    {
                                       break loop24;
                                    }
                                    §§goto(addr0ad0);
                                    §§push(_loc14_.next);
                                    _loc14_ = _loc12_;
                                 }
                                 var _temp_9:* = §§pop();
                                 loop25:
                                 while(true)
                                 {
                                    loop26:
                                    while(true)
                                    {
                                       loop27:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_temp_9);
                                             §§push(Boolean(_temp_9));
                                             if(_loc18_)
                                             {
                                                if(§§pop())
                                                {
                                                   §§pop();
                                                   if(_loc19_ && Boolean(this))
                                                   {
                                                      break loop11;
                                                   }
                                                   §§push(imh > _loc4_);
                                                }
                                                addr0941:
                                                var _temp_18:* = §§pop();
                                                §§push(_temp_18);
                                                if(Boolean(_temp_18))
                                                {
                                                   break;
                                                }
                                                §§pop();
                                                if(!_loc18_)
                                                {
                                                   break loop27;
                                                }
                                                §§push(_loc7_);
                                                if(!(_loc18_ || Boolean(param1)))
                                                {
                                                   break loop26;
                                                }
                                                var _temp_20:* = !§§pop();
                                                §§push(_temp_20);
                                                if(_temp_20)
                                                {
                                                   §§pop();
                                                   if(_loc19_ && Boolean(this))
                                                   {
                                                      break loop25;
                                                   }
                                                   §§push(!_loc8_);
                                                   if(_loc19_)
                                                   {
                                                      break loop14;
                                                   }
                                                }
                                                var _temp_22:* = §§pop();
                                                §§push(_temp_22);
                                                §§push(_temp_22);
                                             }
                                             addr0980:
                                             if(!Boolean(§§pop()))
                                             {
                                                break;
                                             }
                                             §§pop();
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   if(_loc18_ || Boolean(param2))
                                                   {
                                                      §§push(iml > _loc4_);
                                                      break loop26;
                                                   }
                                                   §§goto(addr0a4d);
                                                }
                                                §§goto(addr0a86);
                                             }
                                             §§goto(addr0b56);
                                          }
                                          §§goto(addr099c);
                                       }
                                       §§goto(addr0bcf);
                                    }
                                    addr099c:
                                    loop28:
                                    while(true)
                                    {
                                       if(Boolean(§§pop()))
                                       {
                                          if(!_loc18_)
                                          {
                                             break loop24;
                                          }
                                          if(_loc15_ != null)
                                          {
                                             §§push(_loc15_.next);
                                             §§push(null);
                                             if(!(_loc18_ || Boolean(param1)))
                                             {
                                                break;
                                             }
                                             if(§§pop() == §§pop())
                                             {
                                                _loc15_.draw(param1,param2,this.threshold,this);
                                                break loop11;
                                             }
                                             this.drawAABBGeometry(param1,param2,_loc15_);
                                          }
                                          for(; _loc14_ != null; _loc14_ = _loc12_)
                                          {
                                             _loc12_ = _loc14_.next;
                                             if(!(_loc19_ && Boolean(param1)))
                                             {
                                                _loc14_.draw(param1,param2,this.threshold,this);
                                                if(_loc19_)
                                                {
                                                   continue;
                                                }
                                             }
                                             _loc14_.destroy();
                                          }
                                          while(true)
                                          {
                                             if(!_loc19_)
                                             {
                                                if(_loc13_ != null)
                                                {
                                                   §§push(_loc13_.next);
                                                   §§push(null);
                                                   if(_loc19_)
                                                   {
                                                      break loop28;
                                                   }
                                                   while(true)
                                                   {
                                                      if(§§pop() != §§pop())
                                                      {
                                                         if(_loc18_ || Boolean(param1))
                                                         {
                                                            §§goto(addr0a4d);
                                                         }
                                                         else
                                                         {
                                                            addr0a91:
                                                            §§push(_loc13_.next);
                                                            §§push(null);
                                                            if(_loc19_ && Boolean(param1))
                                                            {
                                                               break loop28;
                                                            }
                                                            if(§§pop() == §§pop())
                                                            {
                                                               _loc13_.draw(param1,param2,this.threshold,this);
                                                               _loc13_.destroy();
                                                               break;
                                                            }
                                                         }
                                                      }
                                                      else
                                                      {
                                                         _loc13_.draw(param1,param2,this.threshold,this);
                                                         if(_loc18_)
                                                         {
                                                            addr0a72:
                                                            _loc13_.destroy();
                                                            if(!(_loc18_ || Boolean(param1)))
                                                            {
                                                               break loop25;
                                                            }
                                                            §§goto(addr0a86);
                                                         }
                                                      }
                                                      this.drawAABBGeometry(param1,param2,_loc13_);
                                                      break;
                                                   }
                                                   §§goto(addr0af8);
                                                }
                                             }
                                             §§goto(addr0a86);
                                          }
                                          §§goto(addr0b56);
                                       }
                                       else if(_loc13_ != null)
                                       {
                                          §§goto(addr0a91);
                                       }
                                       §§goto(addr0ac7);
                                    }
                                    §§goto(addr0b0b);
                                 }
                                 addr0b0b:
                                 addr0b0a:
                                 if(_loc15_.next != null)
                                 {
                                    if(!_loc19_)
                                    {
                                       this.drawAABBGeometry(param1,param2,_loc15_);
                                       if(_loc19_ && Boolean(param2))
                                       {
                                          continue loop15;
                                       }
                                    }
                                    §§goto(addr0b56);
                                 }
                                 else
                                 {
                                    _loc15_.draw(param1,param2,this.threshold,this);
                                    if(!_loc19_)
                                    {
                                       _loc15_.destroy();
                                       if(!(_loc19_ && Boolean(this)))
                                       {
                                          §§goto(addr0b56);
                                       }
                                    }
                                 }
                                 §§goto(addr0bcf);
                                 addr0af8:
                              }
                              if(_loc15_ != null)
                              {
                                 break loop25;
                              }
                              break loop32;
                           }
                           §§goto(addr0aec);
                        }
                        var _temp_25:* = Boolean(_loc7_) && imd > _loc4_;
                        §§push(_temp_25);
                        if(!_temp_25)
                        {
                           §§pop();
                           §§push(_loc8_);
                           if(!(_loc19_ && Boolean(param1)))
                           {
                              §§push(Boolean(§§pop()));
                              continue loop27;
                           }
                        }
                        §§goto(addr0941);
                     }
                     break loop27;
                  }
                  §§push(this.resolveByOOBB);
                  break;
               }
               if(§§pop())
               {
                  break;
               }
               break loop12;
            }
            if(!(_loc19_ && Boolean(param3)))
            {
               _loc9_ = param3;
               loop15:
               while(true)
               {
                  loop16:
                  while(true)
                  {
                     if(_loc18_)
                     {
                        while(true)
                        {
                           if(_loc9_ == null)
                           {
                              break loop16;
                           }
                           _loc9_.calculateOOBB(this);
                           if(!(_loc18_ || Boolean(param2)))
                           {
                              break loop15;
                           }
                        }
                        addr0a4d:
                        this.drawAABBGeometry(param1,param2,_loc13_);
                        if(!_loc19_)
                        {
                           addr0a86:
                        }
                        addr0b56:
                        §§goto(addr0bcf);
                        addr0b9c:
                     }
                     _loc9_ = _loc9_.next;
                     §§goto(addr0b9c);
                  }
                  if(!(_loc19_ && Boolean(param3)))
                  {
                     break;
                  }
                  §§goto(addr0bc3);
               }
               this.drawOOBBGeometry(param1,param2,param3);
               addr0bc3:
            }
            §§goto(addr0bcf);
         }
         this.drawConflictGeometry(param1,param2,param3);
         addr0bcf:
      }
      
      alternativa3d function drawOOBBGeometry(param1:Camera3D, param2:Canvas, param3:VG) : void
      {
         var _temp_1:* = true;
         var _loc21_:Boolean = false;
         var _loc22_:Boolean = _temp_1;
         var _loc4_:Vertex = null;
         var _loc5_:Vertex = null;
         var _loc6_:Wrapper = null;
         var _loc7_:* = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:* = NaN;
         var _loc10_:* = NaN;
         var _loc11_:* = NaN;
         var _loc12_:* = false;
         var _loc13_:* = false;
         var _loc14_:VG = null;
         var _loc15_:VG = null;
         var _loc16_:* = false;
         var _loc17_:VG = null;
         var _loc18_:VG = null;
         var _loc19_:VG = null;
         var _loc20_:VG = null;
         _loc14_ = param3;
         loop0:
         while(_loc14_ != null)
         {
            loop14:
            while(true)
            {
               loop15:
               while(true)
               {
                  loop20:
                  while(true)
                  {
                     loop24:
                     while(true)
                     {
                        loop30:
                        while(true)
                        {
                           loop31:
                           while(true)
                           {
                              if(_loc14_.viewAligned)
                              {
                                 if(_loc21_)
                                 {
                                    break loop0;
                                 }
                                 §§push(_loc14_.object.ml);
                                 if(_loc22_)
                                 {
                                    §§push(Number(§§pop()));
                                 }
                                 _loc11_ = §§pop();
                                 if(_loc21_)
                                 {
                                    break loop0;
                                 }
                                 _loc15_ = param3;
                                 loop32:
                                 while(true)
                                 {
                                    if(!(_loc21_ && Boolean(param2)))
                                    {
                                       loop2:
                                       while(true)
                                       {
                                          if(_loc15_ == null)
                                          {
                                             break loop32;
                                          }
                                          while(true)
                                          {
                                             §§push(_loc15_.viewAligned);
                                             if(!(_loc21_ && Boolean(this)))
                                             {
                                                §§push(!§§pop());
                                                if(_loc22_ || Boolean(param1))
                                                {
                                                   if(!§§pop())
                                                   {
                                                      continue loop2;
                                                   }
                                                   if(_loc21_ && Boolean(param3))
                                                   {
                                                      break loop32;
                                                   }
                                                   §§push(false);
                                                   if(_loc21_)
                                                   {
                                                      break;
                                                   }
                                                }
                                                §§push(Boolean(§§pop()));
                                                if(_loc21_)
                                                {
                                                   break;
                                                }
                                             }
                                             _loc12_ = §§pop();
                                             if(_loc22_ || Boolean(param1))
                                             {
                                                §§push(false);
                                                if(!(_loc21_ && Boolean(param1)))
                                                {
                                                   §§push(Boolean(§§pop()));
                                                }
                                                break;
                                             }
                                             break loop32;
                                          }
                                          _loc13_ = §§pop();
                                          if(!_loc22_)
                                          {
                                             break loop32;
                                          }
                                          _loc4_ = _loc15_.boundVertexList;
                                          loop4:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                if(_loc4_ == null)
                                                {
                                                   if(!_loc22_)
                                                   {
                                                      break loop24;
                                                   }
                                                }
                                                else
                                                {
                                                   §§push(_loc4_.cameraZ);
                                                   if(_loc21_ && Boolean(param2))
                                                   {
                                                      break loop31;
                                                   }
                                                   if(§§pop() > _loc11_)
                                                   {
                                                      if(!(_loc21_ && Boolean(param3)))
                                                      {
                                                         §§push(_loc12_);
                                                         if(_loc21_)
                                                         {
                                                            break loop30;
                                                         }
                                                         if(!§§pop())
                                                         {
                                                            _loc13_ = true;
                                                            continue loop4;
                                                         }
                                                      }
                                                      else
                                                      {
                                                         §§goto(addr09c6);
                                                      }
                                                   }
                                                   else if(!_loc13_)
                                                   {
                                                      §§push(true);
                                                      if(_loc22_)
                                                      {
                                                         §§push(Boolean(§§pop()));
                                                         if(!(_loc22_ || Boolean(param3)))
                                                         {
                                                            break loop4;
                                                         }
                                                         _loc12_ = §§pop();
                                                         continue loop4;
                                                      }
                                                      §§goto(addr097a);
                                                   }
                                                }
                                                if(_loc4_ == null)
                                                {
                                                   continue loop2;
                                                }
                                                if(_loc22_)
                                                {
                                                   break loop32;
                                                }
                                                §§goto(addr0a73);
                                             }
                                             _loc4_ = _loc4_.next;
                                             §§goto(addr0a97);
                                          }
                                          §§goto(addr0944);
                                          _loc15_ = _loc15_.next;
                                       }
                                       addr01b7:
                                       if(!_loc21_)
                                       {
                                          break loop0;
                                       }
                                       break loop20;
                                    }
                                    §§goto(addr00d0);
                                 }
                                 if(_loc15_ == null)
                                 {
                                    §§goto(addr01b7);
                                 }
                              }
                              else
                              {
                                 _loc5_ = _loc14_.boundPlaneList;
                                 loop35:
                                 while(true)
                                 {
                                    if(_loc22_)
                                    {
                                       while(true)
                                       {
                                          if(_loc5_ == null)
                                          {
                                             break loop35;
                                          }
                                          §§push(_loc5_.cameraX);
                                          if(!(_loc21_ && Boolean(param1)))
                                          {
                                             _loc8_ = §§pop();
                                             §§push(_loc5_.cameraY);
                                             if(!_loc21_)
                                             {
                                                _loc9_ = §§pop();
                                                §§push(_loc5_.cameraZ);
                                                if(!(_loc21_ && Boolean(param3)))
                                                {
                                                   _loc10_ = §§pop();
                                                   §§push(_loc5_.offset);
                                                }
                                             }
                                          }
                                          _loc11_ = §§pop();
                                          _loc5_ = _loc5_.next;
                                       }
                                       addr0512:
                                       break loop0;
                                       addr0504:
                                    }
                                    §§push(false);
                                    if(!_loc21_)
                                    {
                                       §§push(Boolean(§§pop()));
                                    }
                                    _loc16_ = §§pop();
                                    _loc15_ = param3;
                                    if(_loc22_ || Boolean(param3))
                                    {
                                       addr0233:
                                       loop3:
                                       while(true)
                                       {
                                          loop36:
                                          while(true)
                                          {
                                             loop37:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   if(_loc15_ != null)
                                                   {
                                                      if(_loc14_ == _loc15_)
                                                      {
                                                         continue loop3;
                                                      }
                                                      if(!(_loc21_ && Boolean(param2)))
                                                      {
                                                         §§push(false);
                                                         if(!(_loc21_ && Boolean(param3)))
                                                         {
                                                            §§push(Boolean(§§pop()));
                                                            if(!(_loc21_ && Boolean(param1)))
                                                            {
                                                               _loc12_ = §§pop();
                                                               if(_loc22_ || Boolean(param1))
                                                               {
                                                                  §§push(false);
                                                                  if(!_loc21_)
                                                                  {
                                                                     §§push(Boolean(§§pop()));
                                                                     if(!(_loc21_ && Boolean(this)))
                                                                     {
                                                                        _loc13_ = §§pop();
                                                                        if(_loc22_)
                                                                        {
                                                                           addr029e:
                                                                           addr029a:
                                                                           if(_loc15_.viewAligned)
                                                                           {
                                                                              if(_loc22_)
                                                                              {
                                                                                 addr02a8:
                                                                                 _loc6_ = _loc15_.faceStruct.wrapper;
                                                                                 if(_loc22_ || Boolean(this))
                                                                                 {
                                                                                    loop6:
                                                                                    for(; _loc6_ != null; _loc6_ = _loc6_.next)
                                                                                    {
                                                                                       _loc4_ = _loc6_.vertex;
                                                                                       loop39:
                                                                                       while(true)
                                                                                       {
                                                                                          §§push(_loc4_.cameraX);
                                                                                          if(_loc22_ || Boolean(param2))
                                                                                          {
                                                                                             §§push(§§pop() * _loc8_);
                                                                                             if(_loc21_)
                                                                                             {
                                                                                                break;
                                                                                             }
                                                                                          }
                                                                                          §§push(_loc4_.cameraY);
                                                                                          §§push(_loc9_);
                                                                                          if(_loc22_ || Boolean(param3))
                                                                                          {
                                                                                             §§push(§§pop() * §§pop());
                                                                                             if(!_loc21_)
                                                                                             {
                                                                                                while(true)
                                                                                                {
                                                                                                   §§push(§§pop() + §§pop());
                                                                                                   if(_loc22_ || Boolean(param2))
                                                                                                   {
                                                                                                      break loop39;
                                                                                                   }
                                                                                                   addr032e:
                                                                                                   addr0333:
                                                                                                   §§push(_loc11_ - this.threshold);
                                                                                                   break;
                                                                                                }
                                                                                             }
                                                                                             addr0334:
                                                                                             if(§§pop() < §§pop())
                                                                                             {
                                                                                                if(_loc13_)
                                                                                                {
                                                                                                   break loop6;
                                                                                                }
                                                                                                _loc12_ = true;
                                                                                                continue loop6;
                                                                                             }
                                                                                             §§push(_loc12_);
                                                                                             if(_loc22_)
                                                                                             {
                                                                                                if(§§pop())
                                                                                                {
                                                                                                   break loop6;
                                                                                                }
                                                                                                _loc16_ = true;
                                                                                                _loc13_ = true;
                                                                                                continue loop6;
                                                                                             }
                                                                                             §§pop();
                                                                                             §§push(_loc16_);
                                                                                             if(_loc22_)
                                                                                             {
                                                                                                §§push(Boolean(§§pop()));
                                                                                             }
                                                                                             if(§§pop())
                                                                                             {
                                                                                                break loop36;
                                                                                             }
                                                                                             _loc5_ = _loc5_.next;
                                                                                             §§goto(addr0504);
                                                                                          }
                                                                                          addr031e:
                                                                                          §§push(§§pop() * §§pop());
                                                                                          if(!(_loc21_ && Boolean(param2)))
                                                                                          {
                                                                                             §§goto(addr032e);
                                                                                             §§push(§§pop() + §§pop());
                                                                                          }
                                                                                          §§goto(addr0334);
                                                                                       }
                                                                                       while(true)
                                                                                       {
                                                                                          §§push(_loc4_.cameraZ);
                                                                                          §§push(_loc10_);
                                                                                          if(_loc22_)
                                                                                          {
                                                                                             §§goto(addr031e);
                                                                                          }
                                                                                          §§goto(addr0333);
                                                                                       }
                                                                                       §§goto(addr0334);
                                                                                    }
                                                                                 }
                                                                                 if(_loc6_ == null)
                                                                                 {
                                                                                    break loop37;
                                                                                 }
                                                                                 if(!(_loc22_ || Boolean(param2)))
                                                                                 {
                                                                                    break loop36;
                                                                                 }
                                                                              }
                                                                              addr04cb:
                                                                              §§push(_loc15_ == null);
                                                                              if(_loc22_)
                                                                              {
                                                                                 §§push(Boolean(§§pop()));
                                                                              }
                                                                              var _temp_44:* = §§pop();
                                                                              §§push(_temp_44);
                                                                              §§push(_temp_44);
                                                                              if(_loc22_ || Boolean(param3))
                                                                              {
                                                                                 §§push(Boolean(§§pop()));
                                                                              }
                                                                              if(§§pop())
                                                                              {
                                                                                 §§goto(addr04ea);
                                                                              }
                                                                              §§goto(addr04f4);
                                                                           }
                                                                           _loc4_ = _loc15_.boundVertexList;
                                                                           if(!(_loc21_ && Boolean(param3)))
                                                                           {
                                                                              loop5:
                                                                              while(true)
                                                                              {
                                                                                 loop42:
                                                                                 while(true)
                                                                                 {
                                                                                    if(_loc4_ == null)
                                                                                    {
                                                                                       if(_loc21_ && Boolean(param1))
                                                                                       {
                                                                                          break;
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       while(true)
                                                                                       {
                                                                                          §§push(_loc4_.cameraX);
                                                                                          if(_loc22_ || Boolean(param2))
                                                                                          {
                                                                                             §§push(§§pop() * _loc8_);
                                                                                             if(!(_loc22_ || Boolean(param3)))
                                                                                             {
                                                                                                break;
                                                                                             }
                                                                                          }
                                                                                          addr040a:
                                                                                          §§push(_loc4_.cameraY);
                                                                                          §§push(_loc9_);
                                                                                          if(_loc22_)
                                                                                          {
                                                                                             §§push(§§pop() * §§pop());
                                                                                             if(!(_loc21_ && Boolean(param3)))
                                                                                             {
                                                                                                §§push(§§pop() + §§pop());
                                                                                                if(_loc22_ || Boolean(param3))
                                                                                                {
                                                                                                   break;
                                                                                                }
                                                                                                addr040c:
                                                                                                addr0420:
                                                                                                §§push(_loc11_);
                                                                                                if(_loc22_ || Boolean(param2))
                                                                                                {
                                                                                                   addr041f:
                                                                                                   §§push(§§pop() - this.threshold);
                                                                                                }
                                                                                                if(§§pop() >= §§pop())
                                                                                                {
                                                                                                   §§push(_loc12_);
                                                                                                   if(!_loc21_)
                                                                                                   {
                                                                                                      if(§§pop())
                                                                                                      {
                                                                                                         addr04b1:
                                                                                                         if(_loc4_ != null)
                                                                                                         {
                                                                                                            break loop42;
                                                                                                         }
                                                                                                         continue loop3;
                                                                                                      }
                                                                                                      _loc16_ = true;
                                                                                                      if(_loc21_ && Boolean(param3))
                                                                                                      {
                                                                                                         continue loop5;
                                                                                                      }
                                                                                                      §§push(true);
                                                                                                      if(!(_loc21_ && Boolean(param1)))
                                                                                                      {
                                                                                                         _loc13_ = §§pop();
                                                                                                         if(_loc21_ && Boolean(this))
                                                                                                         {
                                                                                                            break loop42;
                                                                                                         }
                                                                                                         continue loop5;
                                                                                                      }
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                      addr0491:
                                                                                                      §§push(Boolean(§§pop()));
                                                                                                   }
                                                                                                }
                                                                                                else if(_loc13_)
                                                                                                {
                                                                                                   if(!(_loc22_ || Boolean(param3)))
                                                                                                   {
                                                                                                      continue loop5;
                                                                                                   }
                                                                                                   §§goto(addr04b1);
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                   §§push(true);
                                                                                                   if(_loc22_)
                                                                                                   {
                                                                                                      §§goto(addr0491);
                                                                                                   }
                                                                                                }
                                                                                                _loc12_ = §§pop();
                                                                                                continue loop5;
                                                                                             }
                                                                                             addr040b:
                                                                                             §§goto(addr040c);
                                                                                             §§push(§§pop() + §§pop());
                                                                                          }
                                                                                          §§goto(addr040b);
                                                                                       }
                                                                                       while(true)
                                                                                       {
                                                                                          §§push(_loc4_.cameraZ);
                                                                                          §§push(_loc10_);
                                                                                          if(!_loc21_)
                                                                                          {
                                                                                             §§goto(addr040a);
                                                                                          }
                                                                                          §§goto(addr041f);
                                                                                       }
                                                                                       §§goto(addr0420);
                                                                                       §§push(§§pop() * §§pop());
                                                                                    }
                                                                                    §§goto(addr04b1);
                                                                                 }
                                                                                 §§goto(addr04cb);
                                                                              }
                                                                              break loop3;
                                                                           }
                                                                           continue loop5;
                                                                        }
                                                                        §§goto(addr02a8);
                                                                     }
                                                                  }
                                                                  §§goto(addr029e);
                                                               }
                                                               §§goto(addr029a);
                                                            }
                                                         }
                                                         §§goto(addr029e);
                                                      }
                                                   }
                                                   §§goto(addr04cb);
                                                }
                                                §§goto(addr0233);
                                             }
                                             continue loop3;
                                          }
                                          _loc15_ = _loc15_.next;
                                          break loop35;
                                       }
                                       §§goto(addr0512);
                                    }
                                    §§goto(addr029a);
                                 }
                                 if(_loc5_ != null)
                                 {
                                    break loop5;
                                 }
                              }
                              §§push(_loc14_.next);
                              if(_loc22_)
                              {
                                 _loc14_ = §§pop();
                                 continue loop0;
                              }
                              addr0564:
                              _loc17_ = §§pop();
                              if(param3.viewAligned)
                              {
                                 §§push(param3.object.ml);
                                 if(_loc22_)
                                 {
                                    addr057a:
                                    loop45:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc11_);
                                          if(_loc22_ || Boolean(param1))
                                          {
                                             §§push(§§pop() - §§pop());
                                             if(!(_loc21_ && Boolean(param2)))
                                             {
                                                addr0599:
                                                §§push(Number(§§pop()));
                                                if(_loc22_ || Boolean(param3))
                                                {
                                                   addr05a8:
                                                   _loc7_ = §§pop();
                                                   §§push(_loc7_);
                                                   if(_loc22_)
                                                   {
                                                      §§push(this.threshold);
                                                      if(_loc22_)
                                                      {
                                                         addr05bb:
                                                         §§push(-§§pop());
                                                         if(!_loc21_)
                                                         {
                                                            if(§§pop() < §§pop())
                                                            {
                                                               if(_loc22_)
                                                               {
                                                                  param3.next = _loc20_;
                                                                  if(!_loc21_)
                                                                  {
                                                                     _loc20_ = param3;
                                                                     param3 = _loc17_;
                                                                     while(true)
                                                                     {
                                                                        if(param3 == null)
                                                                        {
                                                                           break loop45;
                                                                        }
                                                                        §§push(param3.next);
                                                                        if(!(_loc22_ || Boolean(this)))
                                                                        {
                                                                           break loop14;
                                                                        }
                                                                        §§goto(addr0564);
                                                                        param3 = _loc17_;
                                                                     }
                                                                     break loop0;
                                                                     addr0619:
                                                                     addr06ed:
                                                                  }
                                                               }
                                                               addr05f3:
                                                               param3.next = _loc18_;
                                                               if(!(_loc21_ && Boolean(param2)))
                                                               {
                                                                  _loc18_ = param3;
                                                                  §§goto(addr0619);
                                                               }
                                                               addr0614:
                                                               _loc19_ = param3;
                                                               §§goto(addr0619);
                                                            }
                                                            addr05e2:
                                                            §§push(_loc7_);
                                                            §§push(this.threshold);
                                                         }
                                                      }
                                                      if(§§pop() > §§pop())
                                                      {
                                                         §§goto(addr05f3);
                                                      }
                                                      param3.next = _loc19_;
                                                      §§goto(addr0614);
                                                   }
                                                }
                                                §§goto(addr05e2);
                                             }
                                             §§goto(addr05a8);
                                          }
                                          §§goto(addr05bb);
                                       }
                                       §§goto(addr057a);
                                    }
                                    if(!(_loc21_ && Boolean(this)))
                                    {
                                       break loop20;
                                    }
                                    break loop15;
                                 }
                                 §§goto(addr0599);
                              }
                              addr061d:
                              _loc4_ = param3.boundVertexList;
                              loop9:
                              while(true)
                              {
                                 loop47:
                                 while(true)
                                 {
                                    if(_loc4_ != null)
                                    {
                                       loop50:
                                       while(true)
                                       {
                                          §§push(_loc4_.cameraZ);
                                          if(!_loc21_)
                                          {
                                             while(true)
                                             {
                                                §§push(_loc11_);
                                                if(_loc22_)
                                                {
                                                   §§push(§§pop() - §§pop());
                                                   if(_loc21_ && Boolean(this))
                                                   {
                                                      break;
                                                   }
                                                   §§push(Number(§§pop()));
                                                   if(!_loc21_)
                                                   {
                                                      _loc7_ = §§pop();
                                                      if(!(_loc22_ || Boolean(param2)))
                                                      {
                                                         break loop9;
                                                      }
                                                      §§push(_loc7_);
                                                      if(_loc21_)
                                                      {
                                                         break;
                                                      }
                                                   }
                                                   §§push(this.threshold);
                                                   if(_loc22_ || Boolean(param2))
                                                   {
                                                      §§push(-§§pop());
                                                      if(_loc21_)
                                                      {
                                                         break loop50;
                                                      }
                                                   }
                                                }
                                                if(§§pop() >= §§pop())
                                                {
                                                   §§push(_loc7_);
                                                   break;
                                                }
                                                param3.next = _loc20_;
                                                _loc20_ = param3;
                                                if(!(_loc22_ || Boolean(param2)))
                                                {
                                                   break loop47;
                                                }
                                                continue loop48;
                                             }
                                          }
                                          §§push(this.threshold);
                                          break;
                                       }
                                       if(§§pop() > §§pop())
                                       {
                                          if(!_loc21_)
                                          {
                                             break loop9;
                                          }
                                          continue loop48;
                                       }
                                       continue loop9;
                                    }
                                    continue loop48;
                                 }
                                 _loc4_ = _loc4_.next;
                                 _loc19_ = param3;
                                 §§goto(addr06e8);
                              }
                              param3.next = _loc18_;
                              _loc18_ = param3;
                              while(true)
                              {
                                 while(true)
                                 {
                                    if(_loc4_ == null)
                                    {
                                       if(!_loc21_)
                                       {
                                          param3.next = _loc19_;
                                       }
                                       break loop47;
                                    }
                                    §§goto(addr06e8);
                                 }
                                 §§goto(addr061d);
                              }
                              §§goto(addr057a);
                           }
                           §§goto(addr0969);
                        }
                        §§goto(addr0958);
                     }
                     §§goto(addr0b58);
                  }
                  addr0944:
                  §§push(_loc14_.viewAligned);
                  if(_loc22_)
                  {
                     §§push(Boolean(§§pop()));
                  }
                  var _temp_12:* = §§pop();
                  §§push(_temp_12);
                  §§push(_temp_12);
                  if(_loc22_ || Boolean(param1))
                  {
                     §§push(Boolean(§§pop()));
                  }
                  while(true)
                  {
                     if(!§§pop())
                     {
                        addr0958:
                        §§pop();
                        if(_loc21_ && Boolean(this))
                        {
                           break;
                        }
                        §§push(_loc11_ < 0);
                        if(_loc22_ || Boolean(param1))
                        {
                           addr097a:
                           §§push(Boolean(§§pop()));
                        }
                     }
                     while(true)
                     {
                        while(true)
                        {
                           if(!§§pop())
                           {
                              if(_loc18_ != null)
                              {
                                 if(!(_loc21_ && Boolean(this)))
                                 {
                                    §§push(_loc18_.next);
                                    break loop14;
                                 }
                              }
                              break;
                           }
                           if(!(_loc21_ && Boolean(param3)))
                           {
                              loop28:
                              while(true)
                              {
                                 while(true)
                                 {
                                    if(_loc20_ != null)
                                    {
                                       if(!_loc22_)
                                       {
                                          break loop16;
                                       }
                                       §§push(_loc20_.next);
                                       if(!(_loc21_ && Boolean(this)))
                                       {
                                          §§push(null);
                                          if(_loc22_)
                                          {
                                             if(§§pop() != §§pop())
                                             {
                                                this.drawOOBBGeometry(param1,param2,_loc20_);
                                                if(!_loc22_)
                                                {
                                                   break loop28;
                                                }
                                                addr09c6:
                                             }
                                             else
                                             {
                                                _loc20_.draw(param1,param2,this.threshold,this);
                                                addr09d6:
                                                _loc20_.destroy();
                                                addr09e6:
                                                if(_loc21_ && Boolean(param1))
                                                {
                                                   break loop16;
                                                }
                                             }
                                             addr09ea:
                                             while(true)
                                             {
                                                if(_loc19_ != null)
                                                {
                                                   §§push(_loc19_.next);
                                                   if(_loc21_)
                                                   {
                                                      break loop14;
                                                   }
                                                   _loc17_ = §§pop();
                                                   if(!(_loc21_ && Boolean(this)))
                                                   {
                                                      _loc19_.draw(param1,param2,this.threshold,this);
                                                      if(_loc21_)
                                                      {
                                                         continue;
                                                      }
                                                   }
                                                   _loc19_.destroy();
                                                   continue;
                                                }
                                                if(_loc18_ != null)
                                                {
                                                   break loop15;
                                                }
                                                §§goto(addr0a97);
                                                _loc19_ = _loc17_;
                                             }
                                          }
                                          break;
                                       }
                                       §§goto(addr0b53);
                                    }
                                    §§goto(addr09ea);
                                 }
                                 §§goto(addr0ac3);
                              }
                              §§goto(addr0ad6);
                           }
                           §§goto(addr0a97);
                           break;
                        }
                        §§goto(addr0afa);
                     }
                     §§goto(addr0b3b);
                  }
                  §§goto(addr0b6f);
               }
               while(true)
               {
                  while(true)
                  {
                     §§push(_loc18_.next);
                     if(_loc22_ || Boolean(param1))
                     {
                        while(true)
                        {
                           §§push(null);
                           if(!(_loc21_ && Boolean(param2)))
                           {
                              if(§§pop() != §§pop())
                              {
                                 if(!(_loc21_ && Boolean(this)))
                                 {
                                    this.drawOOBBGeometry(param1,param2,_loc18_);
                                    addr0a73:
                                 }
                                 else
                                 {
                                    §§goto(addr0ac7);
                                 }
                              }
                              else
                              {
                                 _loc18_.draw(param1,param2,this.threshold,this);
                                 _loc18_.destroy();
                                 if(!(_loc22_ || Boolean(param3)))
                                 {
                                    §§goto(addr0ae6);
                                 }
                              }
                              addr0a97:
                              break loop17;
                           }
                           §§goto(addr0ac3);
                           §§goto(addr0ac7);
                        }
                        §§goto(addr0afa);
                     }
                     §§goto(addr0b03);
                  }
                  §§goto(addr0b58);
               }
               §§goto(addr0b42);
            }
            addr0ab4:
            loop16:
            while(true)
            {
               loop17:
               while(true)
               {
                  loop18:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(null);
                        if(!(_loc21_ && Boolean(param3)))
                        {
                           addr0ac3:
                           if(§§pop() != §§pop())
                           {
                              addr0ac7:
                              this.drawOOBBGeometry(param1,param2,_loc18_);
                              if(_loc21_)
                              {
                                 break;
                              }
                              addr0ad6:
                           }
                           else
                           {
                              _loc18_.draw(param1,param2,this.threshold,this);
                              addr0ae6:
                              _loc18_.destroy();
                              if(!(_loc22_ || Boolean(param1)))
                              {
                                 break loop18;
                              }
                           }
                           addr0afa:
                           while(true)
                           {
                              if(_loc19_ != null)
                              {
                                 addr0b03:
                                 _loc17_ = _loc19_.next;
                                 if(_loc22_ || Boolean(this))
                                 {
                                    _loc19_.draw(param1,param2,this.threshold,this);
                                    if(!(_loc22_ || Boolean(this)))
                                    {
                                       continue;
                                    }
                                 }
                                 _loc19_.destroy();
                                 continue;
                              }
                              if(_loc20_ == null)
                              {
                                 break loop17;
                              }
                              if(!_loc22_)
                              {
                                 break loop16;
                              }
                              §§push(_loc20_.next);
                              §§push(null);
                              _loc19_ = _loc17_;
                           }
                           §§goto(addr0ab4);
                           addr0b3b:
                        }
                        if(§§pop() != §§pop())
                        {
                           break;
                        }
                        _loc20_.draw(param1,param2,this.threshold,this);
                        if(!_loc21_)
                        {
                           break loop16;
                        }
                        break loop18;
                     }
                     addr0b58:
                     this.drawOOBBGeometry(param1,param2,_loc20_);
                     if(!(_loc21_ && Boolean(param3)))
                     {
                        addr0b6f:
                     }
                     break loop17;
                  }
                  §§goto(addr0baf);
               }
               break loop18;
            }
            _loc20_.destroy();
            if(_loc22_ || Boolean(param2))
            {
               break loop17;
            }
            addr0baf:
            return;
         }
         if(_loc14_ != null)
         {
            if(_loc22_ || Boolean(param2))
            {
               §§push(_loc14_.viewAligned);
               if(!_loc21_)
               {
                  if(§§pop())
                  {
                     §§goto(addr06ed);
                  }
                  loop7:
                  while(true)
                  {
                     if(param3 == null)
                     {
                        break loop20;
                     }
                     _loc17_ = param3.next;
                     if(_loc22_ || Boolean(param3))
                     {
                        if(!param3.viewAligned)
                        {
                           _loc4_ = param3.boundVertexList;
                           loop52:
                           while(true)
                           {
                              if(_loc22_ || Boolean(param2))
                              {
                                 loop11:
                                 while(true)
                                 {
                                    if(_loc4_ != null)
                                    {
                                       loop53:
                                       while(true)
                                       {
                                          loop54:
                                          while(true)
                                          {
                                             §§push(_loc4_.cameraX);
                                             if(!(_loc21_ && Boolean(param1)))
                                             {
                                                while(true)
                                                {
                                                   §§push(§§pop() * _loc8_);
                                                   if(_loc22_)
                                                   {
                                                      §§push(_loc4_.cameraY);
                                                      §§push(_loc9_);
                                                      if(!(_loc22_ || Boolean(this)))
                                                      {
                                                         break;
                                                      }
                                                      §§push(§§pop() + §§pop() * §§pop());
                                                   }
                                                   §§push(_loc4_.cameraZ);
                                                   if(_loc22_ || Boolean(param3))
                                                   {
                                                      §§push(_loc10_);
                                                      break;
                                                   }
                                                   break loop54;
                                                }
                                                §§push(§§pop() + §§pop() * §§pop());
                                                if(!(_loc21_ && Boolean(param2)))
                                                {
                                                   §§push(§§pop() - _loc11_);
                                                }
                                                §§push(Number(§§pop()));
                                                if(_loc21_)
                                                {
                                                   break loop53;
                                                }
                                                _loc7_ = §§pop();
                                                §§push(_loc7_);
                                             }
                                             §§push(this.threshold);
                                             break;
                                          }
                                          §§push(-§§pop());
                                          if(_loc22_)
                                          {
                                             if(§§pop() >= §§pop())
                                             {
                                                §§push(_loc7_);
                                                break;
                                             }
                                             if(_loc21_ && Boolean(param1))
                                             {
                                                break loop11;
                                             }
                                             param3.next = _loc18_;
                                             if(!_loc21_)
                                             {
                                                _loc18_ = param3;
                                                if(!(_loc22_ || Boolean(this)))
                                                {
                                                   break loop52;
                                                }
                                             }
                                             if(_loc4_ == null)
                                             {
                                                if(!(_loc21_ && Boolean(param2)))
                                                {
                                                   break loop52;
                                                }
                                                addr0929:
                                                _loc19_ = param3;
                                             }
                                             continue loop7;
                                          }
                                          §§goto(addr08ee);
                                       }
                                       addr08ee:
                                       if(§§pop() > this.threshold)
                                       {
                                          break;
                                       }
                                       _loc4_ = _loc4_.next;
                                       continue;
                                    }
                                 }
                                 param3.next = _loc20_;
                                 _loc20_ = param3;
                              }
                              §§goto(addr090f);
                           }
                           param3.next = _loc19_;
                           §§goto(addr0929);
                        }
                     }
                     _loc6_ = param3.faceStruct.wrapper;
                     loop56:
                     while(true)
                     {
                        if(!_loc21_)
                        {
                           loop10:
                           while(true)
                           {
                              if(_loc6_ != null)
                              {
                                 _loc4_ = _loc6_.vertex;
                                 while(true)
                                 {
                                    if(!_loc21_)
                                    {
                                       loop58:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc4_.cameraX * _loc8_);
                                             if(!(_loc21_ && Boolean(this)))
                                             {
                                                §§push(_loc4_.cameraY);
                                                if(_loc21_)
                                                {
                                                   break;
                                                }
                                                §§push(_loc9_);
                                                if(_loc22_)
                                                {
                                                   §§push(§§pop() + §§pop() * §§pop());
                                                   §§push(_loc4_.cameraZ);
                                                   if(_loc21_)
                                                   {
                                                      break;
                                                   }
                                                   §§push(_loc10_);
                                                }
                                                §§push(§§pop() + §§pop() * §§pop());
                                                if(_loc21_)
                                                {
                                                   break loop58;
                                                }
                                             }
                                             §§push(_loc11_);
                                             if(_loc22_)
                                             {
                                                break;
                                             }
                                             §§goto(addr07ab);
                                          }
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(§§pop() - §§pop());
                                                if(!_loc21_)
                                                {
                                                   _loc7_ = §§pop();
                                                   if(_loc22_ || Boolean(param1))
                                                   {
                                                      §§push(_loc7_);
                                                      break loop58;
                                                   }
                                                   break;
                                                }
                                                §§goto(addr07e5);
                                             }
                                             §§goto(addr07f2);
                                          }
                                          §§goto(addr07f7);
                                       }
                                       addr07ab:
                                       if(§§pop() < -this.threshold)
                                       {
                                          if(_loc22_)
                                          {
                                             param3.next = _loc18_;
                                             if(!(_loc21_ && Boolean(param3)))
                                             {
                                                addr07c8:
                                                _loc18_ = param3;
                                                if(!(_loc21_ && Boolean(param2)))
                                                {
                                                   break;
                                                }
                                                break loop56;
                                             }
                                          }
                                          else
                                          {
                                             addr07f2:
                                             param3.next = _loc20_;
                                          }
                                       }
                                       else
                                       {
                                          addr07e5:
                                          if(_loc7_ <= this.threshold)
                                          {
                                             continue loop10;
                                          }
                                          if(_loc22_)
                                          {
                                             §§goto(addr07f2);
                                          }
                                       }
                                       addr07f7:
                                       _loc20_ = param3;
                                       break;
                                    }
                                    §§goto(addr07c8);
                                 }
                              }
                              _loc6_ = _loc6_.next;
                           }
                           addr0826:
                           continue loop7;
                        }
                        if(_loc6_ == null)
                        {
                           if(!_loc21_)
                           {
                              param3.next = _loc19_;
                           }
                           break;
                        }
                        §§goto(addr0826);
                     }
                     _loc19_ = param3;
                     §§goto(addr0826);
                     param3 = _loc17_;
                  }
                  break loop20;
               }
               continue loop26;
            }
            §§goto(addr09d6);
            §§goto(addr09e6);
         }
         this.drawConflictGeometry(param1,param2,param3);
         break loop18;
      }
      
      alternativa3d function drawConflictGeometry(param1:Camera3D, param2:Canvas, param3:VG) : void
      {
         var _temp_1:* = true;
         var _loc21_:Boolean = false;
         var _loc22_:Boolean = _temp_1;
         var _loc4_:Canvas = null;
         var _loc5_:Face = null;
         var _loc6_:Face = null;
         var _loc7_:VG = null;
         var _loc8_:VG = null;
         var _loc9_:VG = null;
         var _loc10_:Face = null;
         var _loc11_:Face = null;
         var _loc12_:Face = null;
         var _loc13_:Face = null;
         var _loc14_:Face = null;
         var _loc15_:Face = null;
         var _loc16_:Face = null;
         var _loc17_:Face = null;
         var _loc18_:Boolean = false;
         loop0:
         for(; param3 != null; param3 = _loc7_)
         {
            _loc7_ = param3.next;
            if(_loc22_)
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
                        while(true)
                        {
                           §§push(param3.space);
                           if(!(_loc21_ && Boolean(param1)))
                           {
                              §§push(1);
                              if(!_loc22_)
                              {
                                 break;
                              }
                              if(§§pop() == §§pop())
                              {
                                 §§push(param3);
                                 §§push(param3.faceStruct);
                                 var _loc19_:Object3D;
                                 §§push((_loc19_ = param3.object).transformId);
                                 if(!_loc21_)
                                 {
                                    §§push(§§pop() + 1);
                                    if(_loc22_)
                                    {
                                       var _loc20_:* = §§pop();
                                       §§push(_loc20_);
                                       if(_loc22_ || Boolean(param2))
                                       {
                                          _loc19_.transformId = _loc20_;
                                       }
                                    }
                                 }
                                 §§pop().alternativa3d::transformStruct(§§pop(),§§pop(),ma,mb,mc,md,me,mf,mg,mh,mi,mj,mk,ml);
                              }
                              §§push(param3.sorting);
                              if(!(_loc21_ && Boolean(param1)))
                              {
                                 §§push(3);
                                 if(_loc21_ && Boolean(param2))
                                 {
                                    break;
                                 }
                                 if(§§pop() == §§pop())
                                 {
                                    if(_loc21_)
                                    {
                                       break loop17;
                                    }
                                    param3.next = _loc8_;
                                    if(!_loc22_)
                                    {
                                       break loop17;
                                    }
                                    _loc8_ = param3;
                                    continue loop0;
                                 }
                                 §§push(param3.sorting);
                              }
                           }
                           §§push(2);
                           break;
                        }
                        if(§§pop() == §§pop())
                        {
                           if(_loc21_ && Boolean(param2))
                           {
                              break;
                           }
                           if(_loc10_ != null)
                           {
                              if(!_loc21_)
                              {
                                 break;
                              }
                              addr01e2:
                              _loc13_.processNext = param3.faceStruct;
                           }
                           else
                           {
                              §§push(param3.faceStruct);
                              if(!(_loc22_ || Boolean(this)))
                              {
                                 break loop16;
                              }
                              _loc10_ = §§pop();
                              §§goto(addr0176);
                           }
                        }
                        else
                        {
                           if(_loc12_ == null)
                           {
                              §§push(param3.faceStruct);
                              if(_loc22_ || Boolean(param2))
                              {
                                 break loop16;
                              }
                              break loop15;
                           }
                           if(_loc22_)
                           {
                              §§goto(addr01e2);
                           }
                        }
                        §§goto(addr0202);
                     }
                     _loc11_.processNext = param3.faceStruct;
                     addr0176:
                     §§push(param3.faceStruct);
                     if(!(_loc22_ || Boolean(param3)))
                     {
                        break;
                     }
                     _loc11_ = §§pop();
                     if(_loc22_)
                     {
                        _loc11_.geometry = param3;
                        if(!_loc21_)
                        {
                           loop4:
                           while(true)
                           {
                              §§push(_loc11_.processNext);
                              do
                              {
                                 if(§§pop() == null)
                                 {
                                    break loop4;
                                 }
                                 §§push(_loc11_.processNext);
                              }
                              while(_loc21_ && Boolean(this));
                              _loc11_ = §§pop();
                              if(!_loc21_)
                              {
                                 _loc11_.geometry = param3;
                              }
                           }
                           if(_loc22_)
                           {
                              §§goto(addr0251);
                           }
                        }
                     }
                     §§goto(addr0260);
                  }
                  _loc12_ = §§pop();
                  addr0202:
                  §§push(param3.faceStruct);
                  break;
               }
               _loc13_ = §§pop();
               if(!(_loc21_ && Boolean(param2)))
               {
                  _loc13_.geometry = param3;
                  if(!_loc21_)
                  {
                     loop7:
                     while(true)
                     {
                        §§push(_loc13_.processNext);
                        do
                        {
                           if(§§pop() == null)
                           {
                              break loop7;
                           }
                           §§push(_loc13_.processNext);
                        }
                        while(!(_loc22_ || Boolean(param3)));
                        _loc13_ = §§pop();
                        if(!_loc21_)
                        {
                           _loc13_.geometry = param3;
                        }
                     }
                  }
               }
               addr0251:
               param3.faceStruct = null;
               if(!_loc21_)
               {
                  param3.next = _loc9_;
               }
               addr0260:
               _loc9_ = param3;
               continue;
            }
            §§goto(addr0129);
         }
         loop19:
         while(true)
         {
            while(true)
            {
               if(!_loc21_)
               {
                  if(_loc9_ == null)
                  {
                     _loc9_ = _loc8_;
                     break;
                  }
               }
               param3 = _loc9_;
               if(!(_loc21_ && Boolean(param3)))
               {
                  loop1:
                  while(true)
                  {
                     §§push(param3.next);
                     do
                     {
                        if(§§pop() == null)
                        {
                           break loop1;
                        }
                        §§push(param3.next);
                     }
                     while(_loc21_ && Boolean(param1));
                     param3 = §§pop();
                  }
                  if(!(_loc21_ && Boolean(param3)))
                  {
                     param3.next = _loc8_;
                     if(_loc22_ || Boolean(param2))
                     {
                        break;
                     }
                  }
               }
               break loop19;
            }
            if(_loc10_ != null)
            {
               break;
            }
            _loc14_ = _loc12_;
            §§goto(addr030d);
         }
         _loc14_ = _loc10_;
         loop21:
         while(true)
         {
            while(true)
            {
               if(!(_loc21_ && Boolean(param1)))
               {
                  _loc11_.processNext = _loc12_;
                  if(!_loc21_)
                  {
                     addr030d:
                     if(_loc8_ != null)
                     {
                        if(!_loc21_)
                        {
                           _loc8_.faceStruct.geometry = _loc8_;
                           if(!_loc21_)
                           {
                              addr0328:
                              §§push(this.collectNode(_loc8_.faceStruct,_loc14_,param1,this.threshold,true));
                              if(!_loc21_)
                              {
                                 _loc14_ = §§pop();
                                 if(!_loc21_)
                                 {
                                    _loc8_.faceStruct = null;
                                 }
                                 _loc8_ = _loc8_.next;
                                 if(_loc22_)
                                 {
                                    while(_loc8_ != null)
                                    {
                                       _loc8_.faceStruct.geometry = _loc8_;
                                       if(!(_loc22_ || Boolean(this)))
                                       {
                                          break;
                                       }
                                       _loc14_ = this.collectNode(_loc8_.faceStruct,_loc14_,param1,this.threshold,false);
                                       if(_loc22_)
                                       {
                                          _loc8_.faceStruct = null;
                                       }
                                       _loc8_ = _loc8_.next;
                                    }
                                 }
                                 break loop21;
                              }
                              break;
                           }
                        }
                     }
                     else if(_loc10_ != null)
                     {
                        if(!_loc21_)
                        {
                           §§push(this.collectNode(null,_loc14_,param1,this.threshold,true));
                           break;
                        }
                     }
                     else if(_loc12_ == null)
                     {
                        break loop21;
                     }
                     _loc14_ = param1.sortByAverageZ(_loc14_);
                     break loop21;
                  }
               }
               §§goto(addr0328);
            }
            _loc14_ = §§pop();
            break;
         }
         _loc5_ = _loc14_;
         if(_loc22_ || Boolean(param3))
         {
            loop5:
            for(; _loc5_ != null; _loc5_ = _loc6_)
            {
               _loc6_ = _loc5_.processNext;
               param3 = _loc5_.geometry;
               loop23:
               while(true)
               {
                  if(_loc22_)
                  {
                     _loc5_.geometry = null;
                     loop24:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc6_ == null);
                           if(_loc22_ || Boolean(param1))
                           {
                              var _temp_19:* = §§pop();
                              §§push(_temp_19);
                              §§push(_temp_19);
                              if(!_loc21_)
                              {
                                 §§push(Boolean(§§pop()));
                                 if(!_loc22_)
                                 {
                                    break;
                                 }
                              }
                              if(!§§pop())
                              {
                                 §§pop();
                                 §§push(param3 != _loc6_.geometry);
                                 if(_loc22_)
                                 {
                                    §§push(Boolean(§§pop()));
                                    if(_loc21_ && Boolean(param2))
                                    {
                                       break loop24;
                                    }
                                 }
                              }
                           }
                           _loc18_ = §§pop();
                           if(!_loc21_)
                           {
                              while(true)
                              {
                                 §§push(_loc18_);
                                 if(!(_loc21_ && Boolean(param2)))
                                 {
                                    §§push(Boolean(§§pop()));
                                    if(_loc22_ || Boolean(param2))
                                    {
                                       break loop24;
                                    }
                                    break;
                                 }
                                 addr0491:
                                 §§pop();
                                 §§push(_loc5_.material != _loc6_.material);
                                 if(!(_loc22_ || Boolean(this)))
                                 {
                                    break;
                                 }
                                 if(!§§pop())
                                 {
                                    continue loop5;
                                 }
                                 _loc5_.processNext = null;
                                 if(_loc22_)
                                 {
                                    §§push(_loc18_);
                                    break;
                                 }
                                 _loc16_.processNegative = _loc14_;
                              }
                              addr04bc:
                              if(§§pop())
                              {
                                 while(true)
                                 {
                                    if(_loc15_ != null)
                                    {
                                       if(_loc22_)
                                       {
                                          _loc16_.processNegative = _loc14_;
                                          _loc15_ = null;
                                          _loc16_ = null;
                                          break;
                                       }
                                    }
                                    else
                                    {
                                       _loc14_.processPositive = _loc17_;
                                    }
                                    _loc17_ = _loc14_;
                                    if(_loc22_ || Boolean(this))
                                    {
                                       _loc17_.geometry = param3;
                                    }
                                    break;
                                 }
                                 addr0538:
                                 _loc14_ = _loc6_;
                                 continue loop5;
                              }
                              if(_loc15_ == null)
                              {
                                 _loc14_.processPositive = _loc17_;
                                 _loc17_ = _loc14_;
                                 if(!_loc21_)
                                 {
                                    _loc17_.geometry = param3;
                                 }
                                 _loc15_ = _loc14_;
                                 break loop23;
                              }
                              §§goto(addr050b);
                           }
                        }
                        while(true)
                        {
                           if(!§§pop())
                           {
                              if(_loc21_)
                              {
                                 break;
                              }
                              §§goto(addr0491);
                           }
                           §§goto(addr04ab);
                        }
                        §§goto(addr04bc);
                     }
                     var _temp_18:* = §§pop();
                     §§push(_temp_18);
                     §§push(_temp_18);
                     if(_loc22_)
                     {
                        §§push(Boolean(§§pop()));
                     }
                     break loop25;
                  }
                  break;
               }
               _loc16_ = _loc14_;
               §§goto(addr0538);
            }
            loop29:
            while(true)
            {
               loop30:
               while(true)
               {
                  if(_loc22_)
                  {
                     if(!param1.debug)
                     {
                        break;
                     }
                     if(!(_loc22_ || Boolean(this)))
                     {
                        break loop29;
                     }
                  }
                  _loc4_ = param2.getChildCanvas(true,false);
                  _loc14_ = _loc17_;
                  if(!_loc21_)
                  {
                     loop9:
                     while(true)
                     {
                        if(_loc14_ == null)
                        {
                           break loop30;
                        }
                        §§push(_loc14_.geometry.debug);
                        if(_loc22_ || Boolean(param1))
                        {
                           §§push(§§pop() & Debug.EDGES);
                        }
                        if(!Boolean(§§pop()))
                        {
                           continue;
                        }
                        if(!_loc22_)
                        {
                           break loop30;
                        }
                        _loc5_ = _loc14_;
                        if(!_loc21_)
                        {
                           while(true)
                           {
                              if(_loc5_ != null)
                              {
                                 Debug.drawEdges(param1,_loc4_,_loc5_,16711680);
                                 if(_loc22_ || Boolean(param1))
                                 {
                                    continue;
                                 }
                              }
                              continue loop9;
                           }
                           break loop30;
                           addr05dd:
                        }
                        _loc5_ = _loc5_.processNegative;
                        §§goto(addr05dd);
                        _loc14_ = _loc14_.processPositive;
                     }
                  }
                  break;
               }
               while(true)
               {
                  if(_loc17_ == null)
                  {
                     break loop29;
                  }
                  _loc14_ = _loc17_;
                  _loc17_ = _loc14_.processPositive;
                  if(!_loc21_)
                  {
                     _loc14_.processPositive = null;
                  }
                  param3 = _loc14_.geometry;
                  if(!(_loc21_ && Boolean(param1)))
                  {
                     _loc14_.geometry = null;
                  }
                  _loc4_ = param2.getChildCanvas(true,false,param3.object,param3.alpha,param3.blendMode,param3.colorTransform,param3.filters);
                  if(_loc22_)
                  {
                     while(_loc14_ != null)
                     {
                        _loc6_ = _loc14_.processNegative;
                        _loc14_.processNegative = null;
                        if(!_loc21_)
                        {
                           while(true)
                           {
                              §§push(_loc14_.material);
                              if(!(_loc21_ && Boolean(this)))
                              {
                                 if(§§pop() != null)
                                 {
                                    if(param3.viewAligned)
                                    {
                                       §§push(_loc14_.material);
                                       if(!_loc21_)
                                       {
                                          addr068a:
                                          §§pop().alternativa3d::drawViewAligned(param1,_loc4_,_loc14_,param3.object.ml,param3.tma,param3.tmb,param3.tmc,param3.tmd,param3.tmtx,param3.tmty);
                                          if(_loc22_)
                                          {
                                          }
                                          break;
                                       }
                                    }
                                    else
                                    {
                                       §§push(_loc14_.material);
                                    }
                                    §§pop().alternativa3d::draw(param1,_loc4_,_loc14_,param3.object.ml);
                                    if(_loc22_)
                                    {
                                       break;
                                    }
                                 }
                                 else
                                 {
                                    while(_loc14_ != null)
                                    {
                                       _loc5_ = _loc14_.processNext;
                                       if(_loc22_ || Boolean(this))
                                       {
                                          _loc14_.processNext = null;
                                       }
                                       _loc14_ = _loc5_;
                                    }
                                 }
                                 break;
                              }
                              §§goto(addr068a);
                           }
                        }
                        _loc14_ = _loc6_;
                     }
                  }
               }
               break;
            }
         }
         break loop29;
      }
      
      private function collectNode(param1:Face, param2:Face, param3:Camera3D, param4:Number, param5:Boolean, param6:Face = null) : Face
      {
         §§push(false);
         var _loc54_:Boolean = true;
         var _loc55_:* = §§pop();
         var _loc7_:Wrapper = null;
         var _loc8_:Vertex = null;
         var _loc9_:Vertex = null;
         var _loc10_:Vertex = null;
         var _loc11_:Vertex = null;
         var _loc12_:* = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:* = NaN;
         var _loc15_:* = NaN;
         var _loc16_:Face = null;
         var _loc17_:Face = null;
         var _loc18_:Face = null;
         var _loc19_:VG = null;
         var _loc22_:Face = null;
         var _loc23_:Face = null;
         var _loc24_:Face = null;
         var _loc25_:Face = null;
         var _loc26_:Face = null;
         var _loc28_:Number = NaN;
         var _loc29_:* = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:* = NaN;
         var _loc33_:* = NaN;
         var _loc34_:* = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:* = NaN;
         var _loc37_:* = NaN;
         var _loc38_:* = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:* = NaN;
         var _loc42_:* = NaN;
         var _loc43_:* = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:* = false;
         var _loc46_:* = false;
         var _loc47_:* = NaN;
         var _loc48_:Face = null;
         var _loc49_:Face = null;
         var _loc50_:Wrapper = null;
         var _loc51_:Wrapper = null;
         var _loc52_:Wrapper = null;
         var _loc53_:* = NaN;
         loop12:
         while(true)
         {
            if(!(_loc55_ && Boolean(param3)))
            {
               if(param1 == null)
               {
                  param1 = param2;
                  param2 = param1.processNext;
                  _loc16_ = param1;
                  _loc7_ = param1.wrapper;
                  _loc8_ = _loc7_.vertex;
                  _loc7_ = _loc7_.next;
                  _loc9_ = _loc7_.vertex;
                  loop13:
                  while(true)
                  {
                     while(true)
                     {
                        if(_loc54_ || Boolean(param3))
                        {
                           _loc28_ = _loc8_.cameraX;
                           §§push(_loc8_.cameraY);
                           if(!(_loc54_ || Boolean(param3)))
                           {
                              break;
                           }
                           _loc29_ = §§pop();
                           if(!_loc54_)
                           {
                              break loop13;
                           }
                        }
                        loop36:
                        while(true)
                        {
                           §§push(_loc8_.cameraZ);
                           if(_loc54_ || Boolean(param3))
                           {
                              _loc30_ = §§pop();
                              §§push(_loc9_.cameraX);
                              if(_loc55_)
                              {
                                 break;
                              }
                           }
                           while(true)
                           {
                              while(true)
                              {
                                 loop39:
                                 while(true)
                                 {
                                    addr02ea:
                                    §§push(_loc28_);
                                    if(!(_loc55_ && Boolean(this)))
                                    {
                                       _loc31_ = §§pop() - §§pop();
                                       §§push(_loc9_.cameraY);
                                       §§push(_loc29_);
                                       if(_loc54_ || Boolean(this))
                                       {
                                          §§push(§§pop() - §§pop());
                                          break loop36;
                                       }
                                    }
                                    §§push(§§pop() - §§pop());
                                    if(!_loc55_)
                                    {
                                       §§push(Number(§§pop()));
                                    }
                                    _loc33_ = §§pop();
                                    while(true)
                                    {
                                       if(!_loc55_)
                                       {
                                          §§push(0);
                                          if(_loc54_)
                                          {
                                             §§push(Number(§§pop()));
                                             break loop39;
                                          }
                                          break;
                                       }
                                       §§goto(addr031e);
                                    }
                                    §§goto(addr0348);
                                 }
                                 addr0303:
                                 _loc12_ = §§pop();
                                 if(!_loc55_)
                                 {
                                    break loop13;
                                 }
                                 break;
                              }
                              §§goto(addr034b);
                           }
                           §§goto(addr0349);
                        }
                        while(true)
                        {
                           while(true)
                           {
                              §§push(Number(§§pop()));
                              if(_loc54_ || Boolean(param1))
                              {
                                 _loc32_ = §§pop();
                                 if(_loc55_)
                                 {
                                    break loop38;
                                 }
                                 §§push(_loc9_.cameraZ);
                                 if(!(_loc54_ || Boolean(param2)))
                                 {
                                    break loop37;
                                 }
                                 §§goto(addr02ea);
                                 §§push(_loc30_);
                              }
                              §§goto(addr0303);
                           }
                           §§goto(addr031e);
                        }
                        §§goto(addr0348);
                     }
                     _loc15_ = §§pop();
                     if(_loc54_)
                     {
                        §§push(0);
                        break loop41;
                     }
                     break loop38;
                  }
                  §§push(0);
                  if(_loc54_ || Boolean(param3))
                  {
                     _loc13_ = §§pop();
                     addr031e:
                     §§push(1);
                     if(_loc54_)
                     {
                        §§push(Number(§§pop()));
                        if(_loc54_)
                        {
                           _loc14_ = §§pop();
                           §§push(_loc30_);
                           if(!_loc54_)
                           {
                              break loop14;
                           }
                           §§push(Number(§§pop()));
                           if(!_loc55_)
                           {
                              break loop14;
                           }
                        }
                        addr0349:
                        _loc34_ = §§pop();
                        addr034b:
                        _loc7_ = _loc7_.next;
                        if(!(_loc55_ && Boolean(param2)))
                        {
                           loop2:
                           while(true)
                           {
                              if(_loc7_ == null)
                              {
                                 break loop12;
                              }
                              _loc11_ = _loc7_.vertex;
                              _loc35_ = _loc11_.cameraX - _loc28_;
                              loop15:
                              while(true)
                              {
                                 loop16:
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
                                                loop21:
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
                                                            §§push(_loc11_.cameraY - _loc29_);
                                                            if(!_loc55_)
                                                            {
                                                               loop25:
                                                               while(true)
                                                               {
                                                                  loop26:
                                                                  while(true)
                                                                  {
                                                                     §§push(Number(§§pop()));
                                                                     if(_loc54_ || Boolean(this))
                                                                     {
                                                                        _loc36_ = §§pop();
                                                                        if(!_loc54_)
                                                                        {
                                                                           break;
                                                                        }
                                                                        §§push(_loc11_.cameraZ);
                                                                        §§push(_loc30_);
                                                                        if(_loc55_ && Boolean(this))
                                                                        {
                                                                           break loop15;
                                                                        }
                                                                        §§push(§§pop() - §§pop());
                                                                        if(!(_loc54_ || Boolean(this)))
                                                                        {
                                                                           break loop25;
                                                                        }
                                                                        _loc37_ = §§pop();
                                                                        §§push(_loc37_);
                                                                     }
                                                                     loop27:
                                                                     while(true)
                                                                     {
                                                                        loop28:
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc32_);
                                                                           if(_loc54_)
                                                                           {
                                                                              §§push(§§pop() * §§pop());
                                                                              §§push(_loc36_);
                                                                              §§push(_loc33_);
                                                                              if(!(_loc55_ && Boolean(param2)))
                                                                              {
                                                                                 §§push(§§pop() - §§pop() * §§pop());
                                                                                 if(!_loc55_)
                                                                                 {
                                                                                    _loc38_ = §§pop();
                                                                                    if(_loc55_)
                                                                                    {
                                                                                       break loop26;
                                                                                    }
                                                                                    loop29:
                                                                                    while(true)
                                                                                    {
                                                                                       loop30:
                                                                                       while(true)
                                                                                       {
                                                                                          while(true)
                                                                                          {
                                                                                             §§push(_loc35_ * _loc33_);
                                                                                             §§push(_loc37_ * _loc31_);
                                                                                             if(!(_loc55_ && Boolean(param3)))
                                                                                             {
                                                                                                _loc39_ = §§pop() - §§pop();
                                                                                                break loop26;
                                                                                             }
                                                                                             addr0462:
                                                                                             §§push(§§pop() + §§pop());
                                                                                             §§push(_loc40_);
                                                                                             if(_loc54_ || Boolean(this))
                                                                                             {
                                                                                                §§push(§§pop() * _loc40_);
                                                                                                break loop30;
                                                                                             }
                                                                                             §§goto(addr0501);
                                                                                          }
                                                                                          addr04b5:
                                                                                          _loc41_ = §§pop();
                                                                                          §§push(_loc38_);
                                                                                          if(!(_loc54_ || Boolean(this)))
                                                                                          {
                                                                                             break loop24;
                                                                                          }
                                                                                          §§push(§§pop() * _loc41_);
                                                                                          if(_loc54_ || Boolean(this))
                                                                                          {
                                                                                             _loc12_ = §§pop();
                                                                                             if(_loc55_ && Boolean(param2))
                                                                                             {
                                                                                                break loop22;
                                                                                             }
                                                                                             §§goto(addr04eb);
                                                                                             §§push(_loc39_);
                                                                                          }
                                                                                          §§goto(addr0572);
                                                                                       }
                                                                                       _loc41_ = §§pop() + §§pop();
                                                                                       if(!_loc54_)
                                                                                       {
                                                                                          break loop20;
                                                                                       }
                                                                                       while(true)
                                                                                       {
                                                                                          §§push(_loc41_);
                                                                                          if(!_loc55_)
                                                                                          {
                                                                                             §§push(param4);
                                                                                             if(_loc55_)
                                                                                             {
                                                                                                break loop27;
                                                                                             }
                                                                                             if(§§pop() > §§pop())
                                                                                             {
                                                                                                if(_loc55_)
                                                                                                {
                                                                                                   break loop20;
                                                                                                }
                                                                                                §§push(1);
                                                                                                if(_loc54_ || Boolean(this))
                                                                                                {
                                                                                                   §§push(§§pop() / Math.sqrt(_loc41_));
                                                                                                   break loop31;
                                                                                                }
                                                                                                §§goto(addr0567);
                                                                                             }
                                                                                             else
                                                                                             {
                                                                                                §§push(_loc41_);
                                                                                                §§push(_loc34_);
                                                                                                if(!(_loc55_ && Boolean(this)))
                                                                                                {
                                                                                                   break loop29;
                                                                                                }
                                                                                                §§goto(addr0586);
                                                                                             }
                                                                                          }
                                                                                          addr04eb:
                                                                                          _loc13_ = §§pop() * _loc41_;
                                                                                          if(_loc54_)
                                                                                          {
                                                                                             §§push(_loc40_);
                                                                                             if(_loc54_)
                                                                                             {
                                                                                                addr0501:
                                                                                                _loc14_ = §§pop() * _loc41_;
                                                                                                if(!_loc55_)
                                                                                                {
                                                                                                   §§push(_loc28_ * _loc12_ + _loc29_ * _loc13_);
                                                                                                   §§push(_loc30_);
                                                                                                   if(!(_loc55_ && Boolean(param3)))
                                                                                                   {
                                                                                                      §§push(_loc14_);
                                                                                                      break loop28;
                                                                                                   }
                                                                                                   break loop15;
                                                                                                }
                                                                                                break loop22;
                                                                                             }
                                                                                             break loop18;
                                                                                          }
                                                                                          §§goto(addr0565);
                                                                                       }
                                                                                       §§goto(addr0572);
                                                                                    }
                                                                                    if(§§pop() <= §§pop())
                                                                                    {
                                                                                       continue loop2;
                                                                                    }
                                                                                    if(_loc55_ && Boolean(this))
                                                                                    {
                                                                                       break loop23;
                                                                                    }
                                                                                    addr0572:
                                                                                    _loc41_ = 1 / Math.sqrt(_loc41_);
                                                                                    addr0567:
                                                                                    addr0565:
                                                                                    if(!(_loc54_ || Boolean(this)))
                                                                                    {
                                                                                       break loop22;
                                                                                    }
                                                                                    addr0586:
                                                                                    §§push(_loc38_ * _loc41_);
                                                                                    if(!(_loc54_ || Boolean(this)))
                                                                                    {
                                                                                       break loop16;
                                                                                    }
                                                                                 }
                                                                                 §§push(Number(§§pop()));
                                                                                 break loop25;
                                                                              }
                                                                              break;
                                                                           }
                                                                           §§goto(addr0501);
                                                                        }
                                                                        addr0528:
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                     §§push(§§pop() + §§pop());
                                                                     if(_loc54_)
                                                                     {
                                                                        _loc15_ = §§pop();
                                                                        if(_loc54_)
                                                                        {
                                                                           break loop12;
                                                                        }
                                                                        break loop17;
                                                                     }
                                                                     break loop19;
                                                                  }
                                                                  §§push(_loc36_ * _loc31_);
                                                                  §§push(_loc35_);
                                                                  if(!_loc54_)
                                                                  {
                                                                     break loop21;
                                                                  }
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(§§pop() - §§pop() * _loc32_);
                                                                           if(!(_loc55_ && Boolean(param1)))
                                                                           {
                                                                              _loc40_ = §§pop();
                                                                              §§push(_loc38_ * _loc38_);
                                                                              §§push(_loc39_);
                                                                              if(!(_loc54_ || Boolean(param3)))
                                                                              {
                                                                                 break loop30;
                                                                              }
                                                                              §§push(_loc39_);
                                                                              if(!(_loc55_ && Boolean(param3)))
                                                                              {
                                                                                 §§push(§§pop() * §§pop());
                                                                                 if(!(_loc54_ || Boolean(param3)))
                                                                                 {
                                                                                    break loop29;
                                                                                 }
                                                                                 §§goto(addr0462);
                                                                              }
                                                                              §§goto(addr0528);
                                                                           }
                                                                           §§goto(addr04b5);
                                                                        }
                                                                        §§goto(addr04eb);
                                                                     }
                                                                     §§goto(addr0586);
                                                                  }
                                                                  §§goto(addr0567);
                                                               }
                                                            }
                                                            break loop25;
                                                         }
                                                         §§goto(addr05d3);
                                                      }
                                                      §§goto(addr0612);
                                                   }
                                                   §§goto(addr05d6);
                                                }
                                                §§goto(addr05ec);
                                             }
                                             §§push(_loc39_);
                                             if(!(_loc55_ && Boolean(param3)))
                                             {
                                                break loop16;
                                             }
                                             §§goto(addr05de);
                                          }
                                          §§goto(addr0601);
                                       }
                                       §§goto(addr0602);
                                    }
                                    §§push(_loc40_ * _loc41_);
                                    if(_loc54_)
                                    {
                                       addr05d3:
                                       §§push(Number(§§pop()));
                                    }
                                    _loc14_ = §§pop();
                                    addr05d6:
                                    §§push(_loc28_);
                                    if(!_loc54_)
                                    {
                                       break loop18;
                                    }
                                    addr05de:
                                    §§push(_loc12_);
                                    if(!_loc55_)
                                    {
                                       §§push(§§pop() * §§pop());
                                       §§push(_loc29_);
                                       break loop15;
                                    }
                                    §§goto(addr05ec);
                                 }
                                 §§push(§§pop() * _loc41_);
                                 if(_loc54_ || Boolean(param1))
                                 {
                                    _loc13_ = §§pop();
                                    if(_loc54_)
                                    {
                                       break loop17;
                                    }
                                    continue loop2;
                                 }
                                 §§goto(addr0602);
                              }
                              addr0602:
                              addr05ec:
                              §§push(§§pop() + §§pop() * _loc13_ + _loc30_ * _loc14_);
                              if(!(_loc55_ && Boolean(param1)))
                              {
                                 addr0601:
                                 §§push(Number(§§pop()));
                              }
                              _loc15_ = §§pop();
                              if(_loc54_ || Boolean(param1))
                              {
                                 addr0612:
                                 §§push(_loc41_);
                                 if(_loc54_)
                                 {
                                    §§push(Number(§§pop()));
                                 }
                                 _loc34_ = §§pop();
                              }
                              _loc7_ = _loc7_.next;
                           }
                        }
                        break;
                     }
                  }
                  addr0348:
                  §§goto(addr0349);
               }
            }
            _loc19_ = param1.geometry;
            loop43:
            while(true)
            {
               loop44:
               while(true)
               {
                  if(!_loc55_)
                  {
                     if(param1.offset >= 0)
                     {
                        _loc17_ = param1.processPositive;
                        _loc18_ = param1.processNegative;
                        loop45:
                        while(true)
                        {
                           if(!(_loc55_ && Boolean(this)))
                           {
                              §§push(-param1.normalX);
                              if(_loc55_ && Boolean(param2))
                              {
                                 break;
                              }
                              _loc12_ = Number(§§pop());
                              if(!_loc54_)
                              {
                                 break loop44;
                              }
                           }
                           while(true)
                           {
                              §§push(-param1.normalY);
                              if(!_loc55_)
                              {
                                 _loc13_ = §§pop();
                                 if(!_loc54_)
                                 {
                                    break loop44;
                                 }
                                 §§push(-param1.normalZ);
                                 if(_loc55_)
                                 {
                                    break;
                                 }
                              }
                              §§push(Number(§§pop()));
                              break loop45;
                           }
                           addr01b2:
                           §§push(-§§pop());
                           if(!_loc55_)
                           {
                              §§push(Number(§§pop()));
                           }
                           _loc15_ = §§pop();
                           break loop44;
                        }
                        _loc14_ = §§pop();
                        if(!(_loc54_ || Boolean(param3)))
                        {
                           break;
                        }
                        §§goto(addr01b2);
                        §§push(param1.offset);
                     }
                  }
                  _loc17_ = param1.processNegative;
                  _loc18_ = param1.processPositive;
                  if(!(_loc54_ || Boolean(this)))
                  {
                     break loop43;
                  }
                  _loc12_ = param1.normalX;
                  loop47:
                  while(true)
                  {
                     if(!(_loc55_ && Boolean(param1)))
                     {
                        _loc13_ = param1.normalY;
                        while(true)
                        {
                           if(_loc54_)
                           {
                              §§push(param1.normalZ);
                              if(_loc55_)
                              {
                                 break;
                              }
                              _loc14_ = §§pop();
                              if(!_loc54_)
                              {
                                 break loop43;
                              }
                           }
                           §§push(param1.offset);
                           if(!_loc55_)
                           {
                              break;
                           }
                           addr013e:
                           _loc15_ = §§pop();
                           if(_loc55_)
                           {
                              break loop47;
                           }
                        }
                        §§goto(addr013e);
                     }
                     break loop44;
                  }
                  param1.processPositive = null;
                  if(param1.wrapper != null)
                  {
                     break loop43;
                  }
                  param1.geometry = null;
                  param1 = null;
                  §§goto(addr0215);
               }
               param1.processNegative = null;
               §§goto(addr01c0);
            }
            _loc16_ = param1;
            loop0:
            while(true)
            {
               §§push(_loc16_.processNext);
               do
               {
                  if(§§pop() == null)
                  {
                     break loop0;
                  }
                  §§push(_loc16_.processNext);
               }
               while(_loc55_ && Boolean(this));
               _loc16_ = §§pop();
               if(_loc54_ || Boolean(this))
               {
                  _loc16_.geometry = _loc19_;
               }
            }
            addr0215:
            break;
         }
         while(true)
         {
            §§push(_loc15_);
            if(!(_loc55_ && Boolean(param2)))
            {
               §§push(§§pop() - param4);
               if(_loc55_ && Boolean(param2))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc20_:* = §§pop();
         §§push(_loc15_);
         if(_loc54_)
         {
            §§push(§§pop() + param4);
            if(_loc54_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc21_:* = §§pop();
         var _loc27_:Face = param2;
         loop3:
         for(; _loc27_ != null; _loc27_ = _loc26_)
         {
            _loc26_ = _loc27_.processNext;
            _loc7_ = _loc27_.wrapper;
            _loc8_ = _loc7_.vertex;
            _loc7_ = _loc7_.next;
            _loc9_ = _loc7_.vertex;
            _loc7_ = _loc7_.next;
            _loc10_ = _loc7_.vertex;
            _loc7_ = _loc7_.next;
            loop50:
            while(true)
            {
               loop51:
               while(true)
               {
                  loop87:
                  while(true)
                  {
                     loop93:
                     while(true)
                     {
                        loop94:
                        while(true)
                        {
                           loop95:
                           while(true)
                           {
                              loop96:
                              while(true)
                              {
                                 loop97:
                                 while(true)
                                 {
                                    loop98:
                                    while(true)
                                    {
                                       loop99:
                                       while(true)
                                       {
                                          loop100:
                                          while(true)
                                          {
                                             if(_loc54_ || Boolean(param1))
                                             {
                                                loop101:
                                                while(true)
                                                {
                                                   §§push(_loc8_.cameraX);
                                                   if(!(_loc55_ && Boolean(param1)))
                                                   {
                                                      loop102:
                                                      while(true)
                                                      {
                                                         loop103:
                                                         while(true)
                                                         {
                                                            loop106:
                                                            while(true)
                                                            {
                                                               loop107:
                                                               while(true)
                                                               {
                                                                  while(true)
                                                                  {
                                                                     §§push(§§pop() * _loc12_);
                                                                     §§push(_loc8_.cameraY);
                                                                     §§push(_loc13_);
                                                                     if(!_loc55_)
                                                                     {
                                                                        §§push(§§pop() + §§pop() * §§pop());
                                                                        §§push(_loc8_.cameraZ);
                                                                        if(!(_loc54_ || Boolean(param1)))
                                                                        {
                                                                           break;
                                                                        }
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc14_);
                                                                           if(!_loc55_)
                                                                           {
                                                                              §§push(§§pop() + §§pop() * §§pop());
                                                                              if(!_loc54_)
                                                                              {
                                                                                 break loop94;
                                                                              }
                                                                              §§push(Number(§§pop()));
                                                                              if(!_loc54_)
                                                                              {
                                                                                 break loop107;
                                                                              }
                                                                              _loc42_ = §§pop();
                                                                              if(_loc55_ && Boolean(param3))
                                                                              {
                                                                                 break loop93;
                                                                              }
                                                                              §§push(_loc9_.cameraX);
                                                                              §§push(_loc12_);
                                                                              if(_loc55_ && Boolean(param3))
                                                                              {
                                                                                 break loop106;
                                                                              }
                                                                              §§push(§§pop() * §§pop());
                                                                              if(!(_loc54_ || Boolean(param2)))
                                                                              {
                                                                                 break loop103;
                                                                              }
                                                                              §§push(_loc9_.cameraY);
                                                                              §§push(_loc13_);
                                                                              if(!_loc54_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                           }
                                                                           §§push(§§pop() + §§pop() * §§pop());
                                                                           §§push(_loc9_.cameraZ);
                                                                           §§push(_loc14_);
                                                                           if(_loc54_ || Boolean(param2))
                                                                           {
                                                                              break;
                                                                           }
                                                                           break loop102;
                                                                        }
                                                                     }
                                                                     §§push(§§pop() * §§pop());
                                                                     if(_loc55_)
                                                                     {
                                                                        break loop95;
                                                                     }
                                                                     §§push(§§pop() + §§pop());
                                                                     if(_loc54_)
                                                                     {
                                                                        §§push(Number(§§pop()));
                                                                        if(_loc55_ && Boolean(param3))
                                                                        {
                                                                           break loop94;
                                                                        }
                                                                     }
                                                                     _loc43_ = §§pop();
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc10_.cameraX * _loc12_);
                                                                        if(_loc54_)
                                                                        {
                                                                           §§push(_loc10_.cameraY);
                                                                           §§push(_loc13_);
                                                                           if(!_loc54_)
                                                                           {
                                                                              break loop102;
                                                                           }
                                                                           §§push(§§pop() + §§pop() * §§pop());
                                                                           if(!_loc55_)
                                                                           {
                                                                              break loop107;
                                                                           }
                                                                        }
                                                                        else
                                                                        {
                                                                           §§goto(addr07c2);
                                                                        }
                                                                        §§goto(addr0802);
                                                                     }
                                                                     §§goto(addr0852);
                                                                  }
                                                                  §§goto(addr0843);
                                                               }
                                                               §§push(_loc10_.cameraZ);
                                                               break;
                                                            }
                                                            §§push(_loc14_);
                                                            break loop102;
                                                         }
                                                         §§push(_loc21_);
                                                         if(!(_loc54_ || Boolean(param1)))
                                                         {
                                                            break loop95;
                                                         }
                                                         addr0843:
                                                         §§push(§§pop() > §§pop());
                                                         if(!(_loc55_ && Boolean(param3)))
                                                         {
                                                            §§goto(addr0852);
                                                         }
                                                         §§goto(addr085f);
                                                      }
                                                      loop104:
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(§§pop() * §§pop());
                                                            if(!(_loc55_ && Boolean(param1)))
                                                            {
                                                               §§push(§§pop() + §§pop());
                                                               if(_loc55_ && Boolean(param1))
                                                               {
                                                                  break loop103;
                                                               }
                                                               _loc44_ = §§pop();
                                                               §§push(_loc42_ < _loc20_);
                                                               if(_loc55_)
                                                               {
                                                                  break loop51;
                                                               }
                                                               var _temp_109:* = Boolean(§§pop());
                                                               §§push(_temp_109);
                                                               if(!_temp_109)
                                                               {
                                                                  if(!(_loc54_ || Boolean(this)))
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§pop();
                                                                  if(_loc55_ && Boolean(param2))
                                                                  {
                                                                     break loop100;
                                                                  }
                                                                  §§push(_loc43_ < _loc20_);
                                                               }
                                                               §§push(§§pop() || _loc20_);
                                                            }
                                                            §§push(§§pop() < §§pop());
                                                            if(!_loc55_)
                                                            {
                                                               §§push(Boolean(§§pop()));
                                                               if(_loc54_ || Boolean(param1))
                                                               {
                                                                  break loop104;
                                                               }
                                                               break loop98;
                                                            }
                                                            break loop99;
                                                         }
                                                         addr0852:
                                                         var _temp_114:* = Boolean(§§pop());
                                                         §§push(_temp_114);
                                                         §§push(_temp_114);
                                                         if(!_loc55_)
                                                         {
                                                            §§push(Boolean(§§pop()));
                                                         }
                                                         if(§§pop())
                                                         {
                                                            break loop101;
                                                         }
                                                         addr085f:
                                                         §§pop();
                                                         §§push(_loc43_);
                                                      }
                                                      §§push(Boolean(§§pop()));
                                                      if(!_loc55_)
                                                      {
                                                         _loc45_ = §§pop();
                                                         if(!(_loc55_ && Boolean(this)))
                                                         {
                                                            §§push(_loc42_);
                                                            break loop103;
                                                         }
                                                         break loop96;
                                                      }
                                                      break loop97;
                                                   }
                                                   §§push(_loc21_);
                                                   if(_loc54_)
                                                   {
                                                      §§push(§§pop() > §§pop());
                                                      break;
                                                   }
                                                   break loop95;
                                                }
                                                var _temp_123:* = §§pop();
                                                §§push(_temp_123);
                                                if(Boolean(_temp_123))
                                                {
                                                   break loop87;
                                                }
                                                if(_loc55_)
                                                {
                                                   break loop51;
                                                }
                                                §§pop();
                                                if(!(_loc54_ || Boolean(param2)))
                                                {
                                                   break loop50;
                                                }
                                             }
                                             §§push(_loc44_);
                                             break loop94;
                                          }
                                          §§goto(addr09dc);
                                       }
                                       §§goto(addr09f9);
                                    }
                                    §§goto(addr09f8);
                                 }
                                 §§goto(addr09b2);
                              }
                              §§goto(addr0a0b);
                           }
                           §§push(§§pop() > §§pop());
                           if(_loc54_ || Boolean(param1))
                           {
                              §§push(Boolean(§§pop()));
                              break loop87;
                           }
                           break loop51;
                        }
                        §§push(_loc21_);
                        break loop95;
                     }
                     §§goto(addr09bc);
                  }
                  §§push(Boolean(§§pop()));
                  if(!(_loc55_ && Boolean(param3)))
                  {
                     break;
                  }
                  §§goto(addr09ab);
               }
               _loc46_ = §§pop();
               loop8:
               for(; _loc7_ != null; _loc11_.offset = _loc47_,_loc7_ = _loc7_.next)
               {
                  _loc11_ = _loc7_.vertex;
                  loop88:
                  while(true)
                  {
                     if(!_loc55_)
                     {
                        loop89:
                        while(true)
                        {
                           loop90:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(_loc11_.cameraX);
                                 §§push(_loc12_);
                                 if(_loc54_)
                                 {
                                    §§push(§§pop() * §§pop());
                                    §§push(_loc11_.cameraY);
                                    §§push(_loc13_);
                                    if(_loc55_ && Boolean(param1))
                                    {
                                       break;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(!_loc54_)
                                    {
                                       break loop90;
                                    }
                                    §§push(§§pop() + §§pop());
                                    if(!(_loc54_ || Boolean(param1)))
                                    {
                                       break loop89;
                                    }
                                    §§push(_loc11_.cameraZ);
                                 }
                                 §§push(_loc14_);
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(!_loc55_)
                              {
                                 break;
                              }
                              §§goto(addr091b);
                           }
                           §§push(§§pop() + §§pop());
                           break;
                        }
                        _loc47_ = §§pop();
                        if(!_loc55_)
                        {
                           addr091b:
                           if(_loc47_ >= _loc20_)
                           {
                              if(_loc47_ > _loc21_)
                              {
                                 break;
                              }
                              continue loop8;
                           }
                        }
                     }
                     while(true)
                     {
                        §§push(true);
                        if(!(_loc55_ && Boolean(param3)))
                        {
                           §§push(Boolean(§§pop()));
                           if(_loc55_ && Boolean(this))
                           {
                              break;
                           }
                        }
                        _loc45_ = §§pop();
                        if(!(_loc54_ || Boolean(param1)))
                        {
                           break loop88;
                        }
                        continue loop8;
                     }
                     addr0961:
                     _loc46_ = §§pop();
                     continue loop8;
                  }
                  §§push(true);
                  if(_loc54_)
                  {
                     §§push(Boolean(§§pop()));
                  }
                  §§goto(addr0961);
               }
               §§push(_loc45_);
               if(!(_loc55_ && Boolean(this)))
               {
                  §§push(!§§pop());
                  if(!(_loc55_ && Boolean(param3)))
                  {
                     if(§§pop())
                     {
                        if(!(_loc55_ && Boolean(param1)))
                        {
                           break;
                        }
                     }
                     else
                     {
                        §§goto(addr09f8);
                        §§push(_loc46_);
                     }
                     §§goto(addr0a44);
                  }
                  §§goto(addr09b2);
               }
               §§goto(addr09f9);
            }
            addr09ab:
            §§push(!_loc46_);
            if(_loc54_)
            {
               addr09b2:
               if(§§pop())
               {
                  if(param1 != null)
                  {
                     addr09bc:
                     _loc16_.processNext = _loc27_;
                  }
                  else
                  {
                     param1 = _loc27_;
                  }
                  _loc16_ = _loc27_;
               }
               else
               {
                  if(_loc24_ != null)
                  {
                     addr09dc:
                     _loc25_.processNext = _loc27_;
                  }
                  else
                  {
                     _loc24_ = _loc27_;
                  }
                  _loc25_ = _loc27_;
               }
               continue;
            }
            addr09f8:
            addr09f9:
            if(!§§pop())
            {
               while(true)
               {
                  if(!(_loc55_ && Boolean(this)))
                  {
                     addr0a0b:
                     if(_loc22_ == null)
                     {
                        _loc22_ = _loc27_;
                        addr0a28:
                        _loc23_ = _loc27_;
                        continue loop3;
                     }
                     if(!_loc54_)
                     {
                        break;
                     }
                  }
                  _loc23_.processNext = _loc27_;
                  break;
               }
               §§goto(addr0a28);
            }
            else
            {
               _loc8_.offset = _loc42_;
               _loc9_.offset = _loc43_;
               _loc10_.offset = _loc44_;
               addr0a44:
               _loc48_ = _loc27_.create();
               while(true)
               {
                  if(!_loc55_)
                  {
                     _loc48_.material = _loc27_.material;
                     if(_loc55_ && Boolean(param2))
                     {
                        break;
                     }
                     _loc48_.geometry = _loc27_.geometry;
                     if(!_loc54_)
                     {
                        break;
                     }
                     param3.lastFace.next = _loc48_;
                     if(!(_loc54_ || Boolean(this)))
                     {
                        break;
                     }
                  }
                  param3.lastFace = _loc48_;
                  break;
               }
               _loc49_ = _loc27_.create();
               while(true)
               {
                  if(_loc54_)
                  {
                     _loc49_.material = _loc27_.material;
                     if(!_loc54_)
                     {
                        break;
                     }
                  }
                  _loc49_.geometry = _loc27_.geometry;
                  if(_loc54_)
                  {
                     param3.lastFace.next = _loc49_;
                     if(_loc55_ && Boolean(param2))
                     {
                        break;
                     }
                  }
                  param3.lastFace = _loc49_;
                  break;
               }
               _loc50_ = null;
               _loc51_ = null;
               §§push(_loc27_.wrapper.next);
               if(!(_loc55_ && Boolean(param2)))
               {
                  §§push(§§pop().alternativa3d::next);
               }
               _loc7_ = §§pop();
               if(!_loc55_)
               {
                  loop9:
                  while(true)
                  {
                     §§push(_loc7_.next);
                     do
                     {
                        if(§§pop() == null)
                        {
                           break loop9;
                        }
                        §§push(_loc7_.next);
                     }
                     while(!_loc54_);
                     _loc7_ = §§pop();
                  }
               }
               _loc8_ = _loc7_.vertex;
               if(!_loc55_)
               {
                  §§push(_loc8_.offset);
                  if(!_loc55_)
                  {
                     §§push(Number(§§pop()));
                  }
                  _loc42_ = §§pop();
               }
               _loc7_ = _loc27_.wrapper;
               while(true)
               {
                  if(_loc54_)
                  {
                     while(_loc7_ != null)
                     {
                        _loc9_ = _loc7_.vertex;
                        loop56:
                        while(true)
                        {
                           loop57:
                           while(true)
                           {
                              loop61:
                              while(true)
                              {
                                 loop64:
                                 while(true)
                                 {
                                    loop65:
                                    while(true)
                                    {
                                       loop66:
                                       while(true)
                                       {
                                          if(!(_loc55_ && Boolean(this)))
                                          {
                                             loop67:
                                             while(true)
                                             {
                                                loop68:
                                                while(true)
                                                {
                                                   loop69:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_loc9_.offset);
                                                         if(!(_loc55_ && Boolean(param3)))
                                                         {
                                                            _loc43_ = §§pop();
                                                            if(_loc54_ || Boolean(param1))
                                                            {
                                                               §§push(_loc42_);
                                                               §§push(_loc20_);
                                                               if(!(_loc55_ && Boolean(param3)))
                                                               {
                                                                  loop71:
                                                                  while(true)
                                                                  {
                                                                     loop72:
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(§§pop() < §§pop());
                                                                           if(_loc54_ || Boolean(this))
                                                                           {
                                                                              var _temp_64:* = §§pop();
                                                                              §§push(_temp_64);
                                                                              §§push(_temp_64);
                                                                              if(!(_loc54_ || Boolean(this)))
                                                                              {
                                                                                 break loop71;
                                                                              }
                                                                              §§push(Boolean(§§pop()));
                                                                              if(!(_loc54_ || Boolean(param2)))
                                                                              {
                                                                                 break loop72;
                                                                              }
                                                                              if(§§pop())
                                                                              {
                                                                                 §§pop();
                                                                                 §§push(_loc43_);
                                                                                 §§push(_loc21_);
                                                                                 if(!_loc54_)
                                                                                 {
                                                                                    break loop68;
                                                                                 }
                                                                                 §§push(§§pop() > §§pop());
                                                                                 if(_loc55_ && Boolean(param3))
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(Boolean(§§pop()));
                                                                              }
                                                                              var _temp_68:* = §§pop();
                                                                              §§push(_temp_68);
                                                                              §§push(_temp_68);
                                                                              if(!(_loc54_ || Boolean(this)))
                                                                              {
                                                                                 break loop72;
                                                                              }
                                                                              §§push(Boolean(§§pop()));
                                                                              if(_loc55_ && Boolean(param1))
                                                                              {
                                                                                 break loop71;
                                                                              }
                                                                              if(§§pop())
                                                                              {
                                                                                 break loop67;
                                                                              }
                                                                           }
                                                                           §§pop();
                                                                           §§push(_loc42_);
                                                                           if(!_loc55_)
                                                                           {
                                                                              §§push(§§pop() > _loc21_);
                                                                              if(!_loc55_)
                                                                              {
                                                                                 var _temp_71:* = §§pop();
                                                                                 §§push(_temp_71);
                                                                                 §§push(_temp_71);
                                                                                 if(!_loc55_)
                                                                                 {
                                                                                    break loop71;
                                                                                 }
                                                                                 break loop72;
                                                                              }
                                                                              break loop67;
                                                                           }
                                                                           break loop56;
                                                                        }
                                                                        §§pop();
                                                                     }
                                                                     if(§§pop())
                                                                     {
                                                                        break loop73;
                                                                     }
                                                                     break loop67;
                                                                  }
                                                                  §§push(Boolean(§§pop()));
                                                                  break loop72;
                                                               }
                                                               break loop69;
                                                            }
                                                            break;
                                                         }
                                                         §§push(_loc20_);
                                                         break loop68;
                                                      }
                                                      §§goto(addr0c34);
                                                   }
                                                   §§goto(addr0c4c);
                                                }
                                                §§push(§§pop() < §§pop());
                                                break;
                                             }
                                             if(!§§pop())
                                             {
                                                break;
                                             }
                                             if(!_loc54_)
                                             {
                                                break loop65;
                                             }
                                             addr0c34:
                                             §§push(_loc15_);
                                             if(_loc55_)
                                             {
                                                break loop64;
                                             }
                                             §§push(_loc42_);
                                             if(!(_loc54_ || Boolean(param1)))
                                             {
                                                break loop61;
                                             }
                                             addr0c4c:
                                             §§push(§§pop() - §§pop());
                                             if(_loc54_ || Boolean(this))
                                             {
                                                §§push(_loc43_);
                                                if(_loc55_)
                                                {
                                                   break loop57;
                                                }
                                                §§push(§§pop() - _loc42_);
                                                if(_loc55_)
                                                {
                                                   break loop57;
                                                }
                                                §§push(§§pop() / §§pop());
                                                if(_loc55_ && Boolean(param2))
                                                {
                                                   break loop56;
                                                }
                                             }
                                             _loc53_ = §§pop();
                                          }
                                          _loc11_ = _loc9_.create();
                                          param3.lastVertex.next = _loc11_;
                                          while(true)
                                          {
                                             if(!(_loc55_ && Boolean(param1)))
                                             {
                                                param3.lastVertex = _loc11_;
                                                if(_loc55_ && Boolean(param3))
                                                {
                                                   break;
                                                }
                                                §§push(_loc11_);
                                                §§push(_loc8_.cameraX);
                                                if(_loc54_)
                                                {
                                                   loop75:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_loc9_.cameraX);
                                                         if(!(_loc55_ && Boolean(param2)))
                                                         {
                                                            §§push(_loc8_.cameraX);
                                                            if(!(_loc54_ || Boolean(param1)))
                                                            {
                                                               break;
                                                            }
                                                            §§push(§§pop() - §§pop());
                                                            if(!_loc54_)
                                                            {
                                                               break loop75;
                                                            }
                                                         }
                                                         §§push(_loc53_);
                                                         break;
                                                      }
                                                      §§push(§§pop() * §§pop());
                                                      break;
                                                   }
                                                }
                                                §§pop().alternativa3d::cameraX = §§pop();
                                                §§push(_loc11_);
                                                §§push(_loc8_.cameraY);
                                                if(!_loc55_)
                                                {
                                                   loop77:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_loc9_.cameraY);
                                                         if(_loc54_)
                                                         {
                                                            §§push(_loc8_.cameraY);
                                                            if(_loc55_)
                                                            {
                                                               break;
                                                            }
                                                            §§push(§§pop() - §§pop());
                                                            if(!(_loc54_ || Boolean(param1)))
                                                            {
                                                               break loop77;
                                                            }
                                                         }
                                                         §§push(_loc53_);
                                                         break;
                                                      }
                                                      §§push(§§pop() * §§pop());
                                                      break;
                                                   }
                                                }
                                                §§pop().alternativa3d::cameraY = §§pop();
                                                §§push(_loc11_);
                                                §§push(_loc8_.cameraZ);
                                                if(_loc54_)
                                                {
                                                   §§push(_loc9_.cameraZ);
                                                   if(!(_loc55_ && Boolean(param3)))
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_loc8_.cameraZ);
                                                         if(_loc54_ || Boolean(this))
                                                         {
                                                            §§push(§§pop() - §§pop());
                                                            if(!(_loc54_ || Boolean(param3)))
                                                            {
                                                               break;
                                                            }
                                                            §§push(_loc53_);
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         break;
                                                      }
                                                   }
                                                   §§push(§§pop() + §§pop());
                                                }
                                                §§pop().alternativa3d::cameraZ = §§pop();
                                             }
                                             §§push(_loc11_);
                                             §§push(_loc8_.u);
                                             if(_loc54_ || Boolean(param2))
                                             {
                                                loop80:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(_loc9_.u);
                                                      if(!_loc55_)
                                                      {
                                                         §§push(_loc8_.u);
                                                         if(_loc55_ && Boolean(param1))
                                                         {
                                                            break;
                                                         }
                                                         §§push(§§pop() - §§pop());
                                                         if(_loc55_ && Boolean(param2))
                                                         {
                                                            break loop80;
                                                         }
                                                      }
                                                      §§push(_loc53_);
                                                      break;
                                                   }
                                                   §§push(§§pop() * §§pop());
                                                   break;
                                                }
                                             }
                                             §§pop().u = §§pop();
                                             if(!_loc55_)
                                             {
                                                break;
                                             }
                                             addr0dee:
                                             _loc52_ = _loc7_.create();
                                             if(_loc54_)
                                             {
                                                _loc52_.vertex = _loc11_;
                                                loop82:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      if(_loc54_)
                                                      {
                                                         if(_loc50_ == null)
                                                         {
                                                            _loc48_.wrapper = _loc52_;
                                                            break;
                                                         }
                                                         if(_loc55_)
                                                         {
                                                            break loop82;
                                                         }
                                                      }
                                                      _loc50_.next = _loc52_;
                                                      if(!_loc55_)
                                                      {
                                                         break loop82;
                                                      }
                                                      break;
                                                   }
                                                }
                                                break loop83;
                                             }
                                             _loc50_ = _loc52_;
                                             _loc52_ = _loc7_.create();
                                             while(true)
                                             {
                                                if(_loc54_ || Boolean(param1))
                                                {
                                                   _loc52_.vertex = _loc11_;
                                                   if(!(_loc54_ || Boolean(this)))
                                                   {
                                                      break;
                                                   }
                                                }
                                                if(_loc51_ != null)
                                                {
                                                   if(!(_loc55_ && Boolean(param1)))
                                                   {
                                                      break;
                                                   }
                                                }
                                                else
                                                {
                                                   _loc49_.wrapper = _loc52_;
                                                }
                                                addr0e90:
                                                _loc51_ = _loc52_;
                                                break loop66;
                                             }
                                             _loc51_.next = _loc52_;
                                             if(_loc55_ && Boolean(param1))
                                             {
                                             }
                                             §§goto(addr0e90);
                                          }
                                          §§push(_loc11_);
                                          §§push(_loc8_.v);
                                          if(!_loc55_)
                                          {
                                             §§push(_loc9_.v);
                                             if(_loc54_)
                                             {
                                                while(true)
                                                {
                                                   §§push(_loc8_.v);
                                                   if(_loc54_ || Boolean(this))
                                                   {
                                                      §§push(§§pop() - §§pop());
                                                      if(!(_loc54_ || Boolean(param3)))
                                                      {
                                                         break;
                                                      }
                                                      §§push(_loc53_);
                                                   }
                                                   §§push(§§pop() * §§pop());
                                                   break;
                                                }
                                             }
                                             §§push(§§pop() + §§pop());
                                          }
                                          §§pop().v = §§pop();
                                          §§goto(addr0dee);
                                       }
                                       §§push(_loc43_);
                                       if(_loc54_)
                                       {
                                          break loop56;
                                       }
                                       break loop64;
                                    }
                                    §§goto(addr0f12);
                                 }
                                 §§goto(addr0f0c);
                              }
                              §§goto(addr0f0e);
                           }
                           while(true)
                           {
                              if(§§pop() <= §§pop())
                              {
                                 if(!_loc54_)
                                 {
                                    break;
                                 }
                                 §§push(_loc7_.create());
                                 if(_loc55_ && Boolean(param1))
                                 {
                                    break loop58;
                                 }
                                 _loc52_ = §§pop();
                                 while(true)
                                 {
                                    if(_loc54_)
                                    {
                                       _loc52_.vertex = _loc9_;
                                       if(_loc55_)
                                       {
                                          break;
                                       }
                                    }
                                    if(_loc50_ != null)
                                    {
                                       if(_loc54_)
                                       {
                                          _loc50_.next = _loc52_;
                                          if(_loc54_)
                                          {
                                          }
                                       }
                                       break;
                                    }
                                    _loc48_.wrapper = _loc52_;
                                    break;
                                 }
                                 _loc50_ = _loc52_;
                              }
                              addr0f0c:
                              §§push(_loc43_);
                              §§push(_loc20_);
                              break loop61;
                           }
                           §§goto(addr0f12);
                        }
                        while(true)
                        {
                           while(true)
                           {
                              §§push(_loc21_);
                              if(!(_loc55_ && Boolean(param2)))
                              {
                                 break loop57;
                              }
                              addr0f0e:
                              if(§§pop() >= §§pop())
                              {
                                 break;
                              }
                              §§goto(addr0f5e);
                           }
                           addr0f12:
                           §§push(_loc7_.create());
                           break;
                        }
                        _loc52_ = §§pop();
                        if(_loc54_)
                        {
                           _loc52_.vertex = _loc9_;
                           while(true)
                           {
                              if(_loc54_ || Boolean(param2))
                              {
                                 if(_loc51_ == null)
                                 {
                                    _loc49_.wrapper = _loc52_;
                                    break;
                                 }
                                 if(!_loc54_)
                                 {
                                    break;
                                 }
                                 _loc51_.next = _loc52_;
                                 if(!_loc54_)
                                 {
                                    break;
                                 }
                              }
                              break;
                           }
                        }
                        _loc51_ = _loc52_;
                        addr0f5e:
                        _loc8_ = _loc9_;
                        if(!(_loc55_ && Boolean(this)))
                        {
                           §§push(_loc43_);
                           if(_loc54_ || Boolean(param1))
                           {
                              §§push(Number(§§pop()));
                           }
                           _loc42_ = §§pop();
                        }
                        _loc7_ = _loc7_.next;
                     }
                     if(!(_loc54_ || Boolean(param3)))
                     {
                        break;
                     }
                  }
                  if(_loc22_ != null)
                  {
                     if(!(_loc55_ && Boolean(param1)))
                     {
                        break;
                     }
                     addr0fbd:
                  }
                  else
                  {
                     _loc22_ = _loc48_;
                  }
                  _loc23_ = _loc48_;
                  while(true)
                  {
                     if(_loc54_ || Boolean(param3))
                     {
                        if(_loc24_ == null)
                        {
                           _loc24_ = _loc49_;
                           addr1000:
                           _loc25_ = _loc49_;
                           if(_loc54_ || Boolean(param2))
                           {
                              _loc27_.processNext = null;
                              if(_loc54_ || Boolean(param2))
                              {
                                 _loc27_.geometry = null;
                              }
                           }
                           continue loop3;
                        }
                        if(!(_loc54_ || Boolean(param2)))
                        {
                           break;
                        }
                     }
                     _loc25_.processNext = _loc49_;
                     break;
                  }
                  §§goto(addr1000);
               }
               _loc23_.processNext = _loc48_;
               §§goto(addr0fbd);
            }
         }
         if(_loc18_ != null)
         {
            _loc18_.geometry = _loc19_;
            if(_loc25_ != null)
            {
               _loc25_.processNext = null;
            }
            §§push(this.collectNode(_loc18_,_loc24_,param3,param4,param5,param6));
            if(!_loc55_)
            {
               param6 = §§pop();
            }
            else
            {
               addr10f9:
               param6 = §§pop();
               addr1157:
            }
         }
         else if(_loc24_ != null)
         {
            loop111:
            while(true)
            {
               while(true)
               {
                  §§push(param5);
                  if(!_loc55_)
                  {
                     §§push(Boolean(§§pop()));
                     if(_loc55_ && Boolean(this))
                     {
                        break;
                     }
                     var _temp_129:* = §§pop();
                     §§push(_temp_129);
                     §§push(_temp_129);
                     if(!(_loc55_ && Boolean(param2)))
                     {
                        §§push(Boolean(§§pop()));
                     }
                     if(!§§pop())
                     {
                        break loop111;
                     }
                     if(_loc55_)
                     {
                        break loop111;
                     }
                  }
                  §§pop();
                  §§push(_loc24_ == _loc25_);
                  if(_loc54_)
                  {
                     §§push(!§§pop());
                     if(!_loc55_)
                     {
                        break;
                     }
                  }
                  break loop111;
               }
               §§push(Boolean(§§pop()));
               break;
            }
            while(true)
            {
               if(§§pop())
               {
                  if(_loc25_ != null)
                  {
                     if(!(_loc55_ && Boolean(param2)))
                     {
                        _loc25_.processNext = null;
                        if(_loc55_)
                        {
                           addr1161:
                           param6 = _loc24_;
                           break;
                        }
                     }
                  }
                  if(_loc24_.geometry.sorting == 2)
                  {
                     §§goto(addr10f9);
                     §§push(this.collectNode(null,_loc24_,param3,param4,param5,param6));
                  }
                  else
                  {
                     _loc24_ = param3.sortByAverageZ(_loc24_);
                     _loc25_ = _loc24_.processNext;
                     if(!(_loc55_ && Boolean(param2)))
                     {
                        loop4:
                        while(true)
                        {
                           §§push(_loc25_.processNext);
                           do
                           {
                              if(§§pop() == null)
                              {
                                 break loop4;
                              }
                              §§push(_loc25_.processNext);
                           }
                           while(_loc55_);
                           _loc25_ = §§pop();
                        }
                        if(_loc54_ || Boolean(param1))
                        {
                           _loc25_.processNext = param6;
                        }
                     }
                     param6 = _loc24_;
                  }
                  §§goto(addr1157);
               }
               else
               {
                  _loc25_.processNext = param6;
               }
               §§goto(addr1161);
            }
         }
         loop114:
         while(true)
         {
            if(param1 != null)
            {
               _loc16_.processNext = param6;
               if(!_loc54_)
               {
                  break;
               }
               param6 = param1;
            }
            if(_loc17_ != null)
            {
               _loc17_.geometry = _loc19_;
               loop115:
               while(true)
               {
                  if(_loc54_)
                  {
                     while(true)
                     {
                        if(_loc23_ != null)
                        {
                           if(_loc55_ && Boolean(param2))
                           {
                              addr1232:
                              if(_loc22_.geometry.sorting == 2)
                              {
                                 if(!(_loc55_ && Boolean(param1)))
                                 {
                                    break loop114;
                                 }
                                 addr12c4:
                                 addr12c4:
                                 param6 = _loc22_;
                                 break loop115;
                              }
                              _loc22_ = param3.sortByAverageZ(_loc22_);
                              _loc23_ = _loc22_.processNext;
                              while(true)
                              {
                                 if(_loc54_)
                                 {
                                    loop6:
                                    while(true)
                                    {
                                       §§push(_loc23_.processNext);
                                       do
                                       {
                                          if(§§pop() == null)
                                          {
                                             break loop6;
                                          }
                                          §§push(_loc23_.processNext);
                                       }
                                       while(!_loc54_);
                                       _loc23_ = §§pop();
                                    }
                                    if(!(_loc54_ || Boolean(this)))
                                    {
                                       break;
                                    }
                                 }
                                 _loc23_.processNext = param6;
                                 break;
                              }
                              param6 = _loc22_;
                              break;
                           }
                           _loc23_.processNext = null;
                        }
                        §§push(this.collectNode(_loc17_,_loc22_,param3,param4,param5,param6));
                        if(!(_loc55_ && Boolean(param2)))
                        {
                           param6 = §§pop();
                           break loop115;
                        }
                        addr125a:
                        param6 = §§pop();
                        break;
                     }
                     break;
                  }
                  §§goto(addr12c4);
               }
            }
            else if(_loc22_ != null)
            {
               loop118:
               while(true)
               {
                  while(true)
                  {
                     §§push(param5);
                     if(!_loc55_)
                     {
                        §§push(Boolean(§§pop()));
                        if(!_loc55_)
                        {
                           var _temp_135:* = §§pop();
                           §§push(_temp_135);
                           §§push(_temp_135);
                           if(_loc54_ || Boolean(param2))
                           {
                              §§push(Boolean(§§pop()));
                           }
                           if(!§§pop())
                           {
                              break;
                           }
                           if(_loc55_)
                           {
                              break loop118;
                           }
                        }
                     }
                     §§pop();
                     §§push(_loc22_ == _loc23_);
                     if(!_loc55_)
                     {
                        §§push(!§§pop());
                        if(!(_loc55_ && Boolean(param1)))
                        {
                           break loop118;
                        }
                        break;
                     }
                     break loop118;
                  }
                  while(true)
                  {
                     if(§§pop())
                     {
                        if(_loc23_ != null)
                        {
                           _loc23_.processNext = null;
                           if(!_loc54_)
                           {
                              break loop114;
                           }
                        }
                        §§goto(addr1232);
                     }
                     else
                     {
                        _loc23_.processNext = param6;
                     }
                     §§goto(addr12c4);
                  }
               }
               §§push(Boolean(§§pop()));
               break loop119;
            }
            return param6;
         }
         §§goto(addr125a);
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(_loc2_)
{
   ConflictContainer = §§newclass(ConflictContainer,Object3DContainer);
}

