package alternativa.engine3d.objects
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Canvas;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.core.VG;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class Sprite3D extends Object3D
   {
      
      private static var tma:Number;
      
      private static var tmb:Number;
      
      private static var tmc:Number;
      
      private static var tmd:Number;
      
      private static var tmtx:Number;
      
      private static var tmty:Number;
      
      public var material:Material;
      
      public var originX:Number = 0.5;
      
      public var originY:Number = 0.5;
      
      public var sorting:int = 0;
      
      public var clipping:int = 2;
      
      public var rotation:Number = 0;
      
      public var width:Number;
      
      public var height:Number;
      
      public var perspectiveScale:Boolean = true;
      
      public function Sprite3D(param1:Number, param2:Number, param3:Material = null)
      {
         var _temp_1:* = true;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = _temp_1;
         while(true)
         {
            if(!(_loc4_ && Boolean(this)))
            {
               super();
               if(!(_loc5_ || Boolean(param1)))
               {
                  break;
               }
            }
            this.width = param1;
            if(_loc5_)
            {
               this.height = param2;
               if(!(_loc4_ && Boolean(this)))
               {
                  break;
               }
            }
            §§goto(addr0066);
         }
         this.material = param3;
         addr0066:
      }
      
      override public function calculateResolution(param1:int, param2:int, param3:int = 1, param4:Matrix3D = null) : Number
      {
         §§push(false);
         var _loc9_:Boolean = true;
         var _loc10_:* = §§pop();
         var _loc7_:Object3D = null;
         var _loc8_:* = NaN;
         §§push(this.width);
         if(_loc9_)
         {
            §§push(Number(§§pop()));
         }
         var _loc5_:* = §§pop();
         §§push(this.height);
         if(_loc9_)
         {
            §§push(Number(§§pop()));
         }
         var _loc6_:* = §§pop();
         loop0:
         while(true)
         {
            if(param4 != null)
            {
               if(!(_loc9_ || Boolean(param2)))
               {
                  break;
               }
               _loc7_ = new Object3D();
               if(_loc9_)
               {
                  _loc7_.matrix = param4;
                  loop1:
                  while(true)
                  {
                     if(_loc9_ || Boolean(param3))
                     {
                        _loc7_.composeMatrix();
                        if(_loc10_)
                        {
                           break;
                        }
                     }
                     loop2:
                     while(true)
                     {
                        while(true)
                        {
                           §§push((Math.sqrt(_loc7_.ma * _loc7_.ma + _loc7_.me * _loc7_.me + _loc7_.mi * _loc7_.mi) + Math.sqrt(_loc7_.mb * _loc7_.mb + _loc7_.mf * _loc7_.mf + _loc7_.mj * _loc7_.mj) + Math.sqrt(_loc7_.mc * _loc7_.mc + _loc7_.mg * _loc7_.mg + _loc7_.mk * _loc7_.mk)) / 3);
                           if(_loc9_)
                           {
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(Number(§§pop()));
                                    if(!(_loc10_ && Boolean(param2)))
                                    {
                                       _loc8_ = §§pop();
                                       if(_loc9_ || Boolean(param1))
                                       {
                                          break loop1;
                                       }
                                       §§goto(addr0156);
                                    }
                                    §§goto(addr0166);
                                 }
                                 §§goto(addr016c);
                              }
                              §§goto(addr016a);
                           }
                           addr0137:
                           while(true)
                           {
                              §§push(Number(§§pop()));
                              if(_loc9_ || Boolean(param1))
                              {
                                 break loop2;
                              }
                              §§goto(addr0166);
                           }
                        }
                        addr0168:
                        §§push(§§pop() * §§pop());
                        break loop4;
                     }
                     _loc5_ = §§pop();
                     if(!(_loc10_ && Boolean(param2)))
                     {
                        addr016a:
                        addr0156:
                        §§push(_loc6_);
                        if(_loc9_ || Boolean(param3))
                        {
                           addr0166:
                           §§push(_loc8_);
                           break loop3;
                        }
                        _loc6_ = §§pop();
                     }
                  }
                  while(true)
                  {
                     §§push(_loc5_);
                     §§push(_loc8_);
                     if(!(_loc10_ && Boolean(param2)))
                     {
                        §§push(§§pop() * §§pop());
                        if(!(_loc9_ || Boolean(param1)))
                        {
                           break loop2;
                        }
                        §§goto(addr0137);
                     }
                     §§goto(addr0168);
                  }
               }
            }
            addr016c:
            loop6:
            while(true)
            {
               §§push(_loc5_);
               §§push(param1);
               if(!_loc10_)
               {
                  _loc5_ = §§pop() / §§pop();
                  §§push(_loc6_);
                  §§push(param2);
                  if(!_loc9_)
                  {
                     break;
                  }
               }
               §§push(§§pop() / §§pop());
               if(!(_loc10_ && Boolean(param1)))
               {
                  _loc6_ = §§pop();
                  §§push(param3);
                  if(_loc9_ || Boolean(param3))
                  {
                     loop7:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(0);
                           if(_loc9_)
                           {
                              if(§§pop() == §§pop())
                              {
                                 §§goto(addr01b1);
                              }
                              §§push(param3);
                              if(!_loc9_)
                              {
                                 break;
                              }
                              §§push(1);
                              if(!_loc9_)
                              {
                                 break loop7;
                              }
                           }
                           if(§§pop() != §§pop())
                           {
                              break loop0;
                           }
                           §§push(_loc5_);
                           §§push(_loc6_);
                           if(_loc9_ || Boolean(param2))
                           {
                              §§push(§§pop() + §§pop());
                              if(!(_loc10_ && Boolean(param1)))
                              {
                                 §§push(2);
                                 break loop6;
                              }
                           }
                           else
                           {
                              addr0228:
                              while(true)
                              {
                                 if(§§pop() > §§pop())
                                 {
                                    §§push(_loc5_);
                                    if(!_loc10_)
                                    {
                                       §§push(Number(§§pop()));
                                       if(_loc10_ && Boolean(this))
                                       {
                                          addr0253:
                                          §§push(Number(§§pop()));
                                          break;
                                       }
                                    }
                                    break;
                                 }
                                 §§push(_loc6_);
                                 §§goto(addr0253);
                              }
                              §§goto(addr0254);
                           }
                           addr0254:
                           return §§pop();
                        }
                     }
                     while(true)
                     {
                        if(§§pop() == §§pop())
                        {
                           §§push(_loc5_);
                           §§push(_loc6_);
                           if(!(_loc10_ && Boolean(param2)))
                           {
                              if(§§pop() < §§pop())
                              {
                                 §§push(_loc5_);
                                 if(_loc10_ && Boolean(this))
                                 {
                                    addr0226:
                                    §§push(_loc6_);
                                    break;
                                 }
                                 return Number(§§pop());
                              }
                              else
                              {
                                 return Number(_loc6_);
                              }
                           }
                           break;
                        }
                        §§push(_loc5_);
                        §§goto(addr0226);
                     }
                     §§goto(addr0228);
                  }
                  addr01eb:
                  §§push(2);
                  break loop7;
               }
               addr01b1:
               return _loc5_;
            }
            return §§pop() / §§pop();
         }
         §§goto(addr01eb);
      }
      
      override public function intersectRay(param1:Vector3D, param2:Vector3D, param3:Dictionary = null, param4:Camera3D = null) : RayIntersectionData
      {
         §§push(false);
         var _loc53_:Boolean = true;
         var _loc54_:* = §§pop();
         var _loc5_:Vertex = null;
         var _loc9_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc47_:Number = NaN;
         var _loc48_:Number = NaN;
         var _loc49_:Number = NaN;
         var _loc50_:Number = NaN;
         var _loc51_:Vector3D = null;
         var _loc52_:RayIntersectionData = null;
         if(!(_loc54_ && Boolean(this)))
         {
            loop6:
            while(true)
            {
               loop7:
               while(true)
               {
                  while(true)
                  {
                     §§push(param4 == null);
                     if(_loc53_)
                     {
                        var _temp_11:* = Boolean(§§pop());
                        §§push(_temp_11);
                        §§push(_temp_11);
                        if(!(_loc53_ || Boolean(this)))
                        {
                           break;
                        }
                        §§push(Boolean(§§pop()));
                        if(!_loc53_)
                        {
                           break;
                        }
                        if(§§pop())
                        {
                           break loop7;
                        }
                        §§pop();
                        if(_loc54_ && Boolean(this))
                        {
                           break loop6;
                        }
                        §§push(param3 != null);
                     }
                     var _temp_14:* = Boolean(§§pop());
                     §§push(_temp_14);
                     §§push(_temp_14);
                     if(_loc53_ || Boolean(this))
                     {
                        §§push(Boolean(§§pop()));
                     }
                     break;
                  }
                  if(§§pop())
                  {
                     §§pop();
                     if(!_loc54_)
                     {
                        §§push(Boolean(param3[this]));
                        break;
                     }
                     break loop6;
                  }
                  break;
               }
               if(§§pop())
               {
                  if(_loc53_ || Boolean(param1))
                  {
                     §§goto(addr00d2);
                  }
               }
               param4.composeMatrix();
               break;
            }
            var _loc6_:Object3D = param4;
            loop0:
            while(true)
            {
               §§push(_loc6_._parent);
               do
               {
                  if(§§pop() == null)
                  {
                     break loop0;
                  }
                  §§push(_loc6_._parent);
               }
               while(_loc54_);
               _loc6_ = §§pop();
               if(!_loc54_)
               {
                  _loc6_.composeMatrix();
                  if(!(_loc54_ && Boolean(this)))
                  {
                     param4.appendMatrix(_loc6_);
                  }
               }
            }
            while(true)
            {
               if(_loc53_)
               {
                  param4.invertMatrix();
                  if(_loc54_ && Boolean(this))
                  {
                     break;
                  }
               }
               composeMatrix();
               break;
            }
            _loc6_ = this;
            if(_loc53_ || Boolean(param1))
            {
               loop2:
               while(true)
               {
                  §§push(_loc6_._parent);
                  do
                  {
                     if(§§pop() == null)
                     {
                        break loop2;
                     }
                     §§push(_loc6_._parent);
                  }
                  while(_loc54_);
                  _loc6_ = §§pop();
                  if(!(_loc54_ && Boolean(param1)))
                  {
                     _loc6_.composeMatrix();
                     if(!_loc54_)
                     {
                        appendMatrix(_loc6_);
                     }
                  }
               }
               if(!(_loc54_ && Boolean(param1)))
               {
                  appendMatrix(param4);
               }
            }
            var _loc7_:Face = new Face();
            while(true)
            {
               if(_loc53_)
               {
                  _loc7_.material = this.material;
                  if(!_loc53_)
                  {
                     break;
                  }
               }
               _loc7_.wrapper = new Wrapper();
               break;
            }
            _loc5_ = new Vertex();
            if(!(_loc54_ && Boolean(param2)))
            {
               _loc5_.u = 0;
               if(!(_loc54_ && Boolean(param2)))
               {
                  _loc5_.v = 0;
                  loop10:
                  while(true)
                  {
                     while(true)
                     {
                        if(_loc53_)
                        {
                           §§push(_loc7_.wrapper);
                           if(!(_loc53_ || Boolean(param3)))
                           {
                              break;
                           }
                           §§pop().alternativa3d::vertex = _loc5_;
                           if(!_loc53_)
                           {
                              break loop10;
                           }
                        }
                        §§push(_loc7_.wrapper);
                        break;
                     }
                     §§pop().alternativa3d::next = new Wrapper();
                     break;
                  }
               }
            }
            break loop10;
         }
         addr00d2:
         return null;
      }
      
      override public function clone() : Object3D
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         var _loc1_:Sprite3D = new Sprite3D(this.width,this.height);
         if(!_loc2_)
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
         if(_loc3_ || _loc3_)
         {
            super.clonePropertiesFrom(param1);
         }
         var _loc2_:Sprite3D = param1 as Sprite3D;
         while(true)
         {
            if(!(_loc4_ && Boolean(param1)))
            {
               this.width = _loc2_.width;
               if(_loc3_)
               {
                  this.height = _loc2_.height;
                  if(!(_loc4_ && Boolean(param1)))
                  {
                     this.material = _loc2_.material;
                     this.clipping = _loc2_.clipping;
                     if(_loc4_)
                     {
                        break;
                     }
                  }
                  this.sorting = _loc2_.sorting;
                  this.originX = _loc2_.originX;
               }
            }
            this.originY = _loc2_.originY;
            if(_loc3_ || _loc3_)
            {
               break;
            }
            §§goto(addr00a5);
         }
         this.rotation = _loc2_.rotation;
         addr00a5:
         this.perspectiveScale = _loc2_.perspectiveScale;
      }
      
      override alternativa3d function draw(param1:Camera3D, param2:Canvas) : void
      {
         §§push(false);
         var _loc7_:Boolean = true;
         var _loc8_:* = §§pop();
         var _loc3_:Canvas = null;
         var _loc4_:* = 0;
         if(!_loc8_)
         {
            if(this.material == null)
            {
               if(!(_loc8_ && Boolean(_loc3_)))
               {
                  §§goto(addr0036);
               }
            }
            var _loc5_:Face = this.calculateFace(param1);
            loop0:
            while(true)
            {
               while(true)
               {
                  if(_loc7_)
                  {
                     if(_loc5_ == null)
                     {
                        break;
                     }
                     if(!_loc7_)
                     {
                        break loop0;
                     }
                  }
                  while(true)
                  {
                     §§push(param1.debug);
                     if(!(_loc8_ && Boolean(this)))
                     {
                        §§push(Boolean(§§pop()));
                        if(!(_loc8_ && Boolean(_loc3_)))
                        {
                           var _temp_17:* = §§pop();
                           §§push(_temp_17);
                           §§push(_temp_17);
                           if(!(_loc8_ && Boolean(param1)))
                           {
                              §§push(Boolean(§§pop()));
                           }
                           if(!§§pop())
                           {
                              break;
                           }
                           if(_loc8_ && Boolean(param1))
                           {
                              break;
                           }
                        }
                     }
                     §§pop();
                     if(!(_loc8_ && Boolean(_loc3_)))
                     {
                        break loop0;
                     }
                     §§goto(addr00f1);
                  }
                  §§goto(addr00ed);
               }
               return;
            }
            while(true)
            {
               §§push(param1.checkInDebug(this));
               if(_loc7_)
               {
                  var _temp_2:* = §§pop();
                  §§push(_temp_2);
                  §§push(_temp_2);
                  if(!(_loc7_ || Boolean(this)))
                  {
                     break;
                  }
                  var _loc6_:* = §§pop();
                  if(_loc7_)
                  {
                     §§push(int(§§pop()));
                     if(_loc7_ || Boolean(this))
                     {
                        _loc4_ = §§pop();
                        §§push(_loc6_);
                     }
                  }
               }
               §§push(0);
               break;
            }
            addr00ed:
            §§push(§§pop() > §§pop());
            if(_loc7_ || Boolean(param1))
            {
               §§push(Boolean(§§pop()));
            }
            while(true)
            {
               if(§§pop())
               {
                  addr00f1:
                  §§push(param2.getChildCanvas(true,false));
                  if(_loc8_ && Boolean(param1))
                  {
                     break;
                  }
                  _loc3_ = §§pop();
                  loop4:
                  while(true)
                  {
                     if(_loc7_)
                     {
                        loop5:
                        while(true)
                        {
                           loop6:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(_loc4_);
                                 if(_loc7_ || Boolean(param1))
                                 {
                                    §§push(Debug.EDGES);
                                    if(!(_loc7_ || Boolean(param1)))
                                    {
                                       break;
                                    }
                                    §§push(§§pop() & §§pop());
                                    if(!(_loc8_ && Boolean(param1)))
                                    {
                                       §§push(Boolean(§§pop()));
                                       if(_loc8_ && Boolean(_loc3_))
                                       {
                                          break loop6;
                                       }
                                       if(§§pop())
                                       {
                                          if(_loc8_)
                                          {
                                             break loop4;
                                          }
                                          Debug.drawEdges(param1,_loc3_,_loc5_,16777215);
                                          if(!(_loc7_ || Boolean(param2)))
                                          {
                                             break loop4;
                                          }
                                       }
                                       §§push(_loc4_);
                                       if(!(_loc7_ || Boolean(this)))
                                       {
                                          break loop5;
                                       }
                                    }
                                 }
                                 §§push(Debug.BOUNDS);
                                 break;
                              }
                              §§push(§§pop() & §§pop());
                              break loop5;
                           }
                           if(!§§pop())
                           {
                              break loop4;
                           }
                           if(!(_loc7_ || Boolean(param2)))
                           {
                              break loop4;
                           }
                        }
                        §§push(Boolean(§§pop()));
                        break loop6;
                     }
                     Debug.drawBounds(param1,_loc3_,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
                     break;
                  }
               }
               §§push(param2.getChildCanvas(true,false,this,alpha,blendMode,colorTransform,filters));
               break;
            }
            _loc3_ = §§pop();
            if(_loc7_ || Boolean(param2))
            {
               this.material.drawViewAligned(param1,_loc3_,_loc5_,ml,tma,tmb,tmc,tmd,tmtx,tmty);
            }
            break loop1;
         }
         addr0036:
      }
      
      override alternativa3d function getVG(param1:Camera3D) : VG
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         if(_loc4_ || Boolean(param1))
         {
            if(this.material == null)
            {
               if(!(_loc3_ && Boolean(_loc2_)))
               {
                  §§goto(addr0035);
               }
            }
            var _loc2_:Face = this.calculateFace(param1);
            if(_loc2_ != null)
            {
               _loc2_.normalX = 0;
               if(_loc4_)
               {
                  _loc2_.normalY = 0;
                  _loc2_.normalZ = -1;
                  _loc2_.offset = -ml;
               }
               while(true)
               {
                  §§push(VG);
                  §§push(this);
                  §§push(_loc2_);
                  §§push(this.sorting);
                  if(!(_loc3_ && Boolean(this)))
                  {
                     if(!param1.debug)
                     {
                        §§push(0);
                        if(_loc4_ || _loc3_)
                        {
                           §§push(int(§§pop()));
                        }
                        break;
                     }
                  }
                  §§push(param1.checkInDebug(this));
                  if(!_loc3_)
                  {
                     §§push(int(§§pop()));
                     if(!(_loc4_ || Boolean(param1)))
                     {
                        break;
                     }
                  }
                  break;
               }
               return §§pop().alternativa3d::create(§§pop(),§§pop(),§§pop(),§§pop(),true,tma,tmb,tmc,tmd,tmtx,tmty);
            }
            return null;
         }
         addr0035:
         return null;
      }
      
      private function calculateFace(param1:Camera3D) : Face
      {
         §§push(false);
         var _loc35_:Boolean = true;
         var _loc36_:* = §§pop();
         var _loc3_:* = NaN;
         var _loc4_:* = NaN;
         var _loc5_:* = NaN;
         var _loc6_:* = NaN;
         var _loc7_:* = NaN;
         var _loc8_:* = NaN;
         var _loc9_:* = NaN;
         var _loc10_:* = NaN;
         var _loc11_:* = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Vertex = null;
         var _loc14_:Vertex = null;
         var _loc22_:Number = NaN;
         var _loc23_:* = NaN;
         var _loc24_:* = NaN;
         var _loc25_:* = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:* = NaN;
         var _loc31_:Vertex = null;
         var _loc32_:Vertex = null;
         var _loc33_:Vertex = null;
         var _loc34_:Vertex = null;
         if(_loc35_)
         {
            culling &= 60;
         }
         var _loc2_:Number = ml;
         if(!_loc36_)
         {
            while(true)
            {
               §§push(_loc2_);
               if(!_loc36_)
               {
                  loop6:
                  while(true)
                  {
                     §§push(param1.nearClipping);
                     if(_loc35_ || Boolean(_loc3_))
                     {
                        loop7:
                        while(true)
                        {
                           §§push(§§pop() <= §§pop());
                           if(!(_loc36_ && Boolean(this)))
                           {
                              §§push(Boolean(§§pop()));
                              if(_loc36_)
                              {
                                 break;
                              }
                           }
                           var _temp_3:* = §§pop();
                           §§push(_temp_3);
                           §§push(_temp_3);
                           if(!(_loc36_ && Boolean(_loc3_)))
                           {
                              §§push(Boolean(§§pop()));
                           }
                           loop8:
                           while(true)
                           {
                              loop9:
                              while(true)
                              {
                                 while(true)
                                 {
                                    if(!§§pop())
                                    {
                                       if(_loc36_)
                                       {
                                          break loop7;
                                       }
                                       §§pop();
                                       if(_loc36_)
                                       {
                                          break;
                                       }
                                       §§push(_loc2_);
                                       if(_loc36_ && Boolean(_loc3_))
                                       {
                                          break loop9;
                                       }
                                       §§push(param1.farClipping);
                                       if(_loc36_)
                                       {
                                          break loop8;
                                       }
                                       §§push(§§pop() >= §§pop());
                                       if(!(_loc36_ && Boolean(param1)))
                                       {
                                          break loop7;
                                       }
                                    }
                                    addr00fc:
                                    if(§§pop())
                                    {
                                       if(!_loc36_)
                                       {
                                          §§goto(addr0106);
                                       }
                                    }
                                    break;
                                 }
                                 §§push(param1.viewSizeX);
                                 if(_loc35_)
                                 {
                                    break;
                                 }
                                 break loop6;
                              }
                              §§push(_loc2_);
                              break;
                           }
                        }
                        §§goto(addr00fc);
                     }
                     break loop8;
                  }
               }
               §§push(Number(§§pop()));
               break;
            }
            var _loc15_:* = §§pop();
            §§push(param1.viewSizeY);
            if(_loc35_)
            {
               §§push(§§pop() / _loc2_);
               if(_loc35_)
               {
                  §§push(Number(§§pop()));
               }
            }
            var _loc16_:* = §§pop();
            while(true)
            {
               §§push(param1.focalLength);
               if(!_loc36_)
               {
                  §§push(§§pop() / _loc2_);
                  if(_loc36_)
                  {
                     break;
                  }
               }
               §§push(Number(§§pop()));
               break;
            }
            var _loc17_:* = §§pop();
            §§push(param1.focalLength);
            if(_loc35_ || Boolean(this))
            {
               §§push(§§pop() / param1.viewSizeX);
               if(_loc35_)
               {
                  §§push(Number(§§pop()));
               }
            }
            var _loc18_:* = §§pop();
            while(true)
            {
               §§push(param1.focalLength);
               if(_loc35_)
               {
                  §§push(§§pop() / param1.viewSizeY);
                  if(_loc36_)
                  {
                     break;
                  }
               }
               §§push(Number(§§pop()));
               break;
            }
            var _loc19_:* = §§pop();
            loop13:
            while(true)
            {
               loop14:
               while(true)
               {
                  loop94:
                  while(true)
                  {
                     loop183:
                     while(true)
                     {
                        loop184:
                        while(true)
                        {
                           loop185:
                           while(true)
                           {
                              loop186:
                              while(true)
                              {
                                 loop187:
                                 while(true)
                                 {
                                    loop188:
                                    while(true)
                                    {
                                       loop189:
                                       while(true)
                                       {
                                          loop190:
                                          while(true)
                                          {
                                             loop191:
                                             while(true)
                                             {
                                                loop192:
                                                while(true)
                                                {
                                                   loop193:
                                                   while(true)
                                                   {
                                                      loop194:
                                                      while(true)
                                                      {
                                                         loop195:
                                                         while(true)
                                                         {
                                                            loop196:
                                                            while(true)
                                                            {
                                                               loop197:
                                                               while(true)
                                                               {
                                                                  loop198:
                                                                  while(true)
                                                                  {
                                                                     loop199:
                                                                     while(true)
                                                                     {
                                                                        loop200:
                                                                        while(true)
                                                                        {
                                                                           loop201:
                                                                           while(true)
                                                                           {
                                                                              loop202:
                                                                              while(true)
                                                                              {
                                                                                 loop203:
                                                                                 while(true)
                                                                                 {
                                                                                    if(!_loc36_)
                                                                                    {
                                                                                       loop204:
                                                                                       while(true)
                                                                                       {
                                                                                          loop205:
                                                                                          while(true)
                                                                                          {
                                                                                             loop206:
                                                                                             while(true)
                                                                                             {
                                                                                                loop207:
                                                                                                while(true)
                                                                                                {
                                                                                                   loop208:
                                                                                                   while(true)
                                                                                                   {
                                                                                                      loop209:
                                                                                                      while(true)
                                                                                                      {
                                                                                                         §§push(ma / _loc18_);
                                                                                                         if(!(_loc36_ && Boolean(_loc2_)))
                                                                                                         {
                                                                                                            loop210:
                                                                                                            while(true)
                                                                                                            {
                                                                                                               loop211:
                                                                                                               while(true)
                                                                                                               {
                                                                                                                  loop218:
                                                                                                                  while(true)
                                                                                                                  {
                                                                                                                     loop248:
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        loop250:
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              loop252:
                                                                                                                              while(true)
                                                                                                                              {
                                                                                                                                 loop253:
                                                                                                                                 while(true)
                                                                                                                                 {
                                                                                                                                    loop254:
                                                                                                                                    while(true)
                                                                                                                                    {
                                                                                                                                       while(true)
                                                                                                                                       {
                                                                                                                                          loop256:
                                                                                                                                          while(true)
                                                                                                                                          {
                                                                                                                                             while(true)
                                                                                                                                             {
                                                                                                                                                while(true)
                                                                                                                                                {
                                                                                                                                                   loop259:
                                                                                                                                                   while(true)
                                                                                                                                                   {
                                                                                                                                                      loop260:
                                                                                                                                                      while(true)
                                                                                                                                                      {
                                                                                                                                                         loop261:
                                                                                                                                                         while(true)
                                                                                                                                                         {
                                                                                                                                                            loop262:
                                                                                                                                                            while(true)
                                                                                                                                                            {
                                                                                                                                                               loop263:
                                                                                                                                                               while(true)
                                                                                                                                                               {
                                                                                                                                                                  loop264:
                                                                                                                                                                  while(true)
                                                                                                                                                                  {
                                                                                                                                                                     loop268:
                                                                                                                                                                     while(true)
                                                                                                                                                                     {
                                                                                                                                                                        loop269:
                                                                                                                                                                        while(true)
                                                                                                                                                                        {
                                                                                                                                                                           loop270:
                                                                                                                                                                           while(true)
                                                                                                                                                                           {
                                                                                                                                                                              loop271:
                                                                                                                                                                              while(true)
                                                                                                                                                                              {
                                                                                                                                                                                 loop272:
                                                                                                                                                                                 while(true)
                                                                                                                                                                                 {
                                                                                                                                                                                    loop273:
                                                                                                                                                                                    while(true)
                                                                                                                                                                                    {
                                                                                                                                                                                       §§push(Number(§§pop()));
                                                                                                                                                                                       if(_loc35_ || Boolean(param1))
                                                                                                                                                                                       {
                                                                                                                                                                                          _loc4_ = §§pop();
                                                                                                                                                                                          §§push(me / _loc19_);
                                                                                                                                                                                          if(_loc36_)
                                                                                                                                                                                          {
                                                                                                                                                                                             break loop270;
                                                                                                                                                                                          }
                                                                                                                                                                                          _loc5_ = §§pop();
                                                                                                                                                                                          if(!_loc35_)
                                                                                                                                                                                          {
                                                                                                                                                                                             break loop269;
                                                                                                                                                                                          }
                                                                                                                                                                                          loop274:
                                                                                                                                                                                          while(true)
                                                                                                                                                                                          {
                                                                                                                                                                                             while(true)
                                                                                                                                                                                             {
                                                                                                                                                                                                §§push(mi);
                                                                                                                                                                                                if(!_loc36_)
                                                                                                                                                                                                {
                                                                                                                                                                                                   _loc6_ = §§pop();
                                                                                                                                                                                                   if(_loc35_ || Boolean(this))
                                                                                                                                                                                                   {
                                                                                                                                                                                                      §§push(Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_));
                                                                                                                                                                                                      if(!(_loc36_ && Boolean(_loc3_)))
                                                                                                                                                                                                      {
                                                                                                                                                                                                         _loc3_ = §§pop();
                                                                                                                                                                                                         §§push(mb / _loc18_);
                                                                                                                                                                                                         if(!_loc36_)
                                                                                                                                                                                                         {
                                                                                                                                                                                                            _loc4_ = Number(§§pop());
                                                                                                                                                                                                            loop276:
                                                                                                                                                                                                            while(true)
                                                                                                                                                                                                            {
                                                                                                                                                                                                               while(true)
                                                                                                                                                                                                               {
                                                                                                                                                                                                                  §§push(mf / _loc19_);
                                                                                                                                                                                                                  if(_loc35_ || Boolean(_loc3_))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     _loc5_ = Number(§§pop());
                                                                                                                                                                                                                     if(!_loc35_)
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        break loop210;
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     _loc6_ = mj;
                                                                                                                                                                                                                     §§push(_loc3_ + Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_));
                                                                                                                                                                                                                     if(!_loc36_)
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        _loc3_ = §§pop();
                                                                                                                                                                                                                        §§push(mc / _loc18_);
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop192;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        _loc4_ = §§pop();
                                                                                                                                                                                                                        if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop262;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        _loc5_ = mg / _loc19_;
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop156;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        _loc6_ = mk;
                                                                                                                                                                                                                        if(_loc36_ && Boolean(_loc2_))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop230;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(_loc3_ + Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_));
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop261;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        _loc3_ = §§pop();
                                                                                                                                                                                                                        if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop191;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(_loc3_);
                                                                                                                                                                                                                        §§push(3);
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        _loc3_ = §§pop() / §§pop();
                                                                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop272;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(this.perspectiveScale);
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop193;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(!§§pop());
                                                                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop123;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        if(!§§pop())
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop276;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop194;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(_loc3_);
                                                                                                                                                                                                                        if(!(_loc35_ || Boolean(this)))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop273;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(§§pop() / _loc17_);
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     else
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        §§goto(addr0b22);
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  _loc3_ = Number(§§pop());
                                                                                                                                                                                                                  break loop276;
                                                                                                                                                                                                               }
                                                                                                                                                                                                               if(§§pop() == §§pop())
                                                                                                                                                                                                               {
                                                                                                                                                                                                                  if(!(_loc35_ || Boolean(_loc2_)))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     break loop191;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  §§push(_loc3_);
                                                                                                                                                                                                                  §§push(this.width);
                                                                                                                                                                                                                  if(!_loc35_)
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     break loop190;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  §§push(§§pop() * §§pop());
                                                                                                                                                                                                                  if(_loc36_)
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     break loop189;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  §§push(_loc18_);
                                                                                                                                                                                                                  if(!_loc35_)
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     continue loop19;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  §§push(§§pop() * §§pop());
                                                                                                                                                                                                                  if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     break loop211;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  _loc22_ = §§pop();
                                                                                                                                                                                                                  if(_loc36_)
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     break loop210;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  §§push(_loc3_ * this.height);
                                                                                                                                                                                                                  §§push(_loc19_);
                                                                                                                                                                                                                  if(_loc35_ || Boolean(_loc2_))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     §§push(§§pop() * §§pop());
                                                                                                                                                                                                                     if(_loc36_ && Boolean(this))
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        break loop248;
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     §§push(Number(§§pop()));
                                                                                                                                                                                                                     if(_loc35_)
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        _loc23_ = §§pop();
                                                                                                                                                                                                                        §§push(md - this.originX * _loc22_);
                                                                                                                                                                                                                        if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop264;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        _loc4_ = §§pop();
                                                                                                                                                                                                                        _loc5_ = mh - this.originY * _loc23_;
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop210;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(_loc4_);
                                                                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop188;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        _loc9_ = §§pop() + _loc22_;
                                                                                                                                                                                                                        §§push(_loc5_ + _loc23_);
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop223;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        _loc10_ = Number(§§pop());
                                                                                                                                                                                                                        if(_loc36_ && Boolean(this))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop254;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(§§findproperty(tmtx));
                                                                                                                                                                                                                        §§push(_loc4_);
                                                                                                                                                                                                                        if(!(_loc36_ && Boolean(param1)))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           §§push(§§pop() * _loc15_);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§pop().tmtx = §§pop();
                                                                                                                                                                                                                        while(true)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           if(!(_loc36_ && Boolean(_loc3_)))
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              §§push(§§findproperty(tmty));
                                                                                                                                                                                                                              §§push(_loc5_);
                                                                                                                                                                                                                              if(_loc35_)
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 §§push(§§pop() * _loc16_);
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              §§pop().tmty = §§pop();
                                                                                                                                                                                                                              if(culling > 0)
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 §§push(_loc4_);
                                                                                                                                                                                                                                 break loop263;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           else
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              §§goto(addr0529);
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           §§goto(addr056c);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§goto(addr20a2);
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     else
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        §§goto(addr076d);
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  §§goto(addr04e3);
                                                                                                                                                                                                               }
                                                                                                                                                                                                               else
                                                                                                                                                                                                               {
                                                                                                                                                                                                                  §§push(-Math.sin(this.rotation));
                                                                                                                                                                                                                  if(_loc36_)
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     break loop274;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  §§push(§§pop() * _loc3_);
                                                                                                                                                                                                               }
                                                                                                                                                                                                            }
                                                                                                                                                                                                            §§push(this.rotation);
                                                                                                                                                                                                            if(_loc35_ || Boolean(param1))
                                                                                                                                                                                                            {
                                                                                                                                                                                                               §§push(0);
                                                                                                                                                                                                               break loop277;
                                                                                                                                                                                                            }
                                                                                                                                                                                                            break loop271;
                                                                                                                                                                                                         }
                                                                                                                                                                                                         break loop263;
                                                                                                                                                                                                      }
                                                                                                                                                                                                      break loop264;
                                                                                                                                                                                                   }
                                                                                                                                                                                                   break loop268;
                                                                                                                                                                                                }
                                                                                                                                                                                                _loc24_ = §§pop();
                                                                                                                                                                                                if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                                                                {
                                                                                                                                                                                                   break loop250;
                                                                                                                                                                                                }
                                                                                                                                                                                                §§push(Math.cos(this.rotation) * _loc3_);
                                                                                                                                                                                                if(!_loc35_)
                                                                                                                                                                                                {
                                                                                                                                                                                                   break loop253;
                                                                                                                                                                                                }
                                                                                                                                                                                                §§push(Number(§§pop()));
                                                                                                                                                                                                if(_loc36_)
                                                                                                                                                                                                {
                                                                                                                                                                                                   break loop185;
                                                                                                                                                                                                }
                                                                                                                                                                                                _loc25_ = §§pop();
                                                                                                                                                                                                §§push(_loc25_);
                                                                                                                                                                                                if(!(_loc35_ || Boolean(this)))
                                                                                                                                                                                                {
                                                                                                                                                                                                   break loop252;
                                                                                                                                                                                                }
                                                                                                                                                                                                §§push(this.width);
                                                                                                                                                                                                if(_loc36_ && Boolean(this))
                                                                                                                                                                                                {
                                                                                                                                                                                                   break loop231;
                                                                                                                                                                                                }
                                                                                                                                                                                                §§push(§§pop() * §§pop());
                                                                                                                                                                                                if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                                {
                                                                                                                                                                                                   break loop209;
                                                                                                                                                                                                }
                                                                                                                                                                                                §§push(_loc18_);
                                                                                                                                                                                                if(!_loc35_)
                                                                                                                                                                                                {
                                                                                                                                                                                                   break loop197;
                                                                                                                                                                                                }
                                                                                                                                                                                                §§push(§§pop() * §§pop());
                                                                                                                                                                                                if(_loc35_)
                                                                                                                                                                                                {
                                                                                                                                                                                                   break loop248;
                                                                                                                                                                                                }
                                                                                                                                                                                                §§goto(addr0b83);
                                                                                                                                                                                             }
                                                                                                                                                                                             §§goto(addr0b85);
                                                                                                                                                                                          }
                                                                                                                                                                                          §§goto(addr083d);
                                                                                                                                                                                       }
                                                                                                                                                                                       §§goto(addr036a);
                                                                                                                                                                                    }
                                                                                                                                                                                    §§goto(addr04eb);
                                                                                                                                                                                 }
                                                                                                                                                                                 §§goto(addr04e8);
                                                                                                                                                                              }
                                                                                                                                                                              §§goto(addr0888);
                                                                                                                                                                           }
                                                                                                                                                                           §§goto(addr0791);
                                                                                                                                                                        }
                                                                                                                                                                        §§goto(addr04da);
                                                                                                                                                                     }
                                                                                                                                                                     §§goto(addr0a4a);
                                                                                                                                                                  }
                                                                                                                                                                  §§goto(addr0524);
                                                                                                                                                               }
                                                                                                                                                               var _temp_310:* = §§pop() > _loc2_;
                                                                                                                                                               while(true)
                                                                                                                                                               {
                                                                                                                                                                  §§push(_temp_310);
                                                                                                                                                                  if(!_temp_310)
                                                                                                                                                                  {
                                                                                                                                                                     if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                     {
                                                                                                                                                                        break loop206;
                                                                                                                                                                     }
                                                                                                                                                                     §§pop();
                                                                                                                                                                     if(!_loc35_)
                                                                                                                                                                     {
                                                                                                                                                                        break loop205;
                                                                                                                                                                     }
                                                                                                                                                                     §§push(_loc5_);
                                                                                                                                                                     if(_loc36_)
                                                                                                                                                                     {
                                                                                                                                                                        break loop260;
                                                                                                                                                                     }
                                                                                                                                                                     §§push(_loc2_);
                                                                                                                                                                     if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                                     {
                                                                                                                                                                        break loop195;
                                                                                                                                                                     }
                                                                                                                                                                     §§push(§§pop() > §§pop());
                                                                                                                                                                     if(_loc36_)
                                                                                                                                                                     {
                                                                                                                                                                        break;
                                                                                                                                                                     }
                                                                                                                                                                  }
                                                                                                                                                                  var _temp_313:* = §§pop();
                                                                                                                                                                  while(true)
                                                                                                                                                                  {
                                                                                                                                                                     §§push(_temp_313);
                                                                                                                                                                     if(!Boolean(_temp_313))
                                                                                                                                                                     {
                                                                                                                                                                        §§pop();
                                                                                                                                                                        §§push(_loc9_);
                                                                                                                                                                        §§push(_loc2_);
                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                        {
                                                                                                                                                                           break;
                                                                                                                                                                        }
                                                                                                                                                                        §§push(-§§pop());
                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                        {
                                                                                                                                                                           break loop259;
                                                                                                                                                                        }
                                                                                                                                                                        §§push(§§pop() < §§pop());
                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                        {
                                                                                                                                                                           break loop131;
                                                                                                                                                                        }
                                                                                                                                                                        §§push(Boolean(§§pop()));
                                                                                                                                                                     }
                                                                                                                                                                     var _temp_314:* = §§pop();
                                                                                                                                                                     §§push(_temp_314);
                                                                                                                                                                     §§push(_temp_314);
                                                                                                                                                                     if(_loc36_)
                                                                                                                                                                     {
                                                                                                                                                                        continue loop106;
                                                                                                                                                                     }
                                                                                                                                                                     §§push(Boolean(§§pop()));
                                                                                                                                                                     if(_loc35_ || Boolean(_loc2_))
                                                                                                                                                                     {
                                                                                                                                                                        while(true)
                                                                                                                                                                        {
                                                                                                                                                                           if(!§§pop())
                                                                                                                                                                           {
                                                                                                                                                                              §§pop();
                                                                                                                                                                              if(!_loc35_)
                                                                                                                                                                              {
                                                                                                                                                                                 break loop151;
                                                                                                                                                                              }
                                                                                                                                                                              §§push(_loc10_);
                                                                                                                                                                              §§push(-_loc2_);
                                                                                                                                                                              if(!(_loc35_ || Boolean(this)))
                                                                                                                                                                              {
                                                                                                                                                                                 break;
                                                                                                                                                                              }
                                                                                                                                                                              §§push(§§pop() < §§pop());
                                                                                                                                                                           }
                                                                                                                                                                           if(§§pop())
                                                                                                                                                                           {
                                                                                                                                                                              return null;
                                                                                                                                                                           }
                                                                                                                                                                           §§push(this.clipping);
                                                                                                                                                                           §§push(2);
                                                                                                                                                                           if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                                           {
                                                                                                                                                                              break loop256;
                                                                                                                                                                           }
                                                                                                                                                                           if(§§pop() == §§pop())
                                                                                                                                                                           {
                                                                                                                                                                              addr04da:
                                                                                                                                                                              §§push(_loc4_);
                                                                                                                                                                              §§push(_loc2_);
                                                                                                                                                                              if(_loc35_)
                                                                                                                                                                              {
                                                                                                                                                                                 addr04e3:
                                                                                                                                                                                 if(§§pop() < -§§pop())
                                                                                                                                                                                 {
                                                                                                                                                                                    addr04eb:
                                                                                                                                                                                    _loc4_ = -_loc2_;
                                                                                                                                                                                    addr04e8:
                                                                                                                                                                                 }
                                                                                                                                                                                 §§push(_loc5_);
                                                                                                                                                                                 if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                 {
                                                                                                                                                                                    break loop207;
                                                                                                                                                                                 }
                                                                                                                                                                                 §§push(_loc2_);
                                                                                                                                                                                 if(!_loc35_)
                                                                                                                                                                                 {
                                                                                                                                                                                    break loop218;
                                                                                                                                                                                 }
                                                                                                                                                                                 if(§§pop() < -§§pop())
                                                                                                                                                                                 {
                                                                                                                                                                                    §§push(_loc2_);
                                                                                                                                                                                    break loop261;
                                                                                                                                                                                 }
                                                                                                                                                                                 continue loop232;
                                                                                                                                                                              }
                                                                                                                                                                              §§goto(addr0f20);
                                                                                                                                                                           }
                                                                                                                                                                           else
                                                                                                                                                                           {
                                                                                                                                                                              §§goto(addr056c);
                                                                                                                                                                           }
                                                                                                                                                                        }
                                                                                                                                                                        §§goto(addr0e7d);
                                                                                                                                                                     }
                                                                                                                                                                     §§goto(addr0e3f);
                                                                                                                                                                  }
                                                                                                                                                                  §§goto(addr099b);
                                                                                                                                                               }
                                                                                                                                                               §§goto(addr0c2a);
                                                                                                                                                            }
                                                                                                                                                            §§goto(addr088a);
                                                                                                                                                         }
                                                                                                                                                         §§push(-§§pop());
                                                                                                                                                         break loop211;
                                                                                                                                                      }
                                                                                                                                                      §§goto(addr0868);
                                                                                                                                                   }
                                                                                                                                                   §§goto(addr0b86);
                                                                                                                                                }
                                                                                                                                                §§goto(addr09cb);
                                                                                                                                             }
                                                                                                                                             §§goto(addr0f23);
                                                                                                                                          }
                                                                                                                                          §§goto(addr0954);
                                                                                                                                       }
                                                                                                                                       §§goto(addr0ea5);
                                                                                                                                    }
                                                                                                                                    §§goto(addr0a24);
                                                                                                                                 }
                                                                                                                                 §§goto(addr082d);
                                                                                                                              }
                                                                                                                              §§goto(addr0822);
                                                                                                                           }
                                                                                                                           §§goto(addr0836);
                                                                                                                        }
                                                                                                                        §§goto(addr0b04);
                                                                                                                     }
                                                                                                                     _loc26_ = §§pop();
                                                                                                                     §§push(-_loc24_);
                                                                                                                     §§push(this.width);
                                                                                                                     if(!(_loc35_ || Boolean(_loc2_)))
                                                                                                                     {
                                                                                                                        break loop196;
                                                                                                                     }
                                                                                                                     addr076d:
                                                                                                                     §§goto(addr0770);
                                                                                                                     §§push(§§pop() * §§pop() * _loc19_);
                                                                                                                  }
                                                                                                                  addr0791:
                                                                                                                  _loc28_ = §§pop() * §§pop();
                                                                                                                  §§push(_loc25_);
                                                                                                                  if(_loc36_ && Boolean(_loc2_))
                                                                                                                  {
                                                                                                                     break loop219;
                                                                                                                  }
                                                                                                                  while(true)
                                                                                                                  {
                                                                                                                     §§push(this.height);
                                                                                                                     if(!_loc36_)
                                                                                                                     {
                                                                                                                        §§push(§§pop() * §§pop());
                                                                                                                        §§push(_loc19_);
                                                                                                                        if(_loc36_)
                                                                                                                        {
                                                                                                                           break;
                                                                                                                        }
                                                                                                                        _loc29_ = §§pop() * §§pop();
                                                                                                                        if(_loc36_)
                                                                                                                        {
                                                                                                                           break loop232;
                                                                                                                        }
                                                                                                                        §§goto(addr07bf);
                                                                                                                     }
                                                                                                                     §§goto(addr086a);
                                                                                                                  }
                                                                                                                  §§goto(addr0e7d);
                                                                                                               }
                                                                                                               _loc5_ = §§pop();
                                                                                                               if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                               {
                                                                                                                  break loop191;
                                                                                                               }
                                                                                                               loop219:
                                                                                                               while(true)
                                                                                                               {
                                                                                                                  loop220:
                                                                                                                  while(true)
                                                                                                                  {
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           loop223:
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              loop224:
                                                                                                                              while(true)
                                                                                                                              {
                                                                                                                                 loop225:
                                                                                                                                 while(true)
                                                                                                                                 {
                                                                                                                                    loop226:
                                                                                                                                    while(true)
                                                                                                                                    {
                                                                                                                                       loop227:
                                                                                                                                       while(true)
                                                                                                                                       {
                                                                                                                                          loop228:
                                                                                                                                          while(true)
                                                                                                                                          {
                                                                                                                                             loop229:
                                                                                                                                             while(true)
                                                                                                                                             {
                                                                                                                                                loop230:
                                                                                                                                                while(true)
                                                                                                                                                {
                                                                                                                                                   loop231:
                                                                                                                                                   while(true)
                                                                                                                                                   {
                                                                                                                                                      while(true)
                                                                                                                                                      {
                                                                                                                                                         while(true)
                                                                                                                                                         {
                                                                                                                                                            §§push(_loc9_);
                                                                                                                                                            if(_loc35_)
                                                                                                                                                            {
                                                                                                                                                               addr0524:
                                                                                                                                                               loop234:
                                                                                                                                                               while(true)
                                                                                                                                                               {
                                                                                                                                                                  if(§§pop() > _loc2_)
                                                                                                                                                                  {
                                                                                                                                                                     addr0529:
                                                                                                                                                                     §§push(_loc2_);
                                                                                                                                                                     if(!_loc36_)
                                                                                                                                                                     {
                                                                                                                                                                        §§push(Number(§§pop()));
                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                        {
                                                                                                                                                                           break loop227;
                                                                                                                                                                        }
                                                                                                                                                                        _loc9_ = §§pop();
                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                        {
                                                                                                                                                                           addr07bf:
                                                                                                                                                                           §§push(md - this.originX * _loc26_);
                                                                                                                                                                           §§push(this.originY);
                                                                                                                                                                           if(_loc35_ || Boolean(this))
                                                                                                                                                                           {
                                                                                                                                                                              while(true)
                                                                                                                                                                              {
                                                                                                                                                                                 §§push(_loc28_);
                                                                                                                                                                                 if(!_loc36_)
                                                                                                                                                                                 {
                                                                                                                                                                                    §§push(§§pop() - §§pop() * §§pop());
                                                                                                                                                                                    if(!_loc35_)
                                                                                                                                                                                    {
                                                                                                                                                                                       break;
                                                                                                                                                                                    }
                                                                                                                                                                                    _loc4_ = §§pop();
                                                                                                                                                                                    if(!(_loc35_ || Boolean(_loc2_)))
                                                                                                                                                                                    {
                                                                                                                                                                                       break loop230;
                                                                                                                                                                                    }
                                                                                                                                                                                    §§push(mh - this.originX * _loc27_);
                                                                                                                                                                                    if(_loc36_ && Boolean(_loc2_))
                                                                                                                                                                                    {
                                                                                                                                                                                       break loop186;
                                                                                                                                                                                    }
                                                                                                                                                                                    §§push(this.originY);
                                                                                                                                                                                    §§push(_loc29_);
                                                                                                                                                                                 }
                                                                                                                                                                                 §§push(§§pop() - §§pop() * §§pop());
                                                                                                                                                                                 if(!_loc36_)
                                                                                                                                                                                 {
                                                                                                                                                                                    addr0822:
                                                                                                                                                                                    §§push(Number(§§pop()));
                                                                                                                                                                                    if(_loc35_)
                                                                                                                                                                                    {
                                                                                                                                                                                       break;
                                                                                                                                                                                    }
                                                                                                                                                                                    break loop229;
                                                                                                                                                                                 }
                                                                                                                                                                                 break loop185;
                                                                                                                                                                              }
                                                                                                                                                                              _loc5_ = §§pop();
                                                                                                                                                                              addr082d:
                                                                                                                                                                              §§push(_loc4_);
                                                                                                                                                                              §§push(_loc28_);
                                                                                                                                                                              if(!_loc36_)
                                                                                                                                                                              {
                                                                                                                                                                                 §§push(§§pop() + §§pop());
                                                                                                                                                                                 break;
                                                                                                                                                                              }
                                                                                                                                                                              break loop228;
                                                                                                                                                                           }
                                                                                                                                                                           break loop231;
                                                                                                                                                                        }
                                                                                                                                                                     }
                                                                                                                                                                     else
                                                                                                                                                                     {
                                                                                                                                                                        addr0770:
                                                                                                                                                                        _loc27_ = §§pop();
                                                                                                                                                                        §§push(_loc24_);
                                                                                                                                                                        if(!(_loc36_ && Boolean(param1)))
                                                                                                                                                                        {
                                                                                                                                                                           §§push(§§pop() * this.height);
                                                                                                                                                                           if(_loc35_)
                                                                                                                                                                           {
                                                                                                                                                                              §§push(_loc18_);
                                                                                                                                                                              break loop218;
                                                                                                                                                                           }
                                                                                                                                                                           break loop224;
                                                                                                                                                                        }
                                                                                                                                                                        §§goto(addr0aee);
                                                                                                                                                                     }
                                                                                                                                                                  }
                                                                                                                                                                  while(true)
                                                                                                                                                                  {
                                                                                                                                                                     if(_loc10_ > _loc2_)
                                                                                                                                                                     {
                                                                                                                                                                        §§push(_loc2_);
                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                        {
                                                                                                                                                                           break loop226;
                                                                                                                                                                        }
                                                                                                                                                                        §§push(Number(§§pop()));
                                                                                                                                                                        if(_loc36_ && Boolean(this))
                                                                                                                                                                        {
                                                                                                                                                                           break loop234;
                                                                                                                                                                        }
                                                                                                                                                                        _loc10_ = §§pop();
                                                                                                                                                                        if(_loc36_ && Boolean(param1))
                                                                                                                                                                        {
                                                                                                                                                                           §§goto(addr13fb);
                                                                                                                                                                        }
                                                                                                                                                                     }
                                                                                                                                                                     addr056c:
                                                                                                                                                                     §§push(Vertex.createList(4));
                                                                                                                                                                     if(_loc35_ || Boolean(_loc3_))
                                                                                                                                                                     {
                                                                                                                                                                        _loc13_ = §§pop();
                                                                                                                                                                        _loc14_ = _loc13_;
                                                                                                                                                                        while(true)
                                                                                                                                                                        {
                                                                                                                                                                           if(_loc35_ || Boolean(_loc2_))
                                                                                                                                                                           {
                                                                                                                                                                              _loc14_.cameraX = _loc4_;
                                                                                                                                                                              if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                                              {
                                                                                                                                                                                 break;
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           _loc14_.cameraY = _loc5_;
                                                                                                                                                                           if(!(_loc36_ && Boolean(_loc2_)))
                                                                                                                                                                           {
                                                                                                                                                                              break;
                                                                                                                                                                           }
                                                                                                                                                                           addr05c8:
                                                                                                                                                                           _loc14_ = _loc14_.next;
                                                                                                                                                                           if(!(_loc36_ && Boolean(this)))
                                                                                                                                                                           {
                                                                                                                                                                              _loc14_.cameraX = _loc4_;
                                                                                                                                                                              while(true)
                                                                                                                                                                              {
                                                                                                                                                                                 if(_loc35_)
                                                                                                                                                                                 {
                                                                                                                                                                                    _loc14_.cameraY = _loc10_;
                                                                                                                                                                                    if(_loc36_ && Boolean(_loc2_))
                                                                                                                                                                                    {
                                                                                                                                                                                       break;
                                                                                                                                                                                    }
                                                                                                                                                                                 }
                                                                                                                                                                                 _loc14_.cameraZ = _loc2_;
                                                                                                                                                                                 break;
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           _loc14_ = _loc14_.next;
                                                                                                                                                                           if(_loc35_ || Boolean(param1))
                                                                                                                                                                           {
                                                                                                                                                                              _loc14_.cameraX = _loc9_;
                                                                                                                                                                              while(true)
                                                                                                                                                                              {
                                                                                                                                                                                 if(!_loc36_)
                                                                                                                                                                                 {
                                                                                                                                                                                    _loc14_.cameraY = _loc10_;
                                                                                                                                                                                    if(_loc36_ && Boolean(_loc2_))
                                                                                                                                                                                    {
                                                                                                                                                                                       break;
                                                                                                                                                                                    }
                                                                                                                                                                                 }
                                                                                                                                                                                 _loc14_.cameraZ = _loc2_;
                                                                                                                                                                                 break;
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           _loc14_ = _loc14_.next;
                                                                                                                                                                           if(!_loc36_)
                                                                                                                                                                           {
                                                                                                                                                                              _loc14_.cameraX = _loc9_;
                                                                                                                                                                              _loc14_.cameraY = _loc5_;
                                                                                                                                                                              _loc14_.cameraZ = _loc2_;
                                                                                                                                                                              loop240:
                                                                                                                                                                              while(true)
                                                                                                                                                                              {
                                                                                                                                                                                 while(true)
                                                                                                                                                                                 {
                                                                                                                                                                                    §§push(§§findproperty(tma));
                                                                                                                                                                                    §§push(_loc3_);
                                                                                                                                                                                    if(_loc35_)
                                                                                                                                                                                    {
                                                                                                                                                                                       §§push(_loc17_);
                                                                                                                                                                                       if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                                                       {
                                                                                                                                                                                          break;
                                                                                                                                                                                       }
                                                                                                                                                                                       §§push(§§pop() * §§pop());
                                                                                                                                                                                       if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                                                       {
                                                                                                                                                                                          break loop240;
                                                                                                                                                                                       }
                                                                                                                                                                                    }
                                                                                                                                                                                    §§push(this.width);
                                                                                                                                                                                    break;
                                                                                                                                                                                 }
                                                                                                                                                                                 §§push(§§pop() * §§pop());
                                                                                                                                                                                 break;
                                                                                                                                                                              }
                                                                                                                                                                              §§pop().tma = §§pop();
                                                                                                                                                                           }
                                                                                                                                                                           tmb = 0;
                                                                                                                                                                           tmc = 0;
                                                                                                                                                                           if(!(_loc36_ && Boolean(param1)))
                                                                                                                                                                           {
                                                                                                                                                                              §§push(§§findproperty(tmd));
                                                                                                                                                                              §§push(_loc3_);
                                                                                                                                                                              if(!(_loc36_ && Boolean(_loc3_)))
                                                                                                                                                                              {
                                                                                                                                                                                 while(true)
                                                                                                                                                                                 {
                                                                                                                                                                                    §§push(_loc17_);
                                                                                                                                                                                    if(_loc35_ || Boolean(_loc2_))
                                                                                                                                                                                    {
                                                                                                                                                                                       §§push(§§pop() * §§pop());
                                                                                                                                                                                       if(!_loc35_)
                                                                                                                                                                                       {
                                                                                                                                                                                          break;
                                                                                                                                                                                       }
                                                                                                                                                                                       §§push(this.height);
                                                                                                                                                                                    }
                                                                                                                                                                                    §§push(§§pop() * §§pop());
                                                                                                                                                                                    break;
                                                                                                                                                                                 }
                                                                                                                                                                              }
                                                                                                                                                                              §§pop().tmd = §§pop();
                                                                                                                                                                           }
                                                                                                                                                                           §§goto(addr22ee);
                                                                                                                                                                        }
                                                                                                                                                                        _loc14_.cameraZ = _loc2_;
                                                                                                                                                                        §§goto(addr05c8);
                                                                                                                                                                     }
                                                                                                                                                                     else
                                                                                                                                                                     {
                                                                                                                                                                        §§goto(addr0c91);
                                                                                                                                                                     }
                                                                                                                                                                  }
                                                                                                                                                                  §§goto(addr20a2);
                                                                                                                                                               }
                                                                                                                                                               addr0836:
                                                                                                                                                               §§push(Number(§§pop()));
                                                                                                                                                               if(!_loc35_)
                                                                                                                                                               {
                                                                                                                                                                  break loop225;
                                                                                                                                                               }
                                                                                                                                                               _loc7_ = §§pop();
                                                                                                                                                               §§push(_loc5_);
                                                                                                                                                               if(_loc36_ && Boolean(_loc2_))
                                                                                                                                                               {
                                                                                                                                                                  break loop185;
                                                                                                                                                               }
                                                                                                                                                               _loc8_ = §§pop() + _loc29_;
                                                                                                                                                               §§push(_loc4_);
                                                                                                                                                               §§push(_loc26_);
                                                                                                                                                               if(_loc36_ && Boolean(this))
                                                                                                                                                               {
                                                                                                                                                                  break loop203;
                                                                                                                                                               }
                                                                                                                                                               §§push(§§pop() + §§pop() + _loc28_);
                                                                                                                                                               if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                               {
                                                                                                                                                                  break loop224;
                                                                                                                                                               }
                                                                                                                                                               §§push(Number(§§pop()));
                                                                                                                                                               if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                               {
                                                                                                                                                                  break loop202;
                                                                                                                                                               }
                                                                                                                                                               _loc9_ = §§pop();
                                                                                                                                                               §§push(_loc5_);
                                                                                                                                                               if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                               {
                                                                                                                                                                  break loop223;
                                                                                                                                                               }
                                                                                                                                                               §§push(§§pop() + _loc27_);
                                                                                                                                                               if(!_loc35_)
                                                                                                                                                               {
                                                                                                                                                                  break loop201;
                                                                                                                                                               }
                                                                                                                                                               §§push(_loc29_);
                                                                                                                                                               if(!_loc36_)
                                                                                                                                                               {
                                                                                                                                                                  _loc10_ = §§pop() + §§pop();
                                                                                                                                                                  §§push(_loc4_);
                                                                                                                                                                  if(_loc36_)
                                                                                                                                                                  {
                                                                                                                                                                     break loop200;
                                                                                                                                                                  }
                                                                                                                                                                  §§push(_loc26_);
                                                                                                                                                                  if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                                  {
                                                                                                                                                                     break loop220;
                                                                                                                                                                  }
                                                                                                                                                                  §§push(§§pop() + §§pop());
                                                                                                                                                                  if(_loc36_ && Boolean(this))
                                                                                                                                                                  {
                                                                                                                                                                     break loop219;
                                                                                                                                                                  }
                                                                                                                                                                  _loc11_ = §§pop();
                                                                                                                                                                  §§push(_loc5_);
                                                                                                                                                                  if(_loc36_ && Boolean(_loc2_))
                                                                                                                                                                  {
                                                                                                                                                                     break loop207;
                                                                                                                                                                  }
                                                                                                                                                               }
                                                                                                                                                               else
                                                                                                                                                               {
                                                                                                                                                                  §§goto(addr09c9);
                                                                                                                                                               }
                                                                                                                                                            }
                                                                                                                                                            §§push(§§pop() + _loc27_);
                                                                                                                                                            if(!(_loc36_ && Boolean(param1)))
                                                                                                                                                            {
                                                                                                                                                               _loc12_ = §§pop();
                                                                                                                                                               if(!_loc35_)
                                                                                                                                                               {
                                                                                                                                                                  break loop152;
                                                                                                                                                               }
                                                                                                                                                               §§push(§§findproperty(tmtx));
                                                                                                                                                               §§push(_loc4_);
                                                                                                                                                               if(_loc35_ || Boolean(_loc2_))
                                                                                                                                                               {
                                                                                                                                                                  §§push(§§pop() * _loc15_);
                                                                                                                                                               }
                                                                                                                                                               §§pop().tmtx = §§pop();
                                                                                                                                                               §§push(§§findproperty(tmty));
                                                                                                                                                               §§push(_loc5_);
                                                                                                                                                               if(!(_loc36_ && Boolean(_loc3_)))
                                                                                                                                                               {
                                                                                                                                                                  §§push(§§pop() * _loc16_);
                                                                                                                                                               }
                                                                                                                                                               §§pop().tmty = §§pop();
                                                                                                                                                               if(!_loc35_)
                                                                                                                                                               {
                                                                                                                                                                  break loop208;
                                                                                                                                                               }
                                                                                                                                                               if(culling <= 0)
                                                                                                                                                               {
                                                                                                                                                                  _loc13_ = Vertex.createList(4);
                                                                                                                                                                  _loc14_ = _loc13_;
                                                                                                                                                                  while(true)
                                                                                                                                                                  {
                                                                                                                                                                     if(!_loc36_)
                                                                                                                                                                     {
                                                                                                                                                                        _loc14_.cameraX = _loc4_;
                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                        {
                                                                                                                                                                           break;
                                                                                                                                                                        }
                                                                                                                                                                     }
                                                                                                                                                                     _loc14_.cameraY = _loc5_;
                                                                                                                                                                     if(_loc35_)
                                                                                                                                                                     {
                                                                                                                                                                        _loc14_.cameraZ = _loc2_;
                                                                                                                                                                     }
                                                                                                                                                                     break;
                                                                                                                                                                  }
                                                                                                                                                                  _loc14_ = _loc14_.next;
                                                                                                                                                                  if(_loc35_ || Boolean(param1))
                                                                                                                                                                  {
                                                                                                                                                                     §§push(_loc14_);
                                                                                                                                                                     §§push(_loc4_);
                                                                                                                                                                     if(_loc35_)
                                                                                                                                                                     {
                                                                                                                                                                        §§push(§§pop() + _loc28_);
                                                                                                                                                                     }
                                                                                                                                                                     §§pop().alternativa3d::cameraX = §§pop();
                                                                                                                                                                     while(true)
                                                                                                                                                                     {
                                                                                                                                                                        if(!(_loc36_ && Boolean(_loc2_)))
                                                                                                                                                                        {
                                                                                                                                                                           §§push(_loc14_);
                                                                                                                                                                           §§push(_loc5_);
                                                                                                                                                                           if(_loc35_ || Boolean(this))
                                                                                                                                                                           {
                                                                                                                                                                              §§push(§§pop() + _loc29_);
                                                                                                                                                                           }
                                                                                                                                                                           §§pop().alternativa3d::cameraY = §§pop();
                                                                                                                                                                           if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                                           {
                                                                                                                                                                              break;
                                                                                                                                                                           }
                                                                                                                                                                        }
                                                                                                                                                                        _loc14_.cameraZ = _loc2_;
                                                                                                                                                                        break;
                                                                                                                                                                     }
                                                                                                                                                                  }
                                                                                                                                                                  _loc14_ = _loc14_.next;
                                                                                                                                                                  while(true)
                                                                                                                                                                  {
                                                                                                                                                                     if(_loc35_ || Boolean(param1))
                                                                                                                                                                     {
                                                                                                                                                                        §§push(_loc14_);
                                                                                                                                                                        §§push(_loc4_);
                                                                                                                                                                        if(_loc35_ || Boolean(_loc3_))
                                                                                                                                                                        {
                                                                                                                                                                           while(true)
                                                                                                                                                                           {
                                                                                                                                                                              §§push(_loc26_);
                                                                                                                                                                              if(!_loc36_)
                                                                                                                                                                              {
                                                                                                                                                                                 §§push(§§pop() + §§pop());
                                                                                                                                                                                 if(!_loc35_)
                                                                                                                                                                                 {
                                                                                                                                                                                    break;
                                                                                                                                                                                 }
                                                                                                                                                                                 §§push(_loc28_);
                                                                                                                                                                              }
                                                                                                                                                                              §§push(§§pop() + §§pop());
                                                                                                                                                                              break;
                                                                                                                                                                           }
                                                                                                                                                                        }
                                                                                                                                                                        §§pop().alternativa3d::cameraX = §§pop();
                                                                                                                                                                        if(_loc35_)
                                                                                                                                                                        {
                                                                                                                                                                           §§push(_loc14_);
                                                                                                                                                                           §§push(_loc5_);
                                                                                                                                                                           if(_loc35_ || Boolean(_loc3_))
                                                                                                                                                                           {
                                                                                                                                                                              while(true)
                                                                                                                                                                              {
                                                                                                                                                                                 §§push(_loc27_);
                                                                                                                                                                                 if(_loc35_ || Boolean(_loc3_))
                                                                                                                                                                                 {
                                                                                                                                                                                    §§push(§§pop() + §§pop());
                                                                                                                                                                                    if(!_loc35_)
                                                                                                                                                                                    {
                                                                                                                                                                                       break;
                                                                                                                                                                                    }
                                                                                                                                                                                    §§push(_loc29_);
                                                                                                                                                                                 }
                                                                                                                                                                                 §§push(§§pop() + §§pop());
                                                                                                                                                                                 break;
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           §§pop().alternativa3d::cameraY = §§pop();
                                                                                                                                                                           if(_loc36_)
                                                                                                                                                                           {
                                                                                                                                                                              break;
                                                                                                                                                                           }
                                                                                                                                                                        }
                                                                                                                                                                     }
                                                                                                                                                                     _loc14_.cameraZ = _loc2_;
                                                                                                                                                                     break;
                                                                                                                                                                  }
                                                                                                                                                                  _loc14_ = _loc14_.next;
                                                                                                                                                                  if(_loc35_)
                                                                                                                                                                  {
                                                                                                                                                                     §§push(_loc14_);
                                                                                                                                                                     §§push(_loc4_);
                                                                                                                                                                     if(!(_loc36_ && Boolean(_loc2_)))
                                                                                                                                                                     {
                                                                                                                                                                        §§push(§§pop() + _loc26_);
                                                                                                                                                                     }
                                                                                                                                                                     §§pop().alternativa3d::cameraX = §§pop();
                                                                                                                                                                     if(_loc36_ && Boolean(param1))
                                                                                                                                                                     {
                                                                                                                                                                        continue loop60;
                                                                                                                                                                     }
                                                                                                                                                                  }
                                                                                                                                                                  §§push(_loc14_);
                                                                                                                                                                  §§push(_loc5_);
                                                                                                                                                                  if(!_loc36_)
                                                                                                                                                                  {
                                                                                                                                                                     §§push(§§pop() + _loc27_);
                                                                                                                                                                  }
                                                                                                                                                                  §§pop().alternativa3d::cameraY = §§pop();
                                                                                                                                                                  if(!(_loc36_ && Boolean(_loc2_)))
                                                                                                                                                                  {
                                                                                                                                                                     _loc14_.cameraZ = _loc2_;
                                                                                                                                                                  }
                                                                                                                                                                  continue loop60;
                                                                                                                                                               }
                                                                                                                                                               §§push(this.clipping);
                                                                                                                                                               if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                               {
                                                                                                                                                                  break loop198;
                                                                                                                                                               }
                                                                                                                                                               if(§§pop() == 1)
                                                                                                                                                               {
                                                                                                                                                                  if(_loc35_ || Boolean(this))
                                                                                                                                                                  {
                                                                                                                                                                     break loop210;
                                                                                                                                                                  }
                                                                                                                                                                  §§goto(addr0c18);
                                                                                                                                                               }
                                                                                                                                                               else
                                                                                                                                                               {
                                                                                                                                                                  §§goto(addr0dfe);
                                                                                                                                                                  §§push(culling & 4);
                                                                                                                                                               }
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                               §§goto(addr0b83);
                                                                                                                                                            }
                                                                                                                                                         }
                                                                                                                                                         §§goto(addr0e7d);
                                                                                                                                                      }
                                                                                                                                                      §§goto(addr0ab0);
                                                                                                                                                   }
                                                                                                                                                   §§goto(addr0e2f);
                                                                                                                                                }
                                                                                                                                                §§goto(addr0a6d);
                                                                                                                                             }
                                                                                                                                             §§goto(addr0a6e);
                                                                                                                                          }
                                                                                                                                          §§goto(addr0b38);
                                                                                                                                       }
                                                                                                                                       §§goto(addr0c19);
                                                                                                                                    }
                                                                                                                                    §§goto(addr0c0c);
                                                                                                                                 }
                                                                                                                                 §§goto(addr09f7);
                                                                                                                              }
                                                                                                                              §§goto(addr0f1e);
                                                                                                                           }
                                                                                                                        }
                                                                                                                        §§goto(addr109a);
                                                                                                                     }
                                                                                                                     §§goto(addr0c0b);
                                                                                                                  }
                                                                                                                  §§goto(addr0b2a);
                                                                                                               }
                                                                                                               §§goto(addr108a);
                                                                                                            }
                                                                                                            var _temp_246:* = culling & 4;
                                                                                                            loop212:
                                                                                                            while(true)
                                                                                                            {
                                                                                                               §§push(_temp_246);
                                                                                                               if(Boolean(_temp_246))
                                                                                                               {
                                                                                                                  §§pop();
                                                                                                                  if(_loc35_)
                                                                                                                  {
                                                                                                                     §§push(_loc2_);
                                                                                                                     if(_loc36_ && Boolean(_loc2_))
                                                                                                                     {
                                                                                                                        break;
                                                                                                                     }
                                                                                                                     §§push(-_loc4_);
                                                                                                                     if(_loc36_ && Boolean(this))
                                                                                                                     {
                                                                                                                        break loop161;
                                                                                                                     }
                                                                                                                     §§push(§§pop() <= §§pop());
                                                                                                                     if(!_loc35_)
                                                                                                                     {
                                                                                                                        break loop199;
                                                                                                                     }
                                                                                                                     §§push(§§pop());
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                     §§goto(addr0ee0);
                                                                                                                  }
                                                                                                               }
                                                                                                               var _temp_249:* = §§pop();
                                                                                                               loop213:
                                                                                                               while(true)
                                                                                                               {
                                                                                                                  §§push(_temp_249);
                                                                                                                  if(Boolean(_temp_249))
                                                                                                                  {
                                                                                                                     §§pop();
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           §§push(_loc2_);
                                                                                                                           if(_loc35_)
                                                                                                                           {
                                                                                                                              §§push(_loc7_);
                                                                                                                              if(!_loc36_)
                                                                                                                              {
                                                                                                                                 §§push(-§§pop());
                                                                                                                                 if(_loc35_ || Boolean(this))
                                                                                                                                 {
                                                                                                                                    addr09cb:
                                                                                                                                    var _temp_251:* = Boolean(§§pop() <= §§pop());
                                                                                                                                    addr09c9:
                                                                                                                                    while(true)
                                                                                                                                    {
                                                                                                                                       §§push(_temp_251);
                                                                                                                                       §§push(_temp_251);
                                                                                                                                       if(!(_loc36_ && Boolean(_loc2_)))
                                                                                                                                       {
                                                                                                                                          while(true)
                                                                                                                                          {
                                                                                                                                             if(Boolean(§§pop()))
                                                                                                                                             {
                                                                                                                                                §§pop();
                                                                                                                                                if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                {
                                                                                                                                                   break loop213;
                                                                                                                                                }
                                                                                                                                                §§push(_loc2_);
                                                                                                                                                if(!_loc35_)
                                                                                                                                                {
                                                                                                                                                   break loop212;
                                                                                                                                                }
                                                                                                                                                §§push(-_loc9_);
                                                                                                                                                if(!_loc36_)
                                                                                                                                                {
                                                                                                                                                   §§push(Boolean(§§pop() <= §§pop()));
                                                                                                                                                   if(_loc36_)
                                                                                                                                                   {
                                                                                                                                                      break loop204;
                                                                                                                                                   }
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                   §§goto(addr0b2a);
                                                                                                                                                }
                                                                                                                                             }
                                                                                                                                             var _temp_254:* = §§pop();
                                                                                                                                             §§push(_temp_254);
                                                                                                                                             §§push(_temp_254);
                                                                                                                                             if(!_loc36_)
                                                                                                                                             {
                                                                                                                                                §§push(Boolean(§§pop()));
                                                                                                                                                if(_loc36_ && Boolean(param1))
                                                                                                                                                {
                                                                                                                                                   break loop129;
                                                                                                                                                }
                                                                                                                                                if(§§pop())
                                                                                                                                                {
                                                                                                                                                   §§pop();
                                                                                                                                                   addr0a24:
                                                                                                                                                   §§push(_loc2_);
                                                                                                                                                   §§push(_loc11_);
                                                                                                                                                   if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                   {
                                                                                                                                                      break;
                                                                                                                                                   }
                                                                                                                                                   §§push(-§§pop());
                                                                                                                                                   if(_loc35_)
                                                                                                                                                   {
                                                                                                                                                      §§push(§§pop() <= §§pop());
                                                                                                                                                   }
                                                                                                                                                   else
                                                                                                                                                   {
                                                                                                                                                      §§goto(addr108c);
                                                                                                                                                   }
                                                                                                                                                }
                                                                                                                                                if(!§§pop())
                                                                                                                                                {
                                                                                                                                                   addr0a4a:
                                                                                                                                                   §§push(culling & 8);
                                                                                                                                                   if(_loc35_ || Boolean(param1))
                                                                                                                                                   {
                                                                                                                                                      var _temp_258:* = §§pop();
                                                                                                                                                      §§push(_temp_258);
                                                                                                                                                      if(Boolean(_temp_258))
                                                                                                                                                      {
                                                                                                                                                         §§pop();
                                                                                                                                                         if(_loc36_)
                                                                                                                                                         {
                                                                                                                                                            break loop208;
                                                                                                                                                         }
                                                                                                                                                         §§push(_loc2_ <= _loc4_);
                                                                                                                                                      }
                                                                                                                                                      var _temp_259:* = §§pop();
                                                                                                                                                      §§push(_temp_259);
                                                                                                                                                      if(Boolean(_temp_259))
                                                                                                                                                      {
                                                                                                                                                         §§pop();
                                                                                                                                                         if(!_loc35_)
                                                                                                                                                         {
                                                                                                                                                            break loop184;
                                                                                                                                                         }
                                                                                                                                                         §§push(_loc2_);
                                                                                                                                                         §§push(_loc7_);
                                                                                                                                                         if(!(_loc35_ || Boolean(this)))
                                                                                                                                                         {
                                                                                                                                                            break loop183;
                                                                                                                                                         }
                                                                                                                                                         §§push(§§pop() <= §§pop());
                                                                                                                                                      }
                                                                                                                                                      var _temp_261:* = Boolean(§§pop());
                                                                                                                                                      §§push(_temp_261);
                                                                                                                                                      §§push(_temp_261);
                                                                                                                                                      if(_loc35_)
                                                                                                                                                      {
                                                                                                                                                         if(Boolean(§§pop()))
                                                                                                                                                         {
                                                                                                                                                            §§pop();
                                                                                                                                                            if(_loc35_ || Boolean(this))
                                                                                                                                                            {
                                                                                                                                                               addr0ab0:
                                                                                                                                                               §§push(_loc2_);
                                                                                                                                                               if(_loc35_ || Boolean(param1))
                                                                                                                                                               {
                                                                                                                                                                  break loop189;
                                                                                                                                                               }
                                                                                                                                                               break loop187;
                                                                                                                                                            }
                                                                                                                                                            break loop13;
                                                                                                                                                         }
                                                                                                                                                         break loop14;
                                                                                                                                                      }
                                                                                                                                                      break loop94;
                                                                                                                                                   }
                                                                                                                                                   break loop198;
                                                                                                                                                }
                                                                                                                                                §§push(null);
                                                                                                                                                if(!_loc36_)
                                                                                                                                                {
                                                                                                                                                   return §§pop();
                                                                                                                                                }
                                                                                                                                                §§goto(addr1332);
                                                                                                                                             }
                                                                                                                                             else
                                                                                                                                             {
                                                                                                                                                §§goto(addr0c47);
                                                                                                                                             }
                                                                                                                                          }
                                                                                                                                          §§goto(addr0b39);
                                                                                                                                       }
                                                                                                                                       else
                                                                                                                                       {
                                                                                                                                          §§goto(addr1084);
                                                                                                                                       }
                                                                                                                                    }
                                                                                                                                    §§goto(addr109a);
                                                                                                                                 }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                 §§goto(addr0e56);
                                                                                                                              }
                                                                                                                           }
                                                                                                                           else
                                                                                                                           {
                                                                                                                              §§goto(addr0bad);
                                                                                                                           }
                                                                                                                           §§goto(addr0bc4);
                                                                                                                        }
                                                                                                                        §§goto(addr0ea5);
                                                                                                                     }
                                                                                                                     §§goto(addr0ec1);
                                                                                                                  }
                                                                                                                  §§goto(addr09cb);
                                                                                                               }
                                                                                                               §§goto(addr0c0b);
                                                                                                            }
                                                                                                            §§goto(addr0ee1);
                                                                                                         }
                                                                                                         break loop223;
                                                                                                      }
                                                                                                      §§goto(addr0e95);
                                                                                                   }
                                                                                                   §§goto(addr0c6a);
                                                                                                }
                                                                                                §§goto(addr0c5c);
                                                                                             }
                                                                                             §§goto(addr0c66);
                                                                                          }
                                                                                          §§goto(addr0c7a);
                                                                                       }
                                                                                       §§goto(addr0c46);
                                                                                    }
                                                                                    break loop232;
                                                                                 }
                                                                                 §§goto(addr1252);
                                                                              }
                                                                              §§goto(addr11f6);
                                                                           }
                                                                           §§goto(addr110e);
                                                                        }
                                                                        §§goto(addr0fbb);
                                                                     }
                                                                     §§goto(addr1054);
                                                                  }
                                                                  §§goto(addr0f55);
                                                               }
                                                               §§goto(addr1225);
                                                            }
                                                            §§goto(addr0f91);
                                                         }
                                                         §§goto(addr0fff);
                                                      }
                                                      §§goto(addr0f40);
                                                   }
                                                   §§goto(addr125a);
                                                }
                                                §§goto(addr1342);
                                             }
                                             §§goto(addr1055);
                                          }
                                          §§goto(addr1116);
                                       }
                                       §§push(§§pop() <= _loc9_);
                                       if(_loc35_ || Boolean(_loc2_))
                                       {
                                          §§push(Boolean(§§pop()));
                                          break loop14;
                                       }
                                       §§goto(addr0f22);
                                    }
                                    §§goto(addr1223);
                                 }
                                 §§goto(addr0ec2);
                              }
                              §§goto(addr10a8);
                           }
                           §§goto(addr105c);
                        }
                        §§goto(addr0ffc);
                     }
                     §§goto(addr1303);
                  }
                  if(§§pop())
                  {
                     break loop134;
                  }
                  §§goto(addr12d1);
               }
               var _temp_141:* = §§pop();
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
                                             loop105:
                                             while(true)
                                             {
                                                loop106:
                                                while(true)
                                                {
                                                   loop107:
                                                   while(true)
                                                   {
                                                      §§push(_temp_141);
                                                      §§push(Boolean(_temp_141));
                                                      if(!_loc36_)
                                                      {
                                                         loop108:
                                                         while(true)
                                                         {
                                                            loop109:
                                                            while(true)
                                                            {
                                                               if(§§pop())
                                                               {
                                                                  §§pop();
                                                                  §§push(_loc2_);
                                                                  if(_loc36_ && Boolean(this))
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(§§pop() <= _loc11_);
                                                                  if(_loc36_ && Boolean(_loc3_))
                                                                  {
                                                                     break loop108;
                                                                  }
                                                                  §§push(Boolean(§§pop()));
                                                               }
                                                               if(§§pop())
                                                               {
                                                                  addr0b04:
                                                                  return null;
                                                               }
                                                               loop114:
                                                               while(true)
                                                               {
                                                                  loop115:
                                                                  while(true)
                                                                  {
                                                                     loop117:
                                                                     while(true)
                                                                     {
                                                                        loop118:
                                                                        while(true)
                                                                        {
                                                                           loop119:
                                                                           while(true)
                                                                           {
                                                                              loop120:
                                                                              while(true)
                                                                              {
                                                                                 loop121:
                                                                                 while(true)
                                                                                 {
                                                                                    loop122:
                                                                                    while(true)
                                                                                    {
                                                                                       loop123:
                                                                                       while(true)
                                                                                       {
                                                                                          loop124:
                                                                                          while(true)
                                                                                          {
                                                                                             loop125:
                                                                                             while(true)
                                                                                             {
                                                                                                loop126:
                                                                                                while(true)
                                                                                                {
                                                                                                   loop127:
                                                                                                   while(true)
                                                                                                   {
                                                                                                      loop128:
                                                                                                      while(true)
                                                                                                      {
                                                                                                         loop129:
                                                                                                         while(true)
                                                                                                         {
                                                                                                            loop130:
                                                                                                            while(true)
                                                                                                            {
                                                                                                               loop131:
                                                                                                               while(true)
                                                                                                               {
                                                                                                                  loop132:
                                                                                                                  while(true)
                                                                                                                  {
                                                                                                                     loop133:
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        loop134:
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           loop135:
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              loop136:
                                                                                                                              while(true)
                                                                                                                              {
                                                                                                                                 loop138:
                                                                                                                                 while(true)
                                                                                                                                 {
                                                                                                                                    loop139:
                                                                                                                                    while(true)
                                                                                                                                    {
                                                                                                                                       loop140:
                                                                                                                                       while(true)
                                                                                                                                       {
                                                                                                                                          loop141:
                                                                                                                                          while(true)
                                                                                                                                          {
                                                                                                                                             §§push(culling & 0x10);
                                                                                                                                             if(_loc35_)
                                                                                                                                             {
                                                                                                                                                var _temp_163:* = §§pop();
                                                                                                                                                while(true)
                                                                                                                                                {
                                                                                                                                                   §§push(_temp_163);
                                                                                                                                                   if(Boolean(_temp_163))
                                                                                                                                                   {
                                                                                                                                                      §§pop();
                                                                                                                                                      addr0b22:
                                                                                                                                                      §§push(_loc2_);
                                                                                                                                                      §§push(_loc5_);
                                                                                                                                                      if(!_loc35_)
                                                                                                                                                      {
                                                                                                                                                         break;
                                                                                                                                                      }
                                                                                                                                                      §§push(§§pop() <= -§§pop());
                                                                                                                                                   }
                                                                                                                                                   var _temp_164:* = §§pop();
                                                                                                                                                   §§push(_temp_164);
                                                                                                                                                   if(Boolean(_temp_164))
                                                                                                                                                   {
                                                                                                                                                      §§pop();
                                                                                                                                                      addr0b39:
                                                                                                                                                      addr0b38:
                                                                                                                                                      §§push(_loc2_ <= -_loc8_);
                                                                                                                                                      if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                      {
                                                                                                                                                         break loop95;
                                                                                                                                                      }
                                                                                                                                                      §§push(§§pop());
                                                                                                                                                   }
                                                                                                                                                   loop143:
                                                                                                                                                   while(true)
                                                                                                                                                   {
                                                                                                                                                      loop144:
                                                                                                                                                      while(true)
                                                                                                                                                      {
                                                                                                                                                         loop145:
                                                                                                                                                         while(true)
                                                                                                                                                         {
                                                                                                                                                            loop148:
                                                                                                                                                            while(true)
                                                                                                                                                            {
                                                                                                                                                               loop151:
                                                                                                                                                               while(true)
                                                                                                                                                               {
                                                                                                                                                                  while(true)
                                                                                                                                                                  {
                                                                                                                                                                     loop153:
                                                                                                                                                                     while(true)
                                                                                                                                                                     {
                                                                                                                                                                        loop154:
                                                                                                                                                                        while(true)
                                                                                                                                                                        {
                                                                                                                                                                           loop155:
                                                                                                                                                                           while(true)
                                                                                                                                                                           {
                                                                                                                                                                              loop156:
                                                                                                                                                                              while(true)
                                                                                                                                                                              {
                                                                                                                                                                                 loop157:
                                                                                                                                                                                 while(true)
                                                                                                                                                                                 {
                                                                                                                                                                                    loop158:
                                                                                                                                                                                    while(true)
                                                                                                                                                                                    {
                                                                                                                                                                                       loop159:
                                                                                                                                                                                       while(true)
                                                                                                                                                                                       {
                                                                                                                                                                                          loop160:
                                                                                                                                                                                          while(true)
                                                                                                                                                                                          {
                                                                                                                                                                                             loop161:
                                                                                                                                                                                             while(true)
                                                                                                                                                                                             {
                                                                                                                                                                                                loop162:
                                                                                                                                                                                                while(true)
                                                                                                                                                                                                {
                                                                                                                                                                                                   loop163:
                                                                                                                                                                                                   while(true)
                                                                                                                                                                                                   {
                                                                                                                                                                                                      loop164:
                                                                                                                                                                                                      while(true)
                                                                                                                                                                                                      {
                                                                                                                                                                                                         loop165:
                                                                                                                                                                                                         while(true)
                                                                                                                                                                                                         {
                                                                                                                                                                                                            loop166:
                                                                                                                                                                                                            while(true)
                                                                                                                                                                                                            {
                                                                                                                                                                                                               §§push(Boolean(§§pop()));
                                                                                                                                                                                                               if(!_loc36_)
                                                                                                                                                                                                               {
                                                                                                                                                                                                                  var _temp_181:* = §§pop();
                                                                                                                                                                                                                  §§push(_temp_181);
                                                                                                                                                                                                                  §§push(_temp_181);
                                                                                                                                                                                                                  if(!(_loc35_ || Boolean(_loc2_)))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     break loop162;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  if(Boolean(§§pop()))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     §§pop();
                                                                                                                                                                                                                     loop167:
                                                                                                                                                                                                                     while(true)
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        while(true)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           if(_loc35_ || Boolean(param1))
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              §§push(_loc2_);
                                                                                                                                                                                                                              if(_loc35_ || Boolean(param1))
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 break loop109;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              §§goto(addr108a);
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           addr0ec1:
                                                                                                                                                                                                                           addr0ec2:
                                                                                                                                                                                                                           §§push(_loc2_);
                                                                                                                                                                                                                           §§push(_loc7_);
                                                                                                                                                                                                                           if(_loc35_)
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              §§push(§§pop() > -§§pop());
                                                                                                                                                                                                                              if(!_loc36_)
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 break loop167;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              break loop17;
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           break loop166;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§goto(addr1244);
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     var _temp_184:* = §§pop();
                                                                                                                                                                                                                     loop169:
                                                                                                                                                                                                                     while(true)
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        while(true)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           §§push(_temp_184);
                                                                                                                                                                                                                           if(Boolean(_temp_184))
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              if(!_loc35_)
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 break;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              §§pop();
                                                                                                                                                                                                                              §§push(_loc2_);
                                                                                                                                                                                                                              §§push(-_loc9_);
                                                                                                                                                                                                                              if(!(_loc35_ || Boolean(_loc2_)))
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 break loop169;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              §§push(§§pop() > §§pop());
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           var _temp_198:* = §§pop();
                                                                                                                                                                                                                           §§push(_temp_198);
                                                                                                                                                                                                                           §§push(_temp_198);
                                                                                                                                                                                                                           if(!(_loc36_ && Boolean(this)))
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              §§push(Boolean(§§pop()));
                                                                                                                                                                                                                              if(_loc35_ || Boolean(_loc2_))
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 if(§§pop())
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    if(!_loc35_)
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       break loop130;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    §§pop();
                                                                                                                                                                                                                                    §§push(_loc2_ > -_loc11_);
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 addr0f23:
                                                                                                                                                                                                                                 if(§§pop())
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    culling &= 59;
                                                                                                                                                                                                                                    if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       break loop99;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 addr0f40:
                                                                                                                                                                                                                                 §§push(culling & 8);
                                                                                                                                                                                                                                 if(_loc35_ || Boolean(_loc2_))
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    addr0f55:
                                                                                                                                                                                                                                    if(Boolean(§§pop()))
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       §§push(_loc2_);
                                                                                                                                                                                                                                       if(!_loc36_)
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          §§push(_loc4_);
                                                                                                                                                                                                                                          break loop169;
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       break loop98;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    break loop156;
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 break loop157;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              break loop158;
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           break loop126;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§pop();
                                                                                                                                                                                                                        if(_loc36_ && Boolean(_loc2_))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop132;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(_loc2_ <= _loc11_);
                                                                                                                                                                                                                        if(_loc36_ && Boolean(param1))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop131;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§goto(addr100f);
                                                                                                                                                                                                                        §§push(Boolean(§§pop()));
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     §§push(§§pop() <= §§pop());
                                                                                                                                                                                                                     if(_loc36_)
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        break loop125;
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     var _temp_185:* = §§pop();
                                                                                                                                                                                                                     §§push(_temp_185);
                                                                                                                                                                                                                     if(Boolean(_temp_185))
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        §§pop();
                                                                                                                                                                                                                        if(_loc36_ && Boolean(_loc2_))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop124;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(_loc2_);
                                                                                                                                                                                                                        if(!(_loc35_ || Boolean(_loc2_)))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop155;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(§§pop() <= _loc7_);
                                                                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop154;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(Boolean(§§pop()));
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     var _temp_188:* = §§pop();
                                                                                                                                                                                                                     §§push(_temp_188);
                                                                                                                                                                                                                     §§push(_temp_188);
                                                                                                                                                                                                                     if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        break loop153;
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     §§push(Boolean(§§pop()));
                                                                                                                                                                                                                     if(_loc35_)
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        if(§§pop())
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           if(_loc36_)
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              break loop97;
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           §§pop();
                                                                                                                                                                                                                           §§push(_loc2_);
                                                                                                                                                                                                                           §§push(_loc9_);
                                                                                                                                                                                                                           if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              break loop121;
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           §§push(§§pop() <= §§pop());
                                                                                                                                                                                                                           if(_loc36_)
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              break loop19;
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        var _temp_191:* = §§pop();
                                                                                                                                                                                                                        §§push(_temp_191);
                                                                                                                                                                                                                        §§push(_temp_191);
                                                                                                                                                                                                                        if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop111;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(Boolean(§§pop()));
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop120;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        if(§§pop())
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop170;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        addr100f:
                                                                                                                                                                                                                        if(§§pop())
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           if(_loc35_)
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              return null;
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           break loop151;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(_loc2_);
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop119;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(§§pop() > _loc4_);
                                                                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop118;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(Boolean(§§pop()));
                                                                                                                                                                                                                        if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop148;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        var _temp_194:* = §§pop();
                                                                                                                                                                                                                        §§push(_temp_194);
                                                                                                                                                                                                                        §§push(Boolean(_temp_194));
                                                                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop117;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        if(!§§pop())
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop145;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        if(_loc36_ && Boolean(_loc2_))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop144;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§pop();
                                                                                                                                                                                                                        §§push(_loc2_);
                                                                                                                                                                                                                        if(_loc36_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop122;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§push(_loc7_);
                                                                                                                                                                                                                        if(!_loc35_)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop143;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        addr1064:
                                                                                                                                                                                                                        §§push(§§pop() > §§pop());
                                                                                                                                                                                                                        if(!(_loc36_ && Boolean(param1)))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           break loop145;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§goto(addr109a);
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     else
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        §§goto(addr1235);
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  var _temp_206:* = §§pop();
                                                                                                                                                                                                                  §§push(_temp_206);
                                                                                                                                                                                                                  §§push(_temp_206);
                                                                                                                                                                                                                  if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     break loop153;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  if(Boolean(§§pop()))
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     §§pop();
                                                                                                                                                                                                                     if(_loc36_ && Boolean(param1))
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        break loop124;
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     §§push(_loc2_);
                                                                                                                                                                                                                     §§push(_loc12_);
                                                                                                                                                                                                                     if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        break loop100;
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     §§push(-§§pop());
                                                                                                                                                                                                                     if(!_loc35_)
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        break loop161;
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     §§push(§§pop() <= §§pop());
                                                                                                                                                                                                                     if(!_loc35_)
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        break loop160;
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  if(§§pop())
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     if(!(_loc36_ && Boolean(this)))
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        §§push(null);
                                                                                                                                                                                                                        if(_loc35_ || Boolean(this))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           return §§pop();
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     else
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        §§goto(addr11c8);
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  else
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     var _temp_212:* = culling & 0x20;
                                                                                                                                                                                                                     loop171:
                                                                                                                                                                                                                     while(true)
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        §§push(_temp_212);
                                                                                                                                                                                                                        if(Boolean(_temp_212))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           §§pop();
                                                                                                                                                                                                                           if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              break;
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           §§push(_loc2_ <= _loc5_);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        var _temp_214:* = §§pop();
                                                                                                                                                                                                                        loop172:
                                                                                                                                                                                                                        while(true)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           while(true)
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              §§push(_temp_214);
                                                                                                                                                                                                                              if(Boolean(_temp_214))
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 §§pop();
                                                                                                                                                                                                                                 addr0c19:
                                                                                                                                                                                                                                 addr0c18:
                                                                                                                                                                                                                                 §§push(_loc2_);
                                                                                                                                                                                                                                 §§push(_loc8_);
                                                                                                                                                                                                                                 if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    addr0e56:
                                                                                                                                                                                                                                    §§push(§§pop() <= §§pop());
                                                                                                                                                                                                                                    if(_loc35_ || Boolean(this))
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       addr0e66:
                                                                                                                                                                                                                                       var _temp_217:* = Boolean(§§pop());
                                                                                                                                                                                                                                       §§push(_temp_217);
                                                                                                                                                                                                                                       §§push(_temp_217);
                                                                                                                                                                                                                                       if(_loc35_)
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          §§push(Boolean(§§pop()));
                                                                                                                                                                                                                                          if(!_loc35_)
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             break loop129;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          if(§§pop())
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             §§pop();
                                                                                                                                                                                                                                             addr0e7d:
                                                                                                                                                                                                                                             §§push(_loc2_ <= -_loc9_);
                                                                                                                                                                                                                                             break;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          var _temp_218:* = §§pop();
                                                                                                                                                                                                                                          §§push(_temp_218);
                                                                                                                                                                                                                                          §§push(_temp_218);
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       if(Boolean(§§pop()))
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          §§pop();
                                                                                                                                                                                                                                          addr0e95:
                                                                                                                                                                                                                                          §§push(_loc2_ <= -_loc11_);
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       if(§§pop())
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          §§push(null);
                                                                                                                                                                                                                                          if(!_loc36_)
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             §§goto(addr0ea5);
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          break loop172;
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       §§push(_loc2_ > -_loc4_);
                                                                                                                                                                                                                                       if(_loc35_ || Boolean(_loc3_))
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          var _temp_220:* = §§pop();
                                                                                                                                                                                                                                          §§push(_temp_220);
                                                                                                                                                                                                                                          if(Boolean(_temp_220))
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             §§pop();
                                                                                                                                                                                                                                             break loop171;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          break loop167;
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       break loop128;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    break loop159;
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 §§push(§§pop() <= §§pop());
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              §§push(Boolean(§§pop()));
                                                                                                                                                                                                                              if(!_loc35_)
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 break loop165;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              var _temp_221:* = §§pop();
                                                                                                                                                                                                                              §§push(_temp_221);
                                                                                                                                                                                                                              §§push(_temp_221);
                                                                                                                                                                                                                              if(_loc35_)
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 addr0c46:
                                                                                                                                                                                                                                 addr0c47:
                                                                                                                                                                                                                                 if(Boolean(§§pop()))
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    §§pop();
                                                                                                                                                                                                                                    §§push(Boolean(_loc2_ <= _loc10_));
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 var _temp_222:* = §§pop();
                                                                                                                                                                                                                                 §§push(_temp_222);
                                                                                                                                                                                                                                 §§push(Boolean(_temp_222));
                                                                                                                                                                                                                                 if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    break loop164;
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 if(§§pop())
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    §§pop();
                                                                                                                                                                                                                                    addr0c5c:
                                                                                                                                                                                                                                    §§push(_loc2_ <= _loc12_);
                                                                                                                                                                                                                                    if(!_loc35_)
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       break;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 if(§§pop())
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    addr0c6a:
                                                                                                                                                                                                                                    §§push(null);
                                                                                                                                                                                                                                    if(_loc35_ || Boolean(_loc3_))
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       return §§pop();
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    break loop172;
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 addr0c7a:
                                                                                                                                                                                                                                 §§push(Vertex.createList(4));
                                                                                                                                                                                                                                 if(!(_loc36_ && Boolean(_loc2_)))
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    addr0c91:
                                                                                                                                                                                                                                    _loc13_ = §§pop();
                                                                                                                                                                                                                                    _loc14_ = _loc13_;
                                                                                                                                                                                                                                    while(true)
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       if(!_loc36_)
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          _loc14_.cameraX = _loc4_;
                                                                                                                                                                                                                                          if(!(_loc35_ || Boolean(_loc2_)))
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             break;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       _loc14_.cameraY = _loc5_;
                                                                                                                                                                                                                                       if(_loc35_)
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          _loc14_.cameraZ = _loc2_;
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       break;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    _loc14_ = _loc14_.next;
                                                                                                                                                                                                                                    while(true)
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       if(_loc35_ || Boolean(this))
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          §§push(_loc14_);
                                                                                                                                                                                                                                          §§push(_loc4_);
                                                                                                                                                                                                                                          if(_loc35_ || Boolean(_loc3_))
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             §§push(§§pop() + _loc28_);
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          §§pop().alternativa3d::cameraX = §§pop();
                                                                                                                                                                                                                                          if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             break;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       §§push(_loc14_);
                                                                                                                                                                                                                                       §§push(_loc5_);
                                                                                                                                                                                                                                       if(_loc35_ || Boolean(_loc2_))
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          §§push(§§pop() + _loc29_);
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       §§pop().alternativa3d::cameraY = §§pop();
                                                                                                                                                                                                                                       if(_loc35_)
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          _loc14_.cameraZ = _loc2_;
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       break;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    _loc14_ = _loc14_.next;
                                                                                                                                                                                                                                    if(!(_loc36_ && Boolean(_loc3_)))
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       loop176:
                                                                                                                                                                                                                                       while(true)
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          while(true)
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             §§push(_loc14_);
                                                                                                                                                                                                                                             §§push(_loc4_);
                                                                                                                                                                                                                                             if(!_loc36_)
                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                §§push(_loc26_);
                                                                                                                                                                                                                                                if(_loc36_)
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                   break;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                if(!_loc35_)
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                   break loop176;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                             §§push(_loc28_);
                                                                                                                                                                                                                                             break;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                          break;
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       §§pop().alternativa3d::cameraX = §§pop();
                                                                                                                                                                                                                                       while(true)
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          if(_loc35_ || Boolean(_loc3_))
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             loop179:
                                                                                                                                                                                                                                             while(true)
                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                while(true)
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                   §§push(_loc14_);
                                                                                                                                                                                                                                                   §§push(_loc5_);
                                                                                                                                                                                                                                                   if(!_loc36_)
                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                      §§push(_loc27_);
                                                                                                                                                                                                                                                      if(!(_loc35_ || Boolean(_loc2_)))
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                         break;
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                      §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                      if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                         break loop179;
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                   §§push(_loc29_);
                                                                                                                                                                                                                                                   break;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                break;
                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                             §§pop().alternativa3d::cameraY = §§pop();
                                                                                                                                                                                                                                             if(_loc36_)
                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                break;
                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          _loc14_.cameraZ = _loc2_;
                                                                                                                                                                                                                                          break;
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    _loc14_ = _loc14_.next;
                                                                                                                                                                                                                                    if(_loc35_ || Boolean(this))
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       §§push(_loc14_);
                                                                                                                                                                                                                                       §§push(_loc4_);
                                                                                                                                                                                                                                       if(!_loc36_)
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          §§push(§§pop() + _loc26_);
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       §§pop().alternativa3d::cameraX = §§pop();
                                                                                                                                                                                                                                       while(true)
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          if(!_loc36_)
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             §§push(_loc14_);
                                                                                                                                                                                                                                             §§push(_loc5_);
                                                                                                                                                                                                                                             if(!(_loc36_ && Boolean(_loc3_)))
                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                §§push(§§pop() + _loc27_);
                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                             §§pop().alternativa3d::cameraY = §§pop();
                                                                                                                                                                                                                                             if(!(_loc35_ || Boolean(_loc3_)))
                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                break;
                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          _loc14_.cameraZ = _loc2_;
                                                                                                                                                                                                                                          break;
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 else
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    §§goto(addr1404);
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 §§goto(addr20a2);
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              else
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 §§goto(addr1244);
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           §§push(Boolean(§§pop()));
                                                                                                                                                                                                                           if(!(_loc35_ || Boolean(this)))
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              break loop163;
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           §§goto(addr0e8d);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§goto(addr11c7);
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     §§goto(addr0ec1);
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  addr0ea5:
                                                                                                                                                                                                                  return §§pop();
                                                                                                                                                                                                               }
                                                                                                                                                                                                               addr0e43:
                                                                                                                                                                                                               §§pop();
                                                                                                                                                                                                               §§push(_loc2_);
                                                                                                                                                                                                               §§push(_loc7_);
                                                                                                                                                                                                               if(!(_loc36_ && Boolean(_loc2_)))
                                                                                                                                                                                                               {
                                                                                                                                                                                                                  §§goto(addr0e56);
                                                                                                                                                                                                                  §§push(-§§pop());
                                                                                                                                                                                                               }
                                                                                                                                                                                                               §§goto(addr1064);
                                                                                                                                                                                                            }
                                                                                                                                                                                                            §§goto(addr10b8);
                                                                                                                                                                                                         }
                                                                                                                                                                                                         §§goto(addr115a);
                                                                                                                                                                                                      }
                                                                                                                                                                                                      §§goto(addr112e);
                                                                                                                                                                                                   }
                                                                                                                                                                                                   §§goto(addr118c);
                                                                                                                                                                                                }
                                                                                                                                                                                                §§goto(addr1148);
                                                                                                                                                                                             }
                                                                                                                                                                                             §§goto(addr117c);
                                                                                                                                                                                          }
                                                                                                                                                                                          §§goto(addr1193);
                                                                                                                                                                                       }
                                                                                                                                                                                       §§goto(addr1146);
                                                                                                                                                                                    }
                                                                                                                                                                                    §§goto(addr109c);
                                                                                                                                                                                 }
                                                                                                                                                                                 §§goto(addr10fa);
                                                                                                                                                                              }
                                                                                                                                                                              §§goto(addr10e5);
                                                                                                                                                                           }
                                                                                                                                                                           §§goto(addr1135);
                                                                                                                                                                        }
                                                                                                                                                                        §§goto(addr10c8);
                                                                                                                                                                     }
                                                                                                                                                                     §§goto(addr109b);
                                                                                                                                                                  }
                                                                                                                                                                  §§goto(addr124f);
                                                                                                                                                               }
                                                                                                                                                               §§goto(addr10ff);
                                                                                                                                                            }
                                                                                                                                                            §§goto(addr113f);
                                                                                                                                                         }
                                                                                                                                                         var _temp_179:* = §§pop();
                                                                                                                                                         while(true)
                                                                                                                                                         {
                                                                                                                                                            while(true)
                                                                                                                                                            {
                                                                                                                                                               §§push(_temp_179);
                                                                                                                                                               §§push(_temp_179);
                                                                                                                                                               if(!(_loc36_ && Boolean(this)))
                                                                                                                                                               {
                                                                                                                                                                  addr1084:
                                                                                                                                                                  if(Boolean(§§pop()))
                                                                                                                                                                  {
                                                                                                                                                                     §§pop();
                                                                                                                                                                     addr108a:
                                                                                                                                                                     addr108c:
                                                                                                                                                                     §§push(_loc2_ > _loc9_);
                                                                                                                                                                     if(!_loc36_)
                                                                                                                                                                     {
                                                                                                                                                                        break loop144;
                                                                                                                                                                     }
                                                                                                                                                                     break loop115;
                                                                                                                                                                  }
                                                                                                                                                                  §§goto(addr109a);
                                                                                                                                                               }
                                                                                                                                                               else
                                                                                                                                                               {
                                                                                                                                                                  §§goto(addr1235);
                                                                                                                                                               }
                                                                                                                                                            }
                                                                                                                                                            §§goto(addr135b);
                                                                                                                                                         }
                                                                                                                                                         §§goto(addr125b);
                                                                                                                                                      }
                                                                                                                                                      §§push(Boolean(§§pop()));
                                                                                                                                                      if(_loc35_)
                                                                                                                                                      {
                                                                                                                                                         addr109a:
                                                                                                                                                         var _temp_168:* = §§pop();
                                                                                                                                                         addr109b:
                                                                                                                                                         addr109c:
                                                                                                                                                         loop146:
                                                                                                                                                         while(true)
                                                                                                                                                         {
                                                                                                                                                            §§push(_temp_168);
                                                                                                                                                            if(Boolean(_temp_168))
                                                                                                                                                            {
                                                                                                                                                               §§pop();
                                                                                                                                                               §§push(_loc2_);
                                                                                                                                                               if(!_loc35_)
                                                                                                                                                               {
                                                                                                                                                                  break loop122;
                                                                                                                                                               }
                                                                                                                                                               §§push(_loc11_);
                                                                                                                                                               if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                               {
                                                                                                                                                                  break;
                                                                                                                                                               }
                                                                                                                                                               §§push(§§pop() > §§pop());
                                                                                                                                                               if(_loc36_ && Boolean(_loc2_))
                                                                                                                                                               {
                                                                                                                                                                  break loop140;
                                                                                                                                                               }
                                                                                                                                                            }
                                                                                                                                                            addr10c8:
                                                                                                                                                            if(§§pop())
                                                                                                                                                            {
                                                                                                                                                               if(!(_loc36_ && Boolean(this)))
                                                                                                                                                               {
                                                                                                                                                                  culling &= 55;
                                                                                                                                                               }
                                                                                                                                                               else
                                                                                                                                                               {
                                                                                                                                                                  §§goto(addr124f);
                                                                                                                                                               }
                                                                                                                                                            }
                                                                                                                                                            addr10e5:
                                                                                                                                                            §§push(culling & 0x10);
                                                                                                                                                            if(_loc36_ && Boolean(_loc3_))
                                                                                                                                                            {
                                                                                                                                                               break loop139;
                                                                                                                                                            }
                                                                                                                                                            if(!Boolean(§§pop()))
                                                                                                                                                            {
                                                                                                                                                               break loop138;
                                                                                                                                                            }
                                                                                                                                                            §§push(_loc2_);
                                                                                                                                                            if(!(_loc35_ || Boolean(this)))
                                                                                                                                                            {
                                                                                                                                                               break loop136;
                                                                                                                                                            }
                                                                                                                                                            while(true)
                                                                                                                                                            {
                                                                                                                                                               §§push(_loc5_);
                                                                                                                                                               if(_loc35_)
                                                                                                                                                               {
                                                                                                                                                                  break loop146;
                                                                                                                                                               }
                                                                                                                                                               addr113e:
                                                                                                                                                               addr113f:
                                                                                                                                                               §§push(§§pop() <= §§pop());
                                                                                                                                                               if(_loc35_)
                                                                                                                                                               {
                                                                                                                                                                  break;
                                                                                                                                                               }
                                                                                                                                                               continue loop111;
                                                                                                                                                            }
                                                                                                                                                            var _temp_174:* = §§pop();
                                                                                                                                                            §§push(_temp_174);
                                                                                                                                                            if(Boolean(_temp_174))
                                                                                                                                                            {
                                                                                                                                                               if(_loc35_ || Boolean(_loc2_))
                                                                                                                                                               {
                                                                                                                                                                  addr115a:
                                                                                                                                                                  §§pop();
                                                                                                                                                                  §§push(_loc2_);
                                                                                                                                                                  if(_loc35_ || Boolean(this))
                                                                                                                                                                  {
                                                                                                                                                                     §§push(_loc10_);
                                                                                                                                                                     if(_loc35_)
                                                                                                                                                                     {
                                                                                                                                                                        addr117c:
                                                                                                                                                                        §§push(-§§pop());
                                                                                                                                                                        break loop143;
                                                                                                                                                                     }
                                                                                                                                                                     break loop103;
                                                                                                                                                                  }
                                                                                                                                                                  break loop135;
                                                                                                                                                               }
                                                                                                                                                               break loop134;
                                                                                                                                                            }
                                                                                                                                                            §§goto(addr1193);
                                                                                                                                                         }
                                                                                                                                                         addr1116:
                                                                                                                                                         §§push(§§pop() <= -§§pop());
                                                                                                                                                         if(!(_loc35_ || Boolean(param1)))
                                                                                                                                                         {
                                                                                                                                                            break loop125;
                                                                                                                                                         }
                                                                                                                                                         var _temp_178:* = §§pop();
                                                                                                                                                         §§push(_temp_178);
                                                                                                                                                         §§push(_temp_178);
                                                                                                                                                         if(_loc36_)
                                                                                                                                                         {
                                                                                                                                                            break loop141;
                                                                                                                                                         }
                                                                                                                                                         addr112e:
                                                                                                                                                         if(Boolean(§§pop()))
                                                                                                                                                         {
                                                                                                                                                            §§pop();
                                                                                                                                                            addr1135:
                                                                                                                                                            §§push(_loc2_);
                                                                                                                                                            §§push(-_loc8_);
                                                                                                                                                            if(_loc36_)
                                                                                                                                                            {
                                                                                                                                                               break;
                                                                                                                                                            }
                                                                                                                                                            §§goto(addr113e);
                                                                                                                                                         }
                                                                                                                                                         §§goto(addr1146);
                                                                                                                                                      }
                                                                                                                                                   }
                                                                                                                                                   §§push(§§pop() <= §§pop());
                                                                                                                                                   if(!(_loc35_ || Boolean(_loc2_)))
                                                                                                                                                   {
                                                                                                                                                      break loop134;
                                                                                                                                                   }
                                                                                                                                                   addr118c:
                                                                                                                                                   §§push(Boolean(§§pop()));
                                                                                                                                                   if(_loc36_)
                                                                                                                                                   {
                                                                                                                                                      break loop133;
                                                                                                                                                   }
                                                                                                                                                   addr1193:
                                                                                                                                                   var _temp_167:* = §§pop();
                                                                                                                                                   §§push(_temp_167);
                                                                                                                                                   if(!Boolean(_temp_167))
                                                                                                                                                   {
                                                                                                                                                      break loop114;
                                                                                                                                                   }
                                                                                                                                                }
                                                                                                                                                addr0b85:
                                                                                                                                                addr0b86:
                                                                                                                                                §§goto(addr0b89);
                                                                                                                                             }
                                                                                                                                             else
                                                                                                                                             {
                                                                                                                                                addr0dfe:
                                                                                                                                                §§push(Boolean(§§pop()));
                                                                                                                                                if(_loc35_ || Boolean(param1))
                                                                                                                                                {
                                                                                                                                                   if(§§pop())
                                                                                                                                                   {
                                                                                                                                                      if(!_loc35_)
                                                                                                                                                      {
                                                                                                                                                         break loop127;
                                                                                                                                                      }
                                                                                                                                                      §§push(_loc2_);
                                                                                                                                                      if(_loc36_ && Boolean(this))
                                                                                                                                                      {
                                                                                                                                                         break loop119;
                                                                                                                                                      }
                                                                                                                                                      while(true)
                                                                                                                                                      {
                                                                                                                                                         §§push(_loc4_);
                                                                                                                                                         if(!_loc36_)
                                                                                                                                                         {
                                                                                                                                                            addr0e2f:
                                                                                                                                                            §§push(§§pop() <= -§§pop());
                                                                                                                                                            if(_loc36_)
                                                                                                                                                            {
                                                                                                                                                               break loop125;
                                                                                                                                                            }
                                                                                                                                                            var _temp_242:* = §§pop();
                                                                                                                                                            §§push(_temp_242);
                                                                                                                                                            §§push(Boolean(_temp_242));
                                                                                                                                                            if(!_loc35_)
                                                                                                                                                            {
                                                                                                                                                               continue loop169;
                                                                                                                                                            }
                                                                                                                                                            if(§§pop())
                                                                                                                                                            {
                                                                                                                                                               §§goto(addr0e43);
                                                                                                                                                            }
                                                                                                                                                            §§goto(addr0e66);
                                                                                                                                                         }
                                                                                                                                                         §§goto(addr1116);
                                                                                                                                                      }
                                                                                                                                                      §§goto(addr113e);
                                                                                                                                                   }
                                                                                                                                                   else
                                                                                                                                                   {
                                                                                                                                                      §§goto(addr0f40);
                                                                                                                                                   }
                                                                                                                                                }
                                                                                                                                             }
                                                                                                                                             §§pop();
                                                                                                                                             §§push(_loc2_);
                                                                                                                                             if(_loc35_)
                                                                                                                                             {
                                                                                                                                                break loop135;
                                                                                                                                             }
                                                                                                                                             break loop122;
                                                                                                                                          }
                                                                                                                                          §§goto(addr12d2);
                                                                                                                                       }
                                                                                                                                       §§goto(addr12a5);
                                                                                                                                    }
                                                                                                                                    §§goto(addr127f);
                                                                                                                                 }
                                                                                                                                 §§goto(addr1278);
                                                                                                                              }
                                                                                                                              §§goto(addr11c9);
                                                                                                                           }
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              §§push(_loc12_);
                                                                                                                              if(!(_loc36_ && Boolean(_loc2_)))
                                                                                                                              {
                                                                                                                                 §§push(§§pop() <= -§§pop());
                                                                                                                                 if(_loc35_ || Boolean(_loc3_))
                                                                                                                                 {
                                                                                                                                    break loop114;
                                                                                                                                 }
                                                                                                                                 break loop123;
                                                                                                                              }
                                                                                                                              §§goto(addr11f8);
                                                                                                                           }
                                                                                                                           §§goto(addr12f2);
                                                                                                                        }
                                                                                                                        §§pop();
                                                                                                                        §§push(_loc2_);
                                                                                                                        §§push(_loc8_);
                                                                                                                        if(!_loc35_)
                                                                                                                        {
                                                                                                                           break loop105;
                                                                                                                        }
                                                                                                                        §§push(§§pop() <= §§pop());
                                                                                                                        if(_loc36_)
                                                                                                                        {
                                                                                                                           break loop110;
                                                                                                                        }
                                                                                                                        §§goto(addr12d1);
                                                                                                                        §§push(Boolean(§§pop()));
                                                                                                                     }
                                                                                                                     §§goto(addr1304);
                                                                                                                  }
                                                                                                                  §§goto(addr121c);
                                                                                                               }
                                                                                                               §§goto(addr131e);
                                                                                                            }
                                                                                                            §§goto(addr11e0);
                                                                                                         }
                                                                                                         §§goto(addr1315);
                                                                                                      }
                                                                                                      §§goto(addr11d3);
                                                                                                   }
                                                                                                   §§goto(addr11c6);
                                                                                                }
                                                                                                §§goto(addr1306);
                                                                                             }
                                                                                             §§goto(addr135a);
                                                                                          }
                                                                                          §§goto(addr131a);
                                                                                       }
                                                                                       §§goto(addr131f);
                                                                                    }
                                                                                    §§goto(addr1250);
                                                                                 }
                                                                                 §§goto(addr1295);
                                                                              }
                                                                              §§goto(addr12ac);
                                                                           }
                                                                           §§goto(addr1293);
                                                                        }
                                                                        §§goto(addr12eb);
                                                                     }
                                                                     §§goto(addr11d5);
                                                                  }
                                                                  §§push(Boolean(§§pop()));
                                                                  if(!_loc35_)
                                                                  {
                                                                     break loop19;
                                                                  }
                                                                  §§goto(addr1207);
                                                               }
                                                               if(§§pop())
                                                               {
                                                                  addr11c7:
                                                                  return null;
                                                                  addr11c6:
                                                               }
                                                               else
                                                               {
                                                                  addr11c9:
                                                                  addr11c8:
                                                                  while(true)
                                                                  {
                                                                     §§push(_loc2_);
                                                                     §§push(-_loc5_);
                                                                     if(!_loc36_)
                                                                     {
                                                                        addr11d3:
                                                                        var _temp_157:* = §§pop() > §§pop();
                                                                        addr11d5:
                                                                        §§push(_temp_157);
                                                                        §§push(_temp_157);
                                                                        if(_loc36_)
                                                                        {
                                                                           break loop102;
                                                                        }
                                                                        if(§§pop())
                                                                        {
                                                                           addr11e0:
                                                                           §§pop();
                                                                           if(!(_loc36_ && Boolean(param1)))
                                                                           {
                                                                              §§push(_loc2_);
                                                                              if(!_loc35_)
                                                                              {
                                                                                 break loop104;
                                                                              }
                                                                              §§push(-_loc8_);
                                                                              if(!_loc36_)
                                                                              {
                                                                                 §§push(§§pop() > §§pop());
                                                                                 break loop115;
                                                                              }
                                                                              §§goto(addr1295);
                                                                           }
                                                                           §§goto(addr12f2);
                                                                        }
                                                                        var _temp_159:* = §§pop();
                                                                        §§push(_temp_159);
                                                                        §§push(Boolean(_temp_159));
                                                                        if(_loc35_ || Boolean(_loc3_))
                                                                        {
                                                                           if(!§§pop())
                                                                           {
                                                                              continue loop111;
                                                                           }
                                                                           §§pop();
                                                                           §§push(_loc2_);
                                                                           if(_loc35_)
                                                                           {
                                                                              addr1223:
                                                                              addr1225:
                                                                              §§push(§§pop() > -_loc10_);
                                                                              if(_loc35_)
                                                                              {
                                                                                 break loop108;
                                                                              }
                                                                           }
                                                                           else
                                                                           {
                                                                              §§goto(addr131b);
                                                                           }
                                                                        }
                                                                        else
                                                                        {
                                                                           §§goto(addr12d2);
                                                                        }
                                                                        §§goto(addr1359);
                                                                     }
                                                                     §§goto(addr1303);
                                                                  }
                                                                  §§goto(addr1305);
                                                               }
                                                            }
                                                            addr0b83:
                                                            §§goto(addr0b85);
                                                         }
                                                         var _temp_142:* = Boolean(§§pop());
                                                         loop110:
                                                         while(true)
                                                         {
                                                            loop111:
                                                            while(true)
                                                            {
                                                               loop112:
                                                               while(true)
                                                               {
                                                                  §§push(_temp_142);
                                                                  §§push(_temp_142);
                                                                  if(_loc35_)
                                                                  {
                                                                     addr1235:
                                                                     §§push(Boolean(§§pop()));
                                                                     if(_loc35_ || Boolean(_loc2_))
                                                                     {
                                                                        addr1244:
                                                                        while(true)
                                                                        {
                                                                           if(§§pop())
                                                                           {
                                                                              if(!_loc35_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§pop();
                                                                              §§push(_loc2_ > -_loc12_);
                                                                              if(!_loc35_)
                                                                              {
                                                                                 break loop112;
                                                                              }
                                                                              §§push(Boolean(§§pop()));
                                                                           }
                                                                           addr125b:
                                                                           if(§§pop())
                                                                           {
                                                                              culling &= 47;
                                                                              if(_loc36_ && Boolean(this))
                                                                              {
                                                                                 break loop99;
                                                                              }
                                                                           }
                                                                           addr1278:
                                                                           addr127f:
                                                                           §§push(Boolean(culling & 0x20));
                                                                           if(!(_loc36_ && Boolean(param1)))
                                                                           {
                                                                              if(!§§pop())
                                                                              {
                                                                                 break loop107;
                                                                              }
                                                                              §§push(_loc2_ <= _loc5_);
                                                                              if(!(_loc36_ && Boolean(param1)))
                                                                              {
                                                                                 §§push(Boolean(§§pop()));
                                                                                 break;
                                                                              }
                                                                              §§goto(addr135a);
                                                                           }
                                                                           addr12d1:
                                                                           var _temp_148:* = §§pop();
                                                                           addr12d2:
                                                                           §§push(_temp_148);
                                                                           §§push(Boolean(_temp_148));
                                                                           if(!(_loc36_ && Boolean(param1)))
                                                                           {
                                                                              if(§§pop())
                                                                              {
                                                                                 if(_loc35_)
                                                                                 {
                                                                                    addr12eb:
                                                                                    §§pop();
                                                                                    if(_loc36_)
                                                                                    {
                                                                                       break loop106;
                                                                                    }
                                                                                    §§push(_loc2_);
                                                                                    §§push(_loc10_);
                                                                                    if(!(_loc35_ || Boolean(this)))
                                                                                    {
                                                                                       break loop100;
                                                                                    }
                                                                                    §§push(§§pop() <= §§pop());
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    §§goto(addr1359);
                                                                                 }
                                                                              }
                                                                              addr1305:
                                                                              var _temp_151:* = §§pop();
                                                                              addr1306:
                                                                              §§push(_temp_151);
                                                                              §§push(Boolean(_temp_151));
                                                                              if(_loc35_ || Boolean(_loc2_))
                                                                              {
                                                                                 addr1315:
                                                                                 if(§§pop())
                                                                                 {
                                                                                    break loop110;
                                                                                 }
                                                                                 break loop112;
                                                                              }
                                                                              break loop111;
                                                                           }
                                                                           break loop101;
                                                                        }
                                                                        addr12a5:
                                                                        var _temp_153:* = §§pop();
                                                                        §§push(_temp_153);
                                                                        §§push(_temp_153);
                                                                        if(!_loc36_)
                                                                        {
                                                                           addr12ac:
                                                                           §§push(Boolean(§§pop()));
                                                                           if(_loc35_ || Boolean(_loc2_))
                                                                           {
                                                                              break loop94;
                                                                           }
                                                                           §§goto(addr13d3);
                                                                        }
                                                                     }
                                                                     §§goto(addr135b);
                                                                  }
                                                                  §§goto(addr1306);
                                                               }
                                                               §§goto(addr131f);
                                                            }
                                                         }
                                                         §§pop();
                                                         addr131f:
                                                         addr131b:
                                                         addr131a:
                                                         addr131e:
                                                         if(_loc2_ <= _loc12_)
                                                         {
                                                            if(!(_loc36_ && Boolean(param1)))
                                                            {
                                                               addr1332:
                                                               return null;
                                                            }
                                                            break loop96;
                                                         }
                                                         break loop13;
                                                      }
                                                      break loop111;
                                                   }
                                                   §§goto(addr13fb);
                                                }
                                                §§goto(addr13c7);
                                             }
                                             §§goto(addr1380);
                                          }
                                          §§goto(addr13da);
                                       }
                                       §§goto(addr13ca);
                                    }
                                    §§goto(addr13b4);
                                 }
                                 §§goto(addr13ad);
                              }
                              §§goto(addr13dc);
                           }
                           §§goto(addr13d9);
                        }
                        §§goto(addr1370);
                     }
                     §§goto(addr13c6);
                  }
                  §§goto(addr136f);
               }
               §§goto(addr139e);
            }
            addr1342:
            loop15:
            while(true)
            {
               §§push(_loc2_);
               §§push(_loc5_);
               if(_loc35_ || Boolean(_loc2_))
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
                              while(true)
                              {
                                 §§push(§§pop() > §§pop());
                                 if(_loc35_)
                                 {
                                    addr135a:
                                    var _temp_10:* = Boolean(§§pop());
                                    addr1359:
                                    addr135b:
                                    §§push(_temp_10);
                                    if(_temp_10)
                                    {
                                       if(!(_loc35_ || Boolean(_loc3_)))
                                       {
                                          break loop19;
                                       }
                                       §§pop();
                                       §§push(_loc2_);
                                       §§push(_loc8_);
                                       if(!(_loc35_ || Boolean(_loc3_)))
                                       {
                                          break;
                                       }
                                       §§push(§§pop() > §§pop());
                                       if(_loc36_ && Boolean(_loc2_))
                                       {
                                          break loop16;
                                       }
                                       §§push(Boolean(§§pop()));
                                       if(!(_loc35_ || Boolean(this)))
                                       {
                                          break loop19;
                                       }
                                    }
                                    addr139e:
                                    var _temp_15:* = §§pop();
                                    §§push(_temp_15);
                                    §§push(_temp_15);
                                    if(!(_loc36_ && Boolean(this)))
                                    {
                                       addr13ad:
                                       §§push(Boolean(§§pop()));
                                       if(_loc36_)
                                       {
                                          break loop18;
                                       }
                                    }
                                    addr13b4:
                                    if(!§§pop())
                                    {
                                       break loop17;
                                    }
                                    if(_loc36_ && Boolean(_loc2_))
                                    {
                                       break loop16;
                                    }
                                 }
                                 addr13c6:
                                 §§pop();
                                 addr13ca:
                                 addr13c7:
                                 §§push(_loc2_ > _loc10_);
                                 if(_loc35_)
                                 {
                                    break loop19;
                                 }
                                 break loop16;
                              }
                           }
                           §§push(Boolean(§§pop()));
                           break loop17;
                        }
                        if(§§pop())
                        {
                           break loop16;
                        }
                        break loop15;
                     }
                     var _temp_9:* = §§pop();
                     addr13d3:
                     §§push(_temp_9);
                     §§push(Boolean(_temp_9));
                     break loop18;
                  }
                  §§pop();
                  addr13d9:
                  addr13da:
               }
               addr13dc:
               §§push(§§pop() > §§pop());
               break;
            }
            if(§§pop())
            {
               if(_loc35_ || Boolean(this))
               {
                  culling &= 31;
               }
            }
            addr1404:
            _loc13_ = Vertex.createList(4);
            _loc14_ = _loc13_;
            addr13fb:
            while(true)
            {
               if(_loc35_ || Boolean(this))
               {
                  _loc14_.cameraX = _loc4_;
                  if(!_loc35_)
                  {
                     break;
                  }
               }
               _loc14_.cameraY = _loc5_;
               if(_loc35_ || Boolean(_loc3_))
               {
                  _loc14_.cameraZ = _loc2_;
               }
               break;
            }
            _loc14_ = _loc14_.next;
            if(_loc35_ || Boolean(_loc2_))
            {
               §§push(_loc14_);
               §§push(_loc4_);
               if(!_loc36_)
               {
                  §§push(§§pop() + _loc28_);
               }
               §§pop().alternativa3d::cameraX = §§pop();
               if(!_loc36_)
               {
                  §§push(_loc14_);
                  §§push(_loc5_);
                  if(!_loc36_)
                  {
                     §§push(§§pop() + _loc29_);
                  }
                  §§pop().alternativa3d::cameraY = §§pop();
                  if(_loc35_)
                  {
                     _loc14_.cameraZ = _loc2_;
                  }
               }
            }
            _loc14_ = _loc14_.next;
            while(true)
            {
               if(!_loc36_)
               {
                  loop23:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_loc14_);
                        §§push(_loc4_);
                        if(_loc35_ || Boolean(_loc2_))
                        {
                           §§push(_loc26_);
                           if(_loc36_ && Boolean(param1))
                           {
                              break;
                           }
                           §§push(§§pop() + §§pop());
                           if(_loc36_)
                           {
                              break loop23;
                           }
                        }
                        §§push(_loc28_);
                        break;
                     }
                     §§push(§§pop() + §§pop());
                     break;
                  }
                  §§pop().alternativa3d::cameraX = §§pop();
                  if(!(_loc35_ || Boolean(_loc3_)))
                  {
                     break;
                  }
                  loop25:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_loc14_);
                        §§push(_loc5_);
                        if(!_loc36_)
                        {
                           §§push(_loc27_);
                           if(!_loc35_)
                           {
                              break;
                           }
                           §§push(§§pop() + §§pop());
                           if(!(_loc35_ || Boolean(this)))
                           {
                              break loop25;
                           }
                        }
                        §§push(_loc29_);
                        break;
                     }
                     §§push(§§pop() + §§pop());
                     break;
                  }
                  §§pop().alternativa3d::cameraY = §§pop();
                  if(_loc36_ && Boolean(this))
                  {
                     break;
                  }
               }
               _loc14_.cameraZ = _loc2_;
               break;
            }
            _loc14_ = _loc14_.next;
            loop27:
            while(true)
            {
               if(_loc35_)
               {
                  §§push(_loc14_);
                  §§push(_loc4_);
                  if(_loc35_)
                  {
                     §§push(§§pop() + _loc26_);
                  }
                  §§pop().alternativa3d::cameraX = §§pop();
                  while(true)
                  {
                     if(_loc35_ || Boolean(_loc3_))
                     {
                        §§push(_loc14_);
                        §§push(_loc5_);
                        if(!(_loc36_ && Boolean(param1)))
                        {
                           §§push(§§pop() + _loc27_);
                        }
                        §§pop().alternativa3d::cameraY = §§pop();
                        if(!_loc35_)
                        {
                           break;
                        }
                     }
                     _loc14_.cameraZ = _loc2_;
                     if(_loc35_ || Boolean(this))
                     {
                        break;
                     }
                     break loop27;
                  }
               }
               if(culling > 0)
               {
                  if(_loc35_ || Boolean(_loc3_))
                  {
                     break;
                  }
                  §§goto(addr1588);
               }
               §§goto(addr20a2);
            }
            if(Boolean(culling & 4))
            {
               addr1588:
               _loc31_ = _loc14_;
               if(_loc35_)
               {
                  §§push(_loc31_.cameraX);
                  if(!(_loc36_ && Boolean(_loc2_)))
                  {
                     §§push(Number(§§pop()));
                  }
                  _loc4_ = §§pop();
               }
               _loc32_ = _loc13_;
               _loc13_ = null;
               _loc14_ = null;
               loop0:
               while(_loc32_ != null)
               {
                  _loc34_ = _loc32_.next;
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
                              §§push(_loc32_.cameraX);
                              if(_loc35_)
                              {
                                 _loc7_ = Number(§§pop());
                                 if(_loc36_ && Boolean(_loc2_))
                                 {
                                    break loop30;
                                 }
                                 loop39:
                                 while(true)
                                 {
                                    §§push(_loc2_);
                                    if(_loc35_)
                                    {
                                       loop40:
                                       while(true)
                                       {
                                          loop41:
                                          while(true)
                                          {
                                             §§push(§§pop() > -_loc7_);
                                             if(_loc35_ || Boolean(_loc3_))
                                             {
                                                var _temp_48:* = Boolean(§§pop());
                                                while(true)
                                                {
                                                   §§push(_temp_48);
                                                   §§push(_temp_48);
                                                   if(_loc35_ || Boolean(param1))
                                                   {
                                                      §§push(Boolean(§§pop()));
                                                      if(_loc36_)
                                                      {
                                                         break;
                                                      }
                                                   }
                                                   if(§§pop())
                                                   {
                                                      §§pop();
                                                      §§push(_loc2_ <= -_loc4_);
                                                   }
                                                   var _temp_50:* = §§pop();
                                                   §§push(_temp_50);
                                                   §§push(_temp_50);
                                                   if(_loc35_)
                                                   {
                                                      §§push(Boolean(§§pop()));
                                                      if(_loc35_)
                                                      {
                                                         break;
                                                      }
                                                      break loop41;
                                                   }
                                                   break;
                                                }
                                                if(§§pop())
                                                {
                                                   break loop40;
                                                }
                                                §§pop();
                                                §§push(_loc2_);
                                                §§push(-_loc7_);
                                                if(_loc36_)
                                                {
                                                   break loop39;
                                                }
                                                §§push(§§pop() <= §§pop());
                                             }
                                             var _temp_51:* = §§pop();
                                             §§push(_temp_51);
                                             §§push(_temp_51);
                                             if(!_loc36_)
                                             {
                                                break;
                                             }
                                             addr1643:
                                             if(§§pop())
                                             {
                                                if(!(_loc36_ && Boolean(_loc3_)))
                                                {
                                                   §§pop();
                                                   §§push(_loc2_ > -_loc4_);
                                                }
                                             }
                                             break loop40;
                                          }
                                          §§goto(addr1643);
                                       }
                                       if(!§§pop())
                                       {
                                          break loop32;
                                       }
                                       §§push(_loc4_ + _loc2_);
                                       if(_loc36_ && Boolean(_loc3_))
                                       {
                                          break loop31;
                                       }
                                    }
                                    §§push(_loc4_);
                                    break;
                                 }
                                 §§push(§§pop() - _loc7_);
                                 if(!(_loc35_ || Boolean(_loc3_)))
                                 {
                                    break loop29;
                                 }
                                 §§push(§§pop() / §§pop());
                              }
                              §§push(Number(§§pop()));
                              break loop31;
                           }
                           §§push(_loc2_);
                           §§push(_loc7_);
                           break loop29;
                        }
                        _loc30_ = §§pop();
                        _loc33_ = _loc32_.create();
                        loop33:
                        while(true)
                        {
                           if(!(_loc36_ && Boolean(_loc3_)))
                           {
                              §§push(_loc33_);
                              §§push(_loc4_);
                              if(_loc35_)
                              {
                                 loop34:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc7_);
                                       if(_loc35_ || Boolean(_loc3_))
                                       {
                                          §§push(_loc4_);
                                          if(_loc36_)
                                          {
                                             break;
                                          }
                                          §§push(§§pop() - §§pop());
                                          if(_loc36_ && Boolean(param1))
                                          {
                                             break loop34;
                                          }
                                       }
                                       §§push(_loc30_);
                                       break;
                                    }
                                    §§push(§§pop() * §§pop());
                                    break;
                                 }
                              }
                              §§pop().alternativa3d::cameraX = §§pop();
                              if(!(_loc35_ || Boolean(this)))
                              {
                                 break;
                              }
                           }
                           §§push(_loc33_);
                           §§push(_loc31_.cameraY);
                           if(!_loc36_)
                           {
                              loop36:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(_loc32_.cameraY);
                                    if(!_loc36_)
                                    {
                                       §§push(_loc31_.cameraY);
                                       if(!_loc35_)
                                       {
                                          break;
                                       }
                                       §§push(§§pop() - §§pop());
                                       if(!(_loc35_ || Boolean(_loc2_)))
                                       {
                                          break loop36;
                                       }
                                    }
                                    §§push(_loc30_);
                                    break;
                                 }
                                 §§push(§§pop() * §§pop());
                                 break;
                              }
                           }
                           §§pop().alternativa3d::cameraY = §§pop();
                           while(true)
                           {
                              if(_loc35_ || Boolean(_loc2_))
                              {
                                 _loc33_.cameraZ = _loc2_;
                                 if(!(_loc36_ && Boolean(_loc2_)))
                                 {
                                    break loop33;
                                 }
                              }
                              addr1750:
                              _loc14_.next = _loc33_;
                              break;
                           }
                           addr1760:
                           _loc14_ = _loc33_;
                           break loop32;
                           addr1756:
                        }
                        if(_loc13_ != null)
                        {
                           if(!(_loc36_ && Boolean(_loc3_)))
                           {
                              §§goto(addr1750);
                           }
                           §§goto(addr1756);
                        }
                        else
                        {
                           _loc13_ = _loc33_;
                        }
                        §§goto(addr1760);
                     }
                     _loc31_ = _loc32_;
                     if(_loc35_ || Boolean(this))
                     {
                        §§push(_loc7_);
                        if(_loc35_)
                        {
                           §§push(Number(§§pop()));
                        }
                        _loc4_ = §§pop();
                     }
                     _loc32_ = _loc34_;
                     continue loop0;
                  }
                  if(§§pop() > -§§pop())
                  {
                     if(_loc35_ || Boolean(param1))
                     {
                        if(_loc13_ != null)
                        {
                           _loc14_.next = _loc32_;
                        }
                        else
                        {
                           _loc13_ = _loc32_;
                        }
                        _loc14_ = _loc32_;
                        if(_loc35_ || Boolean(param1))
                        {
                           _loc32_.next = null;
                        }
                     }
                     break loop30;
                  }
                  _loc32_.next = Vertex.collector;
                  if(!(_loc36_ && Boolean(_loc2_)))
                  {
                     Vertex.collector = _loc32_;
                  }
                  break loop30;
               }
               if(!_loc36_)
               {
                  if(_loc13_ == null)
                  {
                     if(!_loc36_)
                     {
                        return null;
                     }
                  }
               }
               §§goto(addr1811);
            }
            addr1811:
            loop43:
            while(true)
            {
               loop44:
               while(true)
               {
                  §§push(culling & 8);
                  if(!(_loc36_ && Boolean(_loc2_)))
                  {
                     while(true)
                     {
                        §§push(Boolean(§§pop()));
                        if(_loc35_)
                        {
                           if(§§pop())
                           {
                              if(!_loc35_)
                              {
                                 break loop43;
                              }
                              _loc31_ = _loc14_;
                              if(!(_loc36_ && Boolean(_loc3_)))
                              {
                                 §§push(_loc31_.cameraX);
                                 if(!_loc36_)
                                 {
                                    §§push(Number(§§pop()));
                                 }
                                 _loc4_ = §§pop();
                              }
                              _loc32_ = _loc13_;
                              _loc13_ = null;
                              _loc14_ = null;
                              if(!(_loc36_ && Boolean(_loc2_)))
                              {
                                 loop1:
                                 while(_loc32_ != null)
                                 {
                                    _loc34_ = _loc32_.next;
                                    _loc7_ = _loc32_.cameraX;
                                    loop69:
                                    while(true)
                                    {
                                       loop70:
                                       while(true)
                                       {
                                          loop76:
                                          while(true)
                                          {
                                             loop78:
                                             while(true)
                                             {
                                                loop79:
                                                while(true)
                                                {
                                                   loop80:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_loc2_);
                                                         if(_loc35_)
                                                         {
                                                            §§push(_loc7_);
                                                            if(!(_loc35_ || Boolean(_loc2_)))
                                                            {
                                                               break;
                                                            }
                                                            §§push(§§pop() > §§pop());
                                                            if(!_loc35_)
                                                            {
                                                               break loop80;
                                                            }
                                                            var _temp_110:* = §§pop();
                                                            §§push(_temp_110);
                                                            §§push(_temp_110);
                                                            if(!(_loc35_ || Boolean(this)))
                                                            {
                                                               break loop79;
                                                            }
                                                            §§push(Boolean(§§pop()));
                                                            if(!(_loc35_ || Boolean(_loc3_)))
                                                            {
                                                               break loop79;
                                                            }
                                                            if(§§pop())
                                                            {
                                                               §§pop();
                                                               §§push(_loc2_ <= _loc4_);
                                                               if(_loc36_ && Boolean(_loc2_))
                                                               {
                                                                  break loop78;
                                                               }
                                                            }
                                                            var _temp_114:* = §§pop();
                                                            §§push(_temp_114);
                                                            §§push(_temp_114);
                                                            if(!_loc36_)
                                                            {
                                                               §§push(Boolean(§§pop()));
                                                               if(_loc36_ && Boolean(this))
                                                               {
                                                                  break loop76;
                                                               }
                                                            }
                                                            if(§§pop())
                                                            {
                                                               break loop70;
                                                            }
                                                            §§pop();
                                                            §§push(_loc2_);
                                                            if(!(_loc35_ || Boolean(param1)))
                                                            {
                                                               break loop69;
                                                            }
                                                         }
                                                         §§push(_loc7_);
                                                         break;
                                                      }
                                                      §§push(§§pop() <= §§pop());
                                                      if(_loc35_)
                                                      {
                                                         §§push(Boolean(§§pop()));
                                                         if(!(_loc36_ && Boolean(this)))
                                                         {
                                                            break loop78;
                                                         }
                                                      }
                                                      break;
                                                   }
                                                   §§goto(addr192d);
                                                }
                                                §§goto(addr1929);
                                             }
                                             var _temp_108:* = §§pop();
                                             §§push(_temp_108);
                                             §§push(_temp_108);
                                             if(!_loc36_)
                                             {
                                                break;
                                             }
                                             break loop79;
                                          }
                                          addr1929:
                                          if(!Boolean(§§pop()))
                                          {
                                             break;
                                          }
                                          addr192d:
                                          §§pop();
                                          if(!_loc36_)
                                          {
                                             §§push(_loc2_);
                                             if(!_loc36_)
                                             {
                                                §§push(§§pop() > _loc4_);
                                                if(_loc35_ || Boolean(_loc2_))
                                                {
                                                   §§push(Boolean(§§pop()));
                                                }
                                                break;
                                             }
                                             break loop69;
                                          }
                                          §§goto(addr1951);
                                       }
                                       if(§§pop())
                                       {
                                          addr1951:
                                          §§push(_loc2_);
                                          if(!(_loc35_ || Boolean(_loc2_)))
                                          {
                                             break;
                                          }
                                          while(true)
                                          {
                                             §§push(§§pop() - _loc4_);
                                             if(_loc35_)
                                             {
                                                §§push(_loc7_);
                                                if(!_loc35_)
                                                {
                                                   break;
                                                }
                                                §§push(§§pop() - _loc4_);
                                                if(!_loc35_)
                                                {
                                                   break;
                                                }
                                                §§push(§§pop() / §§pop());
                                             }
                                             §§push(Number(§§pop()));
                                             break loop69;
                                          }
                                          §§goto(addr1a46);
                                       }
                                       §§goto(addr1a43);
                                    }
                                    _loc30_ = §§pop();
                                    _loc33_ = _loc32_.create();
                                    while(true)
                                    {
                                       if(!_loc36_)
                                       {
                                          §§push(_loc33_);
                                          §§push(_loc4_);
                                          if(_loc35_)
                                          {
                                             loop72:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   §§push(_loc7_);
                                                   if(_loc35_)
                                                   {
                                                      §§push(_loc4_);
                                                      if(_loc36_ && Boolean(_loc3_))
                                                      {
                                                         break;
                                                      }
                                                      §§push(§§pop() - §§pop());
                                                      if(_loc36_ && Boolean(_loc3_))
                                                      {
                                                         break loop72;
                                                      }
                                                   }
                                                   §§push(_loc30_);
                                                   break;
                                                }
                                                §§push(§§pop() * §§pop());
                                                break;
                                             }
                                          }
                                          §§pop().alternativa3d::cameraX = §§pop();
                                          if(_loc35_)
                                          {
                                             §§push(_loc33_);
                                             §§push(_loc31_.cameraY);
                                             if(_loc35_)
                                             {
                                                §§push(_loc32_.cameraY);
                                                if(_loc35_ || Boolean(param1))
                                                {
                                                   while(true)
                                                   {
                                                      §§push(_loc31_.cameraY);
                                                      if(!_loc36_)
                                                      {
                                                         §§push(§§pop() - §§pop());
                                                         if(!(_loc35_ || Boolean(param1)))
                                                         {
                                                            break;
                                                         }
                                                         §§push(_loc30_);
                                                      }
                                                      §§push(§§pop() * §§pop());
                                                      break;
                                                   }
                                                }
                                                §§push(§§pop() + §§pop());
                                             }
                                             §§pop().alternativa3d::cameraY = §§pop();
                                             if(!(_loc35_ || Boolean(_loc2_)))
                                             {
                                                break;
                                             }
                                          }
                                       }
                                       _loc33_.cameraZ = _loc2_;
                                       if(!_loc35_)
                                       {
                                          break;
                                       }
                                       if(_loc13_ != null)
                                       {
                                          if(_loc35_)
                                          {
                                             break;
                                          }
                                          addr1a33:
                                       }
                                       else
                                       {
                                          _loc13_ = _loc33_;
                                       }
                                       _loc14_ = _loc33_;
                                       while(true)
                                       {
                                          if(_loc2_ > _loc7_)
                                          {
                                             if(_loc13_ != null)
                                             {
                                                if(!(_loc36_ && Boolean(this)))
                                                {
                                                   _loc14_.next = _loc32_;
                                                   if(_loc36_ && Boolean(_loc3_))
                                                   {
                                                      addr1a9c:
                                                      Vertex.collector = _loc32_;
                                                      break;
                                                   }
                                                }
                                             }
                                             else
                                             {
                                                _loc13_ = _loc32_;
                                             }
                                             _loc14_ = _loc32_;
                                             if(_loc35_)
                                             {
                                                _loc32_.next = null;
                                             }
                                             break;
                                          }
                                          _loc32_.next = Vertex.collector;
                                          §§goto(addr1a9c);
                                       }
                                       _loc31_ = _loc32_;
                                       if(!(_loc36_ && Boolean(this)))
                                       {
                                          §§push(_loc7_);
                                          if(_loc35_ || Boolean(_loc3_))
                                          {
                                             §§push(Number(§§pop()));
                                          }
                                          _loc4_ = §§pop();
                                       }
                                       _loc32_ = _loc34_;
                                       continue loop1;
                                    }
                                    _loc14_.next = _loc33_;
                                    §§goto(addr1a33);
                                 }
                                 if(!(_loc36_ && Boolean(_loc3_)))
                                 {
                                    if(_loc13_ == null)
                                    {
                                       if(!(_loc36_ && Boolean(_loc3_)))
                                       {
                                          §§goto(addr1afb);
                                       }
                                    }
                                    addr1afd:
                                    §§push(culling & 0x10);
                                    if(_loc36_ && Boolean(_loc2_))
                                    {
                                       break;
                                    }
                                    §§push(Boolean(§§pop()));
                                    if(_loc36_ && Boolean(this))
                                    {
                                       break loop44;
                                    }
                                    addr1b21:
                                    if(§§pop())
                                    {
                                       if(_loc36_)
                                       {
                                          break loop43;
                                       }
                                       _loc31_ = _loc14_;
                                       if(!(_loc36_ && Boolean(param1)))
                                       {
                                          §§push(_loc31_.cameraY);
                                          if(_loc35_)
                                          {
                                             §§push(Number(§§pop()));
                                          }
                                          _loc5_ = §§pop();
                                       }
                                       _loc32_ = _loc13_;
                                       _loc13_ = null;
                                       _loc14_ = null;
                                       if(!_loc36_)
                                       {
                                          loop2:
                                          while(_loc32_ != null)
                                          {
                                             _loc34_ = _loc32_.next;
                                             loop82:
                                             while(true)
                                             {
                                                if(_loc35_)
                                                {
                                                   loop83:
                                                   while(true)
                                                   {
                                                      loop84:
                                                      while(true)
                                                      {
                                                         §§push(_loc32_.cameraY);
                                                         if(!(_loc36_ && Boolean(_loc3_)))
                                                         {
                                                            §§push(Number(§§pop()));
                                                            if(!_loc36_)
                                                            {
                                                               _loc8_ = §§pop();
                                                               loop85:
                                                               while(true)
                                                               {
                                                                  §§push(_loc2_ > -_loc8_);
                                                                  if(_loc35_)
                                                                  {
                                                                     §§push(Boolean(§§pop()));
                                                                     if(_loc36_ && Boolean(param1))
                                                                     {
                                                                        break;
                                                                     }
                                                                  }
                                                                  var _temp_126:* = §§pop();
                                                                  loop86:
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(_temp_126);
                                                                        §§push(_temp_126);
                                                                        if(_loc35_)
                                                                        {
                                                                           §§push(Boolean(§§pop()));
                                                                           if(_loc35_)
                                                                           {
                                                                              if(§§pop())
                                                                              {
                                                                                 §§pop();
                                                                                 §§push(_loc2_);
                                                                                 §§push(_loc5_);
                                                                                 if(!(_loc35_ || Boolean(_loc2_)))
                                                                                 {
                                                                                    break loop83;
                                                                                 }
                                                                                 §§push(§§pop() <= -§§pop());
                                                                                 if(_loc36_)
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                              }
                                                                              var _temp_128:* = §§pop();
                                                                              §§push(_temp_128);
                                                                              §§push(_temp_128);
                                                                              if(_loc36_ && Boolean(param1))
                                                                              {
                                                                                 break loop86;
                                                                              }
                                                                           }
                                                                        }
                                                                        §§push(Boolean(§§pop()));
                                                                        if(_loc36_ && Boolean(param1))
                                                                        {
                                                                           break loop86;
                                                                        }
                                                                        while(true)
                                                                        {
                                                                           if(!§§pop())
                                                                           {
                                                                              §§pop();
                                                                              §§push(_loc2_);
                                                                              if(!_loc35_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(§§pop() <= -_loc8_);
                                                                              if(!_loc36_)
                                                                              {
                                                                                 break loop85;
                                                                              }
                                                                              §§push(Boolean(§§pop()));
                                                                           }
                                                                           §§goto(addr1c25);
                                                                        }
                                                                     }
                                                                     §§pop();
                                                                     §§push(_loc2_);
                                                                     §§push(-_loc5_);
                                                                     if(!_loc35_)
                                                                     {
                                                                        break loop83;
                                                                     }
                                                                     §§goto(addr1c24);
                                                                     §§push(§§pop() > §§pop());
                                                                  }
                                                                  if(§§pop())
                                                                  {
                                                                     break loop87;
                                                                  }
                                                                  addr1c25:
                                                                  if(!§§pop())
                                                                  {
                                                                     break loop84;
                                                                  }
                                                                  §§push(_loc5_);
                                                               }
                                                               var _temp_131:* = Boolean(§§pop());
                                                               §§push(_temp_131);
                                                               §§push(_temp_131);
                                                               if(_loc35_)
                                                               {
                                                                  §§push(Boolean(§§pop()));
                                                               }
                                                               break loop86;
                                                            }
                                                         }
                                                         §§push(_loc2_);
                                                         if(_loc35_)
                                                         {
                                                            §§push((§§pop() + §§pop()) / (_loc5_ - _loc8_));
                                                            if(_loc35_ || Boolean(_loc3_))
                                                            {
                                                               _loc30_ = Number(§§pop());
                                                               while(true)
                                                               {
                                                                  if(_loc35_ || Boolean(param1))
                                                                  {
                                                                     _loc33_ = _loc32_.create();
                                                                     while(true)
                                                                     {
                                                                        if(!(_loc36_ && Boolean(param1)))
                                                                        {
                                                                           §§push(_loc33_);
                                                                           §§push(_loc31_.cameraX);
                                                                           if(!(_loc36_ && Boolean(_loc2_)))
                                                                           {
                                                                              §§push(_loc32_.cameraX);
                                                                              if(_loc35_)
                                                                              {
                                                                                 while(true)
                                                                                 {
                                                                                    §§push(_loc31_.cameraX);
                                                                                    if(_loc35_)
                                                                                    {
                                                                                       §§push(§§pop() - §§pop());
                                                                                       if(_loc36_)
                                                                                       {
                                                                                          break;
                                                                                       }
                                                                                       §§push(_loc30_);
                                                                                    }
                                                                                    §§push(§§pop() * §§pop());
                                                                                    break;
                                                                                 }
                                                                              }
                                                                              §§push(§§pop() + §§pop());
                                                                           }
                                                                           §§pop().alternativa3d::cameraX = §§pop();
                                                                           if(_loc36_ && Boolean(_loc3_))
                                                                           {
                                                                              break;
                                                                           }
                                                                        }
                                                                        §§push(_loc33_);
                                                                        §§push(_loc5_);
                                                                        if(_loc35_ || Boolean(this))
                                                                        {
                                                                           loop92:
                                                                           while(true)
                                                                           {
                                                                              while(true)
                                                                              {
                                                                                 §§push(_loc8_);
                                                                                 if(_loc35_)
                                                                                 {
                                                                                    §§push(_loc5_);
                                                                                    if(!(_loc35_ || Boolean(_loc2_)))
                                                                                    {
                                                                                       break;
                                                                                    }
                                                                                    §§push(§§pop() - §§pop());
                                                                                    if(!(_loc35_ || Boolean(param1)))
                                                                                    {
                                                                                       break loop92;
                                                                                    }
                                                                                 }
                                                                                 §§push(_loc30_);
                                                                                 break;
                                                                              }
                                                                              §§push(§§pop() * §§pop());
                                                                              break;
                                                                           }
                                                                        }
                                                                        §§pop().alternativa3d::cameraY = §§pop();
                                                                        if(!_loc36_)
                                                                        {
                                                                           _loc33_.cameraZ = _loc2_;
                                                                           if(_loc35_)
                                                                           {
                                                                              if(_loc13_ != null)
                                                                              {
                                                                                 if(_loc35_)
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 addr1d15:
                                                                              }
                                                                              else
                                                                              {
                                                                                 _loc13_ = _loc33_;
                                                                              }
                                                                              _loc14_ = _loc33_;
                                                                              break loop84;
                                                                           }
                                                                        }
                                                                        break;
                                                                     }
                                                                     _loc14_.next = _loc33_;
                                                                     §§goto(addr1d15);
                                                                  }
                                                                  §§goto(addr1d3b);
                                                               }
                                                               addr1d42:
                                                               _loc14_.next = _loc32_;
                                                               break loop82;
                                                            }
                                                            addr1d26:
                                                            §§push(_loc8_);
                                                         }
                                                         §§push(-§§pop());
                                                         break loop83;
                                                      }
                                                      §§goto(addr1d26);
                                                   }
                                                   if(§§pop() <= §§pop())
                                                   {
                                                      _loc32_.next = Vertex.collector;
                                                      Vertex.collector = _loc32_;
                                                      addr1d79:
                                                      _loc31_ = _loc32_;
                                                      if(_loc35_)
                                                      {
                                                         §§push(_loc8_);
                                                         if(_loc35_)
                                                         {
                                                            §§push(Number(§§pop()));
                                                         }
                                                         _loc5_ = §§pop();
                                                      }
                                                      _loc32_ = _loc34_;
                                                      continue loop2;
                                                   }
                                                   if(_loc35_ || Boolean(_loc2_))
                                                   {
                                                      addr1d3b:
                                                      if(_loc13_ == null)
                                                      {
                                                         _loc13_ = _loc32_;
                                                         break;
                                                      }
                                                   }
                                                }
                                                §§goto(addr1d42);
                                             }
                                             _loc14_ = _loc32_;
                                             if(_loc35_)
                                             {
                                                _loc32_.next = null;
                                             }
                                             §§goto(addr1d79);
                                          }
                                          if(_loc35_)
                                          {
                                             if(_loc13_ == null)
                                             {
                                                if(_loc35_ || Boolean(param1))
                                                {
                                                   §§goto(addr1db8);
                                                }
                                             }
                                          }
                                          addr1dba:
                                          §§push(culling & 0x20);
                                          break;
                                       }
                                       addr1db8:
                                       return null;
                                    }
                                    §§goto(addr1dba);
                                 }
                                 addr1afb:
                                 return null;
                              }
                           }
                           §§goto(addr1afd);
                        }
                        §§goto(addr1b21);
                     }
                  }
                  §§push(Boolean(§§pop()));
                  break;
               }
               if(§§pop())
               {
                  break;
               }
            }
            _loc31_ = _loc14_;
            if(!_loc36_)
            {
               §§push(_loc31_.cameraY);
               if(_loc35_ || Boolean(this))
               {
                  §§push(Number(§§pop()));
               }
               _loc5_ = §§pop();
            }
            _loc32_ = _loc13_;
            _loc13_ = null;
            _loc14_ = null;
            if(_loc35_ || Boolean(param1))
            {
               loop3:
               while(_loc32_ != null)
               {
                  _loc34_ = _loc32_.next;
                  loop45:
                  while(true)
                  {
                     loop46:
                     while(true)
                     {
                        loop51:
                        while(true)
                        {
                           loop53:
                           while(true)
                           {
                              loop56:
                              while(true)
                              {
                                 loop58:
                                 while(true)
                                 {
                                    if(!_loc36_)
                                    {
                                       _loc8_ = _loc32_.cameraY;
                                       while(true)
                                       {
                                          §§push(_loc2_);
                                          if(!(_loc36_ && Boolean(_loc2_)))
                                          {
                                             §§push(§§pop() > _loc8_);
                                             if(!_loc35_)
                                             {
                                                break loop58;
                                             }
                                             var _temp_73:* = Boolean(§§pop());
                                             §§push(_temp_73);
                                             §§push(_temp_73);
                                             if(_loc36_)
                                             {
                                                break loop56;
                                             }
                                             §§push(Boolean(§§pop()));
                                             if(_loc36_)
                                             {
                                                break loop51;
                                             }
                                             if(!§§pop())
                                             {
                                                break;
                                             }
                                             if(_loc36_ && Boolean(_loc3_))
                                             {
                                                break loop46;
                                             }
                                             §§pop();
                                             §§push(_loc2_);
                                          }
                                          §§push(§§pop() <= _loc5_);
                                          if(!(_loc36_ && Boolean(this)))
                                          {
                                             §§push(Boolean(§§pop()));
                                             if(_loc35_ || Boolean(this))
                                             {
                                                break;
                                             }
                                          }
                                          break loop53;
                                       }
                                       var _temp_77:* = §§pop();
                                       §§push(_temp_77);
                                       §§push(_temp_77);
                                       if(!_loc35_)
                                       {
                                          break loop51;
                                       }
                                       §§push(Boolean(§§pop()));
                                       if(!(_loc35_ || Boolean(param1)))
                                       {
                                          break loop51;
                                       }
                                       if(§§pop())
                                       {
                                          break loop46;
                                       }
                                       if(_loc36_ && Boolean(_loc2_))
                                       {
                                          break loop46;
                                       }
                                       §§pop();
                                       if(_loc36_ && Boolean(_loc2_))
                                       {
                                          break loop45;
                                       }
                                    }
                                    §§push(_loc2_ <= _loc8_);
                                    if(!_loc36_)
                                    {
                                       var _temp_81:* = Boolean(§§pop());
                                       §§push(_temp_81);
                                       §§push(_temp_81);
                                       if(_loc35_)
                                       {
                                          break loop56;
                                       }
                                       break loop51;
                                    }
                                    break loop53;
                                 }
                                 §§goto(addr1eef);
                              }
                              §§push(Boolean(§§pop()));
                              break loop51;
                           }
                           §§pop();
                           while(true)
                           {
                              if(!(_loc36_ && Boolean(param1)))
                              {
                                 §§push(_loc2_);
                                 §§push(_loc5_);
                                 if(_loc36_ && Boolean(this))
                                 {
                                    break loop54;
                                 }
                                 §§goto(addr1eef);
                                 §§push(§§pop() > §§pop());
                              }
                              §§goto(addr200d);
                           }
                           §§goto(addr2051);
                        }
                        if(!§§pop())
                        {
                           break;
                        }
                        while(true)
                        {
                           while(true)
                           {
                              if(!_loc36_)
                              {
                                 break loop53;
                              }
                              addr1eef:
                              §§push(Boolean(§§pop()));
                              break loop46;
                           }
                           §§goto(addr200d);
                        }
                        §§goto(addr1f11);
                     }
                     if(§§pop())
                     {
                        while(true)
                        {
                           §§push(_loc2_);
                           if(!_loc36_)
                           {
                              §§push(§§pop() - _loc5_);
                              §§push(_loc8_ - _loc5_);
                              if(!(_loc35_ || Boolean(_loc3_)))
                              {
                                 break;
                              }
                              §§push(§§pop() / §§pop());
                              if(!(_loc36_ && Boolean(param1)))
                              {
                                 _loc30_ = §§pop();
                                 break loop45;
                              }
                           }
                           §§goto(addr1ff9);
                        }
                        §§goto(addr1ffb);
                     }
                     §§goto(addr1ff8);
                  }
                  _loc33_ = _loc32_.create();
                  while(true)
                  {
                     if(!_loc36_)
                     {
                        §§push(_loc33_);
                        §§push(_loc31_.cameraX);
                        if(!_loc36_)
                        {
                           §§push(_loc32_.cameraX);
                           if(_loc35_ || Boolean(_loc2_))
                           {
                              while(true)
                              {
                                 §§push(_loc31_.cameraX);
                                 if(!(_loc36_ && Boolean(this)))
                                 {
                                    §§push(§§pop() - §§pop());
                                    if(_loc36_)
                                    {
                                       break;
                                    }
                                    §§push(_loc30_);
                                 }
                                 §§push(§§pop() * §§pop());
                                 break;
                              }
                           }
                           §§push(§§pop() + §§pop());
                        }
                        §§pop().alternativa3d::cameraX = §§pop();
                        if(!_loc35_)
                        {
                           break;
                        }
                        §§push(_loc33_);
                        §§push(_loc5_);
                        if(!(_loc36_ && Boolean(_loc2_)))
                        {
                           §§push(_loc8_);
                           if(!(_loc36_ && Boolean(_loc2_)))
                           {
                              while(true)
                              {
                                 §§push(_loc5_);
                                 if(_loc35_ || Boolean(this))
                                 {
                                    §§push(§§pop() - §§pop());
                                    if(!(_loc35_ || Boolean(_loc2_)))
                                    {
                                       break;
                                    }
                                    §§push(_loc30_);
                                 }
                                 §§push(§§pop() * §§pop());
                                 break;
                              }
                           }
                           §§push(§§pop() + §§pop());
                        }
                        §§pop().alternativa3d::cameraY = §§pop();
                        if(!_loc35_)
                        {
                           break;
                        }
                        _loc33_.cameraZ = _loc2_;
                        if(_loc36_ && Boolean(_loc3_))
                        {
                           break;
                        }
                        if(_loc13_ == null)
                        {
                           _loc13_ = _loc33_;
                           addr1ff2:
                           _loc14_ = _loc33_;
                           addr1ff9:
                           addr1ffb:
                           addr1ff8:
                           while(true)
                           {
                              if(_loc2_ > _loc8_)
                              {
                                 if(_loc35_ || Boolean(_loc2_))
                                 {
                                    addr200d:
                                    if(_loc13_ != null)
                                    {
                                       if(_loc36_ && Boolean(param1))
                                       {
                                          addr2051:
                                          Vertex.collector = _loc32_;
                                          break;
                                       }
                                       _loc14_.next = _loc32_;
                                    }
                                    else
                                    {
                                       _loc13_ = _loc32_;
                                    }
                                    _loc14_ = _loc32_;
                                    if(_loc35_)
                                    {
                                       _loc32_.next = null;
                                    }
                                    break;
                                 }
                              }
                              else
                              {
                                 _loc32_.next = Vertex.collector;
                              }
                              §§goto(addr2051);
                           }
                           _loc31_ = _loc32_;
                           if(_loc35_)
                           {
                              §§push(_loc8_);
                              if(_loc35_ || Boolean(param1))
                              {
                                 §§push(Number(§§pop()));
                              }
                              _loc5_ = §§pop();
                           }
                           _loc32_ = _loc34_;
                           continue loop3;
                        }
                        if(_loc36_)
                        {
                           break;
                        }
                     }
                     _loc14_.next = _loc33_;
                     break;
                  }
                  §§goto(addr1ff2);
               }
               if(!(_loc36_ && Boolean(this)))
               {
                  if(_loc13_ == null)
                  {
                     if(!_loc36_)
                     {
                        §§goto(addr20a0);
                     }
                  }
               }
               loop60:
               while(true)
               {
                  while(true)
                  {
                     §§push(§§findproperty(tma));
                     §§push(_loc25_);
                     if(!_loc36_)
                     {
                        §§push(_loc17_);
                        if(_loc36_ && Boolean(_loc3_))
                        {
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        if(_loc36_ && Boolean(_loc3_))
                        {
                           break loop60;
                        }
                     }
                     §§push(this.width);
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  break;
               }
               §§pop().tma = §§pop();
               while(true)
               {
                  if(!(_loc36_ && Boolean(_loc2_)))
                  {
                     §§push(§§findproperty(tmb));
                     §§push(_loc24_);
                     if(_loc35_ || Boolean(this))
                     {
                        loop63:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(-§§pop());
                              if(_loc35_)
                              {
                                 §§push(_loc17_);
                                 if(_loc36_)
                                 {
                                    break;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc35_ || Boolean(param1)))
                                 {
                                    break loop63;
                                 }
                              }
                              §§push(this.width);
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           break;
                        }
                     }
                     break loop63;
                  }
                  loop65:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(§§findproperty(tmd));
                        §§push(_loc25_);
                        if(_loc35_)
                        {
                           §§push(_loc17_);
                           if(!_loc35_)
                           {
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           if(!(_loc35_ || Boolean(this)))
                           {
                              break loop65;
                           }
                        }
                        §§push(this.height);
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     break;
                  }
                  §§pop().tmd = §§pop();
                  break;
               }
               addr22ee:
               param1.lastVertex.next = _loc13_;
               if(!_loc36_)
               {
                  param1.lastVertex = _loc14_;
               }
               var _loc20_:Face = Face.create();
               while(true)
               {
                  if(_loc35_ || Boolean(param1))
                  {
                     _loc20_.material = this.material;
                     if(!_loc36_)
                     {
                        param1.lastFace.next = _loc20_;
                        if(_loc36_)
                        {
                           break;
                        }
                     }
                  }
                  param1.lastFace = _loc20_;
                  break;
               }
               var _loc21_:Wrapper = Wrapper.create();
               if(_loc35_ || Boolean(_loc2_))
               {
                  _loc20_.wrapper = _loc21_;
                  if(_loc35_)
                  {
                     _loc21_.vertex = _loc13_;
                  }
               }
               _loc13_ = _loc13_.next;
               if(_loc35_)
               {
                  while(_loc13_ != null)
                  {
                     _loc21_.next = _loc21_.create();
                     if(_loc36_)
                     {
                        break;
                     }
                     _loc21_ = _loc21_.next;
                     if(_loc35_ || Boolean(_loc2_))
                     {
                        _loc21_.vertex = _loc13_;
                     }
                     _loc13_ = _loc13_.next;
                  }
               }
               return _loc20_;
               addr20a2:
            }
            addr20a0:
            return null;
         }
         addr0106:
         return null;
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         var _temp_1:* = true;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = _temp_1;
         var _loc9_:* = NaN;
         var _loc10_:* = NaN;
         var _loc11_:* = NaN;
         var _loc12_:* = NaN;
         loop0:
         while(true)
         {
            while(true)
            {
               while(true)
               {
                  if(!(_loc13_ && Boolean(param1)))
                  {
                     §§push(this.originX);
                     if(!_loc14_)
                     {
                        break;
                     }
                     if(§§pop() < 0.5)
                     {
                        §§push(1 - this.originX);
                        if(_loc14_ || Boolean(param1))
                        {
                           break loop0;
                        }
                        continue loop3;
                     }
                  }
                  §§push(this.originX);
                  if(_loc14_)
                  {
                     break;
                  }
                  break loop0;
               }
               §§goto(addr005f);
            }
            var _loc3_:* = §§pop();
            while(true)
            {
               while(true)
               {
                  if(_loc14_)
                  {
                     §§push(this.originY);
                     if(_loc14_ || Boolean(_loc3_))
                     {
                        if(§§pop() >= 0.5)
                        {
                           addr0088:
                           §§push(this.originY);
                           if(!(_loc13_ && Boolean(this)))
                           {
                              §§push(§§pop());
                              break;
                           }
                           continue loop16;
                        }
                        §§push(1 - this.originY);
                        if(_loc13_ && Boolean(param2))
                        {
                           continue loop16;
                        }
                     }
                     §§push(§§pop());
                     break;
                  }
                  §§goto(addr0088);
               }
               §§push(§§pop() * this.height);
               if(_loc14_)
               {
                  §§push(Number(§§pop()));
               }
               continue loop16;
            }
            var _loc4_:* = §§pop();
            var _loc5_:* = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
            var _loc6_:* = 0;
            var _loc7_:* = 0;
            var _loc8_:* = 0;
            loop5:
            while(true)
            {
               loop6:
               while(true)
               {
                  loop7:
                  while(true)
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
                                             if(param2 != null)
                                             {
                                                if(_loc13_ && Boolean(this))
                                                {
                                                   break loop13;
                                                }
                                                §§push(param2.ma);
                                                if(!_loc14_)
                                                {
                                                   break loop12;
                                                }
                                                while(true)
                                                {
                                                   §§push(Number(§§pop()));
                                                   if(_loc14_ || Boolean(param2))
                                                   {
                                                      _loc9_ = §§pop();
                                                      loop19:
                                                      while(true)
                                                      {
                                                         loop20:
                                                         while(true)
                                                         {
                                                            if(_loc14_)
                                                            {
                                                               §§push(param2.me);
                                                               if(!_loc14_)
                                                               {
                                                                  break;
                                                               }
                                                               _loc10_ = §§pop();
                                                               _loc11_ = param2.mi;
                                                               _loc12_ = Math.sqrt(_loc9_ * _loc9_ + _loc10_ * _loc10_ + _loc11_ * _loc11_);
                                                               if(_loc13_)
                                                               {
                                                                  break loop19;
                                                               }
                                                            }
                                                            §§push(param2.mb);
                                                            if(!_loc14_)
                                                            {
                                                               break loop11;
                                                            }
                                                            _loc9_ = Number(§§pop());
                                                            if(!_loc13_)
                                                            {
                                                               while(true)
                                                               {
                                                                  §§push(param2.mf);
                                                                  if(!_loc13_)
                                                                  {
                                                                     _loc10_ = Number(§§pop());
                                                                     if(!_loc13_)
                                                                     {
                                                                        §§push(param2.mj);
                                                                        break loop20;
                                                                     }
                                                                     break loop17;
                                                                  }
                                                                  §§goto(addr01f9);
                                                               }
                                                               §§goto(addr020d);
                                                            }
                                                            §§goto(addr01f1);
                                                         }
                                                         _loc11_ = §§pop();
                                                         break;
                                                      }
                                                      §§push(_loc12_ + Math.sqrt(_loc9_ * _loc9_ + _loc10_ * _loc10_ + _loc11_ * _loc11_));
                                                      if(_loc13_)
                                                      {
                                                         break;
                                                      }
                                                      _loc12_ = §§pop();
                                                      _loc9_ = param2.mc;
                                                      §§push(param2.mg);
                                                      if(_loc14_)
                                                      {
                                                         §§push(Number(§§pop()));
                                                      }
                                                      _loc10_ = §§pop();
                                                      if(!(_loc14_ || Boolean(this)))
                                                      {
                                                         break loop16;
                                                      }
                                                      _loc11_ = param2.mk;
                                                      §§push(_loc12_ + Math.sqrt(_loc9_ * _loc9_ + _loc10_ * _loc10_ + _loc11_ * _loc11_));
                                                      if(!_loc14_)
                                                      {
                                                         break loop15;
                                                      }
                                                      _loc12_ = §§pop();
                                                      if(!_loc14_)
                                                      {
                                                         break loop14;
                                                      }
                                                      addr01f1:
                                                      §§push(_loc5_);
                                                      if(_loc14_)
                                                      {
                                                         addr01f9:
                                                         §§push(_loc12_);
                                                         if(!(_loc14_ || Boolean(_loc3_)))
                                                         {
                                                            break loop10;
                                                         }
                                                         §§push(§§pop() * (§§pop() / 3));
                                                      }
                                                      addr020d:
                                                      §§push(Number(§§pop()));
                                                   }
                                                   _loc5_ = §§pop();
                                                   if(!(_loc13_ && Boolean(param1)))
                                                   {
                                                      §§push(param2.md);
                                                      if(_loc14_)
                                                      {
                                                         _loc6_ = §§pop();
                                                         if(!(_loc13_ && Boolean(_loc3_)))
                                                         {
                                                            §§push(param2.mh);
                                                            break;
                                                         }
                                                         break loop5;
                                                      }
                                                      break loop6;
                                                   }
                                                   break loop7;
                                                }
                                                §§push(Number(§§pop()));
                                                if(_loc14_)
                                                {
                                                   _loc7_ = §§pop();
                                                   §§push(param2.ml);
                                                }
                                                _loc8_ = §§pop();
                                             }
                                             §§push(_loc6_);
                                             if(_loc14_ || Boolean(param2))
                                             {
                                                break loop6;
                                             }
                                             §§goto(addr032d);
                                          }
                                          §§goto(addr0328);
                                       }
                                       §§goto(addr02f2);
                                    }
                                    §§goto(addr0305);
                                 }
                                 §§goto(addr0374);
                              }
                              §§goto(addr0342);
                           }
                           §§goto(addr0296);
                        }
                        §§goto(addr02d5);
                     }
                     §§goto(addr02d8);
                  }
                  §§push(param1);
                  §§push(_loc8_);
                  if(!_loc13_)
                  {
                     §§push(§§pop() - _loc5_);
                  }
                  §§pop().boundMinZ = §§pop();
                  §§goto(addr0342);
               }
               while(true)
               {
                  §§push(§§pop() - _loc5_);
                  if(!_loc13_)
                  {
                     if(§§pop() < param1.boundMinX)
                     {
                        §§push(param1);
                        §§push(_loc6_);
                        if(_loc14_)
                        {
                           §§push(§§pop() - _loc5_);
                        }
                        §§pop().boundMinX = §§pop();
                        if(!(_loc14_ || Boolean(param2)))
                        {
                           break loop5;
                        }
                     }
                     §§push(_loc6_);
                     if(!(_loc14_ || Boolean(param1)))
                     {
                        break;
                     }
                  }
                  addr0296:
                  §§push(§§pop() + _loc5_);
                  §§push(param1.boundMaxX);
                  if(!_loc13_)
                  {
                     while(true)
                     {
                        if(§§pop() > §§pop())
                        {
                           §§push(param1);
                           §§push(_loc6_);
                           if(_loc14_ || Boolean(_loc3_))
                           {
                              §§push(§§pop() + _loc5_);
                           }
                           §§pop().boundMaxX = §§pop();
                           if(!(_loc14_ || Boolean(_loc3_)))
                           {
                              break;
                           }
                        }
                        §§push(_loc7_ - _loc5_);
                        if(!_loc13_)
                        {
                           addr02d8:
                           addr02d5:
                           if(§§pop() < param1.boundMinY)
                           {
                              §§push(param1);
                              §§push(_loc7_);
                              if(_loc14_ || Boolean(_loc3_))
                              {
                                 §§push(§§pop() - _loc5_);
                              }
                              §§pop().boundMinY = §§pop();
                           }
                           addr02f2:
                           §§push(_loc7_);
                           §§push(_loc5_);
                           if(!(_loc13_ && Boolean(this)))
                           {
                              addr0305:
                              §§push(§§pop() + §§pop());
                              §§push(param1.boundMaxY);
                              if(!_loc13_)
                              {
                                 if(§§pop() > §§pop())
                                 {
                                    §§push(param1);
                                    §§push(_loc7_);
                                    if(!(_loc13_ && Boolean(param1)))
                                    {
                                       §§push(§§pop() + _loc5_);
                                    }
                                    §§pop().boundMaxY = §§pop();
                                 }
                                 addr032d:
                                 addr0328:
                                 §§push(_loc8_ - _loc5_);
                                 §§push(param1.boundMinZ);
                              }
                              if(§§pop() < §§pop())
                              {
                                 break loop7;
                              }
                              break;
                           }
                           addr0358:
                           if(§§pop() > §§pop())
                           {
                              if(!(_loc13_ && Boolean(_loc3_)))
                              {
                                 addr0374:
                                 §§push(param1);
                                 §§push(_loc8_);
                                 if(_loc14_)
                                 {
                                    §§push(§§pop() + _loc5_);
                                 }
                                 §§pop().boundMaxZ = §§pop();
                              }
                           }
                           break loop5;
                        }
                        addr0355:
                     }
                     addr0342:
                     §§push(_loc8_);
                     if(_loc14_ || Boolean(_loc3_))
                     {
                        break;
                     }
                     §§goto(addr0355);
                     §§push(param1.boundMaxZ);
                  }
                  §§goto(addr0358);
               }
               §§goto(addr0355);
            }
            return;
         }
         addr005f:
         §§push(§§pop() * this.width);
         if(_loc14_)
         {
            §§push(Number(§§pop()));
         }
         break loop1;
      }
   }
}

§§push(false);
true;
§§pop();
if(_loc1_)
{
   Sprite3D = §§newclass(Sprite3D,Object3D);
}

