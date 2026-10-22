package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.geom.ColorTransform;
   
   use namespace alternativa3d;
   
   public class VG
   {
      
      private static var collector:VG;
      
      alternativa3d var next:VG;
      
      alternativa3d var faceStruct:Face;
      
      alternativa3d var object:Object3D;
      
      alternativa3d var alpha:Number;
      
      alternativa3d var blendMode:String;
      
      alternativa3d var colorTransform:ColorTransform;
      
      alternativa3d var filters:Array;
      
      alternativa3d var sorting:int;
      
      alternativa3d var debug:int = 0;
      
      alternativa3d var space:int = 0;
      
      alternativa3d var viewAligned:Boolean = false;
      
      alternativa3d var tma:Number;
      
      alternativa3d var tmb:Number;
      
      alternativa3d var tmc:Number;
      
      alternativa3d var tmd:Number;
      
      alternativa3d var tmtx:Number;
      
      alternativa3d var tmty:Number;
      
      alternativa3d var boundMinX:Number;
      
      alternativa3d var boundMinY:Number;
      
      alternativa3d var boundMinZ:Number;
      
      alternativa3d var boundMaxX:Number;
      
      alternativa3d var boundMaxY:Number;
      
      alternativa3d var boundMaxZ:Number;
      
      alternativa3d var boundVertexList:Vertex;
      
      alternativa3d var boundPlaneList:Vertex;
      
      alternativa3d var numOccluders:int;
      
      public function VG()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         while(true)
         {
            if(!(_loc2_ && Boolean(this)))
            {
               this.boundVertexList = Vertex.createList(8);
               if(!(_loc1_ || _loc1_))
               {
                  break;
               }
            }
            this.boundPlaneList = Vertex.createList(6);
            if(_loc1_ || Boolean(this))
            {
               super();
            }
            break;
         }
      }
      
      alternativa3d static function create(param1:Object3D, param2:Face, param3:int, param4:int, param5:Boolean, param6:Number = 1, param7:Number = 0, param8:Number = 0, param9:Number = 1, param10:Number = 0, param11:Number = 0) : VG
      {
         §§push(false);
         var _loc13_:Boolean = true;
         var _loc14_:* = §§pop();
         var _loc12_:VG = null;
         loop0:
         while(true)
         {
            while(true)
            {
               if(_loc13_ || Boolean(VG))
               {
                  §§push(collector);
                  if(_loc14_)
                  {
                     break;
                  }
                  if(§§pop() == null)
                  {
                     _loc12_ = new VG();
                     break loop0;
                  }
               }
               §§push(collector);
               break;
            }
            _loc12_ = §§pop();
            collector = collector.next;
            if(_loc13_)
            {
               _loc12_.next = null;
            }
            break;
         }
         _loc12_.object = param1;
         _loc12_.alpha = param1.alpha;
         _loc12_.blendMode = param1.blendMode;
         loop2:
         while(true)
         {
            if(!_loc14_)
            {
               _loc12_.colorTransform = param1.colorTransform;
               _loc12_.filters = param1.filters;
               _loc12_.faceStruct = param2;
               _loc12_.sorting = param3;
               _loc12_.debug = param4;
               while(true)
               {
                  if(_loc13_ || Boolean(param2))
                  {
                     if(!param5)
                     {
                        break loop2;
                     }
                     if(_loc14_ && Boolean(VG))
                     {
                        break;
                     }
                     _loc12_.viewAligned = true;
                     if(_loc14_)
                     {
                        break;
                     }
                     _loc12_.tma = param6;
                     if(!_loc13_)
                     {
                        break;
                     }
                  }
                  _loc12_.tmb = param7;
                  _loc12_.tmc = param8;
                  _loc12_.tmd = param9;
                  break;
               }
               _loc12_.tmtx = param10;
            }
            _loc12_.tmty = param11;
            break;
         }
         return _loc12_;
      }
      
      alternativa3d function destroy() : void
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(this.faceStruct != null)
         {
            this.destroyFaceStruct(this.faceStruct);
            this.faceStruct = null;
         }
         this.object = null;
         this.viewAligned = false;
         this.colorTransform = null;
         this.filters = null;
         this.numOccluders = 0;
         this.debug = 0;
         this.space = 0;
         if(!_loc2_)
         {
            this.next = collector;
            collector = this;
         }
      }
      
      private function destroyFaceStruct(param1:Face) : void
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         if(param1.processNegative != null)
         {
            this.destroyFaceStruct(param1.processNegative);
            param1.processNegative = null;
         }
         if(param1.processPositive != null)
         {
            while(true)
            {
               if(!_loc3_)
               {
                  this.destroyFaceStruct(param1.processPositive);
                  if(!(_loc4_ || Boolean(this)))
                  {
                     break;
                  }
               }
               param1.processPositive = null;
               break;
            }
         }
         var _loc2_:Face = param1.processNext;
         while(_loc2_ != null)
         {
            param1.processNext = null;
            if(_loc3_)
            {
               break;
            }
            param1 = _loc2_;
            _loc2_ = param1.processNext;
         }
      }
      
      alternativa3d function calculateAABB(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number) : void
      {
         var _temp_1:* = true;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = _temp_1;
         if(!_loc15_)
         {
            this.boundMinX = 1e+22;
         }
         this.boundMinY = 1e+22;
         if(_loc16_)
         {
            this.boundMinZ = 1e+22;
            if(!_loc15_)
            {
               this.boundMaxX = -1e+22;
               this.boundMaxY = -1e+22;
               this.boundMaxZ = -1e+22;
               if(!(_loc15_ && Boolean(this)))
               {
                  §§push(this);
                  §§push(this.faceStruct);
                  var _loc13_:Object3D;
                  §§push((_loc13_ = this.object).transformId);
                  if(!(_loc15_ && Boolean(this)))
                  {
                     §§push(§§pop() + 1);
                     if(_loc16_ || Boolean(this))
                     {
                        var _loc14_:* = §§pop();
                        §§push(_loc14_);
                        if(_loc16_)
                        {
                           _loc13_.transformId = _loc14_;
                        }
                     }
                  }
                  §§pop().calculateAABBStruct(§§pop(),§§pop(),param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
               }
               this.space = 1;
            }
         }
      }
      
      alternativa3d function calculateOOBB(param1:Object3D) : void
      {
         var _temp_1:* = true;
         var _loc32_:Boolean = false;
         var _loc33_:Boolean = _temp_1;
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Vertex = null;
         var _loc6_:Vertex = null;
         var _loc7_:Vertex = null;
         var _loc8_:Vertex = null;
         var _loc9_:Vertex = null;
         var _loc10_:Vertex = null;
         var _loc11_:Vertex = null;
         var _loc12_:Vertex = null;
         var _loc13_:* = NaN;
         var _loc14_:* = NaN;
         var _loc15_:* = NaN;
         var _loc16_:* = NaN;
         var _loc17_:* = NaN;
         var _loc18_:* = NaN;
         var _loc19_:* = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:* = NaN;
         var _loc22_:* = NaN;
         var _loc23_:* = NaN;
         var _loc24_:* = NaN;
         var _loc25_:* = NaN;
         var _loc26_:Vertex = null;
         var _loc27_:Vertex = null;
         var _loc28_:Vertex = null;
         var _loc29_:Vertex = null;
         loop1:
         while(true)
         {
            loop2:
            while(true)
            {
               loop108:
               while(true)
               {
                  while(true)
                  {
                     if(!(_loc32_ && Boolean(param1)))
                     {
                        if(this.space == 1)
                        {
                           if(_loc32_ && Boolean(_loc2_))
                           {
                              break;
                           }
                           while(true)
                           {
                              §§push(this);
                              §§push(this.faceStruct);
                              var _loc30_:Object3D;
                              §§push((_loc30_ = this.object).transformId);
                              if(_loc33_ || Boolean(_loc2_))
                              {
                                 §§push(§§pop() + 1);
                                 if(!(_loc33_ || Boolean(this)))
                                 {
                                    break;
                                 }
                              }
                              var _loc31_:* = §§pop();
                              §§push(_loc31_);
                              if(!(_loc32_ && Boolean(this)))
                              {
                                 _loc30_.transformId = _loc31_;
                              }
                              break;
                           }
                           §§pop().alternativa3d::transformStruct(§§pop(),§§pop(),param1.ma,param1.mb,param1.mc,param1.md,param1.me,param1.mf,param1.mg,param1.mh,param1.mi,param1.mj,param1.mk,param1.ml);
                           if(!_loc33_)
                           {
                              break loop2;
                           }
                        }
                        if(this.viewAligned)
                        {
                           if(_loc32_)
                           {
                              break loop108;
                           }
                           §§goto(addr1349);
                        }
                        else
                        {
                           this.boundMinX = 1e+22;
                           this.boundMinY = 1e+22;
                           this.boundMinZ = 1e+22;
                           if(_loc32_ && Boolean(_loc2_))
                           {
                              break loop2;
                           }
                           this.boundMaxX = -1e+22;
                           this.boundMaxY = -1e+22;
                           if(!_loc33_)
                           {
                              break loop1;
                           }
                           this.boundMaxZ = -1e+22;
                        }
                     }
                     while(true)
                     {
                        §§push(this);
                        §§push(this.faceStruct);
                        §§push((_loc30_ = this.object).transformId);
                        if(!_loc32_)
                        {
                           §§push(§§pop() + 1);
                           if(_loc32_ && Boolean(_loc2_))
                           {
                              break;
                           }
                        }
                        _loc31_ = §§pop();
                        §§push(_loc31_);
                        if(_loc33_ || Boolean(_loc3_))
                        {
                           _loc30_.transformId = _loc31_;
                        }
                        break;
                     }
                     §§pop().calculateOOBBStruct(§§pop(),§§pop(),this.object.ima,this.object.imb,this.object.imc,this.object.imd,this.object.ime,this.object.imf,this.object.img,this.object.imh,this.object.imi,this.object.imj,this.object.imk,this.object.iml);
                     if(!_loc32_)
                     {
                        break loop2;
                     }
                     break loop108;
                  }
                  §§goto(addr0233);
               }
               §§goto(addr02c4);
            }
            while(true)
            {
               §§push(this.boundMaxX);
               if(_loc33_ || Boolean(_loc3_))
               {
                  §§push(this.boundMinX);
                  if(_loc33_ || Boolean(param1))
                  {
                     §§push(§§pop() - §§pop());
                     if(!_loc33_)
                     {
                        break loop3;
                     }
                     §§push(1);
                     if(!(_loc33_ || Boolean(_loc3_)))
                     {
                        break;
                     }
                     if(§§pop() < §§pop())
                     {
                        break loop1;
                     }
                     §§goto(addr0233);
                  }
                  else
                  {
                     §§goto(addr0255);
                  }
               }
               §§goto(addr0264);
            }
            §§goto(addr02ba);
         }
         §§push(this);
         §§push(this.boundMinX);
         if(_loc33_ || Boolean(_loc3_))
         {
            §§push(§§pop() + 1);
         }
         §§pop().alternativa3d::boundMaxX = §§pop();
         addr0233:
         loop3:
         while(true)
         {
            loop4:
            while(true)
            {
               §§push(this.boundMaxY);
               if(_loc33_ || Boolean(_loc2_))
               {
                  §§push(this.boundMinY);
                  if(_loc32_ && Boolean(_loc3_))
                  {
                     break;
                  }
                  §§push(§§pop() - §§pop());
                  if(!(_loc33_ || Boolean(_loc3_)))
                  {
                     break loop3;
                  }
               }
               addr0264:
               §§push(1);
               if(_loc33_ || Boolean(_loc3_))
               {
                  loop106:
                  while(true)
                  {
                     while(true)
                     {
                        if(§§pop() < §§pop())
                        {
                           if(!_loc33_)
                           {
                              break;
                           }
                           §§push(this);
                           §§push(this.boundMinY);
                           if(_loc33_ || Boolean(_loc2_))
                           {
                              §§push(§§pop() + 1);
                           }
                           §§pop().alternativa3d::boundMaxY = §§pop();
                           if(_loc32_ && Boolean(_loc2_))
                           {
                              break loop106;
                           }
                        }
                        §§push(this.boundMaxZ);
                        if(_loc33_ || Boolean(this))
                        {
                           §§push(this.boundMinZ);
                           break loop4;
                        }
                        break loop3;
                     }
                     §§goto(addr02c4);
                  }
                  §§goto(addr02db);
               }
               §§goto(addr02ba);
            }
            §§push(§§pop() - §§pop());
            break;
         }
         addr02ba:
         if(§§pop() < 1)
         {
            if(_loc33_)
            {
               addr02c4:
               §§push(this);
               §§push(this.boundMinZ);
               if(_loc33_ || Boolean(_loc2_))
               {
                  §§push(§§pop() + 1);
               }
               §§pop().alternativa3d::boundMaxZ = §§pop();
            }
         }
         addr02db:
         _loc2_ = this.boundVertexList;
         while(true)
         {
            if(_loc33_)
            {
               _loc2_.x = this.boundMinX;
               if(!(_loc33_ || Boolean(_loc2_)))
               {
                  break;
               }
            }
            _loc2_.y = this.boundMinY;
            if(_loc33_ || Boolean(param1))
            {
               break;
            }
            addr0315:
            _loc3_ = _loc2_.next;
            while(true)
            {
               if(!(_loc32_ && Boolean(_loc2_)))
               {
                  _loc3_.x = this.boundMaxX;
                  if(!_loc33_)
                  {
                     break;
                  }
               }
               _loc3_.y = this.boundMinY;
               if(_loc33_)
               {
                  _loc3_.z = this.boundMinZ;
               }
               break;
            }
            _loc4_ = _loc3_.next;
            while(true)
            {
               if(!_loc32_)
               {
                  _loc4_.x = this.boundMinX;
                  if(!_loc32_)
                  {
                     _loc4_.y = this.boundMaxY;
                     if(!(_loc33_ || Boolean(_loc2_)))
                     {
                        break;
                     }
                  }
               }
               _loc4_.z = this.boundMinZ;
               break;
            }
            _loc5_ = _loc4_.next;
            while(true)
            {
               if(_loc33_)
               {
                  _loc5_.x = this.boundMaxX;
                  if(_loc33_ || Boolean(_loc3_))
                  {
                     _loc5_.y = this.boundMaxY;
                     if(!_loc33_)
                     {
                        break;
                     }
                  }
               }
               _loc5_.z = this.boundMinZ;
               break;
            }
            _loc6_ = _loc5_.next;
            while(true)
            {
               if(!(_loc32_ && Boolean(param1)))
               {
                  _loc6_.x = this.boundMinX;
                  if(_loc33_ || Boolean(_loc3_))
                  {
                     _loc6_.y = this.boundMinY;
                     if(!(_loc33_ || Boolean(param1)))
                     {
                        break;
                     }
                  }
               }
               _loc6_.z = this.boundMaxZ;
               break;
            }
            _loc7_ = _loc6_.next;
            while(true)
            {
               if(!_loc32_)
               {
                  _loc7_.x = this.boundMaxX;
                  if(_loc32_)
                  {
                     break;
                  }
                  _loc7_.y = this.boundMinY;
                  if(!_loc33_)
                  {
                     break;
                  }
               }
               _loc7_.z = this.boundMaxZ;
               break;
            }
            _loc8_ = _loc7_.next;
            while(true)
            {
               if(_loc33_)
               {
                  _loc8_.x = this.boundMinX;
                  if(_loc32_ && Boolean(_loc2_))
                  {
                     break;
                  }
                  _loc8_.y = this.boundMaxY;
                  if(_loc32_)
                  {
                     break;
                  }
               }
               _loc8_.z = this.boundMaxZ;
               break;
            }
            _loc9_ = _loc8_.next;
            while(true)
            {
               if(_loc33_ || Boolean(this))
               {
                  _loc9_.x = this.boundMaxX;
                  if(!(_loc33_ || Boolean(_loc2_)))
                  {
                     break;
                  }
               }
               _loc9_.y = this.boundMaxY;
               if(_loc33_)
               {
                  break;
               }
               addr04a0:
               _loc10_ = _loc2_;
               while(_loc10_ != null)
               {
                  loop13:
                  while(true)
                  {
                     loop14:
                     while(true)
                     {
                        loop24:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(_loc10_);
                              §§push(this.object.ma);
                              if(!_loc32_)
                              {
                                 §§push(_loc10_.x);
                                 if(_loc32_ && Boolean(param1))
                                 {
                                    break loop14;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(_loc33_)
                                 {
                                    §§push(this.object);
                                    if(_loc32_)
                                    {
                                       break;
                                    }
                                    §§push(§§pop().alternativa3d::mb);
                                    if(_loc32_ && Boolean(_loc3_))
                                    {
                                       break loop14;
                                    }
                                    §§push(_loc10_.y);
                                    if(_loc32_ && Boolean(_loc2_))
                                    {
                                       break loop24;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(!_loc33_)
                                    {
                                       break loop14;
                                    }
                                    §§push(§§pop() + §§pop());
                                    if(!_loc33_)
                                    {
                                       break loop13;
                                    }
                                 }
                              }
                              §§push(this.object);
                              if(_loc33_ || Boolean(_loc3_))
                              {
                                 break;
                              }
                              §§goto(addr053f);
                           }
                           §§push(§§pop().alternativa3d::mc);
                           if(!_loc32_)
                           {
                              break loop14;
                           }
                           §§goto(addr0541);
                        }
                        §§push(§§pop() * §§pop());
                        if(!_loc32_)
                        {
                           §§push(§§pop() + §§pop());
                           if(_loc33_ || Boolean(_loc3_))
                           {
                              break loop13;
                           }
                           §§goto(addr0542);
                        }
                        §§goto(addr0541);
                     }
                     §§push(_loc10_.z);
                     break loop24;
                  }
                  addr0542:
                  §§pop().alternativa3d::cameraX = §§pop() + this.object.md;
                  addr0541:
                  addr053f:
                  if(_loc32_ && Boolean(_loc2_))
                  {
                     break;
                  }
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_loc10_);
                        §§push(this.object.me);
                        if(!(_loc32_ && Boolean(_loc2_)))
                        {
                           §§push(_loc10_.x);
                           if(!(_loc33_ || Boolean(this)))
                           {
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           if(!(_loc33_ || Boolean(_loc2_)))
                           {
                              continue loop17;
                           }
                        }
                        §§push(this.object);
                        if(_loc33_)
                        {
                           §§push(§§pop().alternativa3d::mf);
                           if(!(_loc32_ && Boolean(param1)))
                           {
                              §§push(_loc10_.y);
                              if(_loc33_ || Boolean(param1))
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!_loc32_)
                                 {
                                    §§push(§§pop() + §§pop());
                                    if(!_loc33_)
                                    {
                                       break loop17;
                                    }
                                    continue loop17;
                                 }
                              }
                              else
                              {
                                 addr05de:
                                 §§push(§§pop() * §§pop());
                                 if(_loc33_)
                                 {
                                    §§push(§§pop() + §§pop());
                                    if(!(_loc33_ || Boolean(_loc2_)))
                                    {
                                       break loop17;
                                    }
                                    §§goto(addr05f7);
                                    §§push(this.object);
                                 }
                              }
                           }
                        }
                        else
                        {
                           §§goto(addr05ca);
                        }
                        §§goto(addr05f9);
                     }
                     §§goto(addr05de);
                  }
                  while(true)
                  {
                     while(true)
                     {
                        §§push(this.object);
                        if(_loc33_)
                        {
                           addr05ca:
                           §§push(§§pop().alternativa3d::mg);
                           if(_loc33_ || Boolean(param1))
                           {
                              break loop16;
                           }
                           break;
                        }
                        addr05f7:
                        §§push(§§pop().alternativa3d::mh);
                        break;
                     }
                     addr05f9:
                     §§push(§§pop() + §§pop());
                     break;
                  }
                  §§pop().alternativa3d::cameraY = §§pop();
                  if(_loc33_ || Boolean(_loc2_))
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
                              §§push(_loc10_);
                              §§push(this.object.mi);
                              if(!(_loc32_ && Boolean(_loc3_)))
                              {
                                 while(true)
                                 {
                                    §§push(_loc10_.x);
                                    if(!(_loc32_ && Boolean(param1)))
                                    {
                                       §§push(§§pop() * §§pop());
                                       if(_loc32_ && Boolean(_loc2_))
                                       {
                                          break;
                                       }
                                       §§push(this.object);
                                       if(_loc32_ && Boolean(this))
                                       {
                                          break loop21;
                                       }
                                       §§push(§§pop().alternativa3d::mj);
                                       if(_loc32_ && Boolean(this))
                                       {
                                          break loop20;
                                       }
                                    }
                                    while(true)
                                    {
                                       §§push(_loc10_.y);
                                       if(!_loc32_)
                                       {
                                          §§push(§§pop() * §§pop());
                                          if(_loc32_)
                                          {
                                             break;
                                          }
                                          §§push(§§pop() + §§pop());
                                          if(_loc32_)
                                          {
                                             break loop19;
                                          }
                                          §§push(this.object);
                                          if(_loc32_)
                                          {
                                             break loop21;
                                          }
                                          §§push(§§pop().alternativa3d::mk);
                                          if(!(_loc33_ || Boolean(this)))
                                          {
                                             break;
                                          }
                                          §§push(_loc10_.z);
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(_loc33_)
                                       {
                                          break;
                                       }
                                       break loop20;
                                    }
                                    §§push(§§pop() + §§pop());
                                    if(!_loc32_)
                                    {
                                       break;
                                    }
                                    break loop19;
                                 }
                              }
                              §§push(this.object);
                              break;
                           }
                           §§push(§§pop().alternativa3d::ml);
                           break;
                        }
                        §§push(§§pop() + §§pop());
                        break;
                     }
                     §§pop().alternativa3d::cameraZ = §§pop();
                     if(_loc32_ && Boolean(_loc3_))
                     {
                        break;
                     }
                  }
                  _loc10_ = _loc10_.next;
               }
               _loc11_ = this.boundPlaneList;
               _loc12_ = _loc11_.next;
               loop26:
               while(true)
               {
                  loop27:
                  while(true)
                  {
                     loop87:
                     while(true)
                     {
                        §§push(_loc2_.cameraX);
                        if(_loc33_)
                        {
                           loop88:
                           while(true)
                           {
                              loop89:
                              while(true)
                              {
                                 loop90:
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
                                             loop101:
                                             while(true)
                                             {
                                                loop102:
                                                while(true)
                                                {
                                                   loop103:
                                                   while(true)
                                                   {
                                                      loop104:
                                                      while(true)
                                                      {
                                                         §§push(Number(§§pop()));
                                                         if(!_loc32_)
                                                         {
                                                            _loc13_ = §§pop();
                                                            while(true)
                                                            {
                                                               if(!_loc32_)
                                                               {
                                                                  §§push(_loc2_.cameraY);
                                                                  if(_loc32_ && Boolean(_loc2_))
                                                                  {
                                                                     break loop104;
                                                                  }
                                                                  _loc14_ = Number(§§pop());
                                                                  §§push(_loc2_.cameraZ);
                                                                  if(!_loc33_)
                                                                  {
                                                                     break loop98;
                                                                  }
                                                                  _loc15_ = §§pop();
                                                                  if(_loc32_)
                                                                  {
                                                                     break;
                                                                  }
                                                               }
                                                               §§push(_loc3_.cameraX);
                                                               §§push(_loc13_);
                                                               if(!(_loc33_ || Boolean(this)))
                                                               {
                                                                  break loop103;
                                                               }
                                                               §§push(§§pop() - §§pop());
                                                               if(!(_loc33_ || Boolean(_loc2_)))
                                                               {
                                                                  break loop102;
                                                               }
                                                               _loc16_ = Number(§§pop());
                                                               §§push(_loc3_.cameraY);
                                                               if(_loc32_)
                                                               {
                                                                  break loop101;
                                                               }
                                                               §§push(§§pop() - _loc14_);
                                                               if(!(_loc33_ || Boolean(this)))
                                                               {
                                                                  break loop99;
                                                               }
                                                               §§push(Number(§§pop()));
                                                               if(_loc33_ || Boolean(this))
                                                               {
                                                                  _loc17_ = §§pop();
                                                                  break;
                                                               }
                                                            }
                                                            §§push(_loc3_.cameraZ);
                                                            if(_loc32_ && Boolean(this))
                                                            {
                                                               break loop98;
                                                            }
                                                            §§push(_loc15_);
                                                            if(_loc32_ && Boolean(this))
                                                            {
                                                               break loop97;
                                                            }
                                                            §§push(§§pop() - §§pop());
                                                            if(_loc32_)
                                                            {
                                                               break loop90;
                                                            }
                                                            _loc18_ = §§pop();
                                                            if(!_loc33_)
                                                            {
                                                               break loop89;
                                                            }
                                                            §§push(_loc6_.cameraX - _loc13_);
                                                            if(!_loc33_)
                                                            {
                                                               break loop88;
                                                            }
                                                         }
                                                         _loc19_ = §§pop();
                                                         §§push(_loc6_.cameraY);
                                                         if(!(_loc32_ && Boolean(param1)))
                                                         {
                                                            break loop98;
                                                         }
                                                         break loop27;
                                                      }
                                                      §§goto(addr080c);
                                                   }
                                                   §§goto(addr07c9);
                                                }
                                                §§goto(addr086f);
                                             }
                                             §§goto(addr0803);
                                          }
                                          §§goto(addr0878);
                                       }
                                       §§push(_loc14_);
                                       if(!(_loc33_ || Boolean(_loc3_)))
                                       {
                                          break loop94;
                                       }
                                       addr07c9:
                                       _loc20_ = §§pop() - §§pop();
                                       if(!(_loc33_ || Boolean(this)))
                                       {
                                          break loop26;
                                       }
                                       while(true)
                                       {
                                          §§push(_loc6_.cameraZ - _loc15_);
                                          if(_loc33_ || Boolean(_loc3_))
                                          {
                                             _loc21_ = Number(§§pop());
                                             break loop89;
                                          }
                                          §§goto(addr08b7);
                                       }
                                       §§goto(addr08da);
                                    }
                                    §§goto(addr081f);
                                 }
                                 _loc23_ = §§pop();
                                 if(_loc33_ || Boolean(this))
                                 {
                                    §§goto(addr0949);
                                    §§push(_loc24_);
                                 }
                                 else
                                 {
                                    §§goto(addr09fc);
                                 }
                              }
                              loop91:
                              while(true)
                              {
                                 §§push(_loc21_);
                                 if(!(_loc32_ && Boolean(this)))
                                 {
                                    addr0803:
                                    loop92:
                                    while(true)
                                    {
                                       §§push(§§pop() * _loc17_);
                                       if(!_loc32_)
                                       {
                                          addr080c:
                                          §§push(_loc20_);
                                          §§push(_loc18_);
                                          if(!(_loc33_ || Boolean(_loc2_)))
                                          {
                                             break;
                                          }
                                          §§push(§§pop() - §§pop() * §§pop());
                                       }
                                       _loc22_ = Number(§§pop());
                                       loop93:
                                       while(true)
                                       {
                                          loop94:
                                          while(true)
                                          {
                                             loop95:
                                             while(true)
                                             {
                                                if(_loc33_)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(_loc19_);
                                                      §§push(_loc18_);
                                                      if(!(_loc32_ && Boolean(this)))
                                                      {
                                                         §§push(§§pop() * §§pop());
                                                         if(_loc32_)
                                                         {
                                                            break loop95;
                                                         }
                                                         §§push(_loc21_);
                                                         if(_loc32_ && Boolean(_loc2_))
                                                         {
                                                            break;
                                                         }
                                                      }
                                                      §§push(_loc16_);
                                                      if(!_loc32_)
                                                      {
                                                         break loop92;
                                                      }
                                                      addr088a:
                                                      §§push(§§pop() * §§pop());
                                                      if(_loc32_ && Boolean(this))
                                                      {
                                                         break loop94;
                                                      }
                                                      §§push(§§pop() - §§pop());
                                                      if(!(_loc33_ || Boolean(_loc3_)))
                                                      {
                                                         break loop88;
                                                      }
                                                      §§push(Number(§§pop()));
                                                      if(!(_loc32_ && Boolean(_loc3_)))
                                                      {
                                                         addr08b7:
                                                         _loc24_ = §§pop();
                                                         §§push(1 / Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_));
                                                         if(_loc32_)
                                                         {
                                                            break loop93;
                                                         }
                                                      }
                                                      _loc25_ = Number(§§pop());
                                                   }
                                                   addr0888:
                                                   §§goto(addr088a);
                                                }
                                                §§push(_loc22_);
                                                §§push(_loc25_);
                                                break loop94;
                                             }
                                             §§push(Number(§§pop()));
                                             if(_loc32_ && Boolean(_loc3_))
                                             {
                                                break loop93;
                                             }
                                             §§goto(addr08ff);
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(!(_loc32_ && Boolean(this)))
                                          {
                                             break loop95;
                                          }
                                          addr08ff:
                                          _loc22_ = §§pop();
                                          if(!(_loc32_ && Boolean(param1)))
                                          {
                                             §§push(_loc23_);
                                             if(_loc33_ || Boolean(_loc3_))
                                             {
                                                §§push(§§pop() * _loc25_);
                                                if(!(_loc32_ && Boolean(this)))
                                                {
                                                   break;
                                                }
                                             }
                                             break loop91;
                                          }
                                          break loop87;
                                       }
                                    }
                                    §§push(§§pop() - §§pop() * §§pop());
                                    if(_loc32_ && Boolean(this))
                                    {
                                       break;
                                    }
                                    _loc23_ = §§pop();
                                    §§push(_loc20_ * _loc16_);
                                    if(!_loc33_)
                                    {
                                       break loop90;
                                    }
                                    §§push(_loc19_);
                                    if(!(_loc32_ && Boolean(this)))
                                    {
                                       §§goto(addr0888);
                                    }
                                    §§goto(addr0899);
                                 }
                                 break loop93;
                              }
                              addr0949:
                              §§push(§§pop() * _loc25_);
                              break;
                           }
                        }
                        break loop88;
                     }
                     §§goto(addr0a37);
                  }
                  _loc24_ = §§pop();
                  if(_loc33_)
                  {
                     _loc11_.cameraX = _loc22_;
                     _loc11_.cameraY = _loc23_;
                     _loc11_.cameraZ = _loc24_;
                     break;
                  }
                  break loop87;
               }
               loop28:
               while(true)
               {
                  loop29:
                  while(true)
                  {
                     loop85:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc11_);
                           §§push(_loc13_);
                           if(_loc33_ || Boolean(_loc2_))
                           {
                              §§push(_loc22_);
                              if(!(_loc33_ || Boolean(param1)))
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(!_loc32_)
                              {
                                 §§push(_loc14_);
                                 if(!(_loc32_ && Boolean(_loc2_)))
                                 {
                                    §§push(_loc23_);
                                    if(!(_loc33_ || Boolean(param1)))
                                    {
                                       break loop85;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(_loc32_ && Boolean(_loc3_))
                                    {
                                       break loop29;
                                    }
                                 }
                                 §§push(§§pop() + §§pop());
                                 if(!(_loc33_ || Boolean(this)))
                                 {
                                    break loop28;
                                 }
                              }
                           }
                           §§push(_loc15_);
                           if(!(_loc32_ && Boolean(this)))
                           {
                              break loop29;
                           }
                           break;
                        }
                        §§push(§§pop() + §§pop());
                        break loop28;
                     }
                     §§push(§§pop() * §§pop());
                     break loop86;
                  }
                  §§push(_loc24_);
                  break loop85;
               }
               §§pop().alternativa3d::offset = §§pop();
               if(_loc33_ || Boolean(this))
               {
                  addr09fc:
                  §§push(_loc12_);
                  §§push(_loc22_);
                  if(!(_loc32_ && Boolean(param1)))
                  {
                     §§push(-§§pop());
                  }
                  §§pop().alternativa3d::cameraX = §§pop();
                  while(true)
                  {
                     if(_loc33_)
                     {
                        §§push(_loc12_);
                        §§push(_loc23_);
                        if(!_loc32_)
                        {
                           §§push(-§§pop());
                        }
                        §§pop().alternativa3d::cameraY = §§pop();
                        §§push(_loc12_);
                        §§push(_loc24_);
                        if(_loc33_)
                        {
                           §§push(-§§pop());
                        }
                        §§pop().alternativa3d::cameraZ = §§pop();
                        if(!_loc33_)
                        {
                           break;
                        }
                     }
                     addr0a37:
                     loop31:
                     while(true)
                     {
                        §§push(_loc12_);
                        §§push(_loc4_.cameraX);
                        if(_loc33_)
                        {
                           §§push(-§§pop());
                           if(!(_loc33_ || Boolean(_loc3_)))
                           {
                              break;
                           }
                        }
                        while(true)
                        {
                           §§push(_loc22_);
                           if(!(_loc32_ && Boolean(param1)))
                           {
                              §§push(§§pop() * §§pop());
                              if(_loc32_)
                              {
                                 break loop31;
                              }
                              §§push(_loc4_.cameraY);
                              if(!_loc33_)
                              {
                                 break;
                              }
                           }
                           §§push(_loc23_);
                           if(_loc33_)
                           {
                              §§push(§§pop() * §§pop());
                              if(_loc33_ || Boolean(param1))
                              {
                                 §§push(§§pop() - §§pop());
                                 if(_loc33_ || Boolean(_loc2_))
                                 {
                                    §§push(_loc4_.cameraZ);
                                    if(!_loc32_)
                                    {
                                       break;
                                    }
                                    addr0aa6:
                                    §§push(§§pop() - §§pop());
                                 }
                                 break loop31;
                              }
                              break;
                           }
                           addr0aa5:
                           §§goto(addr0aa6);
                        }
                        §§goto(addr0aa5);
                     }
                     §§pop().alternativa3d::offset = §§pop();
                     break;
                  }
                  §§push(§§pop() * §§pop());
               }
               _loc26_ = _loc12_.next;
               _loc27_ = _loc26_.next;
               while(true)
               {
                  loop34:
                  while(true)
                  {
                     loop82:
                     while(true)
                     {
                        loop83:
                        while(true)
                        {
                           §§push(_loc2_.cameraX);
                           if(_loc33_ || Boolean(param1))
                           {
                              _loc13_ = Number(§§pop());
                              while(true)
                              {
                                 §§push(_loc2_.cameraY);
                                 if(_loc33_ || Boolean(param1))
                                 {
                                    _loc14_ = §§pop();
                                    if(!(_loc33_ || Boolean(_loc3_)))
                                    {
                                       break loop83;
                                    }
                                    _loc15_ = _loc2_.cameraZ;
                                    if(_loc33_)
                                    {
                                       §§push(_loc6_.cameraX);
                                       §§push(_loc13_);
                                       if(_loc33_)
                                       {
                                          _loc16_ = §§pop() - §§pop();
                                          if(_loc32_)
                                          {
                                             break loop82;
                                          }
                                          §§push(_loc6_.cameraY);
                                          if(_loc32_ && Boolean(_loc3_))
                                          {
                                             break loop34;
                                          }
                                          §§push(_loc14_);
                                          if(!(_loc33_ || Boolean(this)))
                                          {
                                             continue loop79;
                                          }
                                          _loc17_ = §§pop() - §§pop();
                                          if(!_loc32_)
                                          {
                                             break loop82;
                                          }
                                          §§goto(addr0cbb);
                                       }
                                    }
                                    else
                                    {
                                       §§goto(addr0b93);
                                    }
                                    §§goto(addr0c83);
                                 }
                                 §§goto(addr0c25);
                              }
                              §§goto(addr0c2c);
                           }
                           §§goto(addr0b34);
                        }
                        §§goto(addr0d6d);
                     }
                     §§push(_loc6_.cameraZ);
                     §§push(_loc15_);
                     continue loop79;
                  }
                  _loc22_ = §§pop();
                  §§goto(addr0bed);
               }
               _loc18_ = §§pop() - §§pop();
               loop35:
               while(true)
               {
                  loop36:
                  while(true)
                  {
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc4_.cameraX);
                           if(_loc33_)
                           {
                              _loc19_ = §§pop() - _loc13_;
                              §§push(_loc4_.cameraY);
                              §§push(_loc14_);
                              if(_loc32_ && Boolean(_loc2_))
                              {
                                 break loop38;
                              }
                              _loc20_ = §§pop() - §§pop();
                              §§push(_loc4_.cameraZ);
                              if(!_loc32_)
                              {
                                 §§push(§§pop() - _loc15_);
                                 if(_loc33_ || Boolean(_loc2_))
                                 {
                                    _loc21_ = Number(§§pop());
                                    if(_loc33_)
                                    {
                                       addr0b93:
                                       §§push(_loc21_);
                                       if(_loc33_)
                                       {
                                          §§push(_loc17_);
                                          if(_loc32_ && Boolean(param1))
                                          {
                                             break loop38;
                                          }
                                          §§push(§§pop() * §§pop());
                                          §§push(_loc20_);
                                          §§push(_loc18_);
                                          if(_loc33_ || Boolean(_loc2_))
                                          {
                                             §§push(§§pop() * §§pop());
                                             if(!(_loc33_ || Boolean(_loc3_)))
                                             {
                                                break loop36;
                                             }
                                             §§push(§§pop() - §§pop());
                                             if(_loc33_ || Boolean(this))
                                             {
                                                §§push(Number(§§pop()));
                                                if(!(_loc32_ && Boolean(_loc3_)))
                                                {
                                                   break loop34;
                                                }
                                                addr0c1b:
                                                _loc23_ = §§pop();
                                                §§push(_loc20_);
                                                if(_loc33_)
                                                {
                                                   addr0c28:
                                                   addr0c25:
                                                   §§push(§§pop() * _loc16_);
                                                   §§push(_loc19_);
                                                   §§push(_loc17_);
                                                   break;
                                                }
                                                break loop35;
                                             }
                                             addr0c1a:
                                             §§goto(addr0c1b);
                                             §§push(Number(§§pop()));
                                          }
                                          addr0c0a:
                                          §§push(§§pop() * §§pop());
                                          if(!(_loc32_ && Boolean(param1)))
                                          {
                                             §§goto(addr0c1a);
                                             §§push(§§pop() - §§pop());
                                          }
                                       }
                                       else
                                       {
                                          §§goto(addr0c73);
                                       }
                                       §§goto(addr0c83);
                                    }
                                    addr0bed:
                                    §§push(_loc19_);
                                 }
                                 §§push(§§pop() * _loc18_);
                                 §§push(_loc21_);
                                 if(!(_loc33_ || Boolean(param1)))
                                 {
                                    break loop38;
                                 }
                                 §§push(_loc16_);
                                 if(!_loc33_)
                                 {
                                    break;
                                 }
                                 §§goto(addr0c0a);
                              }
                              §§goto(addr0c8a);
                           }
                           §§goto(addr0c28);
                        }
                        addr0c2c:
                        §§push(§§pop() - §§pop() * §§pop());
                        if(_loc33_)
                        {
                           break loop35;
                        }
                        break;
                     }
                     §§goto(addr0c8b);
                  }
                  _loc23_ = §§pop() * §§pop();
                  while(true)
                  {
                     if(_loc33_)
                     {
                        §§push(_loc24_);
                        break loop37;
                     }
                     §§goto(addr0cc1);
                  }
                  §§goto(addr0d53);
               }
               _loc24_ = Number(§§pop());
               loop37:
               while(true)
               {
                  loop38:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(1 / Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_));
                        if(_loc33_ || Boolean(_loc2_))
                        {
                           _loc25_ = Number(§§pop());
                           if(_loc32_ && Boolean(_loc2_))
                           {
                              break;
                           }
                           §§push(_loc22_);
                           §§push(_loc25_);
                           if(_loc32_ && Boolean(_loc2_))
                           {
                              break loop38;
                           }
                           §§push(§§pop() * §§pop());
                           if(_loc32_)
                           {
                              break loop37;
                           }
                           §§push(Number(§§pop()));
                        }
                        addr0c8b:
                        _loc22_ = §§pop();
                        if(_loc33_)
                        {
                           §§push(_loc23_);
                           if(_loc33_)
                           {
                              §§push(_loc25_);
                              break loop36;
                           }
                           §§goto(addr0cb3);
                        }
                        §§goto(addr0d53);
                     }
                     §§push(_loc27_);
                     §§push(_loc22_);
                     if(_loc33_)
                     {
                        §§push(-§§pop());
                     }
                     §§pop().alternativa3d::cameraX = §§pop();
                     §§goto(addr0d53);
                  }
                  addr0cb3:
                  §§push(§§pop() * §§pop());
                  if(_loc33_)
                  {
                     §§push(Number(§§pop()));
                  }
                  _loc24_ = §§pop();
                  if(!_loc33_)
                  {
                     break loop39;
                  }
                  addr0cbb:
                  _loc26_.cameraX = _loc22_;
                  addr0cc1:
                  _loc26_.cameraY = _loc23_;
                  if(_loc33_ || Boolean(_loc2_))
                  {
                     _loc26_.cameraZ = _loc24_;
                     loop40:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc26_);
                           §§push(_loc13_);
                           if(!(_loc32_ && Boolean(_loc3_)))
                           {
                              §§push(_loc22_);
                              if(_loc32_ && Boolean(param1))
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(_loc32_ && Boolean(this))
                              {
                                 break loop40;
                              }
                           }
                           §§push(_loc14_);
                           if(_loc33_)
                           {
                              §§push(_loc23_);
                              if(!_loc32_)
                              {
                                 §§push(§§pop() * §§pop());
                                 if(_loc32_)
                                 {
                                    break;
                                 }
                                 §§push(§§pop() + §§pop());
                                 if(_loc33_)
                                 {
                                    break loop40;
                                 }
                                 §§goto(addr0d3e);
                              }
                              addr0d3c:
                              §§push(§§pop() * §§pop());
                           }
                           §§goto(addr0d3d);
                        }
                        §§goto(addr0d3c);
                     }
                     §§push(_loc15_);
                     if(_loc33_ || Boolean(this))
                     {
                        break loop41;
                     }
                     addr0d3e:
                     §§pop().alternativa3d::offset = §§pop() + §§pop();
                     addr0d3d:
                     if(!_loc32_)
                     {
                        break loop39;
                     }
                     addr0d60:
                     §§push(_loc27_);
                     §§push(_loc24_);
                     if(_loc33_)
                     {
                        §§push(-§§pop());
                     }
                     §§pop().alternativa3d::cameraZ = §§pop();
                     addr0d6d:
                     loop42:
                     while(true)
                     {
                        §§push(_loc27_);
                        §§push(_loc3_.cameraX);
                        if(_loc33_)
                        {
                           §§push(-§§pop());
                           if(!(_loc33_ || Boolean(param1)))
                           {
                              break;
                           }
                        }
                        loop43:
                        while(true)
                        {
                           loop44:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(_loc22_);
                                 if(_loc33_ || Boolean(_loc3_))
                                 {
                                    §§push(§§pop() * §§pop());
                                    if(_loc32_)
                                    {
                                       continue loop46;
                                    }
                                    §§push(_loc3_.cameraY);
                                    if(!_loc33_)
                                    {
                                       break;
                                    }
                                    §§push(_loc23_);
                                    if(_loc32_)
                                    {
                                       break loop44;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(!(_loc33_ || Boolean(_loc2_)))
                                    {
                                       break loop43;
                                    }
                                 }
                                 §§push(§§pop() - §§pop());
                                 if(!(_loc32_ && Boolean(this)))
                                 {
                                    break loop42;
                                 }
                                 continue loop46;
                              }
                              addr0dd6:
                              §§push(_loc24_);
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           break;
                        }
                        §§pop().alternativa3d::offset = §§pop() - §§pop();
                        _loc28_ = _loc27_.next;
                        _loc29_ = _loc28_.next;
                        _loc13_ = _loc6_.cameraX;
                        _loc14_ = _loc6_.cameraY;
                        while(true)
                        {
                           loop46:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(_loc6_.cameraZ);
                                 if(_loc33_)
                                 {
                                    _loc15_ = Number(§§pop());
                                    if(!(_loc33_ || Boolean(this)))
                                    {
                                       break;
                                    }
                                    §§push(_loc7_.cameraX);
                                    §§push(_loc13_);
                                    if(_loc32_)
                                    {
                                       break loop46;
                                    }
                                    §§push(§§pop() - §§pop());
                                    if(!(_loc33_ || Boolean(this)))
                                    {
                                       continue loop49;
                                    }
                                    §§push(Number(§§pop()));
                                 }
                                 _loc16_ = §§pop();
                                 if(!_loc32_)
                                 {
                                    §§push(_loc7_.cameraY);
                                    §§push(_loc14_);
                                    if(!(_loc33_ || Boolean(param1)))
                                    {
                                       continue loop71;
                                    }
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(§§pop() - §§pop());
                                             if(!(_loc32_ && Boolean(param1)))
                                             {
                                                _loc17_ = §§pop();
                                                if(!(_loc33_ || Boolean(_loc2_)))
                                                {
                                                   break loop53;
                                                }
                                                §§push(_loc7_.cameraZ - _loc15_);
                                                if(_loc33_ || Boolean(_loc3_))
                                                {
                                                   §§push(Number(§§pop()));
                                                   if(!_loc32_)
                                                   {
                                                      _loc18_ = §§pop();
                                                      §§push(_loc8_.cameraX);
                                                      if(!_loc33_)
                                                      {
                                                         §§goto(addr0f13);
                                                      }
                                                   }
                                                   §§push(§§pop() - _loc13_);
                                                   if(!_loc33_)
                                                   {
                                                      break loop51;
                                                   }
                                                   _loc19_ = §§pop();
                                                   §§push(_loc8_.cameraY);
                                                   continue loop49;
                                                }
                                                §§goto(addr0ecd);
                                             }
                                             §§goto(addr100f);
                                          }
                                          §§goto(addr120b);
                                       }
                                       §§goto(addr1207);
                                    }
                                    §§goto(addr12b2);
                                 }
                                 §§goto(addr1349);
                              }
                              §§push(_loc20_);
                              if(_loc33_ || Boolean(param1))
                              {
                                 §§goto(addr0f61);
                                 §§push(_loc16_);
                              }
                              §§goto(addr0fb0);
                           }
                           loop58:
                           while(true)
                           {
                              loop59:
                              while(true)
                              {
                                 loop61:
                                 while(true)
                                 {
                                    loop68:
                                    while(true)
                                    {
                                       §§push(§§pop() - §§pop());
                                       if(_loc33_ || Boolean(this))
                                       {
                                          addr0ecd:
                                          _loc21_ = §§pop();
                                          loop69:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(_loc21_);
                                                §§push(_loc17_);
                                                if(!(_loc32_ && Boolean(_loc3_)))
                                                {
                                                   §§push(§§pop() * §§pop());
                                                   if(!_loc32_)
                                                   {
                                                      §§push(_loc20_);
                                                      if(_loc33_)
                                                      {
                                                         loop71:
                                                         while(true)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc18_);
                                                               if(_loc33_)
                                                               {
                                                                  §§push(§§pop() * §§pop());
                                                                  if(!_loc33_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(§§pop() - §§pop());
                                                                  if(!(_loc33_ || Boolean(this)))
                                                                  {
                                                                     break loop69;
                                                                  }
                                                                  _loc22_ = §§pop();
                                                                  §§push(_loc19_);
                                                                  §§push(_loc18_);
                                                                  if(!(_loc32_ && Boolean(_loc3_)))
                                                                  {
                                                                     §§push(§§pop() * §§pop());
                                                                     §§push(_loc21_);
                                                                  }
                                                                  §§push(_loc16_);
                                                                  if(_loc32_)
                                                                  {
                                                                     break loop71;
                                                                  }
                                                               }
                                                               addr0fbf:
                                                               §§push(§§pop() - §§pop() * §§pop());
                                                               if(!(_loc32_ && Boolean(_loc2_)))
                                                               {
                                                                  while(true)
                                                                  {
                                                                     §§push(Number(§§pop()));
                                                                     if(!(_loc32_ && Boolean(_loc2_)))
                                                                     {
                                                                        _loc23_ = §§pop();
                                                                        break loop57;
                                                                     }
                                                                     addr0fed:
                                                                     §§push(_loc25_);
                                                                     if(_loc33_ || Boolean(_loc3_))
                                                                     {
                                                                        §§push(§§pop() * §§pop());
                                                                        if(!_loc32_)
                                                                        {
                                                                           break loop68;
                                                                        }
                                                                        §§goto(addr1207);
                                                                     }
                                                                     §§goto(addr120b);
                                                                  }
                                                                  addr100f:
                                                                  §§push(§§pop() * _loc25_);
                                                                  break loop59;
                                                               }
                                                               _loc25_ = §§pop();
                                                               §§push(_loc22_ * _loc25_);
                                                               if(_loc33_ || Boolean(this))
                                                               {
                                                                  break loop69;
                                                               }
                                                               break loop58;
                                                            }
                                                            addr0f61:
                                                            §§push(§§pop() * §§pop());
                                                            if(!(_loc33_ || Boolean(_loc2_)))
                                                            {
                                                               break loop69;
                                                            }
                                                            §§push(_loc19_);
                                                            if(_loc32_ && Boolean(_loc3_))
                                                            {
                                                               break loop52;
                                                            }
                                                         }
                                                         §§push(§§pop() - §§pop() * §§pop());
                                                         if(!(_loc32_ && Boolean(param1)))
                                                         {
                                                            _loc24_ = Number(§§pop());
                                                            §§push(1 / Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_));
                                                            break;
                                                         }
                                                         break loop51;
                                                      }
                                                      break loop61;
                                                   }
                                                   break loop68;
                                                }
                                                §§push(_loc17_);
                                                break loop71;
                                             }
                                             addr0fb0:
                                             §§push(Number(§§pop()));
                                             if(_loc32_ && Boolean(param1))
                                             {
                                                break loop59;
                                             }
                                             §§goto(addr0fbf);
                                          }
                                          §§push(Number(§§pop()));
                                          if(!_loc33_)
                                          {
                                             break loop51;
                                          }
                                       }
                                       _loc22_ = §§pop();
                                       §§push(_loc23_);
                                       if(!(_loc32_ && Boolean(param1)))
                                       {
                                          §§goto(addr0fed);
                                       }
                                       §§goto(addr100f);
                                    }
                                    _loc23_ = §§pop();
                                    while(true)
                                    {
                                       if(_loc33_)
                                       {
                                          §§goto(addr100f);
                                          §§push(_loc24_);
                                       }
                                       §§goto(addr12b2);
                                    }
                                    §§goto(addr12ce);
                                 }
                                 §§goto(addr115d);
                              }
                              while(true)
                              {
                                 §§push(Number(§§pop()));
                                 if(!_loc32_)
                                 {
                                    _loc24_ = §§pop();
                                    _loc28_.cameraX = _loc22_;
                                    if(_loc32_)
                                    {
                                       break loop47;
                                    }
                                    _loc28_.cameraY = _loc23_;
                                    _loc28_.cameraZ = _loc24_;
                                    if(_loc33_)
                                    {
                                       §§push(_loc28_);
                                       §§push(_loc13_);
                                       if(!_loc32_)
                                       {
                                          loop63:
                                          while(true)
                                          {
                                             §§push(_loc22_);
                                             if(!_loc32_)
                                             {
                                                §§push(§§pop() * §§pop());
                                                if(_loc32_)
                                                {
                                                   break;
                                                }
                                                loop64:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(_loc14_);
                                                      if(_loc33_ || Boolean(_loc3_))
                                                      {
                                                         §§push(_loc23_);
                                                         if(!(_loc33_ || Boolean(_loc2_)))
                                                         {
                                                            break;
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         if(_loc32_)
                                                         {
                                                            break loop64;
                                                         }
                                                      }
                                                      §§push(§§pop() + §§pop());
                                                      if(_loc33_)
                                                      {
                                                         §§push(_loc15_);
                                                         if(!_loc32_)
                                                         {
                                                            §§push(_loc24_);
                                                            break;
                                                         }
                                                         break loop64;
                                                      }
                                                      break loop63;
                                                   }
                                                   §§push(§§pop() * §§pop());
                                                   break;
                                                }
                                             }
                                             break loop64;
                                          }
                                       }
                                       §§pop().alternativa3d::offset = §§pop();
                                       §§push(_loc29_);
                                       §§push(_loc22_);
                                       if(!(_loc32_ && Boolean(this)))
                                       {
                                          §§push(-§§pop());
                                       }
                                       §§pop().alternativa3d::cameraX = §§pop();
                                       if(!_loc33_)
                                       {
                                          break loop55;
                                       }
                                       §§push(_loc29_);
                                       §§push(_loc23_);
                                       if(_loc33_)
                                       {
                                          §§push(-§§pop());
                                       }
                                       §§pop().alternativa3d::cameraY = §§pop();
                                       §§push(_loc29_);
                                       §§push(_loc24_);
                                       if(!(_loc32_ && Boolean(this)))
                                       {
                                          §§push(-§§pop());
                                       }
                                       §§pop().alternativa3d::cameraZ = §§pop();
                                       if(_loc33_ || Boolean(param1))
                                       {
                                          loop66:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(_loc29_);
                                                §§push(_loc2_.cameraX);
                                                if(!_loc32_)
                                                {
                                                   §§push(-§§pop());
                                                   if(!_loc33_)
                                                   {
                                                      break loop66;
                                                   }
                                                   §§push(_loc22_);
                                                   if(_loc32_)
                                                   {
                                                      break;
                                                   }
                                                   §§push(§§pop() * §§pop());
                                                   if(!_loc33_)
                                                   {
                                                      break loop66;
                                                   }
                                                }
                                                §§push(_loc2_.cameraY);
                                                if(!(_loc32_ && Boolean(this)))
                                                {
                                                   §§push(_loc23_);
                                                   if(_loc33_ || Boolean(param1))
                                                   {
                                                      §§push(§§pop() * §§pop());
                                                      if(!(_loc32_ && Boolean(param1)))
                                                      {
                                                         §§push(§§pop() - §§pop());
                                                         if(_loc33_ || Boolean(param1))
                                                         {
                                                            break loop66;
                                                         }
                                                         §§goto(addr1146);
                                                      }
                                                      §§goto(addr1145);
                                                   }
                                                   addr1144:
                                                   §§push(§§pop() * §§pop());
                                                }
                                                §§goto(addr1145);
                                             }
                                             §§goto(addr1144);
                                          }
                                          §§push(_loc2_.cameraZ);
                                          if(_loc33_)
                                          {
                                             break loop67;
                                          }
                                          addr1146:
                                          §§pop().alternativa3d::offset = §§pop() - §§pop();
                                          addr1145:
                                          if(_loc33_)
                                          {
                                             §§push(_loc11_.offset);
                                             break loop58;
                                          }
                                          break loop53;
                                       }
                                       §§goto(addr11e6);
                                    }
                                    §§goto(addr11ab);
                                 }
                                 §§goto(addr1207);
                              }
                              §§goto(addr12b2);
                           }
                           while(true)
                           {
                              §§push(-_loc12_.offset);
                              if(_loc33_)
                              {
                                 addr115d:
                                 if(§§pop() < §§pop())
                                 {
                                    §§push(_loc12_);
                                    §§push(_loc12_.cameraX);
                                    if(!_loc32_)
                                    {
                                       §§push(-§§pop());
                                    }
                                    §§pop().alternativa3d::cameraX = §§pop();
                                    if(_loc32_)
                                    {
                                       break;
                                    }
                                    §§push(_loc12_);
                                    §§push(_loc12_.cameraY);
                                    if(_loc33_ || Boolean(_loc2_))
                                    {
                                       §§push(-§§pop());
                                    }
                                    §§pop().alternativa3d::cameraY = §§pop();
                                    §§push(_loc12_);
                                    §§push(_loc12_.cameraZ);
                                    if(_loc33_)
                                    {
                                       §§push(-§§pop());
                                    }
                                    §§pop().alternativa3d::cameraZ = §§pop();
                                    §§push(_loc12_);
                                    §§push(_loc12_.offset);
                                    if(_loc33_)
                                    {
                                       §§push(-§§pop());
                                    }
                                    §§pop().alternativa3d::offset = §§pop();
                                    §§push(_loc11_);
                                    §§push(_loc11_.cameraX);
                                    if(!(_loc32_ && Boolean(_loc3_)))
                                    {
                                       §§push(-§§pop());
                                    }
                                    §§pop().alternativa3d::cameraX = §§pop();
                                    §§push(_loc11_);
                                    §§push(_loc11_.cameraY);
                                    if(!_loc32_)
                                    {
                                       §§push(-§§pop());
                                    }
                                    §§pop().alternativa3d::cameraY = §§pop();
                                    §§push(_loc11_);
                                    §§push(_loc11_.cameraZ);
                                    if(!_loc32_)
                                    {
                                       §§push(-§§pop());
                                    }
                                    §§pop().alternativa3d::cameraZ = §§pop();
                                    if(_loc32_)
                                    {
                                       break loop49;
                                    }
                                    §§push(_loc11_);
                                    §§push(_loc11_.offset);
                                    if(_loc33_)
                                    {
                                       §§push(-§§pop());
                                    }
                                    §§pop().alternativa3d::offset = §§pop();
                                    if(!(_loc33_ || Boolean(_loc2_)))
                                    {
                                       break loop48;
                                    }
                                 }
                                 addr1207:
                                 §§push(_loc26_.offset);
                                 §§push(_loc27_.offset);
                              }
                              §§goto(addr120b);
                           }
                           §§goto(addr12b2);
                        }
                        _loc20_ = §§pop() - _loc14_;
                        loop47:
                        while(true)
                        {
                           while(true)
                           {
                              while(true)
                              {
                                 while(true)
                                 {
                                    if(_loc33_)
                                    {
                                       loop51:
                                       while(true)
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
                                                      §§push(_loc8_.cameraZ);
                                                      §§push(_loc15_);
                                                      if(!_loc32_)
                                                      {
                                                         break loop46;
                                                      }
                                                      addr120b:
                                                      §§push(-§§pop());
                                                      break loop52;
                                                   }
                                                   §§goto(addr12b2);
                                                }
                                                §§goto(addr129d);
                                             }
                                          }
                                          while(true)
                                          {
                                             if(§§pop() < §§pop())
                                             {
                                                §§push(_loc26_);
                                                §§push(_loc26_.cameraX);
                                                if(_loc33_)
                                                {
                                                   §§push(-§§pop());
                                                }
                                                §§pop().alternativa3d::cameraX = §§pop();
                                                if(_loc33_ || Boolean(param1))
                                                {
                                                   §§push(_loc26_);
                                                   §§push(_loc26_.cameraY);
                                                   if(_loc33_)
                                                   {
                                                      §§push(-§§pop());
                                                   }
                                                   §§pop().alternativa3d::cameraY = §§pop();
                                                   §§push(_loc26_);
                                                   §§push(_loc26_.cameraZ);
                                                   if(!_loc32_)
                                                   {
                                                      §§push(-§§pop());
                                                   }
                                                   §§pop().alternativa3d::cameraZ = §§pop();
                                                }
                                                §§push(_loc26_);
                                                §§push(_loc26_.offset);
                                                if(!(_loc32_ && Boolean(this)))
                                                {
                                                   §§push(-§§pop());
                                                }
                                                §§pop().alternativa3d::offset = §§pop();
                                                if(!(_loc33_ || Boolean(_loc3_)))
                                                {
                                                   break loop53;
                                                }
                                                §§push(_loc27_);
                                                §§push(_loc27_.cameraX);
                                                if(!_loc32_)
                                                {
                                                   §§push(-§§pop());
                                                }
                                                §§pop().alternativa3d::cameraX = §§pop();
                                                §§push(_loc27_);
                                                §§push(_loc27_.cameraY);
                                                if(_loc33_)
                                                {
                                                   §§push(-§§pop());
                                                }
                                                §§pop().alternativa3d::cameraY = §§pop();
                                                §§push(_loc27_);
                                                §§push(_loc27_.cameraZ);
                                                if(!_loc32_)
                                                {
                                                   §§push(-§§pop());
                                                }
                                                §§pop().alternativa3d::cameraZ = §§pop();
                                                §§push(_loc27_);
                                                §§push(_loc27_.offset);
                                                if(_loc33_)
                                                {
                                                   §§push(-§§pop());
                                                }
                                                §§pop().alternativa3d::offset = §§pop();
                                                if(!_loc33_)
                                                {
                                                   break;
                                                }
                                             }
                                             addr12b2:
                                             §§push(_loc29_.offset);
                                             break loop51;
                                          }
                                          §§goto(addr12ce);
                                       }
                                       if(§§pop() >= -_loc28_.offset)
                                       {
                                          break;
                                       }
                                       §§push(_loc29_);
                                       §§push(_loc29_.cameraX);
                                       if(_loc33_)
                                       {
                                          §§push(-§§pop());
                                       }
                                       §§pop().alternativa3d::cameraX = §§pop();
                                       addr12ce:
                                       §§push(_loc29_);
                                       §§push(_loc29_.cameraY);
                                       if(!_loc32_)
                                       {
                                          §§push(-§§pop());
                                       }
                                       §§pop().alternativa3d::cameraY = §§pop();
                                    }
                                    break loop53;
                                 }
                                 §§goto(addr1349);
                              }
                              §§push(_loc28_);
                              §§push(_loc28_.cameraY);
                              if(_loc33_)
                              {
                                 §§push(-§§pop());
                              }
                              §§pop().alternativa3d::cameraY = §§pop();
                              break loop47;
                           }
                           §§push(_loc28_);
                           §§push(_loc28_.cameraX);
                           if(_loc33_)
                           {
                              §§push(-§§pop());
                           }
                           §§pop().alternativa3d::cameraX = §§pop();
                           break loop49;
                        }
                        §§push(_loc28_);
                        §§push(_loc28_.cameraZ);
                        if(!_loc32_)
                        {
                           §§push(-§§pop());
                        }
                        §§pop().alternativa3d::cameraZ = §§pop();
                        §§push(_loc28_);
                        §§push(_loc28_.offset);
                        if(!(_loc32_ && Boolean(_loc2_)))
                        {
                           §§push(-§§pop());
                        }
                        §§pop().alternativa3d::offset = §§pop();
                        addr1349:
                        this.space = 2;
                        return;
                     }
                     §§push(_loc3_.cameraZ);
                     if(!_loc33_)
                     {
                        break loop43;
                     }
                     §§goto(addr0dd6);
                  }
                  addr0d53:
                  §§push(_loc27_);
                  §§push(_loc23_);
                  if(_loc33_)
                  {
                     §§push(-§§pop());
                  }
                  §§pop().alternativa3d::cameraY = §§pop();
                  §§goto(addr0d60);
               }
               §§push(_loc25_);
               break loop38;
            }
            _loc9_.z = this.boundMaxZ;
            §§goto(addr04a0);
         }
         _loc2_.z = this.boundMinZ;
         §§goto(addr0315);
      }
      
      private function calculateAABBStruct(param1:Face, param2:int, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number) : void
      {
         var _temp_1:* = true;
         var _loc21_:Boolean = false;
         var _loc22_:Boolean = _temp_1;
         var _loc16_:Wrapper = null;
         var _loc17_:Vertex = null;
         var _loc18_:* = NaN;
         var _loc19_:* = NaN;
         var _loc20_:Number = NaN;
         var _loc15_:Face = param1;
         while(_loc15_ != null)
         {
            _loc16_ = _loc15_.wrapper;
            if(!(_loc21_ && Boolean(param3)))
            {
               for(; _loc16_ != null; _loc16_ = _loc16_.next)
               {
                  _loc17_ = _loc16_.vertex;
                  if(_loc17_.transformId != param2)
                  {
                     if(!_loc21_)
                     {
                        loop2:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(_loc17_.cameraX);
                              if(_loc22_ || Boolean(param2))
                              {
                                 §§push(Number(§§pop()));
                                 if(!(_loc22_ || Boolean(param1)))
                                 {
                                    break;
                                 }
                                 _loc18_ = §§pop();
                                 if(_loc21_ && Boolean(param3))
                                 {
                                    break loop2;
                                 }
                                 §§push(_loc17_.cameraY);
                              }
                              §§push(Number(§§pop()));
                              if(_loc22_ || Boolean(param2))
                              {
                                 break;
                              }
                              §§goto(addr00bb);
                           }
                           _loc19_ = §§pop();
                           break;
                        }
                        while(true)
                        {
                           loop5:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(_loc17_.cameraZ);
                                 if(!(_loc21_ && Boolean(param3)))
                                 {
                                    addr00bb:
                                    _loc20_ = §§pop();
                                    §§push(_loc17_);
                                    §§push(param3);
                                    if(!(_loc21_ && Boolean(this)))
                                    {
                                       loop7:
                                       while(true)
                                       {
                                          loop8:
                                          while(true)
                                          {
                                             §§push(_loc18_);
                                             if(_loc22_ || Boolean(param2))
                                             {
                                                §§push(§§pop() * §§pop());
                                                if(_loc21_)
                                                {
                                                   break;
                                                }
                                                §§push(param4);
                                                if(_loc21_ && Boolean(param3))
                                                {
                                                   break loop7;
                                                }
                                             }
                                             while(true)
                                             {
                                                §§push(_loc19_);
                                                if(!(_loc21_ && Boolean(param3)))
                                                {
                                                   §§push(§§pop() * §§pop());
                                                   if(_loc22_)
                                                   {
                                                      §§push(§§pop() + §§pop());
                                                      if(!(_loc22_ || Boolean(param2)))
                                                      {
                                                         break loop8;
                                                      }
                                                      §§push(param5);
                                                      if(!(_loc22_ || Boolean(param2)))
                                                      {
                                                         break;
                                                      }
                                                   }
                                                   §§push(_loc20_);
                                                }
                                                §§push(§§pop() * §§pop());
                                                if(_loc22_)
                                                {
                                                   break loop7;
                                                }
                                                break;
                                             }
                                             addr0145:
                                          }
                                          §§goto(addr0145);
                                       }
                                       §§push(§§pop() + §§pop());
                                       if(_loc22_ || Boolean(param1))
                                       {
                                          break loop8;
                                       }
                                    }
                                    §§pop().alternativa3d::cameraX = §§pop();
                                    §§push(_loc17_);
                                    §§push(param7);
                                    if(!(_loc21_ && Boolean(param2)))
                                    {
                                       loop10:
                                       while(true)
                                       {
                                          loop11:
                                          while(true)
                                          {
                                             loop12:
                                             while(true)
                                             {
                                                loop13:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(_loc18_);
                                                      if(!_loc21_)
                                                      {
                                                         §§push(§§pop() * §§pop());
                                                         if(!(_loc22_ || Boolean(param3)))
                                                         {
                                                            break;
                                                         }
                                                         §§push(param8);
                                                         if(!(_loc22_ || Boolean(param3)))
                                                         {
                                                            break loop10;
                                                         }
                                                         §§push(_loc19_);
                                                         if(_loc21_ && Boolean(param3))
                                                         {
                                                            break loop13;
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         if(!_loc22_)
                                                         {
                                                            break loop12;
                                                         }
                                                         §§push(§§pop() + §§pop());
                                                         if(_loc21_)
                                                         {
                                                            break loop11;
                                                         }
                                                         §§push(param9);
                                                         if(!(_loc22_ || Boolean(param1)))
                                                         {
                                                            break loop10;
                                                         }
                                                      }
                                                      §§push(_loc20_);
                                                      break loop13;
                                                   }
                                                   §§goto(addr01bf);
                                                }
                                                §§push(§§pop() * §§pop());
                                                if(_loc22_)
                                                {
                                                   break;
                                                }
                                                break loop10;
                                             }
                                             §§push(§§pop() + §§pop());
                                             if(!_loc21_)
                                             {
                                                addr01bf:
                                                §§push(param10);
                                                break loop10;
                                             }
                                             break;
                                          }
                                       }
                                       §§push(§§pop() + §§pop());
                                    }
                                    break loop11;
                                 }
                                 §§push(this.boundMinZ);
                                 if(!_loc21_)
                                 {
                                    break loop5;
                                 }
                                 §§goto(addr030f);
                              }
                              §§goto(addr0321);
                           }
                           if(§§pop() < §§pop())
                           {
                              this.boundMinZ = _loc17_.cameraZ;
                           }
                           §§push(_loc17_.cameraZ);
                           break;
                        }
                        addr030f:
                        if(§§pop() > this.boundMaxZ)
                        {
                           if(_loc21_ && Boolean(param2))
                           {
                              continue;
                           }
                           addr0321:
                           this.boundMaxZ = _loc17_.cameraZ;
                           if(!(_loc22_ || Boolean(param1)))
                           {
                              continue;
                           }
                        }
                        _loc17_.transformId = param2;
                     }
                  }
               }
            }
            _loc15_ = _loc15_.processNext;
         }
         if(!_loc21_)
         {
            loop15:
            while(true)
            {
               while(true)
               {
                  if(param1.processNegative != null)
                  {
                     if(_loc21_ && Boolean(param1))
                     {
                        break;
                     }
                     this.calculateAABBStruct(param1.processNegative,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
                     if(!(_loc22_ || Boolean(this)))
                     {
                        break loop15;
                     }
                  }
                  if(param1.processPositive != null)
                  {
                     if(!_loc21_)
                     {
                        break;
                     }
                  }
                  break loop15;
               }
               this.calculateAABBStruct(param1.processPositive,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
               break;
            }
         }
         break loop15;
      }
      
      private function calculateOOBBStruct(param1:Face, param2:int, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number) : void
      {
         §§push(false);
         var _loc21_:Boolean = true;
         var _loc22_:* = §§pop();
         var _loc16_:Wrapper = null;
         var _loc17_:Vertex = null;
         var _loc18_:* = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = NaN;
         var _loc15_:Face = param1;
         while(_loc15_ != null)
         {
            _loc16_ = _loc15_.wrapper;
            if(!(_loc22_ && Boolean(param2)))
            {
               loop1:
               for(; _loc16_ != null; _loc16_ = _loc16_.next)
               {
                  _loc17_ = _loc16_.vertex;
                  if(_loc17_.transformId == param2)
                  {
                     continue;
                  }
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
                                 §§push(param3);
                                 §§push(_loc17_.cameraX);
                                 if(_loc21_)
                                 {
                                    loop8:
                                    while(true)
                                    {
                                       §§push(§§pop() * §§pop());
                                       §§push(param4);
                                       §§push(_loc17_.cameraY);
                                       if(!(_loc22_ && Boolean(param1)))
                                       {
                                          §§push(§§pop() + §§pop() * §§pop());
                                          §§push(param5);
                                          §§push(_loc17_.cameraZ);
                                          if(_loc21_ || Boolean(param1))
                                          {
                                             loop9:
                                             while(true)
                                             {
                                                loop10:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(§§pop() * §§pop());
                                                      if(_loc21_)
                                                      {
                                                         §§push(§§pop() + §§pop() + param6);
                                                         if(_loc22_ && Boolean(param1))
                                                         {
                                                            break;
                                                         }
                                                         _loc18_ = §§pop();
                                                         §§push(param7);
                                                         if(!_loc21_)
                                                         {
                                                            break loop2;
                                                         }
                                                         §§push(§§pop() * _loc17_.cameraX);
                                                         §§push(param8);
                                                         if(!_loc21_)
                                                         {
                                                            break loop10;
                                                         }
                                                         §§push(_loc17_.cameraY);
                                                         if(!(_loc21_ || Boolean(param2)))
                                                         {
                                                            break loop9;
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         if(!_loc21_)
                                                         {
                                                            break loop8;
                                                         }
                                                      }
                                                      §§push(§§pop() + §§pop());
                                                      if(!(_loc22_ && Boolean(this)))
                                                      {
                                                         break;
                                                      }
                                                      break loop7;
                                                   }
                                                   §§push(param9);
                                                   §§push(_loc17_.cameraZ);
                                                   if(_loc21_ || Boolean(this))
                                                   {
                                                      break loop9;
                                                   }
                                                   break loop3;
                                                }
                                                §§push(§§pop() * §§pop());
                                                if(_loc22_ && Boolean(param2))
                                                {
                                                   break loop5;
                                                }
                                                §§push(param12);
                                                §§push(_loc17_.cameraY);
                                                if(!_loc21_)
                                                {
                                                   break loop3;
                                                }
                                             }
                                             _loc19_ = §§pop() + §§pop() * §§pop() + param10;
                                             if(!_loc22_)
                                             {
                                                §§push(param11);
                                                §§push(_loc17_.cameraX);
                                                break loop10;
                                             }
                                             break loop6;
                                          }
                                          break loop3;
                                       }
                                       §§push(§§pop() + §§pop() * §§pop());
                                       §§push(param13);
                                       break;
                                    }
                                 }
                                 §§push(_loc17_.cameraZ);
                                 break loop3;
                              }
                              §§goto(addr01c9);
                           }
                           §§goto(addr01a8);
                        }
                        §§goto(addr018d);
                     }
                     §§push(§§pop() + §§pop() * §§pop());
                     §§push(param14);
                     if(_loc21_ || Boolean(param2))
                     {
                        §§push(§§pop() + §§pop());
                        if(_loc21_)
                        {
                           _loc20_ = §§pop();
                           §§push(_loc18_);
                           break;
                        }
                        break loop5;
                     }
                     §§goto(addr0160);
                  }
                  addr0160:
                  if(§§pop() < this.boundMinX)
                  {
                     if(!_loc21_)
                     {
                        continue;
                     }
                     this.boundMinX = _loc18_;
                  }
                  if(_loc18_ > this.boundMaxX)
                  {
                     this.boundMaxX = _loc18_;
                     if(!(_loc21_ || Boolean(param1)))
                     {
                        continue;
                     }
                  }
                  addr018d:
                  while(true)
                  {
                     §§push(_loc19_);
                     §§push(this.boundMinY);
                     if(_loc21_)
                     {
                        if(§§pop() < §§pop())
                        {
                           this.boundMinY = _loc19_;
                        }
                        if(_loc19_ > this.boundMaxY)
                        {
                           addr01a8:
                           this.boundMaxY = _loc19_;
                        }
                        if(_loc20_ < this.boundMinZ)
                        {
                           if(_loc22_)
                           {
                              break;
                           }
                           this.boundMinZ = _loc20_;
                           if(!_loc21_)
                           {
                              continue loop1;
                           }
                        }
                        addr01c9:
                        §§push(_loc20_);
                        §§push(this.boundMaxZ);
                     }
                     if(§§pop() > §§pop())
                     {
                        break;
                     }
                     addr01e3:
                     _loc17_.transformId = param2;
                     continue loop1;
                  }
                  this.boundMaxZ = _loc20_;
                  if(!(_loc21_ || Boolean(param3)))
                  {
                     continue;
                  }
                  §§goto(addr01e3);
               }
            }
            _loc15_ = _loc15_.processNext;
         }
         while(true)
         {
            if(_loc21_)
            {
               if(param1.processNegative != null)
               {
                  if(!_loc21_)
                  {
                     break;
                  }
                  this.calculateOOBBStruct(param1.processNegative,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
                  if(_loc22_ && Boolean(param3))
                  {
                     break;
                  }
               }
            }
            if(param1.processPositive != null)
            {
               if(_loc21_ || Boolean(param3))
               {
                  break;
               }
            }
            §§goto(addr0288);
         }
         this.calculateOOBBStruct(param1.processPositive,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
         addr0288:
      }
      
      private function updateAABBStruct(param1:Face, param2:int) : void
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         var _loc4_:Wrapper = null;
         var _loc5_:Vertex = null;
         var _loc3_:Face = param1;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_.wrapper;
            if(!(_loc6_ && Boolean(_loc3_)))
            {
               loop1:
               for(; _loc4_ != null; _loc4_ = _loc4_.next)
               {
                  _loc5_ = _loc4_.vertex;
                  loop2:
                  while(true)
                  {
                     loop3:
                     while(true)
                     {
                        while(true)
                        {
                           if(_loc7_ || Boolean(_loc3_))
                           {
                              if(_loc5_.transformId == param2)
                              {
                                 continue loop1;
                              }
                              §§push(_loc5_.cameraX);
                              if(_loc6_)
                              {
                                 break;
                              }
                              §§push(this.boundMinX);
                              if(!(_loc7_ || Boolean(param1)))
                              {
                                 break loop5;
                              }
                              if(§§pop() < §§pop())
                              {
                                 if(_loc6_)
                                 {
                                    break loop3;
                                 }
                                 this.boundMinX = _loc5_.cameraX;
                                 if(_loc6_)
                                 {
                                    break loop2;
                                 }
                              }
                           }
                           §§push(_loc5_.cameraX);
                           if(!_loc7_)
                           {
                              break;
                           }
                           §§push(this.boundMaxX);
                           if(_loc7_)
                           {
                              if(§§pop() > §§pop())
                              {
                                 break loop2;
                              }
                              continue loop5;
                           }
                           §§goto(addr0116);
                        }
                        §§goto(addr00ef);
                     }
                     this.boundMaxZ = _loc5_.cameraZ;
                     if(!(_loc7_ || Boolean(this)))
                     {
                        continue loop1;
                     }
                     §§goto(addr0147);
                  }
                  this.boundMaxX = _loc5_.cameraX;
                  loop4:
                  while(true)
                  {
                     loop5:
                     while(true)
                     {
                        loop6:
                        while(true)
                        {
                           §§push(_loc5_.cameraY);
                           if(_loc7_)
                           {
                              §§push(this.boundMinY);
                              if(_loc6_)
                              {
                                 break loop5;
                              }
                              while(true)
                              {
                                 if(§§pop() < §§pop())
                                 {
                                    this.boundMinY = _loc5_.cameraY;
                                    if(!(_loc7_ || Boolean(param1)))
                                    {
                                       break;
                                    }
                                 }
                                 §§push(_loc5_.cameraY);
                                 if(!_loc6_)
                                 {
                                    addr00ef:
                                    §§push(this.boundMaxY);
                                    if(_loc6_)
                                    {
                                       break loop6;
                                    }
                                    if(§§pop() > §§pop())
                                    {
                                       break;
                                    }
                                    §§push(_loc5_.cameraZ);
                                    if(!_loc7_)
                                    {
                                       break loop4;
                                    }
                                 }
                              }
                              this.boundMaxY = _loc5_.cameraY;
                              §§goto(addr0103);
                           }
                           §§push(this.boundMinZ);
                           if(!_loc6_)
                           {
                              break;
                           }
                           break loop5;
                        }
                        addr0116:
                        if(§§pop() < §§pop())
                        {
                           this.boundMinZ = _loc5_.cameraZ;
                        }
                        §§push(_loc5_.cameraZ);
                        break loop4;
                     }
                     if(§§pop() > §§pop())
                     {
                        if(!_loc6_)
                        {
                           break loop3;
                        }
                     }
                     addr0147:
                     _loc5_.transformId = param2;
                     continue loop1;
                  }
                  §§push(this.boundMaxZ);
                  break loop5;
               }
            }
            _loc3_ = _loc3_.processNext;
         }
         loop9:
         while(true)
         {
            if(_loc7_)
            {
               if(param1.processNegative == null)
               {
                  break;
               }
               if(!(_loc7_ || Boolean(param1)))
               {
                  break;
               }
            }
            this.updateAABBStruct(param1.processNegative,param2);
            while(true)
            {
               if(_loc7_ || Boolean(param1))
               {
                  break loop9;
               }
               addr01b2:
               this.updateAABBStruct(param1.processPositive,param2);
               break;
            }
            §§goto(addr01bb);
         }
         if(param1.processPositive != null)
         {
            if(_loc7_)
            {
               §§goto(addr01b2);
            }
         }
         addr01bb:
      }
      
      alternativa3d function split(param1:Camera3D, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _temp_1:* = true;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = _temp_1;
         var _loc8_:VG = null;
         var _loc7_:Face = this.faceStruct.create();
         loop0:
         while(true)
         {
            while(true)
            {
               loop8:
               while(true)
               {
                  if(!(_loc11_ && Boolean(param2)))
                  {
                     while(true)
                     {
                        §§push(this);
                        §§push(param1);
                        §§push(this.faceStruct);
                        §§push(_loc7_);
                        §§push(param2);
                        §§push(param3);
                        §§push(param4);
                        §§push(param5);
                        §§push(param5);
                        if(_loc12_)
                        {
                           §§push(param6);
                           if(_loc11_ && Boolean(param3))
                           {
                              break;
                           }
                           §§push(§§pop() - §§pop());
                        }
                        §§push(param5);
                        if(!_loc11_)
                        {
                           break;
                        }
                        addr0061:
                        §§pop().splitFaceStruct(§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop());
                        if(!(_loc12_ || Boolean(param1)))
                        {
                           break loop8;
                        }
                        if(_loc7_.processNegative == null)
                        {
                           this.next = null;
                           break loop8;
                        }
                        if(_loc11_ && Boolean(this))
                        {
                           break loop0;
                        }
                     }
                     §§goto(addr0061);
                  }
                  §§push(collector);
                  if(_loc12_)
                  {
                     if(§§pop() != null)
                     {
                        if(!(_loc11_ && Boolean(param3)))
                        {
                           break loop0;
                        }
                        break;
                     }
                     _loc8_ = new VG();
                     §§goto(addr00cb);
                  }
                  §§goto(addr00ab);
               }
               §§goto(addr025b);
            }
            _loc7_.processPositive = null;
            §§goto(addr0270);
         }
         addr00ab:
         _loc8_ = collector;
         collector = collector.next;
         _loc8_.next = null;
         addr00cb:
         this.next = _loc8_;
         if(!_loc11_)
         {
            _loc8_.faceStruct = _loc7_.processNegative;
         }
         _loc7_.processNegative = null;
         loop2:
         while(true)
         {
            loop3:
            while(true)
            {
               loop4:
               while(true)
               {
                  if(_loc12_)
                  {
                     _loc8_.object = this.object;
                     if(!(_loc12_ || Boolean(param2)))
                     {
                        break loop2;
                     }
                     _loc8_.alpha = this.alpha;
                     if(!(_loc12_ || Boolean(param1)))
                     {
                        break;
                     }
                     _loc8_.blendMode = this.blendMode;
                     _loc8_.colorTransform = this.colorTransform;
                     _loc8_.filters = this.filters;
                     if(!_loc12_)
                     {
                        break loop3;
                     }
                     _loc8_.sorting = this.sorting;
                     if(!_loc12_)
                     {
                        break loop2;
                     }
                     _loc8_.debug = this.debug;
                  }
                  _loc8_.space = this.space;
                  _loc8_.viewAligned = this.viewAligned;
                  if(_loc11_)
                  {
                     break loop1;
                  }
                  loop5:
                  while(true)
                  {
                     loop6:
                     while(true)
                     {
                        while(true)
                        {
                           if(this.viewAligned)
                           {
                              if(_loc12_ || Boolean(this))
                              {
                                 _loc8_.tma = this.tma;
                                 if(_loc11_ && Boolean(param1))
                                 {
                                    break;
                                 }
                              }
                              _loc8_.tmb = this.tmb;
                              if(!(_loc12_ || Boolean(param1)))
                              {
                                 break loop6;
                              }
                              _loc8_.tmc = this.tmc;
                              if(_loc11_)
                              {
                                 break loop2;
                              }
                              _loc8_.tmd = this.tmd;
                              if(!_loc12_)
                              {
                                 break loop5;
                              }
                              _loc8_.tmtx = this.tmtx;
                              _loc8_.tmty = this.tmty;
                              if(_loc11_)
                              {
                                 break loop1;
                              }
                           }
                           _loc8_.boundMinX = 1e+22;
                           _loc8_.boundMinY = 1e+22;
                           if(!_loc12_)
                           {
                              break loop4;
                           }
                           _loc8_.boundMinZ = 1e+22;
                           if(_loc12_)
                           {
                              break loop6;
                           }
                           §§goto(addr0264);
                        }
                        §§goto(addr0320);
                     }
                     _loc8_.boundMaxX = -1e+22;
                     _loc8_.boundMaxY = -1e+22;
                     _loc8_.boundMaxZ = -1e+22;
                     if(_loc12_ || Boolean(this))
                     {
                        §§push(_loc8_);
                        §§push(_loc8_.faceStruct);
                        var _loc9_:Object3D;
                        §§push((_loc9_ = this.object).transformId);
                        if(!(_loc11_ && Boolean(this)))
                        {
                           §§push(§§pop() + 1);
                           if(!_loc11_)
                           {
                              var _loc10_:* = §§pop();
                              §§push(_loc10_);
                              if(!_loc11_)
                              {
                                 _loc9_.transformId = _loc10_;
                              }
                           }
                        }
                        §§pop().updateAABBStruct(§§pop(),§§pop());
                        if(_loc12_ || Boolean(this))
                        {
                           break;
                        }
                        §§goto(addr02fe);
                     }
                     §§goto(addr0264);
                  }
                  if(_loc7_.processPositive != null)
                  {
                     addr0264:
                     this.faceStruct = _loc7_.processPositive;
                     break loop1;
                  }
                  this.faceStruct = null;
                  §§goto(addr02fe);
               }
               addr0270:
               this.boundMinX = 1e+22;
               if(_loc12_ || Boolean(this))
               {
                  break;
               }
               §§goto(addr02b0);
            }
            this.boundMinY = 1e+22;
            this.boundMinZ = 1e+22;
            if(!_loc11_)
            {
               this.boundMaxX = -1e+22;
               this.boundMaxY = -1e+22;
               if(_loc12_ || Boolean(this))
               {
                  break;
               }
               §§goto(addr0320);
            }
            §§goto(addr02b0);
         }
         this.boundMaxZ = -1e+22;
         addr02b0:
         §§push(this);
         §§push(this.faceStruct);
         §§push((_loc9_ = this.object).transformId);
         if(!(_loc11_ && Boolean(param1)))
         {
            §§push(§§pop() + 1);
            if(!(_loc11_ && Boolean(param2)))
            {
               _loc10_ = §§pop();
               §§push(_loc10_);
               if(!_loc11_)
               {
                  _loc9_.transformId = _loc10_;
               }
            }
         }
         §§pop().updateAABBStruct(§§pop(),§§pop());
         if(_loc11_)
         {
         }
         _loc7_.next = Face.collector;
         addr02fe:
         if(!_loc11_)
         {
            Face.collector = _loc7_;
         }
         addr0320:
      }
      
      alternativa3d function crop(param1:Camera3D, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _temp_1:* = true;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = _temp_1;
         while(true)
         {
            §§push(this);
            §§push(this);
            §§push(param1);
            §§push(this.faceStruct);
            §§push(param2);
            §§push(param3);
            §§push(param4);
            §§push(param5);
            §§push(param5);
            if(!_loc9_)
            {
               §§push(param6);
               if(_loc9_)
               {
                  break;
               }
               §§push(§§pop() - §§pop());
            }
            §§push(param5);
            if(_loc10_)
            {
               §§push(§§pop() + param6);
            }
            break;
         }
         §§pop().alternativa3d::faceStruct = §§pop().cropFaceStruct(§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop());
         if(this.faceStruct != null)
         {
            this.boundMinX = 1e+22;
            if(!(_loc9_ && Boolean(param1)))
            {
               this.boundMinY = 1e+22;
               this.boundMinZ = 1e+22;
            }
            this.boundMaxX = -1e+22;
            if(_loc10_)
            {
               this.boundMaxY = -1e+22;
               this.boundMaxZ = -1e+22;
            }
            while(true)
            {
               §§push(this);
               §§push(this.faceStruct);
               var _loc7_:Object3D;
               §§push((_loc7_ = this.object).transformId);
               if(_loc10_)
               {
                  §§push(§§pop() + 1);
                  if(!(_loc10_ || Boolean(param2)))
                  {
                     break;
                  }
               }
               var _loc8_:* = §§pop();
               §§push(_loc8_);
               if(!(_loc9_ && Boolean(param1)))
               {
                  _loc7_.transformId = _loc8_;
               }
               break;
            }
            §§pop().updateAABBStruct(§§pop(),§§pop());
         }
      }
      
      private function splitFaceStruct(param1:Camera3D, param2:Face, param3:Face, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _temp_1:* = true;
         var _loc39_:Boolean = false;
         var _loc40_:Boolean = _temp_1;
         var _loc10_:Face = null;
         var _loc11_:Face = null;
         var _loc12_:Wrapper = null;
         var _loc13_:Vertex = null;
         var _loc14_:Vertex = null;
         var _loc15_:Face = null;
         var _loc16_:Face = null;
         var _loc17_:Face = null;
         var _loc18_:Face = null;
         var _loc19_:Face = null;
         var _loc20_:Face = null;
         var _loc21_:Face = null;
         var _loc22_:Face = null;
         var _loc23_:Face = null;
         var _loc24_:Face = null;
         var _loc25_:Wrapper = null;
         var _loc26_:Wrapper = null;
         var _loc27_:Wrapper = null;
         var _loc28_:Vertex = null;
         var _loc29_:Vertex = null;
         var _loc30_:Vertex = null;
         var _loc31_:* = NaN;
         var _loc32_:* = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:* = false;
         var _loc35_:* = false;
         var _loc36_:* = false;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         loop6:
         while(true)
         {
            loop7:
            while(true)
            {
               loop8:
               while(true)
               {
                  if(_loc40_ || Boolean(this))
                  {
                     loop100:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(param2.processNegative);
                           if(!(_loc39_ && Boolean(this)))
                           {
                              if(§§pop() == null)
                              {
                                 break;
                              }
                              if(!_loc40_)
                              {
                                 break loop100;
                              }
                              this.splitFaceStruct(param1,param2.processNegative,param3,param4,param5,param6,param7,param8,param9);
                              param2.processNegative = null;
                              §§push(param3.processNegative);
                              if(!(_loc40_ || Boolean(this)))
                              {
                                 break loop8;
                              }
                           }
                           _loc15_ = §§pop();
                           _loc16_ = param3.processPositive;
                           break;
                        }
                        if(param2.processPositive == null)
                        {
                           break loop7;
                        }
                        if(_loc40_ || Boolean(param3))
                        {
                           break;
                        }
                     }
                     this.splitFaceStruct(param1,param2.processPositive,param3,param4,param5,param6,param7,param8,param9);
                     if(_loc39_ && Boolean(param3))
                     {
                        break loop6;
                     }
                  }
                  param2.processPositive = null;
                  if(_loc40_)
                  {
                     break loop6;
                  }
                  §§goto(addr014e);
               }
               §§goto(addr013b);
            }
            if(param2.wrapper != null)
            {
               addr014e:
               _loc10_ = param2;
               loop0:
               for(; _loc10_ != null; _loc10_ = _loc11_)
               {
                  _loc11_ = _loc10_.processNext;
                  _loc12_ = _loc10_.wrapper;
                  _loc28_ = _loc12_.vertex;
                  _loc12_ = _loc12_.next;
                  _loc29_ = _loc12_.vertex;
                  _loc12_ = _loc12_.next;
                  _loc30_ = _loc12_.vertex;
                  _loc12_ = _loc12_.next;
                  loop9:
                  while(true)
                  {
                     loop10:
                     while(true)
                     {
                        §§push(_loc28_.cameraX);
                        §§push(param4);
                        if(!_loc39_)
                        {
                           §§push(§§pop() * §§pop());
                           §§push(_loc28_.cameraY);
                           §§push(param5);
                           if(_loc39_ && Boolean(param1))
                           {
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           if(_loc39_ && Boolean(param3))
                           {
                              break loop9;
                           }
                        }
                        while(true)
                        {
                           §§push(§§pop() + §§pop());
                           if(_loc40_ || Boolean(param2))
                           {
                              while(true)
                              {
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       loop80:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(_loc28_.cameraZ);
                                                §§push(param6);
                                                if(!_loc39_)
                                                {
                                                   §§push(§§pop() + §§pop() * §§pop());
                                                   if(!_loc40_)
                                                   {
                                                      break loop80;
                                                   }
                                                   _loc31_ = §§pop();
                                                   if(!(_loc40_ || Boolean(param3)))
                                                   {
                                                      continue loop72;
                                                   }
                                                   §§push(_loc29_.cameraX);
                                                   if(_loc40_ || Boolean(param1))
                                                   {
                                                      §§push(param4);
                                                      if(!(_loc39_ && Boolean(this)))
                                                      {
                                                         §§push(§§pop() * §§pop());
                                                         if(_loc40_)
                                                         {
                                                            §§push(_loc29_.cameraY);
                                                            §§push(param5);
                                                            if(!(_loc39_ && Boolean(this)))
                                                            {
                                                               break loop10;
                                                            }
                                                            addr0255:
                                                            §§push(§§pop() + §§pop() * §§pop());
                                                            if(_loc40_ || Boolean(param1))
                                                            {
                                                               §§push(Number(§§pop()));
                                                               if(!(_loc39_ && Boolean(this)))
                                                               {
                                                                  _loc32_ = §§pop();
                                                                  §§push(_loc30_.cameraX);
                                                                  if(!_loc39_)
                                                                  {
                                                                     §§push(param4);
                                                                     break loop9;
                                                                  }
                                                                  §§goto(addr0365);
                                                               }
                                                            }
                                                            §§goto(addr0283);
                                                         }
                                                         else
                                                         {
                                                            §§goto(addr02e1);
                                                         }
                                                      }
                                                      §§goto(addr0287);
                                                   }
                                                   else
                                                   {
                                                      §§goto(addr0387);
                                                   }
                                                }
                                                §§goto(addr0297);
                                             }
                                             §§goto(addr029f);
                                          }
                                          §§goto(addr0302);
                                       }
                                       §§goto(addr02bb);
                                    }
                                    §§goto(addr04fa);
                                 }
                                 §§goto(addr0506);
                              }
                              §§goto(addr02a5);
                           }
                           §§goto(addr036e);
                        }
                        §§goto(addr0372);
                     }
                     §§push(§§pop() + §§pop() * §§pop());
                     if(_loc40_ || Boolean(this))
                     {
                        §§push(_loc29_.cameraZ);
                        §§push(param6);
                        if(!_loc40_)
                        {
                           break loop77;
                        }
                        §§goto(addr0255);
                     }
                     §§goto(addr029f);
                  }
                  addr0283:
                  addr0287:
                  loop11:
                  while(true)
                  {
                     §§push(§§pop() * §§pop());
                     §§push(_loc30_.cameraY);
                     §§push(param5);
                     if(_loc40_ || Boolean(this))
                     {
                        addr0297:
                        §§push(§§pop() * §§pop());
                        if(_loc39_)
                        {
                           break;
                        }
                        §§push(§§pop() + §§pop());
                        §§push(_loc30_.cameraZ);
                        §§push(param6);
                     }
                     addr02a5:
                     loop12:
                     while(true)
                     {
                        §§push(§§pop() * §§pop());
                        if(!(_loc39_ && Boolean(param2)))
                        {
                           §§push(§§pop() + §§pop());
                           if(_loc39_)
                           {
                              break;
                           }
                           _loc33_ = §§pop();
                           §§push(_loc31_);
                           §§push(param8);
                        }
                        var _temp_5:* = §§pop() < §§pop();
                        while(true)
                        {
                           loop14:
                           while(true)
                           {
                              loop69:
                              while(true)
                              {
                                 loop70:
                                 while(true)
                                 {
                                    loop74:
                                    while(true)
                                    {
                                       §§push(_temp_5);
                                       §§push(_temp_5);
                                       if(_loc40_ || Boolean(param2))
                                       {
                                          while(true)
                                          {
                                             if(!§§pop())
                                             {
                                                §§pop();
                                                if(!_loc40_)
                                                {
                                                   break;
                                                }
                                                §§push(_loc32_ < param8);
                                                if(!_loc40_)
                                                {
                                                   break loop74;
                                                }
                                                §§push(Boolean(§§pop()));
                                             }
                                             var _temp_85:* = §§pop();
                                             §§push(_temp_85);
                                             §§push(Boolean(_temp_85));
                                             if(!_loc39_)
                                             {
                                                if(!§§pop())
                                                {
                                                   §§pop();
                                                   §§push(_loc33_);
                                                   if(_loc40_)
                                                   {
                                                      §§push(param8);
                                                      break loop11;
                                                   }
                                                   break loop12;
                                                }
                                                addr0320:
                                                addr0304:
                                                §§push(Boolean(§§pop()));
                                                if(_loc40_ || Boolean(this))
                                                {
                                                   _loc34_ = §§pop();
                                                   §§push(_loc31_);
                                                   break loop12;
                                                }
                                                var _temp_87:* = Boolean(§§pop());
                                                §§push(_temp_87);
                                                §§push(_temp_87);
                                             }
                                             if(!§§pop())
                                             {
                                                if(_loc39_ && Boolean(param1))
                                                {
                                                   break loop70;
                                                }
                                                §§pop();
                                                if(_loc40_)
                                                {
                                                   §§push(_loc32_);
                                                   §§push(param9);
                                                   if(_loc39_)
                                                   {
                                                      break loop69;
                                                   }
                                                   §§push(§§pop() > §§pop());
                                                   if(!_loc40_)
                                                   {
                                                      break loop14;
                                                   }
                                                   §§push(Boolean(§§pop()));
                                                }
                                                else
                                                {
                                                   §§goto(addr03b2);
                                                }
                                             }
                                             var _temp_89:* = §§pop();
                                             §§push(_temp_89);
                                             §§push(_temp_89);
                                             if(_loc39_ && Boolean(param1))
                                             {
                                                continue loop15;
                                             }
                                          }
                                          §§goto(addr0504);
                                       }
                                       if(!Boolean(§§pop()))
                                       {
                                          break loop14;
                                       }
                                       §§goto(addr0369);
                                    }
                                    §§goto(addr0372);
                                 }
                                 §§goto(addr04c4);
                              }
                              addr0372:
                              var _temp_82:* = §§pop() < §§pop();
                              §§push(_temp_82);
                              if(_temp_82)
                              {
                                 §§pop();
                                 while(true)
                                 {
                                    if(!_loc39_)
                                    {
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc32_);
                                             if(_loc40_)
                                             {
                                                addr0387:
                                                §§push(§§pop() < param8);
                                                if(_loc40_ || Boolean(this))
                                                {
                                                   addr0399:
                                                   var _temp_84:* = Boolean(§§pop());
                                                   §§push(_temp_84);
                                                   §§push(_temp_84);
                                                   if(_loc40_)
                                                   {
                                                      §§push(Boolean(§§pop()));
                                                   }
                                                   continue loop15;
                                                }
                                                §§goto(addr04fa);
                                             }
                                             else
                                             {
                                                §§goto(addr03b4);
                                             }
                                          }
                                          §§goto(addr06d0);
                                       }
                                       §§goto(addr0517);
                                    }
                                    §§goto(addr06d6);
                                 }
                                 §§goto(addr06db);
                              }
                              §§goto(addr0399);
                           }
                           §§pop();
                           addr0369:
                           _loc35_ = _loc33_ > param9;
                           addr0365:
                           addr036e:
                           §§push(_loc31_);
                           §§push(param8);
                           break loop69;
                        }
                        loop15:
                        while(true)
                        {
                           while(true)
                           {
                              if(§§pop())
                              {
                                 if(_loc40_)
                                 {
                                    §§pop();
                                    if(!_loc40_)
                                    {
                                       break;
                                    }
                                    §§push(_loc33_ < param8);
                                    if(!(_loc40_ || Boolean(param1)))
                                    {
                                       break loop15;
                                    }
                                    §§push(Boolean(§§pop()));
                                 }
                              }
                              §§push(Boolean(§§pop()));
                              if(!_loc39_)
                              {
                                 break loop15;
                              }
                              §§goto(addr04eb);
                           }
                           addr0504:
                           §§goto(addr0506);
                        }
                        _loc36_ = §§pop();
                        loop1:
                        for(; _loc12_ != null; _loc12_ = _loc12_.next)
                        {
                           _loc13_ = _loc12_.vertex;
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
                                       while(true)
                                       {
                                          if(!(_loc39_ && Boolean(param3)))
                                          {
                                             §§push(_loc13_.cameraX);
                                             §§push(param4);
                                             if(_loc40_ || Boolean(param2))
                                             {
                                                §§push(§§pop() * §§pop());
                                                if(!_loc39_)
                                                {
                                                   loop22:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_loc13_.cameraY);
                                                         §§push(param5);
                                                         if(_loc40_)
                                                         {
                                                            §§push(§§pop() + §§pop() * §§pop());
                                                            if(_loc39_)
                                                            {
                                                               break;
                                                            }
                                                            §§push(_loc13_.cameraZ);
                                                            if(!_loc40_)
                                                            {
                                                               break loop22;
                                                            }
                                                            §§push(param6);
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         if(!(_loc39_ && Boolean(param1)))
                                                         {
                                                            break loop22;
                                                         }
                                                         break loop20;
                                                      }
                                                   }
                                                   _loc37_ = §§pop() + §§pop();
                                                   §§push(_loc37_);
                                                   break loop23;
                                                }
                                                break;
                                             }
                                             if(§§pop() < §§pop())
                                             {
                                                §§push(true);
                                                if(!(_loc40_ || Boolean(param3)))
                                                {
                                                   break loop18;
                                                }
                                                §§push(Boolean(§§pop()));
                                                if(!_loc39_)
                                                {
                                                   _loc34_ = §§pop();
                                                   if(_loc40_)
                                                   {
                                                      break loop17;
                                                   }
                                                   break loop19;
                                                }
                                             }
                                             else
                                             {
                                                §§push(false);
                                                if(_loc40_ || Boolean(param1))
                                                {
                                                   §§push(Boolean(§§pop()));
                                                   if(_loc39_)
                                                   {
                                                      break loop18;
                                                   }
                                                }
                                             }
                                             _loc36_ = §§pop();
                                             if(!(_loc40_ || Boolean(param1)))
                                             {
                                                break loop17;
                                             }
                                          }
                                          §§push(_loc37_);
                                          break;
                                       }
                                       §§push(param9);
                                       break;
                                    }
                                    if(§§pop() <= §§pop())
                                    {
                                       break loop17;
                                    }
                                    if(!_loc39_)
                                    {
                                       break;
                                    }
                                    continue loop1;
                                 }
                                 §§push(true);
                                 if(!_loc39_)
                                 {
                                    §§push(Boolean(§§pop()));
                                 }
                                 break;
                              }
                              _loc35_ = §§pop();
                              if(_loc40_)
                              {
                                 break;
                              }
                              continue loop1;
                           }
                           _loc13_.offset = _loc37_;
                        }
                        addr04c4:
                        §§push(_loc34_);
                        if(!_loc39_)
                        {
                           §§push(!§§pop());
                        }
                        if(§§pop())
                        {
                           if(_loc21_ != null)
                           {
                              _loc22_.processNext = _loc10_;
                           }
                           else
                           {
                              _loc21_ = _loc10_;
                           }
                           _loc22_ = _loc10_;
                           continue loop0;
                        }
                        addr0506:
                        addr04eb:
                        §§push(!_loc35_);
                        if(!(_loc39_ && Boolean(param3)))
                        {
                           addr04fa:
                           if(§§pop())
                           {
                              while(true)
                              {
                                 if(!_loc39_)
                                 {
                                    break loop16;
                                 }
                                 addr0517:
                                 _loc20_.processNext = _loc10_;
                                 break;
                              }
                              addr0527:
                              _loc20_ = _loc10_;
                              addr06c0:
                              continue loop0;
                           }
                           _loc28_.offset = _loc31_;
                           _loc29_.offset = _loc32_;
                           addr06d0:
                           _loc30_.offset = _loc33_;
                           addr06db:
                           _loc23_ = _loc10_.create();
                           addr06d6:
                           while(true)
                           {
                              if(!(_loc39_ && Boolean(param1)))
                              {
                                 _loc23_.material = _loc10_.material;
                                 if(_loc39_)
                                 {
                                    break;
                                 }
                                 param1.lastFace.next = _loc23_;
                                 if(!(_loc40_ || Boolean(this)))
                                 {
                                    break;
                                 }
                              }
                              param1.lastFace = _loc23_;
                              break;
                           }
                           _loc24_ = _loc10_.create();
                           if(_loc40_)
                           {
                              _loc24_.material = _loc10_.material;
                              if(!_loc39_)
                              {
                                 param1.lastFace.next = _loc24_;
                                 if(_loc40_ || Boolean(param2))
                                 {
                                    param1.lastFace = _loc24_;
                                 }
                              }
                           }
                           _loc25_ = null;
                           _loc26_ = null;
                           §§push(_loc10_.wrapper.next);
                           if(!_loc39_)
                           {
                              §§push(§§pop().alternativa3d::next);
                           }
                           _loc12_ = §§pop();
                           if(_loc40_)
                           {
                              loop3:
                              while(true)
                              {
                                 §§push(_loc12_.next);
                                 do
                                 {
                                    if(§§pop() == null)
                                    {
                                       break loop3;
                                    }
                                    §§push(_loc12_.next);
                                 }
                                 while(!(_loc40_ || Boolean(this)));
                                 _loc12_ = §§pop();
                              }
                           }
                           _loc28_ = _loc12_.vertex;
                           if(_loc40_ || Boolean(this))
                           {
                              §§push(_loc28_.offset);
                              if(!_loc39_)
                              {
                                 §§push(Number(§§pop()));
                              }
                              _loc31_ = §§pop();
                           }
                           _loc12_ = _loc10_.wrapper;
                           while(true)
                           {
                              if(!(_loc39_ && Boolean(param1)))
                              {
                                 loop5:
                                 while(_loc12_ != null)
                                 {
                                    _loc29_ = _loc12_.vertex;
                                    _loc32_ = _loc29_.offset;
                                    loop27:
                                    while(true)
                                    {
                                       loop28:
                                       while(true)
                                       {
                                          loop57:
                                          while(true)
                                          {
                                             loop62:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   if(!(_loc39_ && Boolean(param1)))
                                                   {
                                                      §§push(_loc31_);
                                                      if(!_loc40_)
                                                      {
                                                         break;
                                                      }
                                                      var _temp_69:* = §§pop() < param8;
                                                      §§push(_temp_69);
                                                      §§push(_temp_69);
                                                      if(_loc39_)
                                                      {
                                                         break loop62;
                                                      }
                                                      §§push(Boolean(§§pop()));
                                                      if(_loc39_ && Boolean(param2))
                                                      {
                                                         break loop57;
                                                      }
                                                      if(!§§pop())
                                                      {
                                                         break loop28;
                                                      }
                                                      §§pop();
                                                      if(_loc39_ && Boolean(this))
                                                      {
                                                         break loop27;
                                                      }
                                                   }
                                                   §§push(_loc32_);
                                                   if(_loc40_ || Boolean(param3))
                                                   {
                                                      §§push(§§pop() > param9);
                                                      if(!_loc39_)
                                                      {
                                                         break loop28;
                                                      }
                                                      §§goto(addr08b0);
                                                   }
                                                   else
                                                   {
                                                      §§goto(addr086d);
                                                   }
                                                }
                                                §§goto(addr08dc);
                                             }
                                             §§goto(addr0887);
                                          }
                                          §§push(Boolean(§§pop()));
                                          break loop62;
                                       }
                                       var _temp_62:* = §§pop();
                                       §§push(_temp_62);
                                       §§push(_temp_62);
                                       if(_loc40_ || Boolean(param2))
                                       {
                                          loop58:
                                          while(true)
                                          {
                                             loop59:
                                             while(true)
                                             {
                                                loop60:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(Boolean(§§pop()));
                                                      if(_loc40_)
                                                      {
                                                         if(§§pop())
                                                         {
                                                            break;
                                                         }
                                                         if(!_loc40_)
                                                         {
                                                            break loop60;
                                                         }
                                                         §§pop();
                                                         §§push(_loc31_);
                                                         if(!(_loc40_ || Boolean(this)))
                                                         {
                                                            break loop59;
                                                         }
                                                         §§push(§§pop() > param9);
                                                         if(_loc39_ && Boolean(param3))
                                                         {
                                                            break loop58;
                                                         }
                                                         var _temp_67:* = §§pop();
                                                         §§push(_temp_67);
                                                         §§push(_temp_67);
                                                         if(_loc40_)
                                                         {
                                                            break loop57;
                                                         }
                                                      }
                                                      addr0887:
                                                      if(§§pop())
                                                      {
                                                         if(!_loc39_)
                                                         {
                                                            break loop58;
                                                         }
                                                      }
                                                      break;
                                                   }
                                                   addr08b0:
                                                   if(§§pop())
                                                   {
                                                      if(_loc40_ || Boolean(param3))
                                                      {
                                                         break loop27;
                                                      }
                                                      break loop29;
                                                   }
                                                   §§goto(addr0c54);
                                                }
                                                §§push(Boolean(§§pop()));
                                                break loop61;
                                             }
                                             §§push(param8);
                                             if(!(_loc39_ && Boolean(param1)))
                                             {
                                                §§push(§§pop() < §§pop());
                                                break loop60;
                                             }
                                             §§goto(addr08d4);
                                          }
                                          §§pop();
                                          §§push(_loc32_);
                                          break loop59;
                                       }
                                       break loop57;
                                    }
                                    loop29:
                                    while(true)
                                    {
                                       loop30:
                                       while(true)
                                       {
                                          loop36:
                                          while(true)
                                          {
                                             §§push(param7);
                                             if(_loc40_ || Boolean(param2))
                                             {
                                                addr08dc:
                                                _loc38_ = (§§pop() - _loc31_) / (_loc32_ - _loc31_);
                                                addr08d4:
                                                if(_loc40_ || Boolean(param1))
                                                {
                                                   _loc13_ = _loc29_.create();
                                                   loop37:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         if(!_loc39_)
                                                         {
                                                            param1.lastVertex.next = _loc13_;
                                                            if(!(_loc40_ || Boolean(param2)))
                                                            {
                                                               break;
                                                            }
                                                            param1.lastVertex = _loc13_;
                                                            if(!_loc40_)
                                                            {
                                                               break loop37;
                                                            }
                                                         }
                                                         §§push(_loc13_);
                                                         §§push(_loc28_.x);
                                                         if(_loc40_)
                                                         {
                                                            §§push(_loc29_.x);
                                                            if(_loc40_)
                                                            {
                                                               while(true)
                                                               {
                                                                  §§push(_loc28_.x);
                                                                  if(!_loc39_)
                                                                  {
                                                                     §§push(§§pop() - §§pop());
                                                                     if(_loc39_ && Boolean(param3))
                                                                     {
                                                                        break;
                                                                     }
                                                                     §§push(_loc38_);
                                                                  }
                                                                  §§push(§§pop() * §§pop());
                                                                  break;
                                                               }
                                                            }
                                                            §§push(§§pop() + §§pop());
                                                         }
                                                         §§pop().x = §§pop();
                                                         if(_loc40_)
                                                         {
                                                            §§push(_loc13_);
                                                            §§push(_loc28_.y);
                                                            if(!_loc39_)
                                                            {
                                                               loop51:
                                                               while(true)
                                                               {
                                                                  while(true)
                                                                  {
                                                                     §§push(_loc29_.y);
                                                                     if(_loc40_ || Boolean(this))
                                                                     {
                                                                        §§push(_loc28_.y);
                                                                        if(_loc39_ && Boolean(this))
                                                                        {
                                                                           break;
                                                                        }
                                                                        §§push(§§pop() - §§pop());
                                                                        if(!(_loc40_ || Boolean(param3)))
                                                                        {
                                                                           break loop51;
                                                                        }
                                                                     }
                                                                     §§push(_loc38_);
                                                                     break;
                                                                  }
                                                                  §§push(§§pop() * §§pop());
                                                                  break;
                                                               }
                                                            }
                                                            §§pop().y = §§pop();
                                                            if(_loc40_ || Boolean(param3))
                                                            {
                                                               §§push(_loc13_);
                                                               §§push(_loc28_.z);
                                                               if(!(_loc39_ && Boolean(param3)))
                                                               {
                                                                  §§push(_loc29_.z);
                                                                  if(_loc40_ || Boolean(this))
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc28_.z);
                                                                        if(_loc40_ || Boolean(param3))
                                                                        {
                                                                           §§push(§§pop() - §§pop());
                                                                           if(_loc39_)
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(_loc38_);
                                                                        }
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§push(§§pop() + §§pop());
                                                               }
                                                               §§pop().z = §§pop();
                                                               break;
                                                            }
                                                            break loop37;
                                                         }
                                                         break;
                                                      }
                                                      §§push(_loc13_);
                                                      §§push(_loc28_.u);
                                                      if(_loc40_ || Boolean(param3))
                                                      {
                                                         §§push(_loc29_.u);
                                                         if(_loc40_)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc28_.u);
                                                               if(!(_loc39_ && Boolean(this)))
                                                               {
                                                                  §§push(§§pop() - §§pop());
                                                                  if(!_loc40_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(_loc38_);
                                                               }
                                                               §§push(§§pop() * §§pop());
                                                               break;
                                                            }
                                                         }
                                                         §§push(§§pop() + §§pop());
                                                      }
                                                      §§pop().u = §§pop();
                                                      while(true)
                                                      {
                                                         if(!_loc39_)
                                                         {
                                                            break loop37;
                                                         }
                                                         §§goto(addr0aa1);
                                                      }
                                                      §§goto(addr0aec);
                                                   }
                                                   §§push(_loc13_);
                                                   §§push(_loc28_.v);
                                                   if(_loc40_)
                                                   {
                                                      §§push(_loc29_.v);
                                                      if(!_loc39_)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc28_.v);
                                                            if(_loc40_)
                                                            {
                                                               §§push(§§pop() - §§pop());
                                                               if(_loc39_ && Boolean(param3))
                                                               {
                                                                  break;
                                                               }
                                                               §§push(_loc38_);
                                                            }
                                                            §§push(§§pop() * §§pop());
                                                            break;
                                                         }
                                                      }
                                                      §§push(§§pop() + §§pop());
                                                   }
                                                   §§pop().v = §§pop();
                                                   §§push(_loc13_);
                                                   §§push(_loc28_.cameraX);
                                                   if(_loc40_)
                                                   {
                                                      loop40:
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc29_.cameraX);
                                                            if(!_loc39_)
                                                            {
                                                               §§push(_loc28_.cameraX);
                                                               if(_loc39_)
                                                               {
                                                                  break;
                                                               }
                                                               §§push(§§pop() - §§pop());
                                                               if(!_loc40_)
                                                               {
                                                                  break loop40;
                                                               }
                                                            }
                                                            §§push(_loc38_);
                                                            break;
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         break;
                                                      }
                                                   }
                                                   §§pop().alternativa3d::cameraX = §§pop();
                                                   while(true)
                                                   {
                                                      if(_loc40_ || Boolean(param3))
                                                      {
                                                         addr0aa1:
                                                         §§push(_loc13_);
                                                         §§push(_loc28_.cameraY);
                                                         if(_loc40_)
                                                         {
                                                            loop43:
                                                            while(true)
                                                            {
                                                               while(true)
                                                               {
                                                                  §§push(_loc29_.cameraY);
                                                                  if(!_loc39_)
                                                                  {
                                                                     §§push(_loc28_.cameraY);
                                                                     if(_loc39_ && Boolean(param2))
                                                                     {
                                                                        break;
                                                                     }
                                                                     §§push(§§pop() - §§pop());
                                                                     if(!(_loc40_ || Boolean(param3)))
                                                                     {
                                                                        break loop43;
                                                                     }
                                                                  }
                                                                  §§push(_loc38_);
                                                                  break;
                                                               }
                                                               §§push(§§pop() * §§pop());
                                                               break;
                                                            }
                                                         }
                                                         §§pop().alternativa3d::cameraY = §§pop();
                                                         if(!(_loc40_ || Boolean(param3)))
                                                         {
                                                            break;
                                                         }
                                                      }
                                                      addr0aec:
                                                      §§push(_loc13_);
                                                      §§push(_loc28_.cameraZ);
                                                      if(_loc40_)
                                                      {
                                                         §§push(_loc29_.cameraZ);
                                                         if(_loc40_ || Boolean(this))
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc28_.cameraZ);
                                                               if(!(_loc39_ && Boolean(param1)))
                                                               {
                                                                  §§push(§§pop() - §§pop());
                                                                  if(_loc39_ && Boolean(param3))
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(_loc38_);
                                                               }
                                                               §§push(§§pop() * §§pop());
                                                               break;
                                                            }
                                                         }
                                                         §§push(§§pop() + §§pop());
                                                      }
                                                      §§pop().alternativa3d::cameraZ = §§pop();
                                                      break;
                                                   }
                                                   _loc27_ = _loc12_.create();
                                                   while(true)
                                                   {
                                                      if(_loc40_)
                                                      {
                                                         _loc27_.vertex = _loc13_;
                                                         if(_loc39_)
                                                         {
                                                            break;
                                                         }
                                                      }
                                                      if(_loc25_ != null)
                                                      {
                                                         if(!(_loc39_ && Boolean(param2)))
                                                         {
                                                            _loc25_.next = _loc27_;
                                                            if(!_loc39_)
                                                            {
                                                               break;
                                                            }
                                                         }
                                                      }
                                                      else
                                                      {
                                                         _loc23_.wrapper = _loc27_;
                                                      }
                                                      addr0b77:
                                                      _loc25_ = _loc27_;
                                                      _loc14_ = _loc29_.create();
                                                      while(true)
                                                      {
                                                         if(!_loc39_)
                                                         {
                                                            param1.lastVertex.next = _loc14_;
                                                            if(!_loc40_)
                                                            {
                                                               break;
                                                            }
                                                         }
                                                         param1.lastVertex = _loc14_;
                                                         _loc14_.x = _loc13_.x;
                                                         _loc14_.y = _loc13_.y;
                                                         if(!_loc39_)
                                                         {
                                                            _loc14_.z = _loc13_.z;
                                                            _loc14_.u = _loc13_.u;
                                                         }
                                                         _loc14_.v = _loc13_.v;
                                                         if(!(_loc39_ && Boolean(param3)))
                                                         {
                                                            _loc14_.cameraX = _loc13_.cameraX;
                                                            if(!(_loc39_ && Boolean(param2)))
                                                            {
                                                               _loc14_.cameraY = _loc13_.cameraY;
                                                               _loc14_.cameraZ = _loc13_.cameraZ;
                                                            }
                                                         }
                                                         break;
                                                      }
                                                      _loc27_ = _loc12_.create();
                                                      loop48:
                                                      while(true)
                                                      {
                                                         if(_loc40_)
                                                         {
                                                            _loc27_.vertex = _loc14_;
                                                            if(!(_loc40_ || Boolean(param2)))
                                                            {
                                                               break;
                                                            }
                                                         }
                                                         if(_loc26_ != null)
                                                         {
                                                            while(true)
                                                            {
                                                               if(!_loc39_)
                                                               {
                                                                  break loop48;
                                                               }
                                                               addr0c44:
                                                               break;
                                                            }
                                                         }
                                                         else
                                                         {
                                                            _loc24_.wrapper = _loc27_;
                                                         }
                                                         addr0c4e:
                                                         _loc26_ = _loc27_;
                                                         addr0c54:
                                                         §§push(_loc29_.offset);
                                                         §§push(param8);
                                                         if(!_loc40_)
                                                         {
                                                            break loop36;
                                                         }
                                                         if(§§pop() >= §§pop())
                                                         {
                                                            addr0ccc:
                                                            §§push(_loc29_.offset);
                                                            §§push(param9);
                                                            break loop36;
                                                         }
                                                         if(!_loc40_)
                                                         {
                                                            break loop29;
                                                         }
                                                      }
                                                      _loc26_.next = _loc27_;
                                                      if(_loc40_ || Boolean(param2))
                                                      {
                                                         §§goto(addr0c44);
                                                      }
                                                      §§goto(addr0c4e);
                                                   }
                                                   §§goto(addr0b77);
                                                }
                                                §§push(_loc12_.create());
                                                if(_loc40_)
                                                {
                                                   _loc27_ = §§pop();
                                                   while(true)
                                                   {
                                                      if(!_loc39_)
                                                      {
                                                         _loc27_.vertex = _loc29_;
                                                         if(!(_loc40_ || Boolean(this)))
                                                         {
                                                            break;
                                                         }
                                                         if(_loc25_ == null)
                                                         {
                                                            _loc23_.wrapper = _loc27_;
                                                            break;
                                                         }
                                                         if(!_loc40_)
                                                         {
                                                            break;
                                                         }
                                                      }
                                                      _loc25_.next = _loc27_;
                                                      if(_loc40_ || Boolean(param2))
                                                      {
                                                      }
                                                      break;
                                                   }
                                                   _loc25_ = _loc27_;
                                                   break loop30;
                                                }
                                                §§goto(addr0ce5);
                                             }
                                             §§goto(addr0ccc);
                                          }
                                          if(§§pop() > §§pop())
                                          {
                                             break loop29;
                                          }
                                          §§goto(addr0d35);
                                          §§push(_loc12_.create());
                                       }
                                       _loc28_ = _loc29_;
                                       if(!(_loc39_ && Boolean(this)))
                                       {
                                          §§push(_loc32_);
                                          if(!(_loc39_ && Boolean(this)))
                                          {
                                             §§push(Number(§§pop()));
                                          }
                                          _loc31_ = §§pop();
                                       }
                                       _loc12_ = _loc12_.next;
                                       continue loop5;
                                    }
                                    §§push(_loc12_.create());
                                    if(!(_loc39_ && Boolean(this)))
                                    {
                                       addr0ce5:
                                       _loc27_ = §§pop();
                                       while(true)
                                       {
                                          if(!(_loc39_ && Boolean(param3)))
                                          {
                                             _loc27_.vertex = _loc29_;
                                             if(!_loc40_)
                                             {
                                                break;
                                             }
                                          }
                                          if(_loc26_ != null)
                                          {
                                             if(_loc40_)
                                             {
                                                _loc26_.next = _loc27_;
                                                if(_loc39_)
                                                {
                                                   break;
                                                }
                                             }
                                             break;
                                          }
                                          _loc24_.wrapper = _loc27_;
                                          break;
                                       }
                                       _loc26_ = _loc27_;
                                       break loop30;
                                    }
                                    addr0d35:
                                    _loc27_ = §§pop();
                                    if(_loc40_)
                                    {
                                       _loc27_.vertex = _loc29_;
                                       while(true)
                                       {
                                          if(!_loc39_)
                                          {
                                             if(_loc26_ == null)
                                             {
                                                _loc24_.wrapper = _loc27_;
                                                break;
                                             }
                                             if(_loc39_)
                                             {
                                                break;
                                             }
                                             _loc26_.next = _loc27_;
                                             if(_loc39_ && Boolean(param2))
                                             {
                                                break;
                                             }
                                          }
                                          break;
                                       }
                                    }
                                    _loc26_ = _loc27_;
                                    _loc14_ = _loc29_.create();
                                    loop33:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          if(_loc40_ || Boolean(param1))
                                          {
                                             param1.lastVertex.next = _loc14_;
                                             param1.lastVertex = _loc14_;
                                             _loc14_.x = _loc29_.x;
                                             if(!_loc40_)
                                             {
                                                break;
                                             }
                                             _loc14_.y = _loc29_.y;
                                             if(_loc40_)
                                             {
                                                _loc14_.z = _loc29_.z;
                                             }
                                             _loc14_.u = _loc29_.u;
                                             if(!(_loc40_ || Boolean(this)))
                                             {
                                                break loop33;
                                             }
                                          }
                                          _loc14_.v = _loc29_.v;
                                          if(!(_loc39_ && Boolean(param3)))
                                          {
                                             break;
                                          }
                                          §§goto(addr0e07);
                                       }
                                       _loc14_.cameraX = _loc29_.cameraX;
                                       _loc14_.cameraY = _loc29_.cameraY;
                                       break;
                                    }
                                    _loc14_.cameraZ = _loc29_.cameraZ;
                                    addr0e07:
                                    _loc27_ = _loc12_.create();
                                    if(!(_loc39_ && Boolean(this)))
                                    {
                                       _loc27_.vertex = _loc14_;
                                       if(!(_loc39_ && Boolean(param3)))
                                       {
                                          if(_loc25_ != null)
                                          {
                                             while(true)
                                             {
                                                if(!_loc39_)
                                                {
                                                   _loc25_.next = _loc27_;
                                                   if(_loc39_ && Boolean(param1))
                                                   {
                                                      break;
                                                   }
                                                }
                                                break;
                                             }
                                          }
                                          else
                                          {
                                             _loc23_.wrapper = _loc27_;
                                          }
                                       }
                                    }
                                    _loc25_ = _loc27_;
                                    break loop30;
                                 }
                                 if(!_loc40_)
                                 {
                                    break;
                                 }
                                 if(_loc19_ == null)
                                 {
                                    _loc19_ = _loc23_;
                                    addr0ebc:
                                    _loc20_ = _loc23_;
                                    while(true)
                                    {
                                       if(_loc40_)
                                       {
                                          if(_loc21_ == null)
                                          {
                                             _loc21_ = _loc24_;
                                             break;
                                          }
                                          if(_loc40_ || Boolean(this))
                                          {
                                             _loc22_.processNext = _loc24_;
                                          }
                                       }
                                       break;
                                    }
                                    _loc22_ = _loc24_;
                                    if(_loc40_ || Boolean(param1))
                                    {
                                       _loc10_.processNext = null;
                                    }
                                    continue loop0;
                                 }
                                 if(!_loc40_)
                                 {
                                    break;
                                 }
                              }
                              _loc20_.processNext = _loc23_;
                              break;
                           }
                           §§goto(addr0ebc);
                        }
                        addr0506:
                        if(§§pop())
                        {
                           while(true)
                           {
                              if(_loc40_)
                              {
                                 if(_loc19_ == null)
                                 {
                                    _loc19_ = _loc10_;
                                    break;
                                 }
                              }
                              §§goto(addr0517);
                           }
                           §§goto(addr0527);
                        }
                        else
                        {
                           _loc28_.offset = _loc31_;
                           _loc29_.offset = _loc32_;
                           _loc30_.offset = _loc33_;
                           if(!(_loc39_ && Boolean(param2)))
                           {
                              §§push(_loc10_.create());
                              if(_loc40_ || Boolean(param2))
                              {
                                 _loc23_ = §§pop();
                                 if(!_loc39_)
                                 {
                                    _loc23_.material = _loc10_.material;
                                    while(true)
                                    {
                                       if(!_loc39_)
                                       {
                                          param1.lastFace.next = _loc23_;
                                          if(_loc39_)
                                          {
                                             break;
                                          }
                                       }
                                       param1.lastFace = _loc23_;
                                       break;
                                    }
                                 }
                                 _loc25_ = null;
                                 _loc12_ = _loc10_.wrapper;
                                 while(true)
                                 {
                                    if(_loc40_)
                                    {
                                       for(; _loc12_ != null; _loc25_ = _loc27_,_loc12_ = _loc12_.next)
                                       {
                                          _loc29_ = _loc12_.vertex;
                                          while(true)
                                          {
                                             if(!(_loc39_ && Boolean(param1)))
                                             {
                                                if(_loc29_.offset < param8)
                                                {
                                                   break;
                                                }
                                             }
                                             _loc14_ = _loc29_.create();
                                             param1.lastVertex.next = _loc14_;
                                             param1.lastVertex = _loc14_;
                                             _loc14_.x = _loc29_.x;
                                             _loc14_.y = _loc29_.y;
                                             _loc14_.z = _loc29_.z;
                                             _loc14_.u = _loc29_.u;
                                             _loc14_.v = _loc29_.v;
                                             _loc14_.cameraX = _loc29_.cameraX;
                                             _loc14_.cameraY = _loc29_.cameraY;
                                             _loc14_.cameraZ = _loc29_.cameraZ;
                                             _loc29_ = _loc14_;
                                             break;
                                          }
                                          _loc27_ = _loc12_.create();
                                          if(!_loc39_)
                                          {
                                             _loc27_.vertex = _loc29_;
                                             if(_loc39_ && Boolean(param3))
                                             {
                                                continue;
                                             }
                                          }
                                          if(_loc25_ != null)
                                          {
                                             if(_loc40_)
                                             {
                                                _loc25_.next = _loc27_;
                                                if(_loc40_ || Boolean(param1))
                                                {
                                                }
                                             }
                                          }
                                          else
                                          {
                                             _loc23_.wrapper = _loc27_;
                                          }
                                       }
                                       if(!_loc40_)
                                       {
                                          break;
                                       }
                                    }
                                    if(_loc19_ != null)
                                    {
                                       if(_loc40_)
                                       {
                                          _loc20_.processNext = _loc23_;
                                       }
                                       break;
                                    }
                                    addr06a7:
                                    _loc19_ = _loc23_;
                                    _loc20_ = _loc23_;
                                    if(_loc40_ || Boolean(this))
                                    {
                                       _loc10_.processNext = null;
                                    }
                                    §§goto(addr06c0);
                                 }
                                 §§goto(addr06a7);
                              }
                           }
                           else
                           {
                              §§goto(addr06d0);
                           }
                           §§goto(addr06db);
                        }
                     }
                     §§push(param9);
                     if(_loc40_)
                     {
                        §§goto(addr0320);
                        §§push(§§pop() > §§pop());
                     }
                     §§goto(addr03b6);
                  }
                  addr0302:
                  §§goto(addr0304);
               }
            }
            loop83:
            while(true)
            {
               loop84:
               while(true)
               {
                  loop85:
                  while(true)
                  {
                     §§push(_loc19_ != null);
                     if(_loc40_)
                     {
                        var _temp_111:* = Boolean(§§pop());
                        while(true)
                        {
                           §§push(_temp_111);
                           §§push(_temp_111);
                           if(!(_loc39_ && Boolean(this)))
                           {
                              §§push(Boolean(§§pop()));
                              if(!(_loc40_ || Boolean(this)))
                              {
                                 break;
                              }
                           }
                           if(§§pop())
                           {
                              break loop84;
                           }
                           §§pop();
                           if(!_loc40_)
                           {
                              break loop85;
                           }
                           §§push(_loc15_ == null);
                           if(!(_loc39_ && Boolean(param3)))
                           {
                              §§push(!§§pop());
                              if(!_loc40_)
                              {
                                 break loop84;
                              }
                              §§push(Boolean(§§pop()));
                              if(_loc40_ || Boolean(this))
                              {
                                 var _temp_116:* = §§pop();
                                 §§push(_temp_116);
                                 §§push(_temp_116);
                                 if(!_loc39_)
                                 {
                                    §§push(Boolean(§§pop()));
                                 }
                                 break;
                              }
                           }
                        }
                        if(!§§pop())
                        {
                           break loop84;
                        }
                        if(!(_loc40_ || Boolean(param2)))
                        {
                           break loop83;
                        }
                     }
                     §§pop();
                     if(_loc40_ || Boolean(param2))
                     {
                        §§push(_loc17_ == null);
                        if(_loc40_ || Boolean(param1))
                        {
                           §§push(!§§pop());
                           if(!(_loc39_ && Boolean(param1)))
                           {
                              break loop83;
                           }
                        }
                        break loop84;
                     }
                     break;
                  }
                  while(true)
                  {
                     if(_loc19_ == null)
                     {
                        if(_loc40_)
                        {
                           _loc19_ = param2.create();
                           if(_loc40_ || Boolean(this))
                           {
                              param1.lastFace.next = _loc19_;
                           }
                           param1.lastFace = _loc19_;
                           §§goto(addr100b);
                        }
                     }
                     else
                     {
                        _loc20_.processNext = null;
                        if(!(_loc39_ && Boolean(param2)))
                        {
                           §§goto(addr100b);
                        }
                     }
                     §§goto(addr1083);
                  }
                  §§goto(addr11bb);
               }
               loop86:
               while(true)
               {
                  if(§§pop())
                  {
                     while(true)
                     {
                        if(_loc40_)
                        {
                           break loop85;
                        }
                        addr100b:
                        while(true)
                        {
                           if(this.sorting == 3)
                           {
                              if(!(_loc40_ || Boolean(param3)))
                              {
                                 break;
                              }
                              _loc19_.normalX = param2.normalX;
                              if(_loc40_ || Boolean(param2))
                              {
                                 _loc19_.normalY = param2.normalY;
                              }
                              _loc19_.normalZ = param2.normalZ;
                              _loc19_.offset = param2.offset;
                              if(_loc39_)
                              {
                                 break loop86;
                              }
                           }
                           _loc19_.processNegative = _loc15_;
                           _loc19_.processPositive = _loc17_;
                           param3.processNegative = _loc19_;
                           break;
                        }
                        break;
                     }
                  }
                  else
                  {
                     while(true)
                     {
                        §§push(param3);
                        if(_loc40_)
                        {
                           if(_loc15_ == null)
                           {
                              §§push(_loc17_);
                              break;
                           }
                        }
                        §§push(_loc15_);
                        break;
                     }
                     §§pop().alternativa3d::processNegative = §§pop();
                  }
                  addr1083:
                  loop90:
                  while(true)
                  {
                     §§push(_loc21_ == null);
                     if(!_loc39_)
                     {
                        §§push(!§§pop());
                        if(_loc39_ && Boolean(param2))
                        {
                           break;
                        }
                     }
                     var _temp_104:* = Boolean(§§pop());
                     while(true)
                     {
                        §§push(_temp_104);
                        §§push(_temp_104);
                        if(_loc40_)
                        {
                           §§push(Boolean(§§pop()));
                           if(_loc40_)
                           {
                              while(true)
                              {
                                 if(!§§pop())
                                 {
                                    if(_loc40_)
                                    {
                                       §§pop();
                                       if(!_loc40_)
                                       {
                                          break;
                                       }
                                       §§push(_loc16_ == null);
                                       if(!(_loc39_ && Boolean(param2)))
                                       {
                                          while(true)
                                          {
                                             addr1104:
                                             §§push(!§§pop());
                                             if(_loc40_)
                                             {
                                                §§push(Boolean(§§pop()));
                                                break loop90;
                                             }
                                             §§push(Boolean(§§pop()));
                                             break;
                                          }
                                          addr1105:
                                          if(§§pop())
                                          {
                                             if(_loc21_ == null)
                                             {
                                                _loc21_ = param2.create();
                                                param1.lastFace.next = _loc21_;
                                                param1.lastFace = _loc21_;
                                                break;
                                             }
                                             _loc22_.processNext = null;
                                             break;
                                          }
                                          while(true)
                                          {
                                             §§push(param3);
                                             if(_loc40_)
                                             {
                                                if(_loc16_ == null)
                                                {
                                                   §§push(_loc18_);
                                                   break;
                                                }
                                             }
                                             §§push(_loc16_);
                                             break;
                                          }
                                          §§pop().alternativa3d::processPositive = §§pop();
                                          break loop86;
                                       }
                                       §§push(!§§pop());
                                       if(!_loc39_)
                                       {
                                          §§goto(addr1104);
                                       }
                                    }
                                 }
                                 §§goto(addr1105);
                              }
                              loop95:
                              while(true)
                              {
                                 loop96:
                                 while(true)
                                 {
                                    if(this.sorting == 3)
                                    {
                                       while(true)
                                       {
                                          if(!_loc39_)
                                          {
                                             _loc21_.normalX = param2.normalX;
                                             if(_loc39_ && Boolean(param1))
                                             {
                                                break;
                                             }
                                          }
                                          _loc21_.normalY = param2.normalY;
                                          _loc21_.normalZ = param2.normalZ;
                                          if(!_loc39_)
                                          {
                                             _loc21_.offset = param2.offset;
                                             if(_loc40_ || Boolean(param1))
                                             {
                                                break;
                                             }
                                             break loop95;
                                          }
                                          break loop96;
                                       }
                                    }
                                    _loc21_.processNegative = _loc16_;
                                    if(!_loc39_)
                                    {
                                       break loop95;
                                    }
                                    §§goto(addr118c);
                                 }
                                 break loop86;
                              }
                              _loc21_.processPositive = _loc18_;
                              addr118c:
                              param3.processPositive = _loc21_;
                              break loop96;
                           }
                           break;
                        }
                        addr10e5:
                        §§push(Boolean(§§pop()));
                        break;
                     }
                     addr10e6:
                     if(§§pop())
                     {
                        if(_loc40_ || Boolean(param1))
                        {
                           §§pop();
                           §§push(_loc18_ == null);
                        }
                        §§goto(addr10fd);
                     }
                     §§goto(addr1105);
                  }
                  var _temp_109:* = §§pop();
                  §§push(_temp_109);
                  §§push(_temp_109);
                  if(!(_loc39_ && Boolean(param3)))
                  {
                     §§goto(addr10e5);
                  }
                  §§goto(addr10e6);
               }
               addr11bb:
               return;
            }
            §§push(Boolean(§§pop()));
            break loop84;
         }
         addr013b:
         _loc17_ = param3.processNegative;
         _loc18_ = param3.processPositive;
         break loop7;
      }
      
      private function cropFaceStruct(param1:Camera3D, param2:Face, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Face
      {
         var _temp_1:* = true;
         var _loc30_:Boolean = false;
         var _loc31_:Boolean = _temp_1;
         var _loc9_:Face = null;
         var _loc10_:Face = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Vertex = null;
         var _loc13_:Face = null;
         var _loc14_:Face = null;
         var _loc15_:Face = null;
         var _loc16_:Face = null;
         var _loc17_:Vertex = null;
         var _loc18_:Vertex = null;
         var _loc19_:Vertex = null;
         var _loc20_:* = NaN;
         var _loc21_:* = NaN;
         var _loc22_:* = NaN;
         var _loc23_:* = false;
         var _loc24_:* = false;
         var _loc25_:* = NaN;
         var _loc26_:Face = null;
         var _loc27_:Wrapper = null;
         var _loc28_:Wrapper = null;
         var _loc29_:* = NaN;
         loop5:
         while(true)
         {
            while(true)
            {
               if(_loc31_)
               {
                  if(param2.processNegative == null)
                  {
                     break;
                  }
                  if(_loc30_)
                  {
                     break loop5;
                  }
               }
               §§push(this.cropFaceStruct(param1,param2.processNegative,param3,param4,param5,param6,param7,param8));
               if(_loc31_)
               {
                  _loc13_ = §§pop();
                  if(_loc31_)
                  {
                     param2.processNegative = null;
                  }
                  break;
               }
               §§goto(addr00ca);
            }
            if(param2.processPositive != null)
            {
               while(true)
               {
                  if(!_loc30_)
                  {
                     break loop5;
                  }
                  §§goto(addr00e0);
               }
               §§goto(addr09ac);
            }
            §§goto(addr00d8);
         }
         addr00ca:
         _loc14_ = this.cropFaceStruct(param1,param2.processPositive,param3,param4,param5,param6,param7,param8);
         if(!_loc30_)
         {
            param2.processPositive = null;
         }
         addr00d8:
         if(param2.wrapper != null)
         {
            addr00e0:
            _loc9_ = param2;
            loop0:
            for(; _loc9_ != null; _loc9_ = _loc10_)
            {
               _loc10_ = _loc9_.processNext;
               _loc11_ = _loc9_.wrapper;
               _loc17_ = _loc11_.vertex;
               _loc11_ = _loc11_.next;
               _loc18_ = _loc11_.vertex;
               _loc11_ = _loc11_.next;
               _loc19_ = _loc11_.vertex;
               _loc11_ = _loc11_.next;
               while(true)
               {
                  loop8:
                  while(true)
                  {
                     loop61:
                     while(true)
                     {
                        §§push(_loc17_.cameraX * param3);
                        §§push(_loc17_.cameraY);
                        §§push(param4);
                        if(_loc31_ || Boolean(param3))
                        {
                           §§push(§§pop() + §§pop() * §§pop());
                           if(_loc30_ && Boolean(this))
                           {
                              break;
                           }
                           §§push(_loc17_.cameraZ);
                           if(!_loc31_)
                           {
                              break loop8;
                           }
                           §§push(param5);
                           if(_loc30_ && Boolean(param1))
                           {
                              continue loop55;
                           }
                        }
                        loop62:
                        while(true)
                        {
                           while(true)
                           {
                              loop64:
                              while(true)
                              {
                                 while(true)
                                 {
                                    addr01c1:
                                    §§push(§§pop() * §§pop());
                                    if(_loc31_)
                                    {
                                       §§push(§§pop() + §§pop());
                                       break loop61;
                                    }
                                    §§push(param5);
                                    if(_loc31_ || Boolean(param2))
                                    {
                                       §§push(§§pop() * §§pop());
                                       break loop64;
                                    }
                                    break loop62;
                                 }
                                 §§goto(addr0217);
                              }
                              while(true)
                              {
                                 §§push(§§pop() + §§pop());
                                 if(!_loc30_)
                                 {
                                    _loc21_ = §§pop();
                                    §§push(_loc19_.cameraX);
                                    if(!_loc31_)
                                    {
                                       break;
                                    }
                                 }
                                 §§push(§§pop() * param3);
                                 §§push(_loc19_.cameraY);
                                 if(!_loc30_)
                                 {
                                    §§push(param4);
                                    if(!_loc31_)
                                    {
                                       break loop62;
                                    }
                                    continue loop55;
                                 }
                                 §§goto(addr0223);
                              }
                              §§goto(addr0221);
                           }
                           §§goto(addr027d);
                        }
                        §§goto(addr020e);
                     }
                     _loc20_ = Number(§§pop());
                     §§push(_loc18_.cameraX);
                     if(_loc31_ || Boolean(param2))
                     {
                        §§push(param3);
                        if(_loc30_)
                        {
                           break loop64;
                        }
                        §§push(§§pop() * §§pop());
                        if(_loc30_)
                        {
                           break loop63;
                        }
                        §§push(_loc18_.cameraY);
                        §§push(param4);
                        if(!(_loc31_ || Boolean(param3)))
                        {
                           break loop62;
                        }
                        §§push(§§pop() + §§pop() * §§pop());
                        §§push(_loc18_.cameraZ);
                        if(!(_loc31_ || Boolean(param1)))
                        {
                           break loop9;
                        }
                        §§goto(addr01c1);
                     }
                     §§goto(addr0217);
                  }
                  §§goto(addr025a);
               }
               loop9:
               while(true)
               {
                  loop10:
                  while(true)
                  {
                     loop51:
                     while(true)
                     {
                        loop52:
                        while(true)
                        {
                           loop53:
                           while(true)
                           {
                              loop54:
                              while(true)
                              {
                                 loop55:
                                 while(true)
                                 {
                                    loop56:
                                    while(true)
                                    {
                                       §§push(§§pop() * §§pop());
                                       if(_loc31_)
                                       {
                                          §§push(§§pop() + §§pop());
                                          if(!_loc30_)
                                          {
                                             addr020e:
                                             loop57:
                                             while(true)
                                             {
                                                §§push(§§pop() + _loc19_.cameraZ * param5);
                                                if(!_loc30_)
                                                {
                                                   addr0217:
                                                   _loc22_ = §§pop();
                                                   §§push(_loc20_);
                                                   if(_loc30_)
                                                   {
                                                      break;
                                                   }
                                                }
                                                addr0223:
                                                addr0221:
                                                §§push(§§pop() < param7);
                                                if(_loc30_)
                                                {
                                                   break loop52;
                                                }
                                                loop58:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(Boolean(§§pop()));
                                                      if(_loc31_)
                                                      {
                                                         var _temp_57:* = §§pop();
                                                         §§push(_temp_57);
                                                         if(!Boolean(_temp_57))
                                                         {
                                                            §§pop();
                                                            if(!(_loc31_ || Boolean(param2)))
                                                            {
                                                               break loop51;
                                                            }
                                                            §§push(_loc21_);
                                                            if(!(_loc30_ && Boolean(param1)))
                                                            {
                                                               break loop57;
                                                            }
                                                            §§push(param8);
                                                            if(!_loc31_)
                                                            {
                                                               break loop9;
                                                            }
                                                            while(true)
                                                            {
                                                               §§push(§§pop() > §§pop());
                                                               if(!(_loc30_ && Boolean(param1)))
                                                               {
                                                                  var _temp_61:* = Boolean(§§pop());
                                                                  §§push(_temp_61);
                                                                  §§push(_temp_61);
                                                                  if(_loc30_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  if(!§§pop())
                                                                  {
                                                                     §§pop();
                                                                     if(_loc31_ || Boolean(param3))
                                                                     {
                                                                        §§push(_loc21_);
                                                                        break loop10;
                                                                     }
                                                                     break loop55;
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  §§goto(addr0302);
                                                               }
                                                               §§goto(addr0309);
                                                            }
                                                            §§goto(addr0310);
                                                         }
                                                         addr025a:
                                                         var _temp_63:* = §§pop();
                                                         §§push(_temp_63);
                                                         if(Boolean(_temp_63))
                                                         {
                                                            break;
                                                         }
                                                         if(_loc30_)
                                                         {
                                                            break loop58;
                                                         }
                                                      }
                                                      §§pop();
                                                      if(_loc31_ || Boolean(param3))
                                                      {
                                                         §§push(_loc22_);
                                                         if(_loc31_)
                                                         {
                                                            addr027d:
                                                            §§push(param7);
                                                            if(!_loc30_)
                                                            {
                                                               §§push(§§pop() < §§pop());
                                                               if(_loc31_ || Boolean(this))
                                                               {
                                                                  §§push(Boolean(§§pop()));
                                                                  if(!(_loc30_ && Boolean(this)))
                                                                  {
                                                                     break;
                                                                  }
                                                                  break loop56;
                                                               }
                                                               break loop58;
                                                            }
                                                            break loop9;
                                                         }
                                                         break loop54;
                                                      }
                                                      break loop55;
                                                   }
                                                   §§push(Boolean(§§pop()));
                                                   if(_loc31_)
                                                   {
                                                      break;
                                                   }
                                                   break loop53;
                                                }
                                                _loc23_ = §§pop();
                                                §§push(_loc20_);
                                                if(_loc30_ && Boolean(param3))
                                                {
                                                   break loop10;
                                                }
                                             }
                                             §§push(param7);
                                             break loop8;
                                          }
                                          §§goto(addr02bc);
                                       }
                                       §§goto(addr02c4);
                                    }
                                    §§goto(addr0329);
                                 }
                                 §§goto(addr0478);
                              }
                              §§goto(addr031e);
                           }
                           §§goto(addr0315);
                        }
                        §§goto(addr042e);
                     }
                     §§goto(addr032b);
                  }
                  §§push(param8);
                  break;
               }
               loop11:
               while(true)
               {
                  loop12:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(§§pop() > §§pop());
                        if(_loc31_ || Boolean(param3))
                        {
                           addr0302:
                           §§push(Boolean(§§pop()));
                           if(!_loc31_)
                           {
                              break loop12;
                           }
                           var _temp_48:* = §§pop();
                           §§push(_temp_48);
                           §§push(_temp_48);
                           if(!_loc30_)
                           {
                              addr0310:
                              §§push(Boolean(§§pop()));
                           }
                           if(!§§pop())
                           {
                              addr0315:
                              §§pop();
                              if(_loc30_)
                              {
                                 break;
                              }
                              §§push(_loc22_ > param8);
                           }
                           §§push(Boolean(§§pop()));
                           if(!_loc31_)
                           {
                              break loop11;
                           }
                        }
                        addr0329:
                        _loc24_ = §§pop();
                        addr032b:
                        loop1:
                        for(; _loc11_ != null; _loc11_ = _loc11_.next)
                        {
                           _loc12_ = _loc11_.vertex;
                           loop44:
                           while(true)
                           {
                              loop45:
                              while(true)
                              {
                                 loop47:
                                 while(true)
                                 {
                                    loop48:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          if(!_loc30_)
                                          {
                                             §§push(_loc12_.cameraX);
                                             §§push(param3);
                                             if(_loc30_)
                                             {
                                                break loop48;
                                             }
                                             §§push(§§pop() * §§pop());
                                             if(!_loc31_)
                                             {
                                                break;
                                             }
                                             §§push(_loc12_.cameraY);
                                             §§push(param4);
                                             if(_loc31_)
                                             {
                                                §§push(§§pop() + §§pop() * §§pop());
                                                if(_loc30_)
                                                {
                                                   break;
                                                }
                                                §§push(_loc12_.cameraZ);
                                                if(_loc30_ && Boolean(param3))
                                                {
                                                   break loop48;
                                                }
                                                §§push(param5);
                                             }
                                             §§push(§§pop() * §§pop());
                                             if(!(_loc31_ || Boolean(this)))
                                             {
                                                break loop47;
                                             }
                                             §§push(§§pop() + §§pop());
                                             if(_loc30_)
                                             {
                                                break loop45;
                                             }
                                             §§push(Number(§§pop()));
                                             if(_loc30_)
                                             {
                                                break loop45;
                                             }
                                             _loc25_ = §§pop();
                                             if(!_loc31_)
                                             {
                                                break loop44;
                                             }
                                          }
                                          §§push(_loc25_);
                                          if(_loc31_ || Boolean(param3))
                                          {
                                             break;
                                          }
                                          break loop45;
                                       }
                                       §§push(param7);
                                       if(_loc31_)
                                       {
                                          break;
                                       }
                                       break loop47;
                                    }
                                    if(§§pop() >= §§pop())
                                    {
                                       §§push(_loc25_);
                                       break loop45;
                                    }
                                    if(!_loc30_)
                                    {
                                       break loop44;
                                    }
                                    §§goto(addr0409);
                                 }
                                 if(§§pop() > §§pop())
                                 {
                                    if(!(_loc31_ || Boolean(param1)))
                                    {
                                       continue loop1;
                                    }
                                    §§push(true);
                                    if(!(_loc30_ && Boolean(this)))
                                    {
                                       §§push(Boolean(§§pop()));
                                    }
                                    §§goto(addr0401);
                                 }
                                 §§goto(addr0409);
                              }
                              §§push(param8);
                              break loop47;
                           }
                           while(true)
                           {
                              §§push(true);
                              if(_loc31_)
                              {
                                 §§push(Boolean(§§pop()));
                                 if(!(_loc31_ || Boolean(param1)))
                                 {
                                    addr0401:
                                    _loc24_ = §§pop();
                                    if(_loc31_)
                                    {
                                       break;
                                    }
                                    continue loop1;
                                 }
                              }
                              _loc23_ = §§pop();
                              break;
                           }
                           addr0409:
                           _loc12_.offset = _loc25_;
                        }
                        while(true)
                        {
                           if(!(_loc30_ && Boolean(param1)))
                           {
                              addr042e:
                              if(_loc24_)
                              {
                                 §§push(_loc23_);
                                 if(!_loc30_)
                                 {
                                    break loop12;
                                 }
                                 break loop11;
                              }
                              _loc9_.processNext = null;
                              if(_loc31_)
                              {
                                 continue loop0;
                              }
                              §§goto(addr049e);
                           }
                           §§goto(addr0478);
                        }
                        §§goto(addr0482);
                     }
                     §§goto(addr0492);
                  }
                  §§push(!§§pop());
                  break;
               }
               while(true)
               {
                  if(§§pop())
                  {
                     if(!(_loc30_ && Boolean(this)))
                     {
                        if(_loc15_ != null)
                        {
                           _loc16_.processNext = _loc9_;
                           if(!(_loc31_ || Boolean(param3)))
                           {
                              break;
                           }
                           addr0478:
                        }
                        else
                        {
                           _loc15_ = _loc9_;
                        }
                        addr0482:
                        _loc16_ = _loc9_;
                        continue loop0;
                     }
                  }
                  else
                  {
                     _loc17_.offset = _loc20_;
                     addr0492:
                     _loc18_.offset = _loc21_;
                  }
                  _loc19_.offset = _loc22_;
                  break;
               }
               addr049e:
               _loc26_ = _loc9_.create();
               while(true)
               {
                  if(_loc31_)
                  {
                     _loc26_.material = _loc9_.material;
                     if(_loc31_)
                     {
                        param1.lastFace.next = _loc26_;
                        if(_loc30_ && Boolean(this))
                        {
                           break;
                        }
                     }
                  }
                  param1.lastFace = _loc26_;
                  break;
               }
               _loc27_ = null;
               §§push(_loc9_.wrapper.next);
               if(!(_loc30_ && Boolean(this)))
               {
                  §§push(§§pop().alternativa3d::next);
               }
               _loc11_ = §§pop();
               if(!_loc30_)
               {
                  loop2:
                  while(true)
                  {
                     §§push(_loc11_.next);
                     do
                     {
                        if(§§pop() == null)
                        {
                           break loop2;
                        }
                        §§push(_loc11_.next);
                     }
                     while(_loc30_ && Boolean(param3));
                     _loc11_ = §§pop();
                  }
               }
               _loc17_ = _loc11_.vertex;
               if(_loc31_)
               {
                  §§push(_loc17_.offset);
                  if(_loc31_)
                  {
                     §§push(Number(§§pop()));
                  }
                  _loc20_ = §§pop();
               }
               _loc11_ = _loc9_.wrapper;
               loop15:
               while(true)
               {
                  if(_loc31_ || Boolean(param1))
                  {
                     while(_loc11_ != null)
                     {
                        _loc18_ = _loc11_.vertex;
                        loop16:
                        while(true)
                        {
                           loop17:
                           while(true)
                           {
                              while(true)
                              {
                                 loop36:
                                 while(true)
                                 {
                                    loop39:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc18_.offset);
                                          if(!(_loc30_ && Boolean(param3)))
                                          {
                                             _loc21_ = §§pop();
                                             §§push(_loc20_);
                                             §§push(param7);
                                             if(!(_loc31_ || Boolean(param2)))
                                             {
                                                break;
                                             }
                                             var _temp_37:* = §§pop() < §§pop();
                                             §§push(_temp_37);
                                             §§push(_temp_37);
                                             if(_loc30_ && Boolean(param3))
                                             {
                                                break loop39;
                                             }
                                             §§push(Boolean(§§pop()));
                                             if(!_loc31_)
                                             {
                                                break loop39;
                                             }
                                             if(§§pop())
                                             {
                                                if(_loc30_)
                                                {
                                                   continue loop37;
                                                }
                                                §§pop();
                                                §§push(_loc21_ > param8);
                                                if(!(_loc31_ || Boolean(this)))
                                                {
                                                   continue loop37;
                                                }
                                             }
                                             var _temp_40:* = §§pop();
                                             §§push(_temp_40);
                                             §§push(_temp_40);
                                             if(!(_loc31_ || Boolean(param3)))
                                             {
                                                break loop39;
                                             }
                                             §§push(Boolean(§§pop()));
                                             if(!_loc31_)
                                             {
                                                break loop36;
                                             }
                                             if(§§pop())
                                             {
                                                continue loop37;
                                             }
                                             §§pop();
                                             if(_loc30_)
                                             {
                                                break loop17;
                                             }
                                             §§push(_loc20_);
                                             if(!(_loc31_ || Boolean(param3)))
                                             {
                                                break loop16;
                                             }
                                          }
                                          §§push(param8);
                                          break;
                                       }
                                       var _temp_43:* = §§pop() > §§pop();
                                       §§push(_temp_43);
                                       §§push(_temp_43);
                                       if(_loc31_ || Boolean(this))
                                       {
                                          break loop36;
                                       }
                                       break;
                                    }
                                    if(!§§pop())
                                    {
                                       continue loop37;
                                    }
                                    §§pop();
                                    while(true)
                                    {
                                       if(!(_loc30_ && Boolean(param2)))
                                       {
                                          §§push(_loc21_);
                                          if(_loc30_)
                                          {
                                             break loop37;
                                          }
                                          §§push(param7);
                                          if(_loc31_ || Boolean(this))
                                          {
                                             §§push(§§pop() < §§pop());
                                             continue loop37;
                                          }
                                          §§goto(addr063e);
                                       }
                                       §§goto(addr08c9);
                                    }
                                    §§goto(addr091d);
                                 }
                                 §§push(Boolean(§§pop()));
                                 break loop39;
                              }
                              while(true)
                              {
                                 while(true)
                                 {
                                    if(§§pop())
                                    {
                                       break loop17;
                                    }
                                    §§goto(addr08c1);
                                 }
                                 §§goto(addr08c5);
                              }
                              §§goto(addr08c3);
                           }
                           §§push(param6);
                           break;
                        }
                        addr063e:
                        while(true)
                        {
                           §§push(§§pop() - _loc20_);
                           if(!_loc30_)
                           {
                              §§push(_loc21_ - _loc20_);
                              if(!(_loc31_ || Boolean(this)))
                              {
                                 break;
                              }
                              §§push(§§pop() / §§pop());
                           }
                           §§push(Number(§§pop()));
                           if(_loc31_)
                           {
                              _loc29_ = §§pop();
                              _loc12_ = _loc18_.create();
                              loop19:
                              while(true)
                              {
                                 if(_loc31_ || Boolean(param2))
                                 {
                                    param1.lastVertex.next = _loc12_;
                                    if(!_loc31_)
                                    {
                                       break;
                                    }
                                    param1.lastVertex = _loc12_;
                                    §§push(_loc12_);
                                    §§push(_loc17_.x);
                                    if(!(_loc30_ && Boolean(param3)))
                                    {
                                       loop20:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc18_.x);
                                             if(!_loc30_)
                                             {
                                                §§push(_loc17_.x);
                                                if(!(_loc31_ || Boolean(param2)))
                                                {
                                                   break;
                                                }
                                                §§push(§§pop() - §§pop());
                                                if(!_loc31_)
                                                {
                                                   break loop20;
                                                }
                                             }
                                             §§push(_loc29_);
                                             break;
                                          }
                                          §§push(§§pop() * §§pop());
                                          break;
                                       }
                                    }
                                    §§pop().x = §§pop();
                                    §§push(_loc12_);
                                    §§push(_loc17_.y);
                                    if(_loc31_)
                                    {
                                       §§push(_loc18_.y);
                                       if(!_loc30_)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc17_.y);
                                             if(_loc31_ || Boolean(param3))
                                             {
                                                §§push(§§pop() - §§pop());
                                                if(!_loc31_)
                                                {
                                                   break;
                                                }
                                                §§push(_loc29_);
                                             }
                                             §§push(§§pop() * §§pop());
                                             break;
                                          }
                                       }
                                       §§push(§§pop() + §§pop());
                                    }
                                    §§pop().y = §§pop();
                                 }
                                 §§push(_loc12_);
                                 §§push(_loc17_.z);
                                 if(_loc31_ || Boolean(param3))
                                 {
                                    §§push(_loc18_.z);
                                    if(!(_loc30_ && Boolean(this)))
                                    {
                                       while(true)
                                       {
                                          §§push(_loc17_.z);
                                          if(_loc31_)
                                          {
                                             §§push(§§pop() - §§pop());
                                             if(_loc30_ && Boolean(this))
                                             {
                                                break;
                                             }
                                             §§push(_loc29_);
                                          }
                                          §§push(§§pop() * §§pop());
                                          break;
                                       }
                                    }
                                    §§push(§§pop() + §§pop());
                                 }
                                 §§pop().z = §§pop();
                                 §§push(_loc12_);
                                 §§push(_loc17_.u);
                                 if(_loc31_)
                                 {
                                    loop24:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc18_.u);
                                          if(!_loc30_)
                                          {
                                             §§push(_loc17_.u);
                                             if(!(_loc31_ || Boolean(param3)))
                                             {
                                                break;
                                             }
                                             §§push(§§pop() - §§pop());
                                             if(!_loc31_)
                                             {
                                                break loop24;
                                             }
                                          }
                                          §§push(_loc29_);
                                          break;
                                       }
                                       §§push(§§pop() * §§pop());
                                       break;
                                    }
                                 }
                                 §§pop().u = §§pop();
                                 §§push(_loc12_);
                                 §§push(_loc17_.v);
                                 if(!_loc30_)
                                 {
                                    §§push(_loc18_.v);
                                    if(!(_loc30_ && Boolean(param1)))
                                    {
                                       while(true)
                                       {
                                          §§push(_loc17_.v);
                                          if(!_loc30_)
                                          {
                                             §§push(§§pop() - §§pop());
                                             if(!_loc31_)
                                             {
                                                break;
                                             }
                                             §§push(_loc29_);
                                          }
                                          §§push(§§pop() * §§pop());
                                          break;
                                       }
                                    }
                                    §§push(§§pop() + §§pop());
                                 }
                                 §§pop().v = §§pop();
                                 while(true)
                                 {
                                    if(_loc31_)
                                    {
                                       break loop19;
                                    }
                                    addr07ed:
                                    §§push(_loc12_);
                                    §§push(_loc17_.cameraY);
                                    if(!_loc30_)
                                    {
                                       §§push(_loc18_.cameraY);
                                       if(_loc31_)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc17_.cameraY);
                                             if(_loc31_ || Boolean(param3))
                                             {
                                                §§push(§§pop() - §§pop());
                                                if(_loc30_)
                                                {
                                                   break;
                                                }
                                                §§push(_loc29_);
                                             }
                                             §§push(§§pop() * §§pop());
                                             break;
                                          }
                                       }
                                       §§push(§§pop() + §§pop());
                                    }
                                    §§pop().alternativa3d::cameraY = §§pop();
                                    if(_loc31_)
                                    {
                                       §§push(_loc12_);
                                       §§push(_loc17_.cameraZ);
                                       if(_loc31_)
                                       {
                                          loop29:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(_loc18_.cameraZ);
                                                if(_loc31_ || Boolean(this))
                                                {
                                                   §§push(_loc17_.cameraZ);
                                                   if(!_loc31_)
                                                   {
                                                      break;
                                                   }
                                                   §§push(§§pop() - §§pop());
                                                   if(!(_loc31_ || Boolean(this)))
                                                   {
                                                      break loop29;
                                                   }
                                                }
                                                §§push(_loc29_);
                                                break;
                                             }
                                             §§push(§§pop() * §§pop());
                                             break;
                                          }
                                       }
                                       §§pop().alternativa3d::cameraZ = §§pop();
                                    }
                                    break;
                                 }
                                 addr0865:
                                 _loc28_ = _loc11_.create();
                                 while(true)
                                 {
                                    if(!(_loc30_ && Boolean(param1)))
                                    {
                                       _loc28_.vertex = _loc12_;
                                       if(!(_loc31_ || Boolean(param3)))
                                       {
                                          break;
                                       }
                                    }
                                    if(_loc27_ != null)
                                    {
                                       if(!_loc30_)
                                       {
                                          break;
                                       }
                                    }
                                    else
                                    {
                                       _loc26_.wrapper = _loc28_;
                                    }
                                    addr08bb:
                                    _loc27_ = _loc28_;
                                    addr08c1:
                                 }
                                 _loc27_.next = _loc28_;
                                 if(_loc31_ || Boolean(param3))
                                 {
                                 }
                                 §§goto(addr08bb);
                              }
                              §§push(_loc12_);
                              §§push(_loc17_.cameraX);
                              if(!_loc30_)
                              {
                                 loop32:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc18_.cameraX);
                                       if(_loc31_)
                                       {
                                          §§push(_loc17_.cameraX);
                                          if(_loc30_ && Boolean(param1))
                                          {
                                             break;
                                          }
                                          §§push(§§pop() - §§pop());
                                          if(_loc30_)
                                          {
                                             break loop32;
                                          }
                                       }
                                       §§push(_loc29_);
                                       break;
                                    }
                                    §§push(§§pop() * §§pop());
                                    break;
                                 }
                              }
                              §§pop().alternativa3d::cameraX = §§pop();
                              if(_loc31_)
                              {
                                 §§goto(addr07ed);
                              }
                              §§goto(addr0865);
                           }
                           addr08c3:
                           §§push(param7);
                           break;
                        }
                        addr08c5:
                        if(§§pop() >= §§pop())
                        {
                           addr08c9:
                           _loc28_ = _loc11_.create();
                           while(true)
                           {
                              if(_loc31_ || Boolean(this))
                              {
                                 _loc28_.vertex = _loc18_;
                                 if(!_loc31_)
                                 {
                                    break;
                                 }
                                 if(_loc27_ == null)
                                 {
                                    _loc26_.wrapper = _loc28_;
                                    break;
                                 }
                                 if(!(_loc31_ || Boolean(param1)))
                                 {
                                    break;
                                 }
                                 _loc27_.next = _loc28_;
                                 if(_loc30_)
                                 {
                                    break;
                                 }
                              }
                              break;
                           }
                           _loc27_ = _loc28_;
                        }
                        addr091d:
                        _loc17_ = _loc18_;
                        if(_loc31_ || Boolean(param3))
                        {
                           §§push(_loc21_);
                           if(_loc31_ || Boolean(param2))
                           {
                              §§push(Number(§§pop()));
                           }
                           _loc20_ = §§pop();
                        }
                        _loc11_ = _loc11_.next;
                     }
                     while(true)
                     {
                        if(!(_loc30_ && Boolean(param3)))
                        {
                           if(_loc15_ == null)
                           {
                              _loc15_ = _loc26_;
                              break loop15;
                           }
                           if(_loc30_ && Boolean(this))
                           {
                              break;
                           }
                        }
                        _loc16_.processNext = _loc26_;
                        break;
                     }
                  }
                  break;
               }
               _loc16_ = _loc26_;
               if(!(_loc30_ && Boolean(param1)))
               {
                  _loc9_.processNext = null;
               }
            }
         }
         addr09ac:
         var _temp_73:* = _loc15_ != null;
         loop67:
         while(true)
         {
            §§push(_temp_73);
            §§push(_temp_73);
            if(!(_loc30_ && Boolean(param2)))
            {
               §§push(Boolean(§§pop()));
               if(_loc30_ && Boolean(this))
               {
                  break;
               }
            }
            loop68:
            while(true)
            {
               if(!§§pop())
               {
                  §§pop();
                  if(_loc30_)
                  {
                     break;
                  }
                  while(true)
                  {
                     §§push(_loc13_ != null);
                     if(!(_loc30_ && Boolean(this)))
                     {
                        §§push(Boolean(§§pop()));
                        if(_loc31_ || Boolean(param2))
                        {
                           var _temp_78:* = §§pop();
                           §§push(_temp_78);
                           §§push(_temp_78);
                           if(!_loc30_)
                           {
                              §§push(Boolean(§§pop()));
                           }
                           break loop67;
                        }
                        addr0a09:
                        §§pop();
                        if(!_loc31_)
                        {
                           break loop68;
                        }
                        §§push(_loc14_ == null);
                        if(_loc31_)
                        {
                           §§push(!§§pop());
                           if(_loc30_ && Boolean(param2))
                           {
                              break;
                           }
                        }
                     }
                     §§push(Boolean(§§pop()));
                     break;
                  }
               }
               §§goto(addr0a2a);
            }
            addr0a7a:
            while(true)
            {
               if(this.sorting == 3)
               {
                  _loc15_.normalX = param2.normalX;
                  if(!(_loc31_ || Boolean(param1)))
                  {
                     break;
                  }
                  _loc15_.normalY = param2.normalY;
                  if(_loc30_ && Boolean(param1))
                  {
                     break;
                  }
                  _loc15_.normalZ = param2.normalZ;
                  if(_loc30_)
                  {
                     break;
                  }
                  _loc15_.offset = param2.offset;
                  if(_loc30_ && Boolean(param1))
                  {
                     break;
                  }
               }
               _loc15_.processNegative = _loc13_;
               if(_loc31_ || Boolean(this))
               {
                  _loc15_.processPositive = _loc14_;
               }
               break;
            }
            §§goto(addr0ae9);
         }
         while(true)
         {
            if(§§pop())
            {
               §§goto(addr0a09);
            }
            addr0a2a:
            while(true)
            {
               if(§§pop())
               {
                  if(!(_loc30_ && Boolean(param1)))
                  {
                     if(_loc15_ == null)
                     {
                        if(!_loc30_)
                        {
                           §§goto(addr0a49);
                        }
                     }
                     else
                     {
                        _loc16_.processNext = null;
                        if(!_loc30_)
                        {
                           break loop68;
                        }
                     }
                     addr0b01:
                     §§push(_loc13_);
                     break;
                  }
                  addr0a49:
                  _loc15_ = param2.create();
                  param1.lastFace.next = _loc15_;
                  if(!(_loc30_ && Boolean(param3)))
                  {
                     param1.lastFace = _loc15_;
                     break loop68;
                  }
                  addr0ae9:
                  return _loc15_;
               }
               if(_loc13_ == null)
               {
                  §§push(_loc14_);
                  break;
               }
               §§goto(addr0b01);
            }
            return §§pop();
         }
         §§goto(addr0a7a);
      }
      
      alternativa3d function transformStruct(param1:Face, param2:int, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number) : void
      {
         var _temp_1:* = true;
         var _loc21_:Boolean = false;
         var _loc22_:Boolean = _temp_1;
         var _loc16_:Wrapper = null;
         var _loc17_:Vertex = null;
         var _loc18_:* = NaN;
         var _loc19_:* = NaN;
         var _loc20_:* = NaN;
         var _loc15_:Face = param1;
         while(_loc15_ != null)
         {
            _loc16_ = _loc15_.wrapper;
            if(_loc22_ || Boolean(param1))
            {
               loop1:
               for(; _loc16_ != null; _loc16_ = _loc16_.next)
               {
                  _loc17_ = _loc16_.vertex;
                  if(_loc17_.transformId != param2)
                  {
                     while(true)
                     {
                        §§push(_loc17_.cameraX);
                        if(!(_loc21_ && Boolean(this)))
                        {
                           §§push(Number(§§pop()));
                           if(!_loc21_)
                           {
                              _loc18_ = §§pop();
                              §§push(_loc17_.cameraY);
                              if(!(_loc22_ || Boolean(param2)))
                              {
                                 break;
                              }
                              §§push(Number(§§pop()));
                              if(_loc21_ && Boolean(param1))
                              {
                                 break;
                              }
                           }
                           _loc19_ = §§pop();
                           §§push(_loc17_.cameraZ);
                           if(_loc21_)
                           {
                              break;
                           }
                        }
                        §§push(Number(§§pop()));
                        break;
                     }
                     _loc20_ = §§pop();
                     loop3:
                     while(true)
                     {
                        loop4:
                        while(true)
                        {
                           §§push(_loc17_);
                           §§push(param3);
                           if(!_loc21_)
                           {
                              §§push(_loc18_);
                              if(_loc21_ && Boolean(param2))
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(!(_loc22_ || Boolean(param2)))
                              {
                                 break loop3;
                              }
                           }
                           while(true)
                           {
                              §§push(param4);
                              if(!(_loc21_ && Boolean(param2)))
                              {
                                 §§push(_loc19_);
                                 if(!(_loc21_ && Boolean(this)))
                                 {
                                    §§push(§§pop() * §§pop());
                                    if(!(_loc21_ && Boolean(this)))
                                    {
                                       §§push(§§pop() + §§pop());
                                       if(_loc22_ || Boolean(param1))
                                       {
                                          §§push(param5);
                                          if(!(_loc21_ && Boolean(param3)))
                                          {
                                             break loop4;
                                          }
                                          break;
                                       }
                                       break loop3;
                                    }
                                    break loop4;
                                 }
                                 addr011f:
                                 §§push(§§pop() * §§pop());
                                 if(_loc21_)
                                 {
                                    break;
                                 }
                              }
                              §§push(§§pop() + §§pop());
                              if(!(_loc21_ && Boolean(this)))
                              {
                                 §§push(param6);
                                 break;
                              }
                              break loop3;
                           }
                           §§push(§§pop() + §§pop());
                           break loop3;
                        }
                        §§goto(addr011f);
                     }
                     §§pop().alternativa3d::cameraX = §§pop();
                     §§push(_loc17_);
                     §§push(param7);
                     if(!(_loc21_ && Boolean(this)))
                     {
                        loop5:
                        while(true)
                        {
                           loop6:
                           while(true)
                           {
                              §§push(_loc18_);
                              if(!_loc21_)
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc22_ || Boolean(param2)))
                                 {
                                    break;
                                 }
                                 loop7:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(param8);
                                       if(!_loc21_)
                                       {
                                          §§push(_loc19_);
                                          if(_loc21_)
                                          {
                                             break;
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(_loc21_ && Boolean(param1))
                                          {
                                             break loop7;
                                          }
                                       }
                                       §§push(§§pop() + §§pop());
                                       if(_loc22_ || Boolean(param2))
                                       {
                                          §§push(param9);
                                          if(!_loc21_)
                                          {
                                             §§push(_loc20_);
                                             break;
                                          }
                                          break loop5;
                                       }
                                       break loop6;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(!(_loc21_ && Boolean(param2)))
                                    {
                                       break;
                                    }
                                    break loop5;
                                 }
                              }
                              break loop7;
                           }
                        }
                        §§push(§§pop() + §§pop());
                        break loop6;
                     }
                     §§pop().alternativa3d::cameraY = §§pop();
                     if(!_loc21_)
                     {
                        loop9:
                        while(true)
                        {
                           loop10:
                           while(true)
                           {
                              loop11:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(_loc17_);
                                    §§push(param11);
                                    if(!(_loc21_ && Boolean(param1)))
                                    {
                                       §§push(_loc18_);
                                       if(_loc21_ && Boolean(param3))
                                       {
                                          break;
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(_loc21_)
                                       {
                                          break loop9;
                                       }
                                       §§push(param12);
                                       if(_loc22_ || Boolean(param1))
                                       {
                                          §§push(_loc19_);
                                          if(_loc21_)
                                          {
                                             break loop11;
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(_loc21_ && Boolean(param2))
                                          {
                                             break loop10;
                                          }
                                       }
                                       §§push(§§pop() + §§pop());
                                       if(!_loc22_)
                                       {
                                          break loop9;
                                       }
                                    }
                                    §§push(param13);
                                    if(!_loc21_)
                                    {
                                       break;
                                    }
                                    break loop10;
                                 }
                                 §§push(_loc20_);
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(!(_loc22_ || Boolean(param1)))
                              {
                                 break;
                              }
                              §§push(§§pop() + §§pop());
                              if(_loc22_)
                              {
                                 break loop9;
                              }
                              §§goto(addr0248);
                           }
                           addr0248:
                           §§pop().alternativa3d::cameraZ = §§pop() + §§pop();
                           _loc17_.transformId = param2;
                           continue loop1;
                        }
                        §§push(param14);
                        break loop10;
                     }
                  }
               }
            }
            _loc15_ = _loc15_.processNext;
         }
         loop14:
         while(true)
         {
            if(!_loc21_)
            {
               while(true)
               {
                  if(param1.processNegative != null)
                  {
                     if(_loc21_ && Boolean(param2))
                     {
                        break;
                     }
                     this.transformStruct(param1.processNegative,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
                     if(!(_loc22_ || Boolean(this)))
                     {
                        break;
                     }
                  }
                  if(param1.processPositive != null)
                  {
                     if(_loc22_)
                     {
                        break;
                     }
                  }
                  break loop14;
               }
            }
            this.transformStruct(param1.processPositive,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
            break;
         }
      }
      
      alternativa3d function draw(param1:Camera3D, param2:Canvas, param3:Number, param4:Object3D) : void
      {
         var _temp_1:* = true;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = _temp_1;
         var _loc5_:Canvas = null;
         var _loc6_:Face = null;
         var _loc7_:Face = null;
         var _loc8_:Face = null;
         loop2:
         while(true)
         {
            if(!_loc11_)
            {
               while(true)
               {
                  if(this.space == 1)
                  {
                     if(_loc11_ && Boolean(param3))
                     {
                        break;
                     }
                     while(true)
                     {
                        §§push(this);
                        §§push(this.faceStruct);
                        var _loc9_:*;
                        §§push((_loc9_ = this.object).alternativa3d::transformId);
                        if(!(_loc11_ && Boolean(param2)))
                        {
                           §§push(§§pop() + 1);
                           if(!_loc12_)
                           {
                              break;
                           }
                        }
                        var _loc10_:* = §§pop();
                        §§push(_loc10_);
                        if(!_loc11_)
                        {
                           _loc9_.alternativa3d::transformId = _loc10_;
                        }
                        break;
                     }
                     §§pop().alternativa3d::transformStruct(§§pop(),§§pop(),param4.ma,param4.mb,param4.mc,param4.md,param4.me,param4.mf,param4.mg,param4.mh,param4.mi,param4.mj,param4.mk,param4.ml);
                     if(!_loc12_)
                     {
                        break;
                     }
                  }
                  if(this.viewAligned)
                  {
                     break;
                  }
                  §§push(this.sorting);
                  if(!_loc11_)
                  {
                     _loc9_ = §§pop();
                     loop5:
                     while(true)
                     {
                        if(!_loc11_)
                        {
                           loop6:
                           while(true)
                           {
                              loop7:
                              while(true)
                              {
                                 loop21:
                                 while(true)
                                 {
                                    loop22:
                                    while(true)
                                    {
                                       §§push(0);
                                       if(!(_loc11_ && Boolean(param3)))
                                       {
                                          loop23:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(_loc9_);
                                                if(_loc12_ || Boolean(param1))
                                                {
                                                   if(§§pop() === §§pop())
                                                   {
                                                      if(_loc11_ && Boolean(param3))
                                                      {
                                                         break;
                                                      }
                                                      §§push(0);
                                                      if(_loc11_ && Boolean(param2))
                                                      {
                                                      }
                                                      §§goto(addr03fe);
                                                   }
                                                   else
                                                   {
                                                      §§push(1);
                                                      if(!_loc12_)
                                                      {
                                                         break loop22;
                                                      }
                                                      §§push(_loc9_);
                                                      if(!_loc12_)
                                                      {
                                                         break loop23;
                                                      }
                                                   }
                                                }
                                                if(§§pop() !== §§pop())
                                                {
                                                   §§push(2);
                                                   if(!(_loc11_ && Boolean(param2)))
                                                   {
                                                      §§push(_loc9_);
                                                      if(!_loc11_)
                                                      {
                                                         break loop23;
                                                      }
                                                      break loop21;
                                                   }
                                                   break loop6;
                                                }
                                                if(_loc12_ || Boolean(param3))
                                                {
                                                   break;
                                                }
                                                §§goto(addr03c3);
                                             }
                                             §§push(1);
                                             if(_loc11_ && Boolean(this))
                                             {
                                                break loop5;
                                             }
                                             §§goto(addr03fe);
                                          }
                                          if(§§pop() === §§pop())
                                          {
                                             if(!(_loc11_ && Boolean(param1)))
                                             {
                                                addr03c3:
                                                §§push(2);
                                                break loop5;
                                             }
                                             break loop7;
                                          }
                                          §§push(3);
                                          if(!_loc12_)
                                          {
                                             break loop6;
                                          }
                                       }
                                       §§push(_loc9_);
                                       break loop21;
                                    }
                                    §§goto(addr03fe);
                                 }
                                 if(§§pop() === §§pop())
                                 {
                                    if(_loc12_)
                                    {
                                       §§push(3);
                                       if(!(_loc11_ && Boolean(param1)))
                                       {
                                          break loop22;
                                       }
                                       break loop6;
                                    }
                                    break;
                                 }
                                 §§goto(addr03fe);
                                 §§push(4);
                              }
                              §§push(4);
                              break;
                           }
                           addr0400:
                           loop8:
                           switch(§§pop())
                           {
                              case 0:
                                 _loc6_ = this.faceStruct;
                                 loop9:
                                 while(true)
                                 {
                                    if(_loc12_ || Boolean(this))
                                    {
                                       addr0414:
                                       if(this.debug <= 0)
                                       {
                                          break;
                                       }
                                    }
                                    addr041d:
                                    §§push(param2.getChildCanvas(true,false));
                                    if(_loc12_ || Boolean(param1))
                                    {
                                       _loc5_ = §§pop();
                                       if(!_loc11_)
                                       {
                                          loop10:
                                          while(true)
                                          {
                                             loop11:
                                             while(true)
                                             {
                                                loop12:
                                                while(true)
                                                {
                                                   loop13:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(this.debug);
                                                         if(!_loc11_)
                                                         {
                                                            §§push(Debug.EDGES);
                                                            if(!(_loc12_ || Boolean(param1)))
                                                            {
                                                               break;
                                                            }
                                                            §§push(§§pop() & §§pop());
                                                            if(!(_loc12_ || Boolean(param1)))
                                                            {
                                                               break loop13;
                                                            }
                                                            §§push(Boolean(§§pop()));
                                                            if(_loc11_)
                                                            {
                                                               break loop12;
                                                            }
                                                            if(§§pop())
                                                            {
                                                               Debug.drawEdges(param1,_loc5_,_loc6_,16777215);
                                                               if(!_loc12_)
                                                               {
                                                                  break loop11;
                                                               }
                                                            }
                                                            §§push(this.debug);
                                                            if(_loc11_)
                                                            {
                                                               break loop10;
                                                            }
                                                         }
                                                         §§push(Debug.BOUNDS);
                                                         if(_loc12_ || Boolean(param2))
                                                         {
                                                            §§push(§§pop() & §§pop());
                                                            if(!(_loc11_ && Boolean(param1)))
                                                            {
                                                               §§push(Boolean(§§pop()));
                                                               break loop12;
                                                            }
                                                            break loop13;
                                                         }
                                                         break;
                                                      }
                                                      §§goto(addr04fd);
                                                   }
                                                   §§goto(addr04fb);
                                                }
                                                if(!§§pop())
                                                {
                                                   break loop9;
                                                }
                                                if(!_loc11_)
                                                {
                                                   §§push(this.space);
                                                   if(_loc12_)
                                                   {
                                                      break loop10;
                                                   }
                                                   break loop13;
                                                }
                                                §§goto(addr04f4);
                                             }
                                             Debug.drawBounds(param1,_loc5_,param4,this.boundMinX,this.boundMinY,this.boundMinZ,this.boundMaxX,this.boundMaxY,this.boundMaxZ,10092288);
                                             addr04f4:
                                             break loop9;
                                          }
                                          §§push(1);
                                          if(!_loc11_)
                                          {
                                             if(§§pop() == §§pop())
                                             {
                                                break loop11;
                                             }
                                             addr04fb:
                                             §§push(this.space);
                                             §§push(2);
                                          }
                                          addr04fd:
                                          if(§§pop() != §§pop())
                                          {
                                             break;
                                          }
                                       }
                                       Debug.drawBounds(param1,_loc5_,this.object,this.boundMinX,this.boundMinY,this.boundMinZ,this.boundMaxX,this.boundMaxY,this.boundMaxZ,16750848);
                                       break;
                                    }
                                    break loop8;
                                 }
                                 addr0523:
                                 §§push(param2.getChildCanvas(true,false,this.object,this.alpha,this.blendMode,this.colorTransform,this.filters));
                                 break;
                              case 1:
                                 loop15:
                                 while(true)
                                 {
                                    §§push(this.faceStruct);
                                    if(_loc12_ || Boolean(this))
                                    {
                                       if(§§pop().alternativa3d::processNext != null)
                                       {
                                          while(true)
                                          {
                                             if(_loc12_)
                                             {
                                                §§push(param1.sortByAverageZ(this.faceStruct));
                                                break loop15;
                                             }
                                             §§goto(addr041d);
                                          }
                                          §§goto(addr0523);
                                       }
                                       else
                                       {
                                          §§push(this.faceStruct);
                                       }
                                    }
                                    §§push(§§pop());
                                    break;
                                 }
                                 _loc6_ = §§pop();
                                 if(!_loc12_)
                                 {
                                    addr02e5:
                                    _loc6_ = param1.sortByDynamicBSP(this.faceStruct,param3);
                                    addr02d2:
                                 }
                                 §§goto(addr0414);
                              case 2:
                                 while(true)
                                 {
                                    §§push(this.faceStruct);
                                    if(_loc12_ || Boolean(param3))
                                    {
                                       if(§§pop().alternativa3d::processNext != null)
                                       {
                                          §§goto(addr02d2);
                                       }
                                       else
                                       {
                                          §§push(this.faceStruct);
                                       }
                                    }
                                    §§push(§§pop());
                                    break;
                                 }
                                 §§goto(addr02e5);
                              case 3:
                                 _loc6_ = this.collectNode(this.faceStruct);
                                 §§goto(addr0414);
                              default:
                                 §§goto(addr0414);
                           }
                           _loc5_ = §§pop();
                           _loc7_ = _loc6_;
                           if(_loc12_)
                           {
                              while(true)
                              {
                                 if(_loc7_ == null)
                                 {
                                    break loop2;
                                 }
                                 _loc8_ = _loc7_.processNext;
                                 loop18:
                                 while(true)
                                 {
                                    loop19:
                                    while(true)
                                    {
                                       §§push(_loc8_ == null);
                                       if(!_loc11_)
                                       {
                                          while(true)
                                          {
                                             §§push(Boolean(§§pop()));
                                             if(!(_loc11_ && Boolean(param1)))
                                             {
                                                var _temp_17:* = §§pop();
                                                §§push(_temp_17);
                                                §§push(_temp_17);
                                                if(_loc12_)
                                                {
                                                   §§push(Boolean(§§pop()));
                                                }
                                                if(§§pop())
                                                {
                                                   break loop18;
                                                }
                                                if(_loc11_ && Boolean(param1))
                                                {
                                                   break loop18;
                                                }
                                                §§pop();
                                                §§push(_loc8_.material);
                                                if(_loc11_ && Boolean(this))
                                                {
                                                   break loop19;
                                                }
                                                §§push(§§pop() == _loc6_.material);
                                                if(!(_loc12_ || Boolean(param2)))
                                                {
                                                   break;
                                                }
                                             }
                                             §§push(!§§pop());
                                             if(_loc12_ || Boolean(this))
                                             {
                                                break;
                                             }
                                             break loop18;
                                          }
                                       }
                                       §§push(Boolean(§§pop()));
                                       break loop18;
                                    }
                                    if(§§pop() != null)
                                    {
                                       §§goto(addr05da);
                                       §§push(_loc6_.material);
                                    }
                                    else
                                    {
                                       while(_loc6_ != null)
                                       {
                                          _loc7_ = _loc6_.processNext;
                                          if(!_loc11_)
                                          {
                                             _loc6_.processNext = null;
                                          }
                                          _loc6_ = _loc7_;
                                       }
                                    }
                                    §§goto(addr061f);
                                 }
                                 if(§§pop())
                                 {
                                    _loc7_.processNext = null;
                                    §§push(_loc6_.material);
                                    if(!_loc11_)
                                    {
                                       break loop19;
                                    }
                                    addr05da:
                                    §§pop().alternativa3d::draw(param1,_loc5_,_loc6_,this.object.ml);
                                    if(_loc12_ || Boolean(param1))
                                    {
                                    }
                                    addr061f:
                                    _loc6_ = _loc8_;
                                 }
                                 _loc7_ = _loc8_;
                              }
                           }
                           break loop2;
                           addr03fe:
                        }
                        §§goto(addr03c3);
                     }
                     §§goto(addr03fe);
                  }
                  §§goto(addr0400);
               }
            }
            _loc6_ = this.faceStruct;
            while(true)
            {
               if(_loc12_ || Boolean(this))
               {
                  if(this.debug <= 0)
                  {
                     break;
                  }
               }
               §§push(param2.getChildCanvas(true,false));
               if(!_loc11_)
               {
                  _loc5_ = §§pop();
                  if(!_loc11_)
                  {
                     loop26:
                     while(true)
                     {
                        loop27:
                        while(true)
                        {
                           loop28:
                           while(true)
                           {
                              loop29:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(this.debug);
                                    if(_loc12_)
                                    {
                                       §§push(Debug.EDGES);
                                       if(!(_loc12_ || Boolean(param2)))
                                       {
                                          break;
                                       }
                                       §§push(§§pop() & §§pop());
                                       if(_loc12_ || Boolean(param2))
                                       {
                                          §§push(Boolean(§§pop()));
                                          if(_loc11_ && Boolean(param1))
                                          {
                                             break loop29;
                                          }
                                          if(§§pop())
                                          {
                                             if(_loc11_ && Boolean(param1))
                                             {
                                                break loop28;
                                             }
                                             loop31:
                                             while(true)
                                             {
                                                loop32:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(Debug);
                                                      §§push(param1);
                                                      §§push(_loc5_);
                                                      §§push(_loc6_);
                                                      if(_loc12_ || Boolean(param3))
                                                      {
                                                         §§push(this.space);
                                                         if(!(_loc12_ || Boolean(param3)))
                                                         {
                                                            break;
                                                         }
                                                         if(§§pop() == 2)
                                                         {
                                                            §§push(16750848);
                                                            if(!(_loc11_ && Boolean(param1)))
                                                            {
                                                               break loop32;
                                                            }
                                                            break loop31;
                                                         }
                                                      }
                                                      §§push(16777215);
                                                      if(!(_loc11_ && Boolean(param3)))
                                                      {
                                                         §§push(int(§§pop()));
                                                         if(!(_loc11_ && Boolean(param1)))
                                                         {
                                                            break;
                                                         }
                                                         break loop32;
                                                      }
                                                      break loop31;
                                                   }
                                                   break loop31;
                                                }
                                                §§push(int(§§pop()));
                                                break;
                                             }
                                             §§pop().alternativa3d::drawEdges(§§pop(),§§pop(),§§pop(),§§pop());
                                             if(_loc11_)
                                             {
                                                break loop27;
                                             }
                                          }
                                          §§push(this.debug);
                                          if(_loc11_)
                                          {
                                             break loop26;
                                          }
                                       }
                                    }
                                    §§push(Debug.BOUNDS);
                                    if(!(_loc12_ || Boolean(this)))
                                    {
                                       break;
                                    }
                                    §§push(§§pop() & §§pop());
                                    if(_loc12_)
                                    {
                                       break loop26;
                                    }
                                    §§goto(addr01e0);
                                 }
                                 §§goto(addr01e2);
                              }
                              §§goto(addr01cb);
                           }
                           §§goto(addr01dd);
                        }
                     }
                     addr01cb:
                     if(Boolean(§§pop()))
                     {
                        if(_loc12_ || Boolean(this))
                        {
                           addr01dd:
                           addr01e0:
                           addr01e2:
                           if(this.space == 1)
                           {
                              if(_loc12_)
                              {
                                 break loop27;
                              }
                           }
                           break;
                        }
                        break loop27;
                     }
                     break;
                  }
                  break loop27;
               }
               addr0222:
               _loc5_ = §§pop();
               if(_loc12_ || Boolean(param3))
               {
                  _loc6_.material.drawViewAligned(param1,_loc5_,_loc6_,this.object.ml,this.tma,this.tmb,this.tmc,this.tmd,this.tmtx,this.tmty);
               }
               break loop2;
            }
            §§goto(addr0222);
         }
         this.faceStruct = null;
      }
      
      private function collectNode(param1:Face, param2:Face = null) : Face
      {
         §§push(false);
         var _loc6_:Boolean = true;
         var _loc7_:* = §§pop();
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Face = null;
         loop2:
         while(true)
         {
            while(true)
            {
               if(!_loc7_)
               {
                  if(param1.offset >= 0)
                  {
                     _loc4_ = param1.processPositive;
                     _loc5_ = param1.processNegative;
                     break;
                  }
               }
               _loc4_ = param1.processNegative;
               _loc5_ = param1.processPositive;
               if(!_loc7_)
               {
                  break;
               }
               break loop2;
            }
            param1.processNegative = null;
            while(true)
            {
               if(!(_loc7_ && Boolean(_loc3_)))
               {
                  param1.processPositive = null;
                  if(!(_loc6_ || Boolean(param1)))
                  {
                     break;
                  }
               }
               if(_loc5_ != null)
               {
                  if(_loc6_)
                  {
                     break loop2;
                  }
                  break;
               }
               §§goto(addr009a);
            }
            §§goto(addr00a2);
         }
         param2 = this.collectNode(_loc5_,param2);
         addr009a:
         if(param1.wrapper != null)
         {
            addr00a2:
            _loc3_ = param1;
            loop0:
            while(true)
            {
               §§push(_loc3_.processNext);
               do
               {
                  if(§§pop() == null)
                  {
                     break loop0;
                  }
                  §§push(_loc3_.processNext);
               }
               while(!(_loc6_ || Boolean(_loc3_)));
               _loc3_ = §§pop();
            }
            if(!(_loc7_ && Boolean(param1)))
            {
               _loc3_.processNext = param2;
            }
            param2 = param1;
         }
         if(_loc4_ != null)
         {
            param2 = this.collectNode(_loc4_,param2);
         }
         return param2;
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(_loc2_)
{
   VG = §§newclass(VG,Object);
}

