package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.StageAlign;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   import flash.utils.getTimer;
   
   use namespace alternativa3d;
   
   public class Camera3D extends Object3D
   {
      
      public var view:View;
      
      public var fov:Number = 1.5707963267948966;
      
      public var nearClipping:Number = 0;
      
      public var farClipping:Number = 1.7976931348623157e+308;
      
      alternativa3d var viewSizeX:Number;
      
      alternativa3d var viewSizeY:Number;
      
      alternativa3d var focalLength:Number;
      
      alternativa3d var occluders:Vector.<Vertex>;
      
      alternativa3d var numOccluders:int;
      
      alternativa3d var occludedAll:Boolean;
      
      alternativa3d var numDraws:int;
      
      alternativa3d var numPolygons:int;
      
      alternativa3d var numTriangles:int;
      
      public var debug:Boolean = false;
      
      private var debugSet:Object;
      
      private var _diagram:Sprite;
      
      public var fpsUpdatePeriod:int = 10;
      
      public var timerUpdatePeriod:int = 10;
      
      private var fpsTextField:TextField;
      
      private var memoryTextField:TextField;
      
      private var drawsTextField:TextField;
      
      private var polygonsTextField:TextField;
      
      private var trianglesTextField:TextField;
      
      private var timerTextField:TextField;
      
      private var graph:Bitmap;
      
      private var rect:Rectangle;
      
      private var _diagramAlign:String = "TR";
      
      private var _diagramHorizontalMargin:Number = 2;
      
      private var _diagramVerticalMargin:Number = 2;
      
      private var fpsUpdateCounter:int;
      
      private var previousFrameTime:int;
      
      private var previousPeriodTime:int;
      
      private var maxMemory:int;
      
      private var timerUpdateCounter:int;
      
      private var timeSum:int;
      
      private var timeCount:int;
      
      private var timer:int;
      
      private var firstVertex:Vertex;
      
      private var firstFace:Face;
      
      private var firstWrapper:Wrapper;
      
      alternativa3d var lastWrapper:Wrapper;
      
      alternativa3d var lastVertex:Vertex;
      
      alternativa3d var lastFace:Face;
      
      public function Camera3D()
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         while(true)
         {
            if(!_loc1_)
            {
               this.occluders = new Vector.<Vertex>();
               if(_loc1_)
               {
                  break;
               }
            }
            this.debugSet = new Object();
            this._diagram = this.createDiagram();
            if(!_loc1_)
            {
               this.firstVertex = new Vertex();
               this.firstFace = new Face();
               this.firstWrapper = new Wrapper();
               this.lastWrapper = this.firstWrapper;
            }
            break;
         }
         this.lastVertex = this.firstVertex;
         this.lastFace = this.firstFace;
         super();
      }
      
      public function render() : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         var _loc1_:Object3D = null;
         this.numDraws = 0;
         this.numPolygons = 0;
         this.numTriangles = 0;
         loop2:
         while(true)
         {
            if(_loc3_ || _loc3_)
            {
               if(this.view == null)
               {
                  break;
               }
               §§push(this);
               §§push(this.view._width);
               if(!_loc2_)
               {
                  §§push(§§pop() * 0.5);
               }
               §§pop().alternativa3d::viewSizeX = §§pop();
               §§push(this);
               §§push(this.view._height);
               if(!(_loc2_ && Boolean(_loc1_)))
               {
                  §§push(§§pop() * 0.5);
               }
               §§pop().alternativa3d::viewSizeY = §§pop();
            }
            this.focalLength = Math.sqrt(this.viewSizeX * this.viewSizeX + this.viewSizeY * this.viewSizeY) / Math.tan(this.fov * 0.5);
            if(!_loc2_)
            {
               this.composeMatrix();
            }
            _loc1_ = this;
            loop0:
            while(true)
            {
               §§push(_loc1_._parent);
               do
               {
                  if(§§pop() == null)
                  {
                     break loop0;
                  }
                  §§push(_loc1_._parent);
               }
               while(!(_loc3_ || Boolean(this)));
               _loc1_ = §§pop();
               if(!(_loc2_ && Boolean(_loc1_)))
               {
                  _loc1_.composeMatrix();
                  if(_loc3_ || _loc2_)
                  {
                     appendMatrix(_loc1_);
                  }
               }
            }
            invertMatrix();
            this.numOccluders = 0;
            loop3:
            while(true)
            {
               if(!_loc2_)
               {
                  this.occludedAll = false;
                  if(!_loc3_)
                  {
                     break;
                  }
               }
               loop4:
               while(true)
               {
                  while(true)
                  {
                     §§push(this.view);
                     if(!(_loc2_ && Boolean(this)))
                     {
                        §§pop().alternativa3d::numDraws = 0;
                        while(true)
                        {
                           §§push(_loc1_ != this);
                           if(_loc3_ || _loc3_)
                           {
                              var _temp_9:* = §§pop();
                              §§push(_temp_9);
                              §§push(_temp_9);
                              if(_loc3_)
                              {
                                 §§push(Boolean(§§pop()));
                              }
                              if(!§§pop())
                              {
                                 break;
                              }
                              §§pop();
                              if(!_loc3_)
                              {
                                 break loop3;
                              }
                              §§push(_loc1_.visible);
                           }
                           §§push(Boolean(§§pop()));
                           break;
                        }
                        if(§§pop())
                        {
                           if(!_loc3_)
                           {
                              break;
                           }
                           _loc1_.appendMatrix(this);
                           if(_loc1_.cullingInCamera(this,63) >= 0)
                           {
                              _loc1_.draw(this,this.view);
                              this.deferredDestroy();
                              this.clearOccluders();
                           }
                        }
                        §§push(this.view);
                        if(_loc3_ || Boolean(this))
                        {
                           §§pop().alternativa3d::removeChildren(this.view.numDraws);
                           if(!_loc2_)
                           {
                              break loop3;
                           }
                           addr01a5:
                           §§push(this.view);
                           if(_loc3_)
                           {
                              addr01ad:
                              §§pop().alternativa3d::camera = this;
                              if(!(_loc2_ && Boolean(_loc1_)))
                              {
                                 break;
                              }
                              break loop2;
                           }
                           break loop4;
                        }
                        addr0199:
                        if(!§§pop().alternativa3d::_interactive)
                        {
                           break loop2;
                        }
                        if(!_loc3_)
                        {
                           break;
                        }
                        §§goto(addr01a5);
                     }
                     §§goto(addr01ad);
                  }
                  §§push(this.view);
                  break;
               }
               §§pop().alternativa3d::onMouseMove();
               break loop2;
            }
            §§push(this.view);
            if(!_loc3_)
            {
               break loop4;
            }
            §§goto(addr0199);
         }
      }
      
      public function projectGlobal(param1:Vector3D) : Vector3D
      {
         var _temp_1:* = true;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = _temp_1;
         if(_loc5_)
         {
            if(this.view != null)
            {
               this.composeMatrix();
               var _loc2_:Object3D = this;
               while(_loc2_._parent != null)
               {
                  _loc2_ = _loc2_._parent;
                  if(_loc5_)
                  {
                     _loc2_.composeMatrix();
                     if(_loc5_)
                     {
                        appendMatrix(_loc2_);
                     }
                  }
               }
               invertMatrix();
               var _loc3_:Vector3D = new Vector3D();
               _loc3_.x = ma * param1.x + mb * param1.y + mc * param1.z + md;
               _loc3_.y = me * param1.x + mf * param1.y + mg * param1.z + mh;
               _loc3_.z = mi * param1.x + mj * param1.y + mk * param1.z + ml;
               this.viewSizeX = this.view._width * 0.5;
               this.viewSizeY = this.view._height * 0.5;
               _loc3_.x = _loc3_.x * this.viewSizeX / _loc3_.z + this.viewSizeX;
               _loc3_.y = _loc3_.y * this.viewSizeY / _loc3_.z + this.viewSizeY;
               return _loc3_;
            }
         }
         throw new Error("It is necessary to have view set.");
      }
      
      public function calculateRay(param1:Vector3D, param2:Vector3D, param3:Number, param4:Number) : void
      {
         var _temp_1:* = true;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = _temp_1;
         if(!(_loc13_ && Boolean(param2)))
         {
            if(this.view != null)
            {
               this.viewSizeX = this.view._width * 0.5;
               this.viewSizeY = this.view._height * 0.5;
               this.focalLength = Math.sqrt(this.viewSizeX * this.viewSizeX + this.viewSizeY * this.viewSizeY) / Math.tan(this.fov * 0.5);
               param3 -= this.viewSizeX;
               param4 -= this.viewSizeY;
               var _loc5_:Number = param3 * this.focalLength / this.viewSizeX;
               var _loc6_:Number = param4 * this.focalLength / this.viewSizeY;
               var _loc7_:Number = this.focalLength;
               var _loc8_:Number = _loc5_ * this.nearClipping / this.focalLength;
               var _loc9_:Number = _loc6_ * this.nearClipping / this.focalLength;
               var _loc10_:Number = this.nearClipping;
               this.composeMatrix();
               var _loc11_:Object3D = this;
               while(_loc11_._parent != null)
               {
                  _loc11_ = _loc11_._parent;
                  if(!_loc13_)
                  {
                     _loc11_.composeMatrix();
                     if(!(_loc13_ && Boolean(param1)))
                     {
                        appendMatrix(_loc11_);
                     }
                  }
               }
               param1.x = ma * _loc8_ + mb * _loc9_ + mc * _loc10_ + md;
               param1.y = me * _loc8_ + mf * _loc9_ + mg * _loc10_ + mh;
               param1.z = mi * _loc8_ + mj * _loc9_ + mk * _loc10_ + ml;
               param2.x = ma * _loc5_ + mb * _loc6_ + mc * _loc7_;
               param2.y = me * _loc5_ + mf * _loc6_ + mg * _loc7_;
               param2.z = mi * _loc5_ + mj * _loc6_ + mk * _loc7_;
               var _loc12_:Number = 1 / Math.sqrt(param2.x * param2.x + param2.y * param2.y + param2.z * param2.z);
               param2.x *= _loc12_;
               param2.y *= _loc12_;
               param2.z *= _loc12_;
               return;
            }
         }
         throw new Error("It is necessary to have view set.");
      }
      
      override public function clone() : Object3D
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         var _loc1_:Camera3D = new Camera3D();
         if(_loc2_)
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
         if(_loc3_ || Boolean(_loc2_))
         {
            super.clonePropertiesFrom(param1);
         }
         var _loc2_:Camera3D = param1 as Camera3D;
         while(true)
         {
            if(!(_loc4_ && _loc3_))
            {
               this.fov = _loc2_.fov;
               if(_loc4_ && Boolean(_loc2_))
               {
                  break;
               }
            }
            this.nearClipping = _loc2_.nearClipping;
            if(_loc3_)
            {
               this.farClipping = _loc2_.farClipping;
               if(!_loc3_)
               {
                  break;
               }
            }
            this.debug = _loc2_.debug;
            break;
         }
      }
      
      override alternativa3d function composeMatrix() : void
      {
         §§push(false);
         var _loc16_:Boolean = true;
         var _loc17_:* = §§pop();
         §§push(this.viewSizeX);
         if(_loc16_ || Boolean(_loc1_))
         {
            §§push(§§pop() / this.focalLength);
            if(!_loc17_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc1_:* = §§pop();
         while(true)
         {
            §§push(this.viewSizeY);
            if(_loc16_ || Boolean(_loc2_))
            {
               §§push(§§pop() / this.focalLength);
               if(!_loc16_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc2_:* = §§pop();
         var _loc3_:Number = Math.cos(rotationX);
         var _loc4_:Number = Math.sin(rotationX);
         var _loc5_:Number = Math.cos(rotationY);
         var _loc6_:Number = Math.sin(rotationY);
         var _loc7_:Number = Math.cos(rotationZ);
         var _loc8_:Number = Math.sin(rotationZ);
         §§push(_loc7_);
         if(_loc16_ || Boolean(_loc2_))
         {
            §§push(§§pop() * _loc6_);
            if(!_loc17_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc9_:* = §§pop();
         §§push(_loc8_);
         if(!(_loc17_ && Boolean(this)))
         {
            §§push(§§pop() * _loc6_);
            if(!_loc17_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc10_:* = §§pop();
         §§push(_loc5_);
         if(_loc16_ || Boolean(_loc3_))
         {
            §§push(§§pop() * scaleX);
            if(_loc16_ || Boolean(_loc3_))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc11_:* = §§pop();
         §§push(_loc4_);
         if(!(_loc17_ && Boolean(_loc3_)))
         {
            §§push(§§pop() * scaleY);
            if(!_loc17_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc12_:* = §§pop();
         while(true)
         {
            §§push(_loc3_);
            if(_loc16_ || Boolean(_loc3_))
            {
               §§push(§§pop() * scaleY);
               if(_loc17_ && Boolean(_loc3_))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc13_:* = §§pop();
         while(true)
         {
            §§push(_loc3_);
            if(_loc16_ || Boolean(_loc3_))
            {
               §§push(§§pop() * scaleZ);
               if(_loc17_ && Boolean(_loc2_))
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
            §§push(_loc4_);
            if(!_loc17_)
            {
               §§push(§§pop() * scaleZ);
               if(_loc17_ && Boolean(_loc2_))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc15_:* = §§pop();
         loop4:
         while(true)
         {
            loop5:
            while(true)
            {
               while(true)
               {
                  if(!(_loc17_ && Boolean(_loc3_)))
                  {
                     loop10:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(§§findproperty(alternativa3d::ma));
                           §§push(_loc7_);
                           if(!(_loc17_ && Boolean(_loc1_)))
                           {
                              §§push(_loc11_);
                              if(_loc17_ && Boolean(_loc1_))
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(_loc17_)
                              {
                                 break loop10;
                              }
                           }
                           §§push(_loc1_);
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        break;
                     }
                     §§pop().alternativa3d::ma = §§pop();
                     if(!(_loc16_ || Boolean(_loc3_)))
                     {
                        break;
                     }
                     §§push(§§findproperty(alternativa3d::mb));
                     §§push(_loc9_);
                     if(!(_loc17_ && Boolean(_loc3_)))
                     {
                        loop12:
                        while(true)
                        {
                           §§push(_loc12_);
                           if(_loc16_ || Boolean(this))
                           {
                              while(true)
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!_loc17_)
                                 {
                                    §§push(_loc8_);
                                    if(!_loc16_)
                                    {
                                       break;
                                    }
                                    §§push(§§pop() * _loc13_);
                                    if(_loc17_ && Boolean(_loc1_))
                                    {
                                       break;
                                    }
                                    §§push(§§pop() - §§pop());
                                    if(!(_loc16_ || Boolean(_loc3_)))
                                    {
                                       break loop12;
                                    }
                                 }
                                 §§push(_loc2_);
                                 break;
                              }
                           }
                           §§push(§§pop() * §§pop());
                           break;
                        }
                     }
                     §§pop().alternativa3d::mb = §§pop();
                     loop14:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(§§findproperty(alternativa3d::mc));
                           §§push(_loc9_);
                           if(!(_loc17_ && Boolean(_loc3_)))
                           {
                              §§push(_loc14_);
                              if(!_loc16_)
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(_loc17_)
                              {
                                 break loop14;
                              }
                           }
                           §§push(_loc8_);
                           if(!_loc17_)
                           {
                              §§push(§§pop() * _loc15_);
                           }
                           break;
                        }
                        §§push(§§pop() + §§pop());
                        break;
                     }
                     §§pop().alternativa3d::mc = §§pop();
                     if(!_loc16_)
                     {
                        break loop5;
                     }
                     md = x;
                     if(!_loc16_)
                     {
                        break loop4;
                     }
                  }
                  loop16:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(§§findproperty(alternativa3d::me));
                        §§push(_loc8_);
                        if(_loc16_ || Boolean(this))
                        {
                           §§push(_loc11_);
                           if(!_loc16_)
                           {
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           if(_loc17_)
                           {
                              break loop16;
                           }
                        }
                        §§push(_loc1_);
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     break;
                  }
                  §§pop().alternativa3d::me = §§pop();
                  if(!(_loc16_ || Boolean(_loc3_)))
                  {
                     break loop5;
                  }
                  while(true)
                  {
                     loop19:
                     while(true)
                     {
                        §§push(§§findproperty(alternativa3d::mf));
                        §§push(_loc10_);
                        if(_loc16_ || Boolean(_loc2_))
                        {
                           while(true)
                           {
                              §§push(_loc12_);
                              if(_loc16_)
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!_loc16_)
                                 {
                                    continue loop20;
                                 }
                                 §§push(_loc7_);
                                 if(!_loc16_)
                                 {
                                    break;
                                 }
                              }
                              §§push(§§pop() * _loc13_);
                              if(_loc16_ || Boolean(this))
                              {
                                 break;
                              }
                              break loop19;
                           }
                           §§push(§§pop() + §§pop());
                           if(!_loc16_)
                           {
                              continue loop20;
                           }
                        }
                        §§push(_loc2_);
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     continue loop20;
                  }
                  §§pop().alternativa3d::mf = §§pop();
                  loop20:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(§§findproperty(alternativa3d::mg));
                        §§push(_loc10_);
                        if(!_loc17_)
                        {
                           §§push(_loc14_);
                           if(_loc17_ && Boolean(_loc2_))
                           {
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           if(_loc17_)
                           {
                              break loop20;
                           }
                        }
                        §§push(_loc7_);
                        if(_loc16_ || Boolean(_loc3_))
                        {
                           break;
                        }
                        addr031d:
                        §§push(§§pop() - §§pop());
                        break loop20;
                     }
                     §§goto(addr031d);
                  }
                  §§pop().alternativa3d::mg = §§pop();
                  if(!_loc17_)
                  {
                     break;
                  }
                  §§goto(addr03b0);
               }
               mh = y;
               if(_loc16_ || Boolean(_loc3_))
               {
                  break loop4;
               }
               continue loop7;
            }
            §§push(§§findproperty(alternativa3d::mk));
            §§push(_loc5_);
            if(_loc16_)
            {
               §§push(§§pop() * _loc14_);
            }
            §§pop().alternativa3d::mk = §§pop();
            if(_loc16_)
            {
               addr03b0:
               ml = z;
            }
            return;
         }
         while(true)
         {
            §§push(§§findproperty(alternativa3d::mi));
            §§push(_loc6_);
            if(_loc16_ || Boolean(_loc3_))
            {
               §§push(-§§pop());
               if(_loc17_)
               {
                  break;
               }
            }
            §§push(§§pop() * scaleX);
            if(_loc16_ || Boolean(this))
            {
               §§push(§§pop() * _loc1_);
            }
            break;
         }
         §§pop().alternativa3d::mi = §§pop();
         loop7:
         while(true)
         {
            while(true)
            {
               §§push(§§findproperty(alternativa3d::mj));
               §§push(_loc5_);
               if(!_loc17_)
               {
                  §§push(_loc12_);
                  if(_loc17_)
                  {
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  if(!(_loc16_ || Boolean(_loc1_)))
                  {
                     break loop7;
                  }
               }
               §§push(_loc2_);
               break;
            }
            §§push(§§pop() * §§pop());
            break;
         }
         §§pop().alternativa3d::mj = §§pop();
         break loop5;
      }
      
      public function addToDebug(param1:int, param2:*) : void
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         loop0:
         while(true)
         {
            while(true)
            {
               if(!_loc3_)
               {
                  if(this.debugSet[param1])
                  {
                     break;
                  }
                  if(!(_loc4_ || _loc3_))
                  {
                     break loop0;
                  }
               }
               this.debugSet[param1] = new Dictionary();
               if(!_loc3_)
               {
                  break;
               }
               break loop0;
            }
            this.debugSet[param1][param2] = true;
            break;
         }
      }
      
      public function removeFromDebug(param1:int, param2:*) : void
      {
         §§push(false);
         var _loc6_:Boolean = true;
         var _loc7_:* = §§pop();
         var _loc3_:* = undefined;
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               while(true)
               {
                  if(!_loc7_)
                  {
                     §§push(Boolean(this.debugSet[param1]));
                     if(!(_loc6_ || Boolean(param2)))
                     {
                        break;
                     }
                     if(!§§pop())
                     {
                        break loop1;
                     }
                     if(_loc7_ && Boolean(param1))
                     {
                        break loop0;
                     }
                  }
                  §§push(delete this.debugSet[param1][param2]);
                  break;
               }
               §§pop();
               break loop0;
            }
            return;
         }
         var _loc4_:int = 0;
         var _loc5_:* = this.debugSet[param1];
         for(_loc3_ in _loc5_)
         {
         }
         while(true)
         {
            if(!_loc7_)
            {
               §§push(!_loc3_);
               if(!_loc6_)
               {
                  break;
               }
               if(!§§pop())
               {
                  break loop1;
               }
               if(_loc7_)
               {
                  break loop1;
               }
            }
            §§push(delete this.debugSet[param1]);
            break;
         }
         §§pop();
         break loop1;
      }
      
      alternativa3d function checkInDebug(param1:Object3D) : int
      {
         var _temp_1:* = true;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = _temp_1;
         var _loc4_:Class = null;
         §§push(0);
         if(_loc6_)
         {
            §§push(int(§§pop()));
         }
         var _loc2_:* = §§pop();
         §§push(1);
         if(!_loc5_)
         {
            §§push(int(§§pop()));
         }
         var _loc3_:* = §§pop();
         loop0:
         while(true)
         {
            §§push(_loc3_);
            if(_loc5_ && Boolean(this))
            {
               break;
            }
            §§push(512);
            loop1:
            while(true)
            {
               if(§§pop() <= §§pop())
               {
                  loop3:
                  while(true)
                  {
                     loop4:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(Boolean(this.debugSet[_loc3_]));
                           if(_loc6_)
                           {
                              if(!§§pop())
                              {
                                 break;
                              }
                              if(_loc5_)
                              {
                                 break loop4;
                              }
                              §§push(Boolean(this.debugSet[_loc3_][Object3D]));
                              if(_loc5_ && Boolean(param1))
                              {
                                 break loop3;
                              }
                           }
                           var _temp_8:* = §§pop();
                           §§push(_temp_8);
                           §§push(_temp_8);
                           if(_loc6_ || Boolean(this))
                           {
                              §§push(Boolean(§§pop()));
                           }
                           if(!§§pop())
                           {
                              if(!(_loc5_ && Boolean(param1)))
                              {
                                 §§pop();
                                 if(!(_loc5_ && Boolean(param1)))
                                 {
                                    §§push(Boolean(this.debugSet[_loc3_][param1]));
                                    break loop3;
                                 }
                                 break loop1;
                              }
                           }
                           break loop3;
                        }
                        §§goto(addr0157);
                     }
                     break loop7;
                  }
                  if(§§pop())
                  {
                     if(!_loc6_)
                     {
                        break loop4;
                     }
                     §§push(_loc2_);
                     §§push(_loc3_);
                     if(_loc5_)
                     {
                        continue;
                     }
                     §§push(§§pop() | §§pop());
                     if(!_loc5_)
                     {
                        _loc2_ = int(§§pop());
                        if(!_loc5_)
                        {
                           break loop4;
                        }
                        addr0197:
                        §§push(_loc2_);
                        break loop0;
                     }
                  }
                  else
                  {
                     _loc4_ = getDefinitionByName(getQualifiedClassName(param1)) as Class;
                     loop5:
                     while(true)
                     {
                        if(!(_loc5_ && Boolean(_loc3_)))
                        {
                           while(true)
                           {
                              if(_loc4_ == Object3D)
                              {
                                 break loop5;
                              }
                              if(!Boolean(this.debugSet[_loc3_][_loc4_]))
                              {
                                 continue;
                              }
                              if(_loc6_ || Boolean(param1))
                              {
                                 while(true)
                                 {
                                    §§push(_loc2_);
                                    if(!(_loc5_ && Boolean(_loc2_)))
                                    {
                                       §§push(§§pop() | _loc3_);
                                       if(_loc5_)
                                       {
                                          break;
                                       }
                                    }
                                    §§push(int(§§pop()));
                                    break;
                                 }
                                 _loc2_ = §§pop();
                                 if(!_loc6_)
                                 {
                                    break loop5;
                                 }
                              }
                              _loc4_ = Class(getDefinitionByName(getQualifiedSuperclassName(_loc4_)));
                           }
                        }
                        break;
                     }
                     addr0157:
                  }
                  §§push(1);
                  if(_loc5_)
                  {
                     continue;
                  }
                  §§push(§§pop() << §§pop());
                  if(_loc5_ && Boolean(_loc2_))
                  {
                     break loop0;
                  }
                  _loc3_ = int(§§pop());
                  if(!_loc5_)
                  {
                     break;
                  }
               }
               §§goto(addr0197);
            }
         }
         return §§pop();
      }
      
      public function startTimer() : void
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(_loc2_ || _loc1_)
         {
            this.timer = getTimer();
         }
      }
      
      public function stopTimer() : void
      {
         §§push(false);
         var _loc3_:Boolean = true;
         var _loc4_:* = §§pop();
         if(!(_loc4_ && Boolean(_loc1_)))
         {
            this.timeSum += getTimer() - this.timer;
            if(!_loc4_)
            {
               var _loc1_:Camera3D = this;
               §§push(_loc1_.timeCount);
               if(!_loc4_)
               {
                  §§push(§§pop() + 1);
               }
               var _loc2_:* = §§pop();
               if(!_loc4_)
               {
                  _loc1_.timeCount = _loc2_;
               }
            }
         }
      }
      
      public function get diagram() : DisplayObject
      {
         return this._diagram;
      }
      
      public function get diagramAlign() : String
      {
         return this._diagramAlign;
      }
      
      public function set diagramAlign(param1:String) : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         while(true)
         {
            if(_loc3_)
            {
               this._diagramAlign = param1;
               if(_loc2_ && Boolean(this))
               {
                  break;
               }
            }
            this.resizeDiagram();
            break;
         }
      }
      
      public function get diagramHorizontalMargin() : Number
      {
         return this._diagramHorizontalMargin;
      }
      
      public function set diagramHorizontalMargin(param1:Number) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         if(!(_loc3_ && Boolean(_loc3_)))
         {
            this._diagramHorizontalMargin = param1;
            if(!_loc3_)
            {
               this.resizeDiagram();
            }
         }
      }
      
      public function get diagramVerticalMargin() : Number
      {
         return this._diagramVerticalMargin;
      }
      
      public function set diagramVerticalMargin(param1:Number) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         if(!_loc3_)
         {
            this._diagramVerticalMargin = param1;
            if(_loc2_ || Boolean(param1))
            {
               this.resizeDiagram();
            }
         }
      }
      
      private function createDiagram() : Sprite
      {
         var diagram:Sprite;
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         diagram = null;
         loop0:
         while(true)
         {
            while(true)
            {
               if(!(_loc2_ && _loc2_))
               {
                  diagram = new Sprite();
                  if(_loc2_ && Boolean(this))
                  {
                     break loop0;
                  }
                  diagram.mouseEnabled = false;
                  if(!(_loc3_ || _loc2_))
                  {
                     break loop0;
                  }
                  §§push(§§newactivation());
                  if(!(_loc3_ || Boolean(this)))
                  {
                     break;
                  }
                  §§pop().§§slot[1].mouseChildren = false;
                  if(!_loc2_)
                  {
                     diagram.addEventListener(Event.ADDED_TO_STAGE,function():void
                     {
                        var _temp_1:* = true;
                        var _loc1_:Boolean = false;
                        var _loc2_:Boolean = _temp_1;
                        fpsTextField = new TextField();
                        loop0:
                        while(true)
                        {
                           loop1:
                           while(true)
                           {
                              loop3:
                              while(true)
                              {
                                 if(_loc2_ || Boolean(this))
                                 {
                                    fpsTextField.defaultTextFormat = new TextFormat("Tahoma",10,13421772);
                                    fpsTextField.autoSize = TextFieldAutoSize.LEFT;
                                    while(true)
                                    {
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
                                                               if(_loc2_)
                                                               {
                                                                  fpsTextField.text = "FPS:";
                                                                  loop22:
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        loop24:
                                                                        while(true)
                                                                        {
                                                                           while(true)
                                                                           {
                                                                              if(!(_loc1_ && _loc1_))
                                                                              {
                                                                                 fpsTextField.selectable = false;
                                                                                 fpsTextField.x = -3;
                                                                                 if(!(_loc2_ || Boolean(this)))
                                                                                 {
                                                                                    break loop17;
                                                                                 }
                                                                                 fpsTextField.y = -5;
                                                                                 diagram.addChild(fpsTextField);
                                                                                 fpsTextField = new TextField();
                                                                                 if(!_loc2_)
                                                                                 {
                                                                                    break loop16;
                                                                                 }
                                                                                 fpsTextField.defaultTextFormat = new TextFormat("Tahoma",10,13421772);
                                                                                 fpsTextField.autoSize = TextFieldAutoSize.RIGHT;
                                                                                 if(_loc1_ && _loc2_)
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 fpsTextField.text = Number(diagram.stage.frameRate).toFixed(2);
                                                                                 if(_loc1_ && _loc1_)
                                                                                 {
                                                                                    break loop24;
                                                                                 }
                                                                                 fpsTextField.selectable = false;
                                                                                 if(_loc2_)
                                                                                 {
                                                                                    fpsTextField.x = -3;
                                                                                    fpsTextField.y = -5;
                                                                                    fpsTextField.width = 65;
                                                                                    diagram.addChild(fpsTextField);
                                                                                    timerTextField = new TextField();
                                                                                    if(_loc2_)
                                                                                    {
                                                                                       timerTextField.defaultTextFormat = new TextFormat("Tahoma",10,26367);
                                                                                       if(!_loc2_)
                                                                                       {
                                                                                          break loop21;
                                                                                       }
                                                                                       timerTextField.autoSize = TextFieldAutoSize.LEFT;
                                                                                    }
                                                                                    timerTextField.text = "MS:";
                                                                                    if(_loc1_)
                                                                                    {
                                                                                       break loop10;
                                                                                    }
                                                                                    timerTextField.selectable = false;
                                                                                    timerTextField.x = -3;
                                                                                    timerTextField.y = 4;
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    §§goto(addr0370);
                                                                                 }
                                                                              }
                                                                              diagram.addChild(timerTextField);
                                                                              if(_loc1_ && Boolean(this))
                                                                              {
                                                                                 break loop20;
                                                                              }
                                                                              timerTextField = new TextField();
                                                                              if(_loc1_)
                                                                              {
                                                                                 break loop19;
                                                                              }
                                                                              timerTextField.defaultTextFormat = new TextFormat("Tahoma",10,26367);
                                                                              timerTextField.autoSize = TextFieldAutoSize.RIGHT;
                                                                              if(!(_loc1_ && _loc1_))
                                                                              {
                                                                                 timerTextField.text = "";
                                                                                 if(_loc2_ || _loc1_)
                                                                                 {
                                                                                    timerTextField.selectable = false;
                                                                                    if(_loc1_)
                                                                                    {
                                                                                       break loop18;
                                                                                    }
                                                                                    timerTextField.x = -3;
                                                                                    timerTextField.y = 4;
                                                                                    if(_loc2_ || _loc1_)
                                                                                    {
                                                                                       timerTextField.width = 65;
                                                                                       if(!_loc1_)
                                                                                       {
                                                                                          break;
                                                                                       }
                                                                                       break loop16;
                                                                                    }
                                                                                    §§goto(addr0269);
                                                                                 }
                                                                                 §§goto(addr0324);
                                                                              }
                                                                              §§goto(addr0254);
                                                                           }
                                                                           diagram.addChild(timerTextField);
                                                                           memoryTextField = new TextField();
                                                                           if(_loc2_)
                                                                           {
                                                                              break;
                                                                           }
                                                                           break loop15;
                                                                        }
                                                                        memoryTextField.defaultTextFormat = new TextFormat("Tahoma",10,13421568);
                                                                        if(_loc1_ && _loc1_)
                                                                        {
                                                                           break;
                                                                        }
                                                                        memoryTextField.autoSize = TextFieldAutoSize.LEFT;
                                                                        addr0254:
                                                                        memoryTextField.text = "MEM:";
                                                                        if(!_loc1_)
                                                                        {
                                                                           memoryTextField.selectable = false;
                                                                           addr0269:
                                                                           memoryTextField.x = -3;
                                                                           memoryTextField.y = 13;
                                                                           if(_loc2_ || _loc1_)
                                                                           {
                                                                              diagram.addChild(memoryTextField);
                                                                              if(_loc2_ || _loc1_)
                                                                              {
                                                                                 memoryTextField = new TextField();
                                                                                 if(_loc2_)
                                                                                 {
                                                                                    memoryTextField.defaultTextFormat = new TextFormat("Tahoma",10,13421568);
                                                                                    memoryTextField.autoSize = TextFieldAutoSize.RIGHT;
                                                                                    if(_loc2_ || Boolean(this))
                                                                                    {
                                                                                       memoryTextField.text = bytesToString(System.totalMemory);
                                                                                       memoryTextField.selectable = false;
                                                                                       memoryTextField.x = -3;
                                                                                       memoryTextField.y = 13;
                                                                                       memoryTextField.width = 65;
                                                                                       if(_loc2_)
                                                                                       {
                                                                                          diagram.addChild(memoryTextField);
                                                                                          drawsTextField = new TextField();
                                                                                          addr0324:
                                                                                          drawsTextField.defaultTextFormat = new TextFormat("Tahoma",10,52224);
                                                                                          drawsTextField.autoSize = TextFieldAutoSize.LEFT;
                                                                                          drawsTextField.text = "DRW:";
                                                                                          addr0335:
                                                                                          break loop1;
                                                                                       }
                                                                                       break loop0;
                                                                                    }
                                                                                    break loop1;
                                                                                 }
                                                                                 break loop3;
                                                                              }
                                                                              break loop22;
                                                                           }
                                                                           break loop16;
                                                                        }
                                                                        §§goto(addr04cc);
                                                                     }
                                                                     §§goto(addr03e3);
                                                                  }
                                                                  §§goto(addr0437);
                                                               }
                                                               §§goto(addr04ed);
                                                            }
                                                            §§goto(addr0523);
                                                         }
                                                         §§goto(addr060a);
                                                      }
                                                      §§goto(addr0624);
                                                   }
                                                   §§goto(addr05a5);
                                                }
                                                §§goto(addr0549);
                                             }
                                             §§goto(addr061e);
                                          }
                                          §§goto(addr05f5);
                                       }
                                       §§goto(addr068a);
                                    }
                                    §§goto(addr0642);
                                 }
                                 §§goto(addr0335);
                              }
                              §§goto(addr0618);
                           }
                           drawsTextField.selectable = false;
                           loop4:
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
                                          if(!(_loc1_ && Boolean(this)))
                                          {
                                             drawsTextField.x = -3;
                                             addr0370:
                                             drawsTextField.y = 22;
                                             diagram.addChild(drawsTextField);
                                             drawsTextField = new TextField();
                                             drawsTextField.defaultTextFormat = new TextFormat("Tahoma",10,52224);
                                             if(_loc2_)
                                             {
                                                drawsTextField.autoSize = TextFieldAutoSize.RIGHT;
                                                drawsTextField.text = "0";
                                                drawsTextField.selectable = false;
                                                drawsTextField.x = -3;
                                                drawsTextField.y = 22;
                                                drawsTextField.width = 52;
                                                if(!(_loc1_ && _loc1_))
                                                {
                                                   addr03e3:
                                                   diagram.addChild(drawsTextField);
                                                   polygonsTextField = new TextField();
                                                   if(_loc2_ || _loc1_)
                                                   {
                                                      polygonsTextField.defaultTextFormat = new TextFormat("Tahoma",10,16711731);
                                                      polygonsTextField.autoSize = TextFieldAutoSize.LEFT;
                                                      polygonsTextField.text = "PLG:";
                                                      polygonsTextField.selectable = false;
                                                      if(_loc2_)
                                                      {
                                                         addr0437:
                                                         polygonsTextField.x = -3;
                                                         polygonsTextField.y = 31;
                                                         diagram.addChild(polygonsTextField);
                                                         polygonsTextField = new TextField();
                                                         loop10:
                                                         while(true)
                                                         {
                                                            while(true)
                                                            {
                                                               if(!(_loc1_ && Boolean(this)))
                                                               {
                                                                  polygonsTextField.defaultTextFormat = new TextFormat("Tahoma",10,16711731);
                                                                  polygonsTextField.autoSize = TextFieldAutoSize.RIGHT;
                                                                  if(_loc2_ || _loc1_)
                                                                  {
                                                                     polygonsTextField.text = "0";
                                                                     polygonsTextField.selectable = false;
                                                                     if(_loc1_ && Boolean(this))
                                                                     {
                                                                        break loop4;
                                                                     }
                                                                     polygonsTextField.x = -3;
                                                                     if(_loc1_ && Boolean(this))
                                                                     {
                                                                        break;
                                                                     }
                                                                     polygonsTextField.y = 31;
                                                                     polygonsTextField.width = 52;
                                                                     diagram.addChild(polygonsTextField);
                                                                     if(_loc1_ && _loc2_)
                                                                     {
                                                                        break loop7;
                                                                     }
                                                                  }
                                                                  addr04ed:
                                                                  trianglesTextField = new TextField();
                                                                  trianglesTextField.defaultTextFormat = new TextFormat("Tahoma",10,16737792);
                                                                  trianglesTextField.autoSize = TextFieldAutoSize.LEFT;
                                                                  trianglesTextField.text = "TRI:";
                                                                  trianglesTextField.selectable = false;
                                                                  addr0523:
                                                                  trianglesTextField.x = -3;
                                                                  trianglesTextField.y = 40;
                                                                  if(!_loc2_)
                                                                  {
                                                                     break loop10;
                                                                  }
                                                                  diagram.addChild(trianglesTextField);
                                                                  if(!_loc2_)
                                                                  {
                                                                     break loop8;
                                                                  }
                                                               }
                                                               addr0549:
                                                               trianglesTextField = new TextField();
                                                               if(!_loc1_)
                                                               {
                                                                  trianglesTextField.defaultTextFormat = new TextFormat("Tahoma",10,16737792);
                                                                  trianglesTextField.autoSize = TextFieldAutoSize.RIGHT;
                                                                  trianglesTextField.text = "0";
                                                                  trianglesTextField.selectable = false;
                                                                  break loop10;
                                                               }
                                                               break loop0;
                                                            }
                                                         }
                                                         trianglesTextField.x = -3;
                                                         break loop11;
                                                      }
                                                      break loop5;
                                                   }
                                                   break loop6;
                                                }
                                                break loop7;
                                             }
                                             break loop0;
                                          }
                                          trianglesTextField.y = 40;
                                          if(!_loc1_)
                                          {
                                             break;
                                          }
                                          break loop0;
                                       }
                                       trianglesTextField.width = 52;
                                       while(true)
                                       {
                                          if(!_loc1_)
                                          {
                                             addr05a5:
                                             diagram.addChild(trianglesTextField);
                                             if(!_loc1_)
                                             {
                                                break loop7;
                                             }
                                             §§goto(addr065e);
                                          }
                                          §§goto(addr0642);
                                       }
                                       §§goto(addr068a);
                                    }
                                    graph = new Bitmap(new BitmapData(60,40,true,553648127));
                                    while(true)
                                    {
                                       if(!_loc1_)
                                       {
                                          rect = new Rectangle(0,0,1,40);
                                          graph.x = 0;
                                          break loop6;
                                       }
                                       §§goto(addr065e);
                                    }
                                    §§goto(addr068a);
                                 }
                                 graph.y = 54;
                                 addr05f5:
                                 diagram.addChild(graph);
                                 break;
                              }
                              previousPeriodTime = getTimer();
                              addr060a:
                              previousFrameTime = previousPeriodTime;
                              break loop0;
                           }
                           §§goto(addr0684);
                        }
                        fpsUpdateCounter = 0;
                        addr0618:
                        maxMemory = 0;
                        addr061e:
                        timerUpdateCounter = 0;
                        addr0624:
                        timeSum = 0;
                        while(true)
                        {
                           if(!(_loc1_ && _loc1_))
                           {
                              timeCount = 0;
                              if(_loc1_)
                              {
                                 break;
                              }
                           }
                           addr0642:
                           diagram.stage.addEventListener(Event.ENTER_FRAME,updateDiagram,false,-1000);
                           diagram.stage.addEventListener(Event.RESIZE,resizeDiagram,false,-1000);
                           addr0684:
                           resizeDiagram();
                           break;
                           addr065e:
                        }
                        addr068a:
                     });
                     if(!_loc3_)
                     {
                        break loop0;
                     }
                  }
               }
               §§push(§§newactivation());
               if(!(_loc2_ && _loc2_))
               {
                  §§pop().§§slot[1].addEventListener(Event.REMOVED_FROM_STAGE,function():void
                  {
                     var _temp_1:* = true;
                     var _loc1_:Boolean = false;
                     var _loc2_:Boolean = _temp_1;
                     diagram.removeChild(fpsTextField);
                     diagram.removeChild(memoryTextField);
                     if(!_loc1_)
                     {
                        diagram.removeChild(drawsTextField);
                        diagram.removeChild(polygonsTextField);
                        while(true)
                        {
                           if(!_loc1_)
                           {
                              diagram.removeChild(trianglesTextField);
                              diagram.removeChild(timerTextField);
                              diagram.removeChild(graph);
                              fpsTextField = null;
                              memoryTextField = null;
                              drawsTextField = null;
                              if(_loc1_ && _loc2_)
                              {
                                 break;
                              }
                              polygonsTextField = null;
                           }
                           trianglesTextField = null;
                           if(_loc2_)
                           {
                              timerTextField = null;
                              if(!_loc1_)
                              {
                                 break;
                              }
                              addr00c1:
                              diagram.stage.removeEventListener(Event.ENTER_FRAME,updateDiagram);
                              diagram.stage.removeEventListener(Event.RESIZE,resizeDiagram);
                              return;
                              addr00d7:
                           }
                           addr00b7:
                           graph = null;
                           rect = null;
                           §§goto(addr00c1);
                        }
                        graph.bitmapData.dispose();
                        §§goto(addr00b7);
                     }
                     §§goto(addr00d7);
                  });
                  break loop0;
               }
               break;
            }
            return §§pop().§§slot[1];
         }
         §§push(§§newactivation());
         break loop1;
      }
      
      private function resizeDiagram(param1:Event = null) : void
      {
         §§push(false);
         var _loc3_:Boolean = true;
         var _loc4_:* = §§pop();
         var _loc2_:Point = null;
         loop0:
         while(true)
         {
            if(_loc3_)
            {
               if(this._diagram.stage == null)
               {
                  break;
               }
            }
            _loc2_ = this._diagram.parent.globalToLocal(new Point());
            var _temp_1:* = this._diagramAlign == StageAlign.TOP_LEFT;
            loop1:
            while(true)
            {
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
                              loop11:
                              while(true)
                              {
                                 loop15:
                                 while(true)
                                 {
                                    loop16:
                                    while(true)
                                    {
                                       §§push(_temp_1);
                                       §§push(_temp_1);
                                       if(_loc3_)
                                       {
                                          loop17:
                                          while(true)
                                          {
                                             §§push(Boolean(§§pop()));
                                             if(!(_loc4_ && Boolean(_loc2_)))
                                             {
                                                if(!§§pop())
                                                {
                                                   if(_loc4_)
                                                   {
                                                      break loop3;
                                                   }
                                                   §§pop();
                                                   §§push(this._diagramAlign);
                                                   if(_loc4_ && Boolean(param1))
                                                   {
                                                      break loop11;
                                                   }
                                                   §§push(§§pop() == StageAlign.LEFT);
                                                   if(!(_loc3_ || Boolean(this)))
                                                   {
                                                      break loop7;
                                                   }
                                                }
                                                var _temp_16:* = §§pop();
                                                §§push(_temp_16);
                                                if(!Boolean(_temp_16))
                                                {
                                                   §§pop();
                                                   §§push(this._diagramAlign == StageAlign.BOTTOM_LEFT);
                                                   if(!(_loc3_ || Boolean(param1)))
                                                   {
                                                      break;
                                                   }
                                                }
                                                if(§§pop())
                                                {
                                                   if(!_loc3_)
                                                   {
                                                      break loop6;
                                                   }
                                                   this._diagram.x = Math.round(_loc2_.x + this._diagramHorizontalMargin);
                                                }
                                                §§push(this._diagramAlign == StageAlign.TOP);
                                                if(_loc4_)
                                                {
                                                   break loop5;
                                                }
                                                var _temp_18:* = §§pop();
                                                §§push(_temp_18);
                                                §§push(_temp_18);
                                             }
                                             if(!Boolean(§§pop()))
                                             {
                                                if(_loc4_)
                                                {
                                                   break;
                                                }
                                                §§pop();
                                                §§push(this._diagramAlign == StageAlign.BOTTOM);
                                                if(!_loc3_)
                                                {
                                                   break loop3;
                                                }
                                                §§push(Boolean(§§pop()));
                                             }
                                             if(§§pop())
                                             {
                                                this._diagram.x = Math.round(_loc2_.x + this._diagram.stage.stageWidth / 2 - this.graph.width / 2);
                                                if(_loc4_ && Boolean(param1))
                                                {
                                                   break loop2;
                                                }
                                             }
                                             var _temp_20:* = this._diagramAlign == StageAlign.TOP_RIGHT;
                                             §§push(_temp_20);
                                             §§push(_temp_20);
                                             if(_loc3_ || Boolean(_loc2_))
                                             {
                                                §§push(Boolean(§§pop()));
                                             }
                                             while(true)
                                             {
                                                if(!§§pop())
                                                {
                                                   §§pop();
                                                   if(!_loc3_)
                                                   {
                                                      break;
                                                   }
                                                   §§push(this._diagramAlign);
                                                   if(!(_loc3_ || Boolean(this)))
                                                   {
                                                      break loop11;
                                                   }
                                                   §§push(§§pop() == StageAlign.RIGHT);
                                                   if(!_loc3_)
                                                   {
                                                      break loop16;
                                                   }
                                                   §§push(Boolean(§§pop()));
                                                }
                                                var _temp_23:* = §§pop();
                                                §§push(_temp_23);
                                                if(Boolean(_temp_23))
                                                {
                                                   break loop17;
                                                }
                                                if(!_loc4_)
                                                {
                                                   §§pop();
                                                   if(_loc4_)
                                                   {
                                                      break loop15;
                                                   }
                                                   §§push(this._diagramAlign);
                                                   if(!(_loc4_ && Boolean(param1)))
                                                   {
                                                      §§push(§§pop() == StageAlign.BOTTOM_RIGHT);
                                                   }
                                                   else
                                                   {
                                                      §§goto(addr0218);
                                                   }
                                                }
                                                §§push(Boolean(§§pop()));
                                                if(_loc3_)
                                                {
                                                   break loop17;
                                                }
                                                §§goto(addr02a6);
                                             }
                                             addr01ce:
                                             §§push(this._diagramAlign == StageAlign.TOP_LEFT);
                                             if(_loc4_ && _loc3_)
                                             {
                                                break loop1;
                                             }
                                             var _temp_26:* = Boolean(§§pop());
                                             §§push(_temp_26);
                                             §§push(_temp_26);
                                          }
                                          if(§§pop())
                                          {
                                             this._diagram.x = Math.round(_loc2_.x + this._diagram.stage.stageWidth - this._diagramHorizontalMargin - this.graph.width);
                                          }
                                          §§goto(addr01ce);
                                       }
                                       if(!§§pop())
                                       {
                                          break loop7;
                                       }
                                       continue loop13;
                                    }
                                    §§goto(addr0207);
                                 }
                                 §§goto(addr031f);
                              }
                              §§goto(addr0322);
                           }
                           §§pop();
                           while(true)
                           {
                              §§push(this._diagramAlign == StageAlign.TOP);
                              if(_loc3_ || Boolean(_loc2_))
                              {
                                 var _temp_10:* = Boolean(§§pop());
                                 addr0207:
                                 loop13:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_temp_10);
                                       if(!_temp_10)
                                       {
                                          §§pop();
                                          §§push(this._diagramAlign);
                                          if(_loc4_)
                                          {
                                             break;
                                          }
                                          §§push(§§pop() == StageAlign.TOP_RIGHT);
                                          if(_loc4_ && _loc3_)
                                          {
                                             break loop13;
                                          }
                                          §§push(Boolean(§§pop()));
                                       }
                                       if(!§§pop())
                                       {
                                          break loop6;
                                       }
                                       this._diagram.y = Math.round(_loc2_.y + this._diagramVerticalMargin);
                                       if(!(_loc4_ && _loc3_))
                                       {
                                          break loop6;
                                       }
                                    }
                                    §§goto(addr0265);
                                 }
                                 §§goto(addr026c);
                              }
                              else
                              {
                                 §§goto(addr0300);
                              }
                           }
                           §§goto(addr032b);
                        }
                        while(true)
                        {
                           §§push(this._diagramAlign);
                           if(!(_loc4_ && Boolean(_loc2_)))
                           {
                              addr026c:
                              var _temp_5:* = §§pop() == StageAlign.LEFT;
                              addr0265:
                              §§push(_temp_5);
                              §§push(_temp_5);
                              if(!(_loc4_ && Boolean(this)))
                              {
                                 §§push(Boolean(§§pop()));
                              }
                              loop9:
                              while(true)
                              {
                                 while(true)
                                 {
                                    if(!§§pop())
                                    {
                                       if(_loc4_ && Boolean(_loc2_))
                                       {
                                          break;
                                       }
                                       §§pop();
                                       if(!_loc3_)
                                       {
                                          break loop0;
                                       }
                                       §§push(this._diagramAlign == StageAlign.RIGHT);
                                       if(_loc4_)
                                       {
                                          break loop9;
                                       }
                                       §§push(Boolean(§§pop()));
                                    }
                                    addr02a6:
                                    if(§§pop())
                                    {
                                       if(!(_loc4_ && Boolean(_loc2_)))
                                       {
                                          this._diagram.y = Math.round(_loc2_.y + this._diagram.stage.stageHeight / 2 - (this.graph.y + this.graph.height) / 2);
                                       }
                                    }
                                    break loop2;
                                 }
                                 §§goto(addr0300);
                              }
                              §§goto(addr0312);
                           }
                           §§goto(addr0309);
                        }
                        §§goto(addr031f);
                     }
                     §§goto(addr02f9);
                  }
                  var _temp_3:* = §§pop();
                  §§push(_temp_3);
                  if(!Boolean(_temp_3))
                  {
                     §§goto(addr0300);
                  }
                  §§goto(addr0312);
               }
               while(true)
               {
                  §§push(this._diagramAlign);
                  if(!_loc4_)
                  {
                     addr0300:
                     §§push(§§pop() == StageAlign.BOTTOM_LEFT);
                     if(_loc3_)
                     {
                        addr02f9:
                        §§push(Boolean(§§pop()));
                        break loop3;
                     }
                     §§pop();
                     if(_loc3_)
                     {
                        addr0309:
                        §§push(this._diagramAlign == StageAlign.BOTTOM);
                        break loop1;
                     }
                     §§goto(addr031f);
                  }
                  §§goto(addr0322);
               }
               §§goto(addr032b);
            }
            addr0312:
            var _temp_2:* = Boolean(§§pop());
            addr032b:
            §§push(_temp_2);
            §§push(_temp_2);
            if(!_loc4_)
            {
               §§push(Boolean(§§pop()));
            }
            if(!§§pop())
            {
               §§pop();
               addr031f:
               addr0322:
               §§push(this._diagramAlign == StageAlign.BOTTOM_RIGHT);
            }
            if(§§pop())
            {
               this._diagram.y = Math.round(_loc2_.y + this._diagram.stage.stageHeight - this._diagramVerticalMargin - this.graph.y - this.graph.height);
            }
            break;
         }
      }
      
      private function updateDiagram(param1:Event) : void
      {
         var _temp_1:* = true;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = _temp_1;
         var _loc2_:* = NaN;
         var _loc3_:* = 0;
         var _loc4_:int = getTimer();
         var _loc5_:int = this._diagram.stage.frameRate;
         while(true)
         {
            var _loc7_:Camera3D = this;
            §§push(_loc7_.fpsUpdateCounter);
            if(_loc10_ || Boolean(_loc2_))
            {
               §§push(§§pop() + 1);
               if(_loc9_)
               {
                  break;
               }
            }
            var _loc8_:* = §§pop();
            §§push(_loc8_);
            if(_loc10_)
            {
               _loc7_.fpsUpdateCounter = _loc8_;
            }
            break;
         }
         loop1:
         while(true)
         {
            loop2:
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
                                          §§push(this.fpsUpdatePeriod);
                                          if(_loc10_)
                                          {
                                             loop17:
                                             while(true)
                                             {
                                                loop18:
                                                while(true)
                                                {
                                                   if(§§pop() == §§pop())
                                                   {
                                                      if(_loc10_)
                                                      {
                                                         loop20:
                                                         while(true)
                                                         {
                                                            loop21:
                                                            while(true)
                                                            {
                                                               while(true)
                                                               {
                                                                  §§push(1000);
                                                                  if(_loc10_)
                                                                  {
                                                                     §§push(this.fpsUpdatePeriod);
                                                                     if(_loc9_)
                                                                     {
                                                                        break loop14;
                                                                     }
                                                                     §§push(§§pop() * §§pop());
                                                                     if(_loc9_)
                                                                     {
                                                                        break;
                                                                     }
                                                                     §§push(§§pop() / (_loc4_ - this.previousPeriodTime));
                                                                     if(_loc9_ && Boolean(_loc3_))
                                                                     {
                                                                        break loop13;
                                                                     }
                                                                     _loc2_ = §§pop();
                                                                     §§push(_loc2_);
                                                                     §§push(_loc5_);
                                                                     if(!(_loc10_ || Boolean(param1)))
                                                                     {
                                                                        break loop21;
                                                                     }
                                                                     if(§§pop() <= §§pop())
                                                                     {
                                                                        break loop20;
                                                                     }
                                                                     if(!(_loc10_ || Boolean(this)))
                                                                     {
                                                                        break loop18;
                                                                     }
                                                                     §§push(_loc5_);
                                                                     if(_loc9_)
                                                                     {
                                                                        break loop15;
                                                                     }
                                                                  }
                                                                  _loc2_ = Number(§§pop());
                                                                  if(_loc10_)
                                                                  {
                                                                     break loop20;
                                                                  }
                                                                  §§goto(addr00ec);
                                                               }
                                                               §§goto(addr00d0);
                                                            }
                                                            §§push(§§pop() * §§pop());
                                                            if(!(_loc10_ || Boolean(this)))
                                                            {
                                                               break loop12;
                                                            }
                                                            §§push(100);
                                                            if(!_loc10_)
                                                            {
                                                               break loop11;
                                                            }
                                                            _loc3_ = int(§§pop() % §§pop());
                                                            this.fpsTextField.text = int(_loc2_) + "." + (_loc3_ >= 10 ? _loc3_ : (_loc3_ > 0 ? "0" + _loc3_ : "00"));
                                                            addr00ec:
                                                            if(!(_loc10_ || Boolean(_loc3_)))
                                                            {
                                                               break loop10;
                                                            }
                                                            this.previousPeriodTime = _loc4_;
                                                            this.fpsUpdateCounter = 0;
                                                         }
                                                         addr00d0:
                                                         §§push(_loc2_);
                                                         §§push(100);
                                                         break loop21;
                                                      }
                                                      break loop17;
                                                   }
                                                   §§push(1000);
                                                   if(!(_loc9_ && Boolean(_loc3_)))
                                                   {
                                                      §§push(_loc4_);
                                                      if(_loc9_ && Boolean(_loc3_))
                                                      {
                                                         break loop1;
                                                      }
                                                      §§push(§§pop() / (§§pop() - this.previousFrameTime));
                                                      if(_loc9_ && Boolean(param1))
                                                      {
                                                         break loop9;
                                                      }
                                                      _loc2_ = Number(§§pop());
                                                      if(_loc9_)
                                                      {
                                                         break loop8;
                                                      }
                                                      §§push(_loc2_);
                                                      if(!(_loc9_ && Boolean(_loc2_)))
                                                      {
                                                         if(§§pop() > _loc5_)
                                                         {
                                                            break;
                                                         }
                                                         addr019e:
                                                         this.graph.bitmapData.scroll(1,0);
                                                         this.graph.bitmapData.fillRect(this.rect,553648127);
                                                         if(!(_loc9_ && Boolean(_loc3_)))
                                                         {
                                                            this.graph.bitmapData.setPixel32(0,40 * (1 - _loc2_ / _loc5_),4291611852);
                                                            this.previousFrameTime = _loc4_;
                                                            break loop17;
                                                         }
                                                         break loop2;
                                                      }
                                                      _loc2_ = §§pop();
                                                      §§goto(addr019e);
                                                   }
                                                   §§goto(addr021e);
                                                }
                                                §§push(_loc5_);
                                                if(!(_loc10_ || Boolean(this)))
                                                {
                                                   continue loop4;
                                                }
                                                §§push(Number(§§pop()));
                                                if(_loc9_)
                                                {
                                                   break loop16;
                                                }
                                                §§goto(addr019d);
                                             }
                                             while(true)
                                             {
                                                _loc7_ = this;
                                                §§push(_loc7_.timerUpdateCounter);
                                                if(_loc10_)
                                                {
                                                   §§push(§§pop() + 1);
                                                   if(!_loc10_)
                                                   {
                                                      break;
                                                   }
                                                }
                                                _loc8_ = §§pop();
                                                §§push(_loc8_);
                                                if(_loc10_ || Boolean(param1))
                                                {
                                                   _loc7_.timerUpdateCounter = _loc8_;
                                                }
                                                break;
                                             }
                                             addr021e:
                                             §§push(this.timerUpdatePeriod);
                                             if(_loc9_)
                                             {
                                                break loop1;
                                             }
                                          }
                                          if(§§pop() == §§pop())
                                          {
                                             break loop2;
                                          }
                                          break loop8;
                                       }
                                       §§goto(addr026d);
                                    }
                                    §§goto(addr0235);
                                 }
                                 §§goto(addr0245);
                              }
                              §§goto(addr025e);
                           }
                           §§goto(addr026a);
                        }
                        §§goto(addr026c);
                     }
                     §§goto(addr02a0);
                  }
                  §§goto(addr0261);
               }
               §§goto(addr02ba);
            }
            §§push(this.timeCount);
            if(_loc9_)
            {
               continue loop4;
            }
            addr0235:
            §§push(0);
            if(_loc9_ && Boolean(_loc2_))
            {
               break;
            }
            addr0245:
            if(§§pop() > §§pop())
            {
               if(_loc10_ || Boolean(_loc3_))
               {
                  §§push(this.timeSum);
                  §§push(this.timeCount);
                  break;
               }
            }
            else
            {
               this.timerTextField.text = "";
               §§goto(addr02ab);
            }
            §§goto(addr02b0);
         }
         addr025e:
         _loc2_ = §§pop() / §§pop();
         addr0261:
         addr026c:
         addr026d:
         §§push(_loc2_);
         §§push(100);
         if(!_loc9_)
         {
            addr026a:
            §§push(§§pop() * §§pop());
            §§push(100);
         }
         _loc3_ = int(§§pop() % §§pop());
         this.timerTextField.text = int(_loc2_) + "." + (_loc3_ >= 10 ? _loc3_ : (_loc3_ > 0 ? "0" + _loc3_ : "00"));
         addr02ab:
         this.timerUpdateCounter = 0;
         addr02b0:
         this.timeSum = 0;
         this.timeCount = 0;
         var _loc6_:int = int(System.totalMemory);
         addr02ba:
         loop3:
         while(true)
         {
            loop4:
            while(true)
            {
               while(true)
               {
                  §§push(_loc6_);
                  if(!_loc9_)
                  {
                     §§push(1048576);
                     if(!(_loc9_ && Boolean(_loc3_)))
                     {
                        loop6:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(§§pop() / §§pop());
                              if(!(_loc9_ && Boolean(_loc2_)))
                              {
                                 §§push(Number(§§pop()));
                                 if(_loc9_ && Boolean(param1))
                                 {
                                    break;
                                 }
                                 _loc2_ = §§pop();
                                 if(_loc9_)
                                 {
                                    break loop4;
                                 }
                                 §§push(_loc2_);
                                 if(_loc9_ && Boolean(_loc3_))
                                 {
                                    break loop6;
                                 }
                              }
                              §§push(100);
                              if(!(_loc9_ && Boolean(this)))
                              {
                                 §§push(§§pop() * §§pop());
                                 if(_loc10_)
                                 {
                                    break loop6;
                                 }
                                 break;
                              }
                              §§goto(addr0329);
                           }
                           §§push(int(§§pop()));
                           if(!(_loc9_ && Boolean(param1)))
                           {
                              _loc3_ = §§pop();
                              if(_loc9_)
                              {
                                 break loop3;
                              }
                              this.memoryTextField.text = int(_loc2_) + "." + (_loc3_ >= 10 ? _loc3_ : (_loc3_ > 0 ? "0" + _loc3_ : "00"));
                              §§push(_loc6_);
                           }
                        }
                        addr0329:
                        §§push(§§pop() % 100);
                        break loop7;
                     }
                     break;
                  }
                  §§push(this.maxMemory);
                  break;
               }
               if(§§pop() > §§pop())
               {
                  break;
               }
               §§goto(addr0385);
            }
            this.maxMemory = _loc6_;
            if(_loc10_)
            {
               addr0385:
               this.graph.bitmapData.setPixel32(0,40 * (1 - _loc6_ / this.maxMemory),4291611648);
               if(_loc10_ || Boolean(param1))
               {
                  break;
               }
               §§goto(addr03df);
            }
            §§goto(addr03ba);
         }
         this.drawsTextField.text = String(this.numDraws);
         this.polygonsTextField.text = String(this.numPolygons);
         this.trianglesTextField.text = String(this.numTriangles);
         addr03df:
         return;
         addr03ba:
         addr02a0:
      }
      
      private function bytesToString(param1:int) : String
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         loop0:
         while(true)
         {
            §§push(param1);
            §§push(1024);
            if(!_loc3_)
            {
               loop1:
               while(true)
               {
                  loop2:
                  while(true)
                  {
                     if(§§pop() < §§pop())
                     {
                        §§push(param1);
                        if(_loc2_)
                        {
                           §§push(§§pop() + "b");
                           if(_loc2_)
                           {
                              return §§pop();
                           }
                           §§goto(addr0083);
                        }
                        addr016b:
                        if(§§pop() >= 104857600)
                        {
                           return String(param1 >> 20);
                        }
                        §§push(param1);
                     }
                     else
                     {
                        loop3:
                        while(true)
                        {
                           loop4:
                           while(true)
                           {
                              loop5:
                              while(true)
                              {
                                 while(true)
                                 {
                                    loop7:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(param1);
                                          if(!_loc3_)
                                          {
                                             §§push(10240);
                                             if(_loc3_ && Boolean(this))
                                             {
                                                break;
                                             }
                                             if(§§pop() < §§pop())
                                             {
                                                if(!_loc2_)
                                                {
                                                   break loop4;
                                                }
                                                §§push(param1);
                                                if(_loc3_)
                                                {
                                                   break loop5;
                                                }
                                                §§push(§§pop() / 1024);
                                                if(!(_loc2_ || Boolean(param1)))
                                                {
                                                   break loop7;
                                                }
                                                §§push(2);
                                                if(_loc3_)
                                                {
                                                   break loop1;
                                                }
                                                §§push(§§pop().toFixed(§§pop()) + "kb");
                                                if(_loc2_)
                                                {
                                                   addr0083:
                                                   return §§pop();
                                                }
                                                §§goto(addr00b5);
                                             }
                                             else
                                             {
                                                §§push(param1);
                                             }
                                          }
                                          if(§§pop() < 102400)
                                          {
                                             §§push(param1 / 1024);
                                             if(_loc2_)
                                             {
                                                break loop7;
                                             }
                                          }
                                          else
                                          {
                                             §§push(param1);
                                             §§push(1048576);
                                             if(_loc3_)
                                             {
                                                break loop3;
                                             }
                                             if(§§pop() >= §§pop())
                                             {
                                                break loop4;
                                             }
                                             if(!_loc3_)
                                             {
                                                §§push(param1);
                                                if(_loc2_)
                                                {
                                                   §§push(10);
                                                   if(_loc2_ || Boolean(param1))
                                                   {
                                                      break;
                                                   }
                                                   break loop3;
                                                }
                                                §§goto(addr0120);
                                             }
                                             §§goto(addr0112);
                                          }
                                          §§goto(addr017f);
                                       }
                                       addr00f3:
                                       §§push((§§pop() >> §§pop()) + "kb");
                                       break loop0;
                                    }
                                    §§push(1);
                                    if(!(_loc3_ && Boolean(_loc3_)))
                                    {
                                       §§push(§§pop().toFixed(§§pop()) + "kb");
                                       if(_loc2_)
                                       {
                                          addr00b5:
                                          return §§pop();
                                       }
                                       break loop0;
                                    }
                                    break;
                                 }
                                 §§goto(addr014c);
                              }
                           }
                           §§push(param1);
                           §§push(10485760);
                           if(!_loc3_)
                           {
                              break;
                           }
                           break loop2;
                        }
                        if(§§pop() < §§pop())
                        {
                           addr0112:
                           §§push(param1);
                           if(!(_loc3_ && _loc2_))
                           {
                              addr0120:
                              §§push(1048576);
                              if(_loc2_ || Boolean(_loc3_))
                              {
                                 §§push(§§pop() / §§pop());
                                 if(_loc2_ || _loc2_)
                                 {
                                    §§push(2);
                                    if(_loc2_ || _loc2_)
                                    {
                                       addr014c:
                                       return §§pop().toFixed(§§pop());
                                    }
                                    break loop1;
                                 }
                                 addr017f:
                                 addr017f:
                                 §§push(1);
                                 break loop1;
                              }
                              break;
                           }
                           §§goto(addr016b);
                        }
                        else
                        {
                           §§push(param1);
                           if(!(_loc3_ && Boolean(this)))
                           {
                              §§goto(addr016b);
                           }
                        }
                     }
                     break loop5;
                  }
                  §§goto(addr017f);
               }
               return §§pop().toFixed(§§pop());
            }
            §§goto(addr00f3);
         }
         return §§pop();
      }
      
      private function deferredDestroy() : void
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         var _loc2_:Wrapper = null;
         var _loc3_:Wrapper = null;
         var _loc1_:Face = this.firstFace.next;
         for(; _loc1_ != null; _loc1_ = _loc1_.next)
         {
            _loc2_ = _loc1_.wrapper;
            if(!_loc5_)
            {
               if(_loc2_ != null)
               {
                  if(_loc5_ && Boolean(this))
                  {
                     continue;
                  }
                  _loc3_ = null;
                  loop2:
                  while(true)
                  {
                     if(!_loc5_)
                     {
                        while(_loc2_ != null)
                        {
                           _loc2_.vertex = null;
                           if(_loc5_ && Boolean(_loc1_))
                           {
                              addr008c:
                              this.lastWrapper = _loc3_;
                              break loop2;
                           }
                           _loc3_ = _loc2_;
                           _loc2_ = _loc2_.next;
                        }
                        if(!_loc4_)
                        {
                           break;
                        }
                     }
                     this.lastWrapper.next = _loc1_.wrapper;
                     if(_loc5_)
                     {
                        break;
                     }
                     §§goto(addr008c);
                  }
               }
               _loc1_.material = null;
               if(!(_loc4_ || Boolean(this)))
               {
                  continue;
               }
            }
            _loc1_.wrapper = null;
         }
         loop3:
         while(true)
         {
            loop4:
            while(true)
            {
               while(true)
               {
                  §§push(this.firstFace);
                  if(!_loc5_)
                  {
                     if(§§pop() == this.lastFace)
                     {
                        break;
                     }
                     if(!(_loc4_ || Boolean(_loc3_)))
                     {
                        break loop4;
                     }
                     this.lastFace.next = Face.collector;
                     if(_loc5_)
                     {
                        break loop3;
                     }
                     Face.collector = this.firstFace.next;
                     §§push(this.firstFace);
                  }
                  §§pop().alternativa3d::next = null;
                  break loop4;
               }
               loop6:
               while(true)
               {
                  §§push(this.firstWrapper);
                  if(_loc4_)
                  {
                     if(§§pop() == this.lastWrapper)
                     {
                        break;
                     }
                     this.lastWrapper.next = Wrapper.collector;
                     Wrapper.collector = this.firstWrapper.next;
                     §§push(this.firstWrapper);
                  }
                  §§pop().alternativa3d::next = null;
                  this.lastWrapper = this.firstWrapper;
                  loop7:
                  while(true)
                  {
                     while(true)
                     {
                        if(!_loc5_)
                        {
                           break loop6;
                        }
                        addr0160:
                        this.lastVertex.next = Vertex.collector;
                        if(!_loc5_)
                        {
                           Vertex.collector = this.firstVertex.next;
                           break loop7;
                        }
                        addr018c:
                        this.lastVertex = this.firstVertex;
                        break loop3;
                     }
                     addr0189:
                     §§pop().alternativa3d::next = null;
                     §§goto(addr018c);
                  }
                  §§push(this.firstVertex);
                  break loop8;
               }
               §§push(this.firstVertex);
               if(!(_loc5_ && Boolean(this)))
               {
                  if(§§pop() == this.lastVertex)
                  {
                     break loop3;
                  }
                  if(!(_loc4_ || Boolean(_loc3_)))
                  {
                     break loop7;
                  }
                  §§goto(addr0160);
               }
               §§goto(addr0189);
            }
            this.lastFace = this.firstFace;
            break loop5;
         }
      }
      
      alternativa3d function clearOccluders() : void
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = null;
         §§push(0);
         if(!_loc5_)
         {
            §§push(int(§§pop()));
         }
         var _loc1_:* = §§pop();
         loop0:
         while(_loc1_ < this.numOccluders)
         {
            _loc2_ = this.occluders[_loc1_];
            _loc3_ = _loc2_;
            while(true)
            {
               if(_loc4_)
               {
                  loop1:
                  while(true)
                  {
                     §§push(_loc3_.next);
                     do
                     {
                        if(§§pop() == null)
                        {
                           break loop1;
                        }
                        §§push(_loc3_.next);
                     }
                     while(!(_loc4_ || Boolean(this)));
                     _loc3_ = §§pop();
                  }
                  if(!_loc5_)
                  {
                     _loc3_.next = Vertex.collector;
                     if(!_loc4_)
                     {
                        break;
                     }
                  }
               }
               Vertex.collector = _loc2_;
               if(_loc4_ || Boolean(this))
               {
                  break;
               }
               continue loop0;
            }
            this.occluders[_loc1_] = null;
            if(!(_loc5_ && Boolean(_loc3_)))
            {
               §§push(_loc1_);
               if(!_loc5_)
               {
                  §§push(§§pop() + 1);
                  if(_loc4_ || Boolean(_loc3_))
                  {
                     §§push(int(§§pop()));
                  }
               }
               _loc1_ = §§pop();
            }
         }
         if(!_loc5_)
         {
            this.numOccluders = 0;
         }
      }
      
      alternativa3d function sortByAverageZ(param1:Face) : Face
      {
         var _temp_1:* = true;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = _temp_1;
         var _loc2_:* = 0;
         var _loc3_:* = NaN;
         var _loc4_:Wrapper = null;
         var _loc5_:Face = param1;
         var _loc6_:Face = param1.processNext;
         loop0:
         while(true)
         {
            var _temp_2:* = _loc6_ != null;
            §§push(_temp_2);
            §§push(_temp_2);
            if(!(_loc9_ && Boolean(_loc3_)))
            {
               §§push(Boolean(§§pop()));
            }
            while(true)
            {
               if(§§pop())
               {
                  §§pop();
                  if(!_loc10_)
                  {
                     break;
                  }
                  §§push(_loc6_.processNext);
                  if(_loc9_ && Boolean(this))
                  {
                     break loop0;
                  }
                  §§push(§§pop() == null);
                  if(_loc10_)
                  {
                     §§push(!§§pop());
                  }
                  §§push(Boolean(§§pop()));
               }
               if(!§§pop())
               {
                  break;
               }
               §§push(param1.processNext);
               if(_loc9_)
               {
                  break loop0;
               }
               param1 = §§pop();
               §§push(_loc6_.processNext);
               if(_loc10_)
               {
                  §§push(§§pop().alternativa3d::processNext);
               }
               _loc6_ = §§pop();
               continue loop0;
            }
            §§push(param1.processNext);
            break;
         }
         _loc6_ = §§pop();
         loop6:
         while(true)
         {
            if(_loc10_)
            {
               param1.processNext = null;
               if(!_loc10_)
               {
                  break;
               }
            }
            if(_loc5_.processNext != null)
            {
               if(_loc10_)
               {
                  break;
               }
            }
            else
            {
               while(true)
               {
                  §§push(0);
                  if(_loc10_ || Boolean(param1))
                  {
                     §§push(int(§§pop()));
                     if(_loc10_)
                     {
                        _loc2_ = §§pop();
                        if(!(_loc10_ || Boolean(this)))
                        {
                           break;
                        }
                        §§push(0);
                     }
                  }
                  _loc3_ = Number(§§pop());
                  break;
               }
            }
            _loc4_ = _loc5_.wrapper;
            while(true)
            {
               loop9:
               while(true)
               {
                  if(!_loc9_)
                  {
                     while(true)
                     {
                        if(_loc4_ == null)
                        {
                           break loop9;
                        }
                        §§push(_loc2_);
                        if(!_loc9_)
                        {
                           §§push(§§pop() + 1);
                           if(_loc10_)
                           {
                              §§push(int(§§pop()));
                           }
                        }
                        _loc2_ = §§pop();
                        if(!(_loc10_ || Boolean(_loc3_)))
                        {
                           continue loop10;
                        }
                        _loc4_ = _loc4_.next;
                     }
                     break loop6;
                     addr015c:
                  }
                  §§push(_loc3_);
                  if(!(_loc9_ && Boolean(_loc3_)))
                  {
                     §§push(§§pop() + _loc4_.vertex.cameraZ);
                     if(!(_loc9_ && Boolean(_loc3_)))
                     {
                        addr014c:
                        §§push(Number(§§pop()));
                     }
                     _loc3_ = §§pop();
                     if(_loc10_)
                     {
                        _loc4_ = _loc4_.next;
                        §§goto(addr015c);
                     }
                     addr0171:
                     §§push(_loc5_);
                     §§push(_loc3_);
                     if(_loc10_)
                     {
                        §§push(§§pop() / _loc2_);
                     }
                     §§pop().alternativa3d::distance = §§pop();
                     continue loop10;
                  }
                  §§goto(addr014c);
               }
               if(_loc9_ && Boolean(param1))
               {
                  continue loop10;
               }
               §§goto(addr0171);
            }
            loop10:
            while(true)
            {
               while(true)
               {
                  if(_loc6_.processNext != null)
                  {
                     if(!(_loc9_ && Boolean(_loc3_)))
                     {
                        addr0195:
                        _loc6_ = this.sortByAverageZ(_loc6_);
                        break loop10;
                     }
                     addr01c9:
                     §§push(0);
                  }
                  else
                  {
                     §§push(0);
                     if(!_loc9_)
                     {
                        §§push(int(§§pop()));
                        if(!(_loc9_ && Boolean(_loc2_)))
                        {
                           _loc2_ = §§pop();
                           if(_loc9_ && Boolean(this))
                           {
                              break;
                           }
                           §§goto(addr01c9);
                        }
                     }
                  }
                  _loc3_ = Number(§§pop());
                  break;
               }
               _loc4_ = _loc6_.wrapper;
               if(!(_loc9_ && Boolean(this)))
               {
                  while(true)
                  {
                     if(_loc4_ != null)
                     {
                        §§push(_loc2_);
                        if(_loc10_ || Boolean(_loc2_))
                        {
                           §§push(§§pop() + 1);
                           if(!(_loc9_ && Boolean(param1)))
                           {
                              §§push(int(§§pop()));
                           }
                        }
                        _loc2_ = §§pop();
                        if(_loc9_)
                        {
                           break loop10;
                        }
                        §§push(_loc3_);
                        if(_loc10_)
                        {
                           §§push(§§pop() + _loc4_.vertex.cameraZ);
                           if(_loc10_)
                           {
                              §§push(Number(§§pop()));
                           }
                        }
                        _loc3_ = §§pop();
                        if(_loc9_ && Boolean(this))
                        {
                           break loop10;
                        }
                        _loc4_ = _loc4_.next;
                        continue;
                     }
                     if(_loc9_ && Boolean(this))
                     {
                        break loop10;
                     }
                  }
                  break;
               }
               §§push(_loc6_);
               §§push(_loc3_);
               if(_loc10_ || Boolean(_loc2_))
               {
                  §§push(§§pop() / _loc2_);
               }
               §§pop().alternativa3d::distance = §§pop();
               break;
            }
            §§push(_loc5_.distance > _loc6_.distance);
            if(!(_loc9_ && Boolean(param1)))
            {
               §§push(Boolean(§§pop()));
            }
            var _loc7_:* = §§pop();
            while(true)
            {
               if(!(_loc9_ && Boolean(_loc3_)))
               {
                  if(!_loc7_)
                  {
                     param1 = _loc6_;
                     _loc6_ = _loc6_.processNext;
                     break;
                  }
               }
               param1 = _loc5_;
               _loc5_ = _loc5_.processNext;
               break;
            }
            var _loc8_:Face = param1;
            if(!_loc9_)
            {
               loop3:
               while(true)
               {
                  §§push(true);
                  loop4:
                  while(true)
                  {
                     if(!§§pop())
                     {
                        break loop3;
                     }
                     loop14:
                     while(true)
                     {
                        if(_loc5_ == null)
                        {
                           if(_loc10_)
                           {
                              _loc8_.processNext = _loc6_;
                              return param1;
                           }
                        }
                        else
                        {
                           if(_loc6_ == null)
                           {
                              if(!_loc9_)
                              {
                                 _loc8_.processNext = _loc5_;
                                 return param1;
                              }
                           }
                           §§push(_loc7_);
                           if(!_loc10_)
                           {
                              continue loop4;
                           }
                           while(true)
                           {
                              if(§§pop())
                              {
                                 §§push(_loc5_.distance);
                                 if(!(_loc9_ && Boolean(_loc2_)))
                                 {
                                    §§push(_loc6_.distance);
                                    if(!(_loc9_ && Boolean(this)))
                                    {
                                       if(§§pop() > §§pop())
                                       {
                                          addr032e:
                                          _loc8_ = _loc5_;
                                          _loc5_ = _loc5_.processNext;
                                          break loop14;
                                       }
                                       _loc8_.processNext = _loc6_;
                                       if(!_loc9_)
                                       {
                                          _loc8_ = _loc6_;
                                          _loc6_ = _loc6_.processNext;
                                          if(!(_loc9_ && Boolean(param1)))
                                          {
                                             §§push(false);
                                             if(!(_loc9_ && Boolean(_loc2_)))
                                             {
                                                §§push(Boolean(§§pop()));
                                             }
                                             _loc7_ = §§pop();
                                          }
                                          break loop14;
                                       }
                                       addr03b0:
                                       _loc8_ = _loc5_;
                                       _loc5_ = _loc5_.processNext;
                                       if(!_loc9_)
                                       {
                                          §§push(true);
                                          if(_loc10_ || Boolean(param1))
                                          {
                                             §§push(Boolean(§§pop()));
                                          }
                                          _loc7_ = §§pop();
                                       }
                                       break loop4;
                                    }
                                    break;
                                 }
                              }
                              else
                              {
                                 §§push(_loc6_.distance);
                              }
                              §§push(_loc5_.distance);
                              break;
                           }
                           if(§§pop() > §§pop())
                           {
                              _loc8_ = _loc6_;
                              _loc6_ = _loc6_.processNext;
                              break loop4;
                           }
                           _loc8_.processNext = _loc5_;
                           if(!(_loc10_ || Boolean(_loc3_)))
                           {
                              break loop3;
                           }
                           §§goto(addr03b0);
                        }
                        §§goto(addr032e);
                     }
                     break;
                  }
               }
            }
            return null;
         }
         _loc5_ = this.sortByAverageZ(_loc5_);
         if(_loc10_ || Boolean(_loc3_))
         {
            continue loop10;
         }
         §§goto(addr0195);
      }
      
      alternativa3d function sortByDynamicBSP(param1:Face, param2:Number, param3:Face = null) : Face
      {
         var _temp_1:* = true;
         var _loc49_:Boolean = false;
         var _loc50_:Boolean = _temp_1;
         var _loc4_:Wrapper = null;
         var _loc5_:Vertex = null;
         var _loc6_:Vertex = null;
         var _loc7_:Vertex = null;
         var _loc8_:Vertex = null;
         var _loc23_:Face = null;
         var _loc24_:Face = null;
         var _loc26_:Face = null;
         var _loc27_:Face = null;
         var _loc28_:Face = null;
         var _loc30_:* = NaN;
         var _loc31_:* = NaN;
         var _loc32_:* = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:* = NaN;
         var _loc36_:* = NaN;
         var _loc37_:* = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:* = false;
         var _loc41_:Boolean = false;
         var _loc42_:Number = NaN;
         var _loc43_:Face = null;
         var _loc44_:Face = null;
         var _loc45_:Wrapper = null;
         var _loc46_:Wrapper = null;
         var _loc47_:Wrapper = null;
         var _loc48_:Number = NaN;
         var _loc9_:Face = param1;
         param1 = _loc9_.processNext;
         _loc4_ = _loc9_.wrapper;
         _loc5_ = _loc4_.vertex;
         _loc4_ = _loc4_.next;
         _loc6_ = _loc4_.vertex;
         §§push(_loc5_.cameraX);
         if(!(_loc49_ && Boolean(param3)))
         {
            §§push(Number(§§pop()));
         }
         var _loc10_:* = §§pop();
         §§push(_loc5_.cameraY);
         if(_loc50_)
         {
            §§push(Number(§§pop()));
         }
         var _loc11_:* = §§pop();
         §§push(_loc5_.cameraZ);
         if(!_loc49_)
         {
            §§push(Number(§§pop()));
         }
         var _loc12_:* = §§pop();
         §§push(_loc6_.cameraX);
         if(!_loc49_)
         {
            §§push(§§pop() - _loc10_);
            if(!(_loc49_ && Boolean(param3)))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc13_:* = §§pop();
         while(true)
         {
            §§push(_loc6_.cameraY);
            if(_loc50_ || Boolean(this))
            {
               §§push(§§pop() - _loc11_);
               if(!_loc50_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc14_:* = §§pop();
         §§push(_loc6_.cameraZ);
         if(_loc50_)
         {
            §§push(§§pop() - _loc12_);
            if(!(_loc49_ && Boolean(this)))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc15_:* = §§pop();
         var _loc16_:Number = 0;
         var _loc17_:* = 0;
         var _loc18_:* = 1;
         §§push(_loc12_);
         if(!(_loc49_ && Boolean(param1)))
         {
            §§push(Number(§§pop()));
         }
         var _loc19_:* = §§pop();
         var _loc20_:* = 0;
         _loc4_ = _loc4_.next;
         loop0:
         while(true)
         {
            loop7:
            while(true)
            {
               if(_loc4_ != null)
               {
                  _loc8_ = _loc4_.vertex;
                  loop61:
                  while(true)
                  {
                     loop62:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc8_.cameraX);
                           §§push(_loc10_);
                           if(!(_loc49_ && Boolean(param3)))
                           {
                              loop64:
                              while(true)
                              {
                                 loop65:
                                 while(true)
                                 {
                                    loop68:
                                    while(true)
                                    {
                                       loop69:
                                       while(true)
                                       {
                                          loop70:
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
                                                      loop74:
                                                      while(true)
                                                      {
                                                         loop75:
                                                         while(true)
                                                         {
                                                            loop76:
                                                            while(true)
                                                            {
                                                               loop77:
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
                                                                           loop81:
                                                                           while(true)
                                                                           {
                                                                              §§push(§§pop() - §§pop());
                                                                              if(!(_loc49_ && Boolean(this)))
                                                                              {
                                                                                 loop82:
                                                                                 while(true)
                                                                                 {
                                                                                    loop83:
                                                                                    while(true)
                                                                                    {
                                                                                       §§push(Number(§§pop()));
                                                                                       if(_loc50_)
                                                                                       {
                                                                                          _loc30_ = §§pop();
                                                                                          if(_loc49_)
                                                                                          {
                                                                                             break;
                                                                                          }
                                                                                          §§push(_loc8_.cameraY - _loc11_);
                                                                                          if(_loc49_)
                                                                                          {
                                                                                             break loop82;
                                                                                          }
                                                                                          _loc31_ = §§pop();
                                                                                          §§push(_loc8_.cameraZ);
                                                                                          if(_loc49_)
                                                                                          {
                                                                                             break loop81;
                                                                                          }
                                                                                          §§push(§§pop() - _loc12_);
                                                                                          if(!(_loc50_ || Boolean(param2)))
                                                                                          {
                                                                                             break loop80;
                                                                                          }
                                                                                       }
                                                                                       while(true)
                                                                                       {
                                                                                          §§push(Number(§§pop()));
                                                                                          if(_loc50_ || Boolean(param3))
                                                                                          {
                                                                                             _loc32_ = §§pop();
                                                                                             §§push(_loc32_);
                                                                                             §§push(_loc14_);
                                                                                             if(_loc49_ && Boolean(param2))
                                                                                             {
                                                                                                break loop79;
                                                                                             }
                                                                                             §§push(§§pop() * §§pop() - _loc31_ * _loc15_);
                                                                                             if(_loc50_ || Boolean(param2))
                                                                                             {
                                                                                                _loc33_ = §§pop();
                                                                                                if(!_loc50_)
                                                                                                {
                                                                                                   break loop61;
                                                                                                }
                                                                                                §§push(_loc30_ * _loc15_);
                                                                                                §§push(_loc32_);
                                                                                                §§push(_loc13_);
                                                                                                if(!_loc50_)
                                                                                                {
                                                                                                   break loop78;
                                                                                                }
                                                                                                §§push(§§pop() - §§pop() * §§pop());
                                                                                                if(!(_loc49_ && Boolean(param1)))
                                                                                                {
                                                                                                   _loc34_ = §§pop();
                                                                                                   break loop83;
                                                                                                }
                                                                                                §§goto(addr03d8);
                                                                                             }
                                                                                             §§goto(addr03e1);
                                                                                          }
                                                                                          addr0267:
                                                                                          _loc35_ = §§pop();
                                                                                          if(!(_loc49_ && Boolean(this)))
                                                                                          {
                                                                                             §§push(_loc33_);
                                                                                             if(_loc50_ || Boolean(this))
                                                                                             {
                                                                                                §§push(_loc33_);
                                                                                                if(_loc50_)
                                                                                                {
                                                                                                   §§push(§§pop() * §§pop());
                                                                                                   break loop82;
                                                                                                }
                                                                                                break loop75;
                                                                                             }
                                                                                             break loop65;
                                                                                          }
                                                                                          break loop76;
                                                                                       }
                                                                                       §§goto(addr03f0);
                                                                                    }
                                                                                    §§push(_loc31_ * _loc13_);
                                                                                    if(_loc50_)
                                                                                    {
                                                                                       §§push(_loc30_);
                                                                                       §§push(_loc14_);
                                                                                       if(!(_loc50_ || Boolean(this)))
                                                                                       {
                                                                                          break loop77;
                                                                                       }
                                                                                       §§push(§§pop() - §§pop() * §§pop());
                                                                                       if(!(_loc49_ && Boolean(param1)))
                                                                                       {
                                                                                          §§goto(addr0267);
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       §§goto(addr03ce);
                                                                                    }
                                                                                    §§goto(addr03f0);
                                                                                 }
                                                                                 §§push(_loc34_);
                                                                                 §§push(_loc34_);
                                                                                 if(_loc49_)
                                                                                 {
                                                                                    break loop74;
                                                                                 }
                                                                                 §§push(§§pop() * §§pop());
                                                                                 if(_loc49_ && Boolean(this))
                                                                                 {
                                                                                    break loop73;
                                                                                 }
                                                                                 §§push(§§pop() + §§pop());
                                                                                 §§push(_loc35_ * _loc35_);
                                                                                 if(!(_loc50_ || Boolean(this)))
                                                                                 {
                                                                                    break loop72;
                                                                                 }
                                                                                 §§push(§§pop() + §§pop());
                                                                                 if(_loc50_ || Boolean(param2))
                                                                                 {
                                                                                    _loc36_ = Number(§§pop());
                                                                                    §§push(_loc36_);
                                                                                    §§push(param2);
                                                                                    if(_loc50_)
                                                                                    {
                                                                                       if(§§pop() > §§pop())
                                                                                       {
                                                                                          if(!_loc49_)
                                                                                          {
                                                                                             §§push(1);
                                                                                             if(_loc50_ || Boolean(param2))
                                                                                             {
                                                                                                addr02fc:
                                                                                                §§push(§§pop() / Math.sqrt(_loc36_));
                                                                                                if(_loc50_)
                                                                                                {
                                                                                                   addr0303:
                                                                                                   _loc36_ = §§pop();
                                                                                                   §§push(_loc33_);
                                                                                                   if(_loc50_ || Boolean(param1))
                                                                                                   {
                                                                                                      _loc16_ = §§pop() * _loc36_;
                                                                                                      §§push(_loc34_);
                                                                                                   }
                                                                                                   §§push(§§pop() * _loc36_);
                                                                                                   if(!_loc49_)
                                                                                                   {
                                                                                                      _loc17_ = Number(§§pop());
                                                                                                      §§push(_loc35_);
                                                                                                      break;
                                                                                                   }
                                                                                                   break loop69;
                                                                                                }
                                                                                                break loop64;
                                                                                             }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                             §§goto(addr03d0);
                                                                                          }
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          §§push(_loc36_);
                                                                                          if(_loc49_)
                                                                                          {
                                                                                             break loop70;
                                                                                          }
                                                                                          if(§§pop() <= _loc20_)
                                                                                          {
                                                                                             continue loop0;
                                                                                          }
                                                                                          if(_loc49_)
                                                                                          {
                                                                                             continue loop0;
                                                                                          }
                                                                                          §§push(1);
                                                                                       }
                                                                                       §§push(§§pop() / Math.sqrt(_loc36_));
                                                                                       break loop68;
                                                                                    }
                                                                                    break loop71;
                                                                                 }
                                                                                 §§goto(addr02fc);
                                                                              }
                                                                              §§goto(addr0303);
                                                                           }
                                                                           §§push(_loc36_);
                                                                           if(!_loc49_)
                                                                           {
                                                                              break loop79;
                                                                           }
                                                                           §§goto(addr0432);
                                                                        }
                                                                        §§push(_loc11_);
                                                                        break loop71;
                                                                     }
                                                                     _loc18_ = §§pop() * §§pop();
                                                                     §§push(_loc10_ * _loc16_);
                                                                     if(!_loc49_)
                                                                     {
                                                                        break loop80;
                                                                     }
                                                                     break loop70;
                                                                  }
                                                                  §§goto(addr034c);
                                                               }
                                                               §§goto(addr0346);
                                                            }
                                                            §§goto(addr0357);
                                                         }
                                                      }
                                                      §§goto(addr043d);
                                                   }
                                                   §§goto(addr0429);
                                                }
                                                §§goto(addr0418);
                                             }
                                             addr0346:
                                             addr034c:
                                             §§push(§§pop() + §§pop() * _loc17_ + _loc12_ * _loc18_);
                                             if(!_loc50_)
                                             {
                                                break loop68;
                                             }
                                             _loc19_ = §§pop();
                                             §§push(_loc19_);
                                             if(_loc50_ || Boolean(this))
                                             {
                                                break loop7;
                                             }
                                             break loop0;
                                             addr0357:
                                          }
                                          §§goto(addr0433);
                                       }
                                       §§goto(addr03f4);
                                    }
                                    §§push(Number(§§pop()));
                                    if(_loc50_ || Boolean(this))
                                    {
                                       break loop64;
                                    }
                                    break;
                                 }
                                 _loc18_ = §§pop();
                                 if(!(_loc50_ || Boolean(param3)))
                                 {
                                    continue loop0;
                                 }
                                 §§push(_loc10_);
                                 if(!_loc50_)
                                 {
                                    break loop66;
                                 }
                                 §§goto(addr0418);
                                 §§push(_loc16_);
                              }
                              _loc36_ = §§pop();
                              if(!(_loc50_ || Boolean(param2)))
                              {
                                 continue loop0;
                              }
                              loop66:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(_loc33_);
                                    if(!(_loc49_ && Boolean(param1)))
                                    {
                                       §§push(_loc36_);
                                       if(_loc49_ && Boolean(param2))
                                       {
                                          break;
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(!(_loc50_ || Boolean(param1)))
                                       {
                                          break loop7;
                                       }
                                       _loc16_ = §§pop();
                                       §§push(_loc34_);
                                       if(_loc49_)
                                       {
                                          break loop62;
                                       }
                                       §§push(§§pop() * _loc36_);
                                       if(!_loc50_)
                                       {
                                          break loop66;
                                       }
                                       §§push(Number(§§pop()));
                                       if(_loc49_ && Boolean(param2))
                                       {
                                          break loop62;
                                       }
                                       _loc17_ = §§pop();
                                       §§push(_loc35_);
                                    }
                                    addr03f4:
                                    §§push(§§pop() * _loc36_);
                                    if(_loc50_)
                                    {
                                       §§push(Number(§§pop()));
                                       break loop65;
                                    }
                                    break loop7;
                                 }
                                 addr0418:
                                 §§push(§§pop() * §§pop());
                                 if(_loc50_ || Boolean(param1))
                                 {
                                    break;
                                 }
                                 break loop0;
                              }
                              addr0429:
                              §§push(_loc11_);
                              §§push(_loc17_);
                              if(!_loc49_)
                              {
                                 addr0433:
                                 addr0432:
                                 §§push(§§pop() + §§pop() * §§pop());
                                 §§push(_loc12_);
                                 if(_loc49_)
                                 {
                                    break;
                                 }
                                 §§push(_loc18_);
                              }
                              addr043d:
                           }
                           break loop75;
                        }
                        addr0479:
                        §§push(§§pop() - §§pop());
                        break loop0;
                     }
                     _loc19_ = §§pop();
                     if(_loc50_)
                     {
                        break;
                     }
                     continue loop0;
                  }
                  §§push(Number(_loc36_));
                  if(_loc49_)
                  {
                     break loop0;
                  }
                  _loc20_ = §§pop();
                  continue loop0;
               }
               §§goto(addr0468);
            }
            _loc4_ = _loc4_.next;
            §§goto(addr0479);
         }
         var _loc21_:* = §§pop();
         while(true)
         {
            §§push(_loc19_);
            if(!(_loc49_ && Boolean(param1)))
            {
               §§push(§§pop() + param2);
               if(_loc49_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc22_:* = §§pop();
         var _loc25_:Face = _loc9_;
         var _loc29_:Face = param1;
         loop1:
         while(true)
         {
            while(true)
            {
               if(_loc29_ == null)
               {
                  if(_loc50_)
                  {
                     if(_loc26_ == null)
                     {
                        break loop1;
                     }
                     if(!(_loc50_ || Boolean(param1)))
                     {
                        break;
                     }
                     _loc27_.processNext = null;
                  }
                  §§push(_loc26_.processNext);
               }
               else
               {
                  §§push(_loc29_.processNext);
                  if(!_loc49_)
                  {
                     _loc28_ = §§pop();
                     _loc4_ = _loc29_.wrapper;
                     _loc5_ = _loc4_.vertex;
                     _loc4_ = _loc4_.next;
                     _loc6_ = _loc4_.vertex;
                     _loc4_ = _loc4_.next;
                     _loc7_ = _loc4_.vertex;
                     _loc4_ = _loc4_.next;
                     loop11:
                     while(true)
                     {
                        loop12:
                        while(true)
                        {
                           loop13:
                           while(true)
                           {
                              loop51:
                              while(true)
                              {
                                 loop52:
                                 while(true)
                                 {
                                    §§push(_loc5_.cameraX);
                                    if(!_loc49_)
                                    {
                                       loop58:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc16_);
                                             if(_loc50_)
                                             {
                                                §§push(§§pop() * §§pop());
                                                §§push(_loc5_.cameraY);
                                                §§push(_loc17_);
                                                if(!_loc50_)
                                                {
                                                   break;
                                                }
                                                §§push(§§pop() + §§pop() * §§pop());
                                                §§push(_loc5_.cameraZ);
                                                §§push(_loc18_);
                                                if(!(_loc50_ || Boolean(param1)))
                                                {
                                                   break loop58;
                                                }
                                                §§push(§§pop() * §§pop());
                                             }
                                             §§push(§§pop() + §§pop());
                                             if(!(_loc50_ || Boolean(param1)))
                                             {
                                                break loop51;
                                             }
                                             _loc37_ = §§pop();
                                             §§push(_loc6_.cameraX);
                                             if(_loc49_ && Boolean(this))
                                             {
                                                break loop13;
                                             }
                                             §§push(§§pop() * _loc16_);
                                             §§push(_loc6_.cameraY);
                                             if(_loc49_)
                                             {
                                                break loop12;
                                             }
                                             §§push(_loc17_);
                                             if(_loc49_ && Boolean(param3))
                                             {
                                                break loop58;
                                             }
                                             §§push(§§pop() * §§pop());
                                             if(!_loc49_)
                                             {
                                                §§push(§§pop() + §§pop());
                                                if(_loc50_)
                                                {
                                                   §§push(_loc6_.cameraZ);
                                                   §§push(_loc18_);
                                                   if(!_loc49_)
                                                   {
                                                      break loop58;
                                                   }
                                                   break;
                                                }
                                                addr05d1:
                                                _loc39_ = §§pop();
                                                §§push(_loc37_);
                                                if(_loc50_)
                                                {
                                                   break loop52;
                                                }
                                                break loop11;
                                             }
                                             §§goto(addr0586);
                                          }
                                          §§push(§§pop() + §§pop() * §§pop());
                                          if(_loc49_ && Boolean(param1))
                                          {
                                             break loop11;
                                          }
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(_loc50_)
                                       {
                                          addr0586:
                                          _loc38_ = §§pop() + §§pop();
                                          §§push(_loc7_.cameraX);
                                          if(_loc50_ || Boolean(param3))
                                          {
                                             §§push(§§pop() * _loc16_);
                                             §§push(_loc7_.cameraY);
                                             §§push(_loc17_);
                                             if(!_loc49_)
                                             {
                                                §§push(§§pop() + §§pop() * §§pop());
                                                if(!(_loc49_ && Boolean(param1)))
                                                {
                                                   §§push(_loc7_.cameraZ);
                                                   §§push(_loc18_);
                                                   break loop59;
                                                }
                                                break;
                                             }
                                             break loop59;
                                          }
                                          break loop51;
                                       }
                                       §§goto(addr0621);
                                    }
                                    §§goto(addr05d1);
                                 }
                                 §§push(§§pop() < _loc21_);
                                 if(_loc50_)
                                 {
                                    var _temp_86:* = §§pop();
                                    §§push(_temp_86);
                                    §§push(Boolean(_temp_86));
                                    if(!(_loc50_ || Boolean(param1)))
                                    {
                                       continue loop56;
                                    }
                                    if(!§§pop())
                                    {
                                       §§pop();
                                       while(true)
                                       {
                                          if(!(_loc49_ && Boolean(param1)))
                                          {
                                             §§push(_loc38_);
                                             if(!_loc49_)
                                             {
                                                break loop51;
                                             }
                                             §§goto(addr0678);
                                          }
                                          §§goto(addr0855);
                                       }
                                       §§goto(addr085b);
                                    }
                                    else
                                    {
                                       §§goto(addr0623);
                                    }
                                 }
                                 §§goto(addr0696);
                              }
                              while(true)
                              {
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc21_);
                                       if(!(_loc49_ && Boolean(this)))
                                       {
                                          addr0623:
                                          var _temp_77:* = §§pop() < §§pop();
                                          addr0621:
                                          loop56:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(_temp_77);
                                                if(!_temp_77)
                                                {
                                                   if(_loc49_)
                                                   {
                                                      break;
                                                   }
                                                   §§pop();
                                                   §§push(_loc39_);
                                                   §§push(_loc21_);
                                                   if(!_loc50_)
                                                   {
                                                      break loop12;
                                                   }
                                                   §§push(§§pop() < §§pop());
                                                   if(!(_loc50_ || Boolean(param1)))
                                                   {
                                                      break loop56;
                                                   }
                                                   §§push(Boolean(§§pop()));
                                                }
                                                _loc40_ = Boolean(§§pop());
                                                §§push(_loc37_);
                                                break loop13;
                                             }
                                             §§goto(addr0660);
                                          }
                                          §§goto(addr0689);
                                       }
                                       §§goto(addr0688);
                                    }
                                    §§goto(addr069c);
                                 }
                                 §§goto(addr0692);
                              }
                              §§goto(addr068a);
                           }
                           §§push(§§pop() > _loc22_);
                           if(_loc50_ || Boolean(param1))
                           {
                              addr0660:
                              var _temp_72:* = Boolean(§§pop());
                              addr0692:
                              §§push(_temp_72);
                              §§push(_temp_72);
                              if(!(_loc49_ && Boolean(param3)))
                              {
                                 if(!Boolean(§§pop()))
                                 {
                                    §§pop();
                                    addr0678:
                                    §§push(_loc38_);
                                    §§push(_loc22_);
                                    if(!(_loc50_ || Boolean(param3)))
                                    {
                                       break;
                                    }
                                    addr0689:
                                    addr0688:
                                    §§push(§§pop() > §§pop());
                                 }
                                 addr068a:
                                 var _temp_75:* = §§pop();
                                 §§push(_temp_75);
                                 §§push(_temp_75);
                                 if(!_loc49_)
                                 {
                                    §§push(Boolean(§§pop()));
                                 }
                              }
                              if(!§§pop())
                              {
                                 addr0696:
                                 §§pop();
                                 §§push(_loc39_);
                                 break loop11;
                              }
                              §§goto(addr069d);
                           }
                           §§goto(addr069c);
                        }
                        addr069d:
                        _loc41_ = §§pop() > §§pop();
                        addr069c:
                        loop2:
                        for(; _loc4_ != null; _loc4_ = _loc4_.next)
                        {
                           _loc8_ = _loc4_.vertex;
                           loop14:
                           while(true)
                           {
                              if(_loc50_)
                              {
                                 loop15:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc8_.cameraX);
                                       §§push(_loc16_);
                                       if(!_loc49_)
                                       {
                                          §§push(§§pop() * §§pop());
                                          if(_loc49_)
                                          {
                                             break;
                                          }
                                          §§push(_loc8_.cameraY);
                                          §§push(_loc17_);
                                          if(!(_loc50_ || Boolean(param2)))
                                          {
                                             break loop15;
                                          }
                                          §§push(§§pop() * §§pop());
                                       }
                                       while(true)
                                       {
                                          addr0705:
                                          §§push(§§pop() + §§pop());
                                          if(!(_loc49_ && Boolean(param2)))
                                          {
                                             §§push(_loc8_.cameraZ);
                                             §§push(_loc18_);
                                             break loop15;
                                          }
                                          §§push(_loc21_);
                                          if(_loc50_ || Boolean(param2))
                                          {
                                             if(§§pop() >= §§pop())
                                             {
                                                §§push(_loc42_);
                                                break;
                                             }
                                             §§push(true);
                                             if(!(_loc49_ && Boolean(param2)))
                                             {
                                                §§push(Boolean(§§pop()));
                                                if(!(_loc50_ || Boolean(param3)))
                                                {
                                                   addr076d:
                                                   _loc41_ = §§pop();
                                                   addr076c:
                                                   if(!_loc49_)
                                                   {
                                                      break loop14;
                                                   }
                                                   continue loop2;
                                                }
                                             }
                                             _loc40_ = §§pop();
                                             if(!(_loc49_ && Boolean(param3)))
                                             {
                                                addr0751:
                                                break loop14;
                                             }
                                             continue loop2;
                                          }
                                          addr0759:
                                          if(§§pop() <= §§pop())
                                          {
                                             break loop14;
                                          }
                                          §§push(true);
                                          if(_loc50_ || Boolean(param1))
                                          {
                                             §§goto(addr076c);
                                          }
                                          §§goto(addr076d);
                                       }
                                       addr0757:
                                       §§goto(addr0759);
                                    }
                                    _loc42_ = §§pop();
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc42_);
                                             if(!(_loc49_ && Boolean(param3)))
                                             {
                                                §§goto(addr0705);
                                             }
                                             §§goto(addr0757);
                                          }
                                          §§goto(addr0759);
                                       }
                                       §§goto(addr076c);
                                    }
                                    §§goto(addr076d);
                                 }
                                 §§push(§§pop() + §§pop() * §§pop());
                                 break loop16;
                              }
                              §§goto(addr0751);
                           }
                           _loc8_.offset = _loc42_;
                        }
                        loop21:
                        while(true)
                        {
                           §§push(_loc40_);
                           if(!_loc49_)
                           {
                              while(true)
                              {
                                 §§push(!§§pop());
                                 if(_loc50_ || Boolean(param1))
                                 {
                                    if(§§pop())
                                    {
                                       §§push(_loc41_);
                                       if(_loc50_ || Boolean(param1))
                                       {
                                          addr07b5:
                                          §§push(!§§pop());
                                          if(_loc49_)
                                          {
                                             break;
                                          }
                                          if(§§pop())
                                          {
                                             _loc25_.processNext = _loc29_;
                                             _loc25_ = _loc29_;
                                          }
                                          else
                                          {
                                             if(_loc26_ != null)
                                             {
                                                _loc27_.processNext = _loc29_;
                                                if(!(_loc50_ || Boolean(param1)))
                                                {
                                                   break loop21;
                                                }
                                             }
                                             else
                                             {
                                                _loc26_ = _loc29_;
                                             }
                                             _loc27_ = _loc29_;
                                          }
                                          continue loop1;
                                       }
                                    }
                                    else
                                    {
                                       §§push(_loc41_);
                                       if(_loc49_ && Boolean(param1))
                                       {
                                          break;
                                       }
                                    }
                                    §§push(!§§pop());
                                    break;
                                 }
                                 §§goto(addr07b5);
                              }
                              if(!§§pop())
                              {
                                 _loc5_.offset = _loc37_;
                                 if(!_loc49_)
                                 {
                                    _loc6_.offset = _loc38_;
                                    if(_loc49_ && Boolean(param3))
                                    {
                                       break;
                                    }
                                 }
                                 addr0855:
                                 _loc7_.offset = _loc39_;
                                 break;
                              }
                              if(_loc23_ != null)
                              {
                                 _loc24_.processNext = _loc29_;
                              }
                              else
                              {
                                 _loc23_ = _loc29_;
                              }
                              _loc24_ = _loc29_;
                              continue loop1;
                           }
                           §§goto(addr07bc);
                        }
                        addr085b:
                        _loc43_ = _loc29_.create();
                        while(true)
                        {
                           if(!(_loc49_ && Boolean(this)))
                           {
                              _loc43_.material = _loc29_.material;
                              if(!(_loc50_ || Boolean(this)))
                              {
                                 break;
                              }
                           }
                           this.lastFace.next = _loc43_;
                           if(!_loc49_)
                           {
                              this.lastFace = _loc43_;
                           }
                           break;
                        }
                        _loc44_ = _loc29_.create();
                        while(true)
                        {
                           if(!_loc49_)
                           {
                              _loc44_.material = _loc29_.material;
                              if(_loc49_)
                              {
                                 break;
                              }
                              this.lastFace.next = _loc44_;
                              if(_loc49_ && Boolean(param2))
                              {
                                 break;
                              }
                           }
                           this.lastFace = _loc44_;
                           break;
                        }
                        _loc45_ = null;
                        _loc46_ = null;
                        §§push(_loc29_.wrapper.next);
                        if(!(_loc49_ && Boolean(this)))
                        {
                           §§push(§§pop().alternativa3d::next);
                        }
                        _loc4_ = §§pop();
                        if(_loc50_ || Boolean(param2))
                        {
                           loop3:
                           while(true)
                           {
                              §§push(_loc4_.next);
                              do
                              {
                                 if(§§pop() == null)
                                 {
                                    break loop3;
                                 }
                                 §§push(_loc4_.next);
                              }
                              while(!(_loc50_ || Boolean(param1)));
                              _loc4_ = §§pop();
                           }
                        }
                        _loc5_ = _loc4_.vertex;
                        if(!(_loc49_ && Boolean(this)))
                        {
                           §§push(_loc5_.offset);
                           if(_loc50_)
                           {
                              §§push(Number(§§pop()));
                           }
                           _loc37_ = §§pop();
                        }
                        _loc4_ = _loc29_.wrapper;
                        while(true)
                        {
                           if(!_loc49_)
                           {
                              loop5:
                              while(_loc4_ != null)
                              {
                                 _loc6_ = _loc4_.vertex;
                                 loop26:
                                 while(true)
                                 {
                                    loop27:
                                    while(true)
                                    {
                                       loop31:
                                       while(true)
                                       {
                                          loop32:
                                          while(true)
                                          {
                                             loop43:
                                             while(true)
                                             {
                                                loop44:
                                                while(true)
                                                {
                                                   loop45:
                                                   while(true)
                                                   {
                                                      §§push(_loc6_.offset);
                                                      if(_loc50_ || Boolean(param3))
                                                      {
                                                         _loc38_ = §§pop();
                                                         §§push(_loc37_);
                                                         if(!(_loc49_ && Boolean(this)))
                                                         {
                                                            §§push(_loc21_);
                                                            if(_loc50_ || Boolean(param2))
                                                            {
                                                               loop46:
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
                                                                           §§push(§§pop() < §§pop());
                                                                           if(_loc50_)
                                                                           {
                                                                              §§push(Boolean(§§pop()));
                                                                              if(_loc49_ && Boolean(param3))
                                                                              {
                                                                                 break;
                                                                              }
                                                                              var _temp_58:* = §§pop();
                                                                              §§push(_temp_58);
                                                                              §§push(_temp_58);
                                                                              if(_loc50_)
                                                                              {
                                                                                 §§push(Boolean(§§pop()));
                                                                                 if(!(_loc50_ || Boolean(param1)))
                                                                                 {
                                                                                    break loop48;
                                                                                 }
                                                                              }
                                                                              if(§§pop())
                                                                              {
                                                                                 §§pop();
                                                                                 §§push(_loc38_);
                                                                                 if(_loc49_)
                                                                                 {
                                                                                    break loop31;
                                                                                 }
                                                                                 §§push(§§pop() > _loc22_);
                                                                              }
                                                                              var _temp_60:* = §§pop();
                                                                              §§push(_temp_60);
                                                                              §§push(_temp_60);
                                                                              if(!(_loc49_ && Boolean(param2)))
                                                                              {
                                                                                 §§push(Boolean(§§pop()));
                                                                                 if(!(_loc50_ || Boolean(param3)))
                                                                                 {
                                                                                    break loop48;
                                                                                 }
                                                                              }
                                                                              if(§§pop())
                                                                              {
                                                                                 break loop47;
                                                                              }
                                                                              if(_loc49_ && Boolean(this))
                                                                              {
                                                                                 break loop47;
                                                                              }
                                                                              §§pop();
                                                                              if(_loc49_ && Boolean(this))
                                                                              {
                                                                                 break loop45;
                                                                              }
                                                                              §§push(_loc37_ > _loc22_);
                                                                              if(!_loc50_)
                                                                              {
                                                                                 break loop46;
                                                                              }
                                                                           }
                                                                           var _temp_65:* = Boolean(§§pop());
                                                                           §§push(_temp_65);
                                                                           §§push(_temp_65);
                                                                           if(!(_loc49_ && Boolean(param3)))
                                                                           {
                                                                              break loop48;
                                                                           }
                                                                           §§goto(addr0a32);
                                                                        }
                                                                        §§goto(addr0a58);
                                                                     }
                                                                     addr0a32:
                                                                     if(Boolean(§§pop()))
                                                                     {
                                                                        break loop46;
                                                                     }
                                                                     break;
                                                                  }
                                                                  if(!§§pop())
                                                                  {
                                                                     break loop27;
                                                                  }
                                                                  §§push(_loc19_);
                                                                  if(!_loc50_)
                                                                  {
                                                                     break loop26;
                                                                  }
                                                               }
                                                               §§pop();
                                                               §§push(_loc38_);
                                                               §§push(_loc21_);
                                                               if(!(_loc49_ && Boolean(param2)))
                                                               {
                                                                  §§push(§§pop() < §§pop());
                                                                  if(_loc50_ || Boolean(this))
                                                                  {
                                                                     addr0a58:
                                                                     §§push(Boolean(§§pop()));
                                                                  }
                                                                  break loop47;
                                                               }
                                                               break loop44;
                                                            }
                                                            break loop32;
                                                         }
                                                         break loop43;
                                                      }
                                                      §§push(§§pop() - _loc37_);
                                                      if(_loc50_)
                                                      {
                                                         §§push(_loc38_);
                                                         break loop32;
                                                      }
                                                      break loop26;
                                                   }
                                                   §§goto(addr0c7b);
                                                }
                                                §§goto(addr0a79);
                                             }
                                             §§goto(addr0a7b);
                                          }
                                          §§push(§§pop() - _loc37_);
                                          if(_loc50_)
                                          {
                                             addr0a79:
                                             §§push(§§pop() / §§pop());
                                             break;
                                          }
                                          §§goto(addr0c77);
                                       }
                                       addr0a7b:
                                       _loc48_ = §§pop();
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             if(_loc50_ || Boolean(param1))
                                             {
                                                _loc8_ = _loc6_.create();
                                                if(_loc50_ || Boolean(param3))
                                                {
                                                   this.lastVertex.next = _loc8_;
                                                   this.lastVertex = _loc8_;
                                                   §§push(_loc8_);
                                                   §§push(_loc5_.cameraX);
                                                   if(!(_loc49_ && Boolean(param1)))
                                                   {
                                                      loop35:
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc6_.cameraX);
                                                            if(_loc50_ || Boolean(param1))
                                                            {
                                                               §§push(_loc5_.cameraX);
                                                               if(!_loc50_)
                                                               {
                                                                  break;
                                                               }
                                                               §§push(§§pop() - §§pop());
                                                               if(!_loc50_)
                                                               {
                                                                  break loop35;
                                                               }
                                                            }
                                                            §§push(_loc48_);
                                                            break;
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         break;
                                                      }
                                                   }
                                                   §§pop().alternativa3d::cameraX = §§pop();
                                                   §§push(_loc8_);
                                                   §§push(_loc5_.cameraY);
                                                   if(_loc50_)
                                                   {
                                                      §§push(_loc6_.cameraY);
                                                      if(_loc50_)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc5_.cameraY);
                                                            if(!_loc49_)
                                                            {
                                                               §§push(§§pop() - §§pop());
                                                               if(_loc49_)
                                                               {
                                                                  break;
                                                               }
                                                               §§push(_loc48_);
                                                            }
                                                            §§push(§§pop() * §§pop());
                                                            break;
                                                         }
                                                      }
                                                      §§push(§§pop() + §§pop());
                                                   }
                                                   §§pop().alternativa3d::cameraY = §§pop();
                                                   §§push(_loc8_);
                                                   §§push(_loc5_.cameraZ);
                                                   if(!_loc49_)
                                                   {
                                                      loop38:
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc6_.cameraZ);
                                                            if(!(_loc49_ && Boolean(param1)))
                                                            {
                                                               §§push(_loc5_.cameraZ);
                                                               if(_loc49_)
                                                               {
                                                                  break;
                                                               }
                                                               §§push(§§pop() - §§pop());
                                                               if(_loc49_)
                                                               {
                                                                  break loop38;
                                                               }
                                                            }
                                                            §§push(_loc48_);
                                                            break;
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         break;
                                                      }
                                                   }
                                                   §§pop().alternativa3d::cameraZ = §§pop();
                                                   §§push(_loc8_);
                                                   §§push(_loc5_.u);
                                                   if(!_loc49_)
                                                   {
                                                      §§push(_loc6_.u);
                                                      if(_loc50_)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc5_.u);
                                                            if(_loc50_)
                                                            {
                                                               §§push(§§pop() - §§pop());
                                                               if(_loc49_)
                                                               {
                                                                  break;
                                                               }
                                                               §§push(_loc48_);
                                                            }
                                                            §§push(§§pop() * §§pop());
                                                            break;
                                                         }
                                                      }
                                                      §§push(§§pop() + §§pop());
                                                   }
                                                   §§pop().u = §§pop();
                                                   if(!(_loc49_ && Boolean(this)))
                                                   {
                                                      §§push(_loc8_);
                                                      §§push(_loc5_.v);
                                                      if(!(_loc49_ && Boolean(param1)))
                                                      {
                                                         §§push(_loc6_.v);
                                                         if(_loc50_)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc5_.v);
                                                               if(_loc50_)
                                                               {
                                                                  §§push(§§pop() - §§pop());
                                                                  if(_loc49_ && Boolean(param3))
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(_loc48_);
                                                               }
                                                               §§push(§§pop() * §§pop());
                                                               break;
                                                            }
                                                         }
                                                         §§push(§§pop() + §§pop());
                                                      }
                                                      §§pop().v = §§pop();
                                                   }
                                                }
                                                _loc47_ = _loc4_.create();
                                                while(true)
                                                {
                                                   if(_loc50_ || Boolean(param2))
                                                   {
                                                      _loc47_.vertex = _loc8_;
                                                      if(_loc49_ && Boolean(param2))
                                                      {
                                                         break;
                                                      }
                                                   }
                                                   if(_loc45_ != null)
                                                   {
                                                      if(_loc50_)
                                                      {
                                                         break;
                                                      }
                                                      addr0c09:
                                                   }
                                                   else
                                                   {
                                                      _loc43_.wrapper = _loc47_;
                                                   }
                                                   addr0c13:
                                                   _loc45_ = _loc47_;
                                                   _loc47_ = _loc4_.create();
                                                   if(!_loc49_)
                                                   {
                                                      _loc47_.vertex = _loc8_;
                                                      if(_loc50_)
                                                      {
                                                         if(_loc46_ != null)
                                                         {
                                                            if(_loc50_ || Boolean(param2))
                                                            {
                                                               _loc46_.next = _loc47_;
                                                               if(_loc49_)
                                                               {
                                                               }
                                                            }
                                                         }
                                                         else
                                                         {
                                                            _loc44_.wrapper = _loc47_;
                                                         }
                                                      }
                                                   }
                                                   _loc46_ = _loc47_;
                                                   break loop27;
                                                }
                                                _loc45_.next = _loc47_;
                                                if(_loc50_)
                                                {
                                                   §§goto(addr0c09);
                                                }
                                                §§goto(addr0c13);
                                             }
                                             §§goto(addr0c7b);
                                          }
                                          §§goto(addr0ce1);
                                       }
                                       §§goto(addr0cdd);
                                    }
                                    §§push(_loc38_);
                                    break;
                                 }
                                 while(true)
                                 {
                                    addr0d41:
                                    addr0ce1:
                                    §§push(_loc22_);
                                    if(!(_loc49_ && Boolean(param1)))
                                    {
                                       addr0c77:
                                       if(§§pop() <= §§pop())
                                       {
                                          addr0c7b:
                                          §§push(_loc4_.create());
                                          if(!_loc50_)
                                          {
                                             break;
                                          }
                                          _loc47_ = §§pop();
                                          if(_loc50_ || Boolean(param3))
                                          {
                                             _loc47_.vertex = _loc6_;
                                             while(true)
                                             {
                                                if(_loc50_)
                                                {
                                                   if(_loc45_ == null)
                                                   {
                                                      _loc43_.wrapper = _loc47_;
                                                      break;
                                                   }
                                                   if(_loc49_ && Boolean(this))
                                                   {
                                                      break;
                                                   }
                                                }
                                                _loc45_.next = _loc47_;
                                                if(_loc49_ && Boolean(this))
                                                {
                                                }
                                                break;
                                             }
                                          }
                                          _loc45_ = _loc47_;
                                       }
                                       addr0cdd:
                                       §§push(_loc38_);
                                       §§push(_loc21_);
                                    }
                                    if(§§pop() >= §§pop())
                                    {
                                       §§push(_loc4_.create());
                                       break;
                                    }
                                    _loc5_ = _loc6_;
                                    if(!(_loc49_ && Boolean(param1)))
                                    {
                                       §§push(_loc38_);
                                       if(_loc50_)
                                       {
                                          §§push(Number(§§pop()));
                                       }
                                       _loc37_ = §§pop();
                                    }
                                    _loc4_ = _loc4_.next;
                                    continue loop5;
                                 }
                                 _loc47_ = §§pop();
                                 while(true)
                                 {
                                    if(_loc50_)
                                    {
                                       _loc47_.vertex = _loc6_;
                                       if(_loc49_ && Boolean(param1))
                                       {
                                          break;
                                       }
                                    }
                                    if(_loc46_ != null)
                                    {
                                       if(!(_loc49_ && Boolean(param3)))
                                       {
                                          _loc46_.next = _loc47_;
                                          if(_loc49_ && Boolean(param1))
                                          {
                                             break;
                                          }
                                       }
                                       break;
                                    }
                                    _loc44_.wrapper = _loc47_;
                                    break;
                                 }
                                 _loc46_ = _loc47_;
                                 §§goto(addr0d41);
                              }
                              if(_loc49_ && Boolean(param1))
                              {
                                 break;
                              }
                           }
                           if(_loc23_ != null)
                           {
                              if(_loc50_)
                              {
                                 break;
                              }
                              addr0d90:
                           }
                           else
                           {
                              _loc23_ = _loc43_;
                           }
                           _loc24_ = _loc43_;
                           while(true)
                           {
                              if(!(_loc49_ && Boolean(param2)))
                              {
                                 if(_loc26_ == null)
                                 {
                                    _loc26_ = _loc44_;
                                    break;
                                 }
                                 if(!(_loc49_ && Boolean(this)))
                                 {
                                    _loc27_.processNext = _loc44_;
                                 }
                              }
                              break;
                           }
                           _loc27_ = _loc44_;
                           if(!(_loc49_ && Boolean(param2)))
                           {
                              _loc29_.processNext = null;
                           }
                           continue loop1;
                        }
                        _loc24_.processNext = _loc43_;
                        §§goto(addr0d90);
                     }
                     §§push(_loc22_);
                     break loop12;
                  }
               }
               if(§§pop() != null)
               {
                  param3 = this.sortByDynamicBSP(_loc26_,param2,param3);
                  break loop1;
               }
               _loc26_.processNext = param3;
               break;
            }
            _loc29_ = _loc28_;
            param3 = _loc26_;
            break;
         }
         _loc25_.processNext = param3;
         param3 = _loc9_;
         while(true)
         {
            if(!(_loc49_ && Boolean(this)))
            {
               if(_loc23_ == null)
               {
                  break;
               }
               if(!(_loc49_ && Boolean(param1)))
               {
                  _loc24_.processNext = null;
                  if(!_loc49_)
                  {
                     if(_loc23_.processNext != null)
                     {
                        if(_loc50_ || Boolean(param1))
                        {
                           param3 = this.sortByDynamicBSP(_loc23_,param2,param3);
                           addr0e8a:
                           break;
                        }
                     }
                     else
                     {
                        _loc23_.processNext = param3;
                     }
                     param3 = _loc23_;
                     break;
                  }
               }
            }
            §§goto(addr0e8a);
         }
         return param3;
      }
      
      alternativa3d function cull(param1:Face, param2:int) : Face
      {
         §§push(false);
         var _loc32_:Boolean = true;
         var _loc33_:* = §§pop();
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Face = null;
         var _loc6_:Vertex = null;
         var _loc7_:Vertex = null;
         var _loc8_:Vertex = null;
         var _loc9_:Wrapper = null;
         var _loc10_:Vertex = null;
         var _loc11_:Wrapper = null;
         var _loc12_:* = NaN;
         var _loc13_:* = NaN;
         var _loc14_:* = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:* = NaN;
         var _loc18_:* = NaN;
         var _loc19_:* = NaN;
         var _loc20_:Number = NaN;
         while(true)
         {
            §§push(param2);
            if(_loc32_ || Boolean(this))
            {
               §§push(1);
               if(_loc33_ && Boolean(_loc3_))
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(_loc32_)
         {
            §§push(Boolean(§§pop()));
         }
         var _loc21_:* = §§pop();
         while(true)
         {
            §§push(param2);
            if(!_loc33_)
            {
               §§push(2);
               if(!_loc32_)
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(_loc32_ || Boolean(param2))
         {
            §§push(Boolean(§§pop()));
         }
         var _loc22_:* = §§pop();
         while(true)
         {
            §§push(param2);
            if(_loc32_)
            {
               §§push(4);
               if(_loc33_)
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(!(_loc33_ && Boolean(this)))
         {
            §§push(Boolean(§§pop()));
         }
         var _loc23_:* = §§pop();
         while(true)
         {
            §§push(param2);
            if(!(_loc33_ && Boolean(_loc3_)))
            {
               §§push(8);
               if(!_loc32_)
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(!(_loc33_ && Boolean(this)))
         {
            §§push(Boolean(§§pop()));
         }
         var _loc24_:* = §§pop();
         while(true)
         {
            §§push(param2);
            if(_loc32_)
            {
               §§push(16);
               if(!_loc32_)
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(_loc32_ || Boolean(param2))
         {
            §§push(Boolean(§§pop()));
         }
         var _loc25_:* = §§pop();
         while(true)
         {
            §§push(param2);
            if(!(_loc33_ && Boolean(param1)))
            {
               §§push(32);
               if(_loc33_)
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(!(_loc33_ && Boolean(_loc3_)))
         {
            §§push(Boolean(§§pop()));
         }
         var _loc26_:* = §§pop();
         §§push(this.nearClipping);
         if(_loc32_ || Boolean(param1))
         {
            §§push(Number(§§pop()));
         }
         var _loc27_:* = §§pop();
         §§push(this.farClipping);
         if(_loc32_)
         {
            §§push(Number(§§pop()));
         }
         var _loc28_:* = §§pop();
         loop13:
         while(true)
         {
            loop14:
            while(true)
            {
               if(_loc32_ || Boolean(this))
               {
                  while(true)
                  {
                     §§push(_loc23_);
                     if(!(_loc33_ && Boolean(param2)))
                     {
                        §§push(Boolean(§§pop()));
                        if(_loc33_)
                        {
                           break;
                        }
                     }
                     var _temp_92:* = §§pop();
                     §§push(_temp_92);
                     §§push(_temp_92);
                     if(_loc32_)
                     {
                        §§push(Boolean(§§pop()));
                     }
                     if(!§§pop())
                     {
                        if(!_loc33_)
                        {
                           break;
                        }
                        break loop13;
                     }
                     break loop14;
                  }
                  §§pop();
               }
               §§push(_loc24_);
               if(_loc32_)
               {
                  break loop13;
               }
               §§goto(addr01b1);
            }
            §§goto(addr01b1);
         }
         §§push(Boolean(§§pop()));
         if(_loc32_)
         {
            break loop14;
         }
         addr01b1:
         var _loc29_:* = §§pop();
         while(true)
         {
            if(!(_loc33_ && Boolean(this)))
            {
               §§push(_loc25_);
               if(_loc32_ || Boolean(this))
               {
                  §§push(Boolean(§§pop()));
                  if(!_loc32_)
                  {
                     break;
                  }
               }
               var _temp_14:* = §§pop();
               §§push(_temp_14);
               §§push(_temp_14);
               if(_loc32_)
               {
                  §§push(Boolean(§§pop()));
               }
               if(§§pop())
               {
                  break;
               }
               if(!_loc32_)
               {
                  break;
               }
               §§pop();
            }
            §§push(_loc26_);
            if(!_loc33_)
            {
               §§push(Boolean(§§pop()));
               if(!(_loc33_ && Boolean(param2)))
               {
                  break;
               }
            }
            §§goto(addr0203);
         }
         addr0203:
         var _loc30_:* = §§pop();
         var _loc31_:Face = param1;
         loop0:
         for(; _loc31_ != null; _loc31_ = _loc5_)
         {
            _loc5_ = _loc31_.processNext;
            _loc9_ = _loc31_.wrapper;
            _loc6_ = _loc9_.vertex;
            _loc9_ = _loc9_.next;
            _loc7_ = _loc9_.vertex;
            _loc9_ = _loc9_.next;
            _loc8_ = _loc9_.vertex;
            _loc9_ = _loc9_.next;
            loop16:
            while(true)
            {
               loop17:
               while(true)
               {
                  loop66:
                  while(true)
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
                              loop70:
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
                                          if(!_loc33_)
                                          {
                                             §§push(_loc29_);
                                             if(_loc33_)
                                             {
                                                break loop67;
                                             }
                                             loop75:
                                             while(true)
                                             {
                                                loop76:
                                                while(true)
                                                {
                                                   loop77:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         if(§§pop())
                                                         {
                                                            §§push(_loc6_.cameraX);
                                                            if(_loc33_ && Boolean(param1))
                                                            {
                                                               break;
                                                            }
                                                            §§push(Number(§§pop()));
                                                            if(!(_loc32_ || Boolean(this)))
                                                            {
                                                               break loop66;
                                                            }
                                                            _loc12_ = §§pop();
                                                            if(!(_loc32_ || Boolean(_loc3_)))
                                                            {
                                                               break loop77;
                                                            }
                                                            _loc15_ = _loc7_.cameraX;
                                                            if(_loc33_)
                                                            {
                                                               break loop76;
                                                            }
                                                            §§push(_loc8_.cameraX);
                                                            if(_loc33_ && Boolean(_loc3_))
                                                            {
                                                               break loop75;
                                                            }
                                                            _loc18_ = §§pop();
                                                            if(_loc33_ && Boolean(this))
                                                            {
                                                               break loop71;
                                                            }
                                                         }
                                                         §§push(_loc30_);
                                                         if(_loc32_ || Boolean(param1))
                                                         {
                                                            while(true)
                                                            {
                                                               if(§§pop())
                                                               {
                                                                  §§push(_loc6_.cameraY);
                                                                  if(_loc33_)
                                                                  {
                                                                     break loop68;
                                                                  }
                                                                  §§push(Number(§§pop()));
                                                                  if(!_loc32_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  _loc13_ = §§pop();
                                                                  _loc16_ = _loc7_.cameraY;
                                                                  if(!(_loc32_ || Boolean(param2)))
                                                                  {
                                                                     break loop73;
                                                                  }
                                                                  §§push(_loc8_.cameraY);
                                                                  if(_loc33_)
                                                                  {
                                                                     break loop44;
                                                                  }
                                                                  _loc19_ = §§pop();
                                                                  if(!_loc32_)
                                                                  {
                                                                     break loop72;
                                                                  }
                                                               }
                                                               §§push(_loc6_.cameraZ);
                                                               if(!(_loc33_ && Boolean(param1)))
                                                               {
                                                                  break;
                                                               }
                                                               §§goto(addr0593);
                                                            }
                                                            §§push(Number(§§pop()));
                                                            if(_loc32_)
                                                            {
                                                               _loc14_ = §§pop();
                                                               §§push(_loc7_.cameraZ);
                                                               break;
                                                            }
                                                            break loop28;
                                                         }
                                                         §§goto(addr060e);
                                                      }
                                                      §§push(Number(§§pop()));
                                                      if(!(_loc33_ && Boolean(param2)))
                                                      {
                                                         _loc17_ = §§pop();
                                                         _loc20_ = _loc8_.cameraZ;
                                                         if(!_loc33_)
                                                         {
                                                            break;
                                                         }
                                                         break loop17;
                                                      }
                                                      break loop68;
                                                   }
                                                   if(!_loc21_)
                                                   {
                                                      break loop16;
                                                   }
                                                }
                                                §§goto(addr0612);
                                             }
                                             §§goto(addr0609);
                                          }
                                          loop80:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(_loc14_);
                                                if(_loc32_ || Boolean(this))
                                                {
                                                   §§push(_loc27_);
                                                   if(_loc33_ && Boolean(_loc3_))
                                                   {
                                                      break;
                                                   }
                                                   §§push(§§pop() <= §§pop());
                                                   if(_loc32_ || Boolean(this))
                                                   {
                                                      §§push(Boolean(§§pop()));
                                                      if(_loc33_)
                                                      {
                                                         break loop31;
                                                      }
                                                      var _temp_87:* = §§pop();
                                                      §§push(_temp_87);
                                                      if(Boolean(_temp_87))
                                                      {
                                                         break loop80;
                                                      }
                                                      §§pop();
                                                      if(_loc33_ && Boolean(param2))
                                                      {
                                                         break loop72;
                                                      }
                                                      §§push(_loc17_);
                                                   }
                                                   else
                                                   {
                                                      §§goto(addr049c);
                                                   }
                                                }
                                                §§push(§§pop() <= _loc27_);
                                                break loop80;
                                             }
                                             §§goto(addr0818);
                                          }
                                          var _temp_83:* = §§pop();
                                          while(true)
                                          {
                                             §§push(_temp_83);
                                             if(!Boolean(_temp_83))
                                             {
                                                §§pop();
                                                if(_loc32_ || Boolean(this))
                                                {
                                                   break loop72;
                                                }
                                                break loop70;
                                             }
                                             §§goto(addr03ce);
                                          }
                                          §§goto(addr093d);
                                       }
                                       §§goto(addr050b);
                                    }
                                    §§push(_loc20_);
                                    §§push(_loc27_);
                                    if(!(_loc33_ && Boolean(param1)))
                                    {
                                       addr03ce:
                                       if(§§pop() <= §§pop())
                                       {
                                          if(!(_loc33_ && Boolean(param2)))
                                          {
                                             _loc31_.processNext = null;
                                             if(_loc33_)
                                             {
                                                break loop69;
                                             }
                                             continue loop0;
                                          }
                                          §§goto(addr04b8);
                                       }
                                       else
                                       {
                                          _loc11_ = _loc9_;
                                          loop74:
                                          while(true)
                                          {
                                             if(_loc32_)
                                             {
                                                while(true)
                                                {
                                                   if(_loc11_ == null)
                                                   {
                                                      if(!_loc32_)
                                                      {
                                                         break loop74;
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(_loc11_.vertex.cameraZ > _loc27_)
                                                      {
                                                         continue;
                                                      }
                                                      if(!_loc32_)
                                                      {
                                                         break loop74;
                                                      }
                                                   }
                                                   _loc11_ = _loc11_.next;
                                                }
                                                continue loop0;
                                             }
                                             if(_loc11_ == null)
                                             {
                                                break loop16;
                                             }
                                             if(_loc32_ || Boolean(_loc3_))
                                             {
                                                break;
                                             }
                                             continue loop0;
                                          }
                                          _loc31_.processNext = null;
                                          §§goto(addr0445);
                                       }
                                    }
                                    §§goto(addr093d);
                                 }
                                 §§goto(addr07cf);
                              }
                              §§goto(addr09bf);
                           }
                           §§goto(addr09c5);
                        }
                        §§goto(addr06e9);
                     }
                     §§goto(addr06f8);
                  }
                  §§goto(addr07d7);
               }
               §§push(_loc20_);
               if(_loc33_ && Boolean(param1))
               {
                  break loop66;
               }
               addr0609:
               §§goto(addr060e);
               §§push(§§pop() <= -_loc18_);
            }
            loop18:
            while(true)
            {
               loop19:
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
                           loop30:
                           while(true)
                           {
                              loop31:
                              while(true)
                              {
                                 loop32:
                                 while(true)
                                 {
                                    loop33:
                                    while(true)
                                    {
                                       §§push(_loc22_);
                                       if(!(_loc33_ && Boolean(param2)))
                                       {
                                          loop34:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                loop42:
                                                while(true)
                                                {
                                                   loop50:
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
                                                               §§push(Boolean(§§pop()));
                                                               if(!(_loc33_ && Boolean(_loc3_)))
                                                               {
                                                                  var _temp_57:* = §§pop();
                                                                  §§push(_temp_57);
                                                                  §§push(_temp_57);
                                                                  if(!_loc32_)
                                                                  {
                                                                     continue loop44;
                                                                  }
                                                                  loop58:
                                                                  while(true)
                                                                  {
                                                                     loop59:
                                                                     while(true)
                                                                     {
                                                                        if(Boolean(§§pop()))
                                                                        {
                                                                           if(_loc33_ && Boolean(param2))
                                                                           {
                                                                              break loop25;
                                                                           }
                                                                           §§pop();
                                                                           §§push(_loc14_);
                                                                           if(_loc33_)
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(§§pop() >= _loc28_);
                                                                           if(_loc33_ && Boolean(this))
                                                                           {
                                                                              break loop58;
                                                                           }
                                                                           §§push(Boolean(§§pop()));
                                                                        }
                                                                        var _temp_60:* = §§pop();
                                                                        §§push(_temp_60);
                                                                        §§push(_temp_60);
                                                                        if(!(_loc32_ || Boolean(param1)))
                                                                        {
                                                                           break loop51;
                                                                        }
                                                                        §§push(Boolean(§§pop()));
                                                                        if(!_loc32_)
                                                                        {
                                                                           break loop50;
                                                                        }
                                                                        while(true)
                                                                        {
                                                                           if(§§pop())
                                                                           {
                                                                              §§pop();
                                                                              addr04b8:
                                                                              §§push(_loc17_);
                                                                              if(!_loc33_)
                                                                              {
                                                                                 break loop59;
                                                                              }
                                                                              break loop23;
                                                                           }
                                                                           addr04d0:
                                                                           var _temp_62:* = §§pop();
                                                                           §§push(_temp_62);
                                                                           §§push(_temp_62);
                                                                           if(_loc33_)
                                                                           {
                                                                              break loop42;
                                                                           }
                                                                           §§push(Boolean(§§pop()));
                                                                           if(!_loc32_)
                                                                           {
                                                                              break loop19;
                                                                           }
                                                                           if(§§pop())
                                                                           {
                                                                              if(_loc32_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              break loop27;
                                                                           }
                                                                           if(§§pop())
                                                                           {
                                                                              addr050b:
                                                                              _loc11_ = _loc9_;
                                                                              if(!(_loc33_ && Boolean(param2)))
                                                                              {
                                                                                 while(true)
                                                                                 {
                                                                                    if(_loc11_ == null)
                                                                                    {
                                                                                       while(true)
                                                                                       {
                                                                                          if(_loc32_ || Boolean(param1))
                                                                                          {
                                                                                             addr0557:
                                                                                             if(_loc11_ != null)
                                                                                             {
                                                                                                addr056d:
                                                                                                §§push(_loc23_);
                                                                                                if(!_loc33_)
                                                                                                {
                                                                                                   break loop58;
                                                                                                }
                                                                                                break loop34;
                                                                                             }
                                                                                             if(!_loc32_)
                                                                                             {
                                                                                                break;
                                                                                             }
                                                                                          }
                                                                                          _loc31_.processNext = null;
                                                                                          break;
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       if(_loc11_.vertex.cameraZ >= _loc28_)
                                                                                       {
                                                                                          continue;
                                                                                       }
                                                                                       if(_loc32_)
                                                                                       {
                                                                                          §§goto(addr0557);
                                                                                       }
                                                                                    }
                                                                                    _loc11_ = _loc11_.next;
                                                                                 }
                                                                              }
                                                                              continue loop0;
                                                                           }
                                                                           §§goto(addr056d);
                                                                        }
                                                                        §§pop();
                                                                        §§push(_loc20_);
                                                                        if(_loc33_ && Boolean(this))
                                                                        {
                                                                           break loop53;
                                                                        }
                                                                        §§goto(addr0507);
                                                                        §§push(§§pop() >= _loc28_);
                                                                     }
                                                                     §§push(_loc28_);
                                                                     if(!_loc32_)
                                                                     {
                                                                        break loop52;
                                                                     }
                                                                     while(true)
                                                                     {
                                                                        §§push(§§pop() >= §§pop());
                                                                        if(!_loc33_)
                                                                        {
                                                                           §§goto(addr04d0);
                                                                        }
                                                                        §§goto(addr04f2);
                                                                     }
                                                                     §§goto(addr0507);
                                                                  }
                                                               }
                                                               var _temp_66:* = §§pop();
                                                               while(true)
                                                               {
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(_temp_66);
                                                                        §§push(_temp_66);
                                                                        if(_loc32_ || Boolean(this))
                                                                        {
                                                                           §§push(Boolean(§§pop()));
                                                                           if(_loc33_)
                                                                           {
                                                                              break loop30;
                                                                           }
                                                                           if(§§pop())
                                                                           {
                                                                              §§pop();
                                                                              addr0593:
                                                                              §§push(_loc14_);
                                                                              §§push(-_loc12_);
                                                                              if(!(_loc33_ && Boolean(param2)))
                                                                              {
                                                                                 break loop52;
                                                                              }
                                                                              §§goto(addr07b3);
                                                                           }
                                                                           §§goto(addr05a6);
                                                                        }
                                                                        else
                                                                        {
                                                                           §§goto(addr05f3);
                                                                        }
                                                                     }
                                                                     §§goto(addr07eb);
                                                                  }
                                                                  §§goto(addr07ea);
                                                               }
                                                               §§goto(addr08c1);
                                                            }
                                                            §§goto(addr0914);
                                                         }
                                                         addr05a6:
                                                         var _temp_49:* = §§pop() <= §§pop();
                                                         §§push(_temp_49);
                                                         §§push(_temp_49);
                                                         if(!(_loc32_ || Boolean(param2)))
                                                         {
                                                            break loop46;
                                                         }
                                                         loop54:
                                                         while(true)
                                                         {
                                                            while(true)
                                                            {
                                                               if(§§pop())
                                                               {
                                                                  §§pop();
                                                                  if(_loc33_)
                                                                  {
                                                                     break loop29;
                                                                  }
                                                                  §§push(_loc17_);
                                                                  if(_loc33_ && Boolean(this))
                                                                  {
                                                                     break loop28;
                                                                  }
                                                                  §§push(-_loc15_);
                                                                  if(!(_loc32_ || Boolean(param1)))
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(§§pop() <= §§pop());
                                                                  if(_loc33_ && Boolean(param2))
                                                                  {
                                                                     break loop54;
                                                                  }
                                                               }
                                                               var _temp_54:* = §§pop();
                                                               addr05f3:
                                                               while(true)
                                                               {
                                                                  §§push(_temp_54);
                                                                  if(Boolean(_temp_54))
                                                                  {
                                                                     §§pop();
                                                                     break loop17;
                                                                  }
                                                                  addr060e:
                                                                  if(§§pop())
                                                                  {
                                                                     addr0612:
                                                                     _loc11_ = _loc9_;
                                                                     loop57:
                                                                     while(true)
                                                                     {
                                                                        if(!_loc33_)
                                                                        {
                                                                           while(true)
                                                                           {
                                                                              if(_loc11_ != null)
                                                                              {
                                                                                 _loc10_ = _loc11_.vertex;
                                                                                 if(!_loc32_)
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(_loc10_.cameraX);
                                                                                 if(_loc32_)
                                                                                 {
                                                                                    §§push(-§§pop());
                                                                                 }
                                                                                 if(§§pop() < _loc10_.cameraZ)
                                                                                 {
                                                                                    if(!_loc33_)
                                                                                    {
                                                                                       break;
                                                                                    }
                                                                                    break loop57;
                                                                                 }
                                                                                 continue;
                                                                              }
                                                                              _loc11_ = _loc11_.next;
                                                                           }
                                                                        }
                                                                        if(_loc11_ == null)
                                                                        {
                                                                           if(!_loc33_)
                                                                           {
                                                                              _loc31_.processNext = null;
                                                                           }
                                                                           break;
                                                                        }
                                                                     }
                                                                     continue loop0;
                                                                  }
                                                                  var _temp_55:* = Boolean(_loc24_);
                                                                  §§push(_temp_55);
                                                                  §§push(_temp_55);
                                                                  if(!(_loc33_ && Boolean(param2)))
                                                                  {
                                                                     continue loop44;
                                                                  }
                                                                  §§goto(addr06e2);
                                                               }
                                                               §§goto(addr07d7);
                                                            }
                                                            §§goto(addr07da);
                                                         }
                                                         §§goto(addr078d);
                                                      }
                                                      §§goto(addr07a4);
                                                   }
                                                   §§goto(addr07f2);
                                                }
                                                §§goto(addr08ea);
                                             }
                                             loop43:
                                             while(true)
                                             {
                                                loop44:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      if(§§pop())
                                                      {
                                                         if(!_loc32_)
                                                         {
                                                            break;
                                                         }
                                                         §§pop();
                                                         §§push(_loc14_);
                                                         if(!_loc32_)
                                                         {
                                                            break loop44;
                                                         }
                                                         §§push(_loc12_);
                                                         if(!_loc32_)
                                                         {
                                                            break loop43;
                                                         }
                                                         §§push(§§pop() <= §§pop());
                                                      }
                                                      var _temp_46:* = §§pop();
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            loop48:
                                                            while(true)
                                                            {
                                                               while(true)
                                                               {
                                                                  §§push(_temp_46);
                                                                  §§push(_temp_46);
                                                                  if(!(_loc33_ && Boolean(param2)))
                                                                  {
                                                                     if(Boolean(§§pop()))
                                                                     {
                                                                        if(!(_loc33_ && Boolean(_loc3_)))
                                                                        {
                                                                           break loop34;
                                                                        }
                                                                        break loop48;
                                                                     }
                                                                     §§goto(addr06da);
                                                                  }
                                                                  §§goto(addr07a4);
                                                               }
                                                               §§goto(addr07db);
                                                            }
                                                            §§goto(addr0903);
                                                         }
                                                         §§goto(addr08a5);
                                                      }
                                                      §§goto(addr08bb);
                                                   }
                                                   §§goto(addr06e6);
                                                }
                                                §§goto(addr07b1);
                                             }
                                             §§goto(addr08d9);
                                          }
                                          §§pop();
                                          §§push(_loc17_);
                                          §§push(_loc15_);
                                          if(!(_loc32_ || Boolean(param2)))
                                          {
                                             break loop32;
                                          }
                                          addr06da:
                                          var _temp_35:* = §§pop() <= §§pop();
                                          §§push(_temp_35);
                                          §§push(_temp_35);
                                          if(!_loc33_)
                                          {
                                             addr06e2:
                                             loop36:
                                             while(true)
                                             {
                                                if(Boolean(§§pop()))
                                                {
                                                   addr06e6:
                                                   §§pop();
                                                   addr06e9:
                                                   §§push(_loc20_);
                                                   §§push(_loc18_);
                                                   if(!_loc32_)
                                                   {
                                                      break loop33;
                                                   }
                                                   §§push(§§pop() <= §§pop());
                                                   if(_loc33_)
                                                   {
                                                      break;
                                                   }
                                                   §§push(Boolean(§§pop()));
                                                   if(!(_loc32_ || Boolean(param2)))
                                                   {
                                                      break loop31;
                                                   }
                                                }
                                                if(§§pop())
                                                {
                                                   _loc11_ = _loc9_;
                                                   loop37:
                                                   while(true)
                                                   {
                                                      loop38:
                                                      while(true)
                                                      {
                                                         if(!(_loc33_ && Boolean(this)))
                                                         {
                                                            while(_loc11_ != null)
                                                            {
                                                               _loc10_ = _loc11_.vertex;
                                                               if(!(_loc32_ || Boolean(param2)))
                                                               {
                                                                  break loop38;
                                                               }
                                                               if(_loc10_.cameraX < _loc10_.cameraZ)
                                                               {
                                                                  if(!_loc33_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  break loop37;
                                                               }
                                                               _loc11_ = _loc11_.next;
                                                            }
                                                         }
                                                         if(_loc11_ == null)
                                                         {
                                                            if(!(_loc33_ && Boolean(_loc3_)))
                                                            {
                                                               break;
                                                            }
                                                            break loop37;
                                                         }
                                                      }
                                                      _loc31_.processNext = null;
                                                      break;
                                                   }
                                                   continue loop0;
                                                }
                                                while(true)
                                                {
                                                   §§push(_loc25_);
                                                   if(!(_loc33_ && Boolean(param1)))
                                                   {
                                                      addr078d:
                                                      §§push(Boolean(§§pop()));
                                                      if(!_loc33_)
                                                      {
                                                         var _temp_41:* = §§pop();
                                                         while(true)
                                                         {
                                                            §§push(_temp_41);
                                                            §§push(Boolean(_temp_41));
                                                            if(_loc32_ || Boolean(param2))
                                                            {
                                                               addr07a4:
                                                               while(true)
                                                               {
                                                                  if(§§pop())
                                                                  {
                                                                     §§pop();
                                                                     §§push(_loc14_);
                                                                     if(!_loc32_)
                                                                     {
                                                                        break;
                                                                     }
                                                                     §§push(§§pop() <= -_loc13_);
                                                                  }
                                                                  var _temp_43:* = §§pop();
                                                                  addr07eb:
                                                                  §§push(_temp_43);
                                                                  §§push(_temp_43);
                                                                  if(_loc32_)
                                                                  {
                                                                     §§push(Boolean(§§pop()));
                                                                     if(!_loc33_)
                                                                     {
                                                                        if(§§pop())
                                                                        {
                                                                           §§pop();
                                                                           if(!_loc33_)
                                                                           {
                                                                              addr07cf:
                                                                              §§push(_loc17_);
                                                                              if(_loc32_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              break loop23;
                                                                           }
                                                                           §§goto(addr08c1);
                                                                        }
                                                                        addr07ea:
                                                                        var _temp_44:* = §§pop();
                                                                        §§push(_temp_44);
                                                                        §§push(_temp_44);
                                                                     }
                                                                  }
                                                                  §§push(Boolean(§§pop()));
                                                                  if(!_loc33_)
                                                                  {
                                                                     addr07f2:
                                                                     if(§§pop())
                                                                     {
                                                                        addr07f6:
                                                                        §§pop();
                                                                        break loop29;
                                                                     }
                                                                     break loop18;
                                                                  }
                                                                  break loop19;
                                                               }
                                                               addr07d7:
                                                               addr07da:
                                                               §§push(§§pop() <= -_loc16_);
                                                               break loop36;
                                                            }
                                                            §§goto(addr08bb);
                                                         }
                                                         §§goto(addr0903);
                                                      }
                                                      §§goto(addr08a5);
                                                   }
                                                   §§goto(addr0903);
                                                }
                                                §§goto(addr0932);
                                             }
                                             addr07db:
                                             §§push(Boolean(§§pop()));
                                             if(!(_loc33_ && Boolean(this)))
                                             {
                                                §§goto(addr07ea);
                                             }
                                             else
                                             {
                                                §§goto(addr08a5);
                                             }
                                          }
                                          §§goto(addr08ea);
                                       }
                                       §§goto(addr07f6);
                                    }
                                    §§goto(addr0818);
                                 }
                                 §§goto(addr0809);
                              }
                              §§goto(addr091d);
                           }
                           §§goto(addr0920);
                        }
                        §§push(_loc20_);
                        break;
                     }
                     §§push(_loc19_);
                     if(!(_loc33_ && Boolean(param2)))
                     {
                        addr0809:
                        §§push(-§§pop());
                        if(!(_loc32_ || Boolean(param2)))
                        {
                           break loop22;
                        }
                     }
                     addr0818:
                     §§push(§§pop() <= §§pop());
                     break loop18;
                  }
                  §§goto(addr0945);
               }
               if(§§pop())
               {
                  if(!_loc33_)
                  {
                     §§goto(addr0903);
                  }
                  §§goto(addr0932);
               }
               §§goto(addr091e);
            }
            while(true)
            {
               if(§§pop())
               {
                  if(!(_loc32_ || Boolean(this)))
                  {
                     break;
                  }
                  _loc11_ = _loc9_;
                  loop21:
                  while(true)
                  {
                     if(!(_loc33_ && Boolean(this)))
                     {
                        while(true)
                        {
                           if(_loc11_ != null)
                           {
                              _loc10_ = _loc11_.vertex;
                              if(!_loc32_)
                              {
                                 break;
                              }
                              §§push(_loc10_.cameraY);
                              if(_loc32_)
                              {
                                 §§push(-§§pop());
                              }
                              if(§§pop() < _loc10_.cameraZ)
                              {
                                 if(!_loc33_)
                                 {
                                    break;
                                 }
                                 break loop21;
                              }
                              continue;
                           }
                           _loc11_ = _loc11_.next;
                        }
                     }
                     if(_loc11_ == null)
                     {
                        if(_loc32_ || Boolean(param1))
                        {
                           _loc31_.processNext = null;
                        }
                        break;
                     }
                  }
                  continue loop0;
               }
               loop22:
               while(true)
               {
                  loop23:
                  while(true)
                  {
                     loop25:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc26_);
                           if(_loc32_)
                           {
                              addr08a5:
                              §§push(Boolean(§§pop()));
                              if(!_loc32_)
                              {
                                 break;
                              }
                              var _temp_26:* = §§pop();
                              §§push(_temp_26);
                              §§push(_temp_26);
                              if(!(_loc32_ || Boolean(param1)))
                              {
                                 break loop19;
                              }
                              if(!Boolean(§§pop()))
                              {
                                 break loop25;
                              }
                              §§pop();
                              §§push(_loc14_);
                              if(_loc33_ && Boolean(_loc3_))
                              {
                                 break loop23;
                              }
                              §§push(_loc13_);
                              if(_loc33_)
                              {
                                 break loop22;
                              }
                              §§push(§§pop() <= §§pop());
                           }
                           §§push(Boolean(§§pop()));
                           if(_loc32_ || Boolean(this))
                           {
                              break loop25;
                           }
                           §§goto(addr091e);
                        }
                        addr0903:
                        §§pop();
                        §§push(_loc17_);
                        if(_loc32_ || Boolean(param1))
                        {
                           addr0914:
                           §§push(_loc16_);
                           break loop22;
                        }
                        break loop23;
                     }
                     var _temp_24:* = §§pop();
                     addr08ea:
                     §§push(_temp_24);
                     §§push(Boolean(_temp_24));
                     if(_loc32_ || Boolean(_loc3_))
                     {
                        break loop19;
                     }
                     §§goto(addr0920);
                  }
                  addr093d:
                  §§push(§§pop() <= _loc19_);
                  if(!_loc33_)
                  {
                     §§push(Boolean(§§pop()));
                  }
                  §§goto(addr0945);
               }
               §§push(§§pop() <= §§pop());
               if(_loc32_)
               {
                  addr091e:
                  var _temp_20:* = Boolean(§§pop());
                  addr0920:
                  addr091d:
                  §§push(_temp_20);
                  if(_temp_20)
                  {
                     if(!(_loc33_ && Boolean(param2)))
                     {
                        addr0932:
                        §§pop();
                        if(_loc32_)
                        {
                           §§push(_loc20_);
                           break loop23;
                        }
                        break;
                     }
                  }
               }
               addr0945:
               if(§§pop())
               {
                  _loc11_ = _loc9_;
                  loop24:
                  while(true)
                  {
                     if(!_loc33_)
                     {
                        while(true)
                        {
                           if(_loc11_ != null)
                           {
                              _loc10_ = _loc11_.vertex;
                              if(!_loc32_)
                              {
                                 break;
                              }
                              if(_loc10_.cameraY < _loc10_.cameraZ)
                              {
                                 if(!(_loc33_ && Boolean(this)))
                                 {
                                    break;
                                 }
                                 break loop24;
                              }
                              continue;
                           }
                           _loc11_ = _loc11_.next;
                        }
                     }
                     if(_loc11_ == null)
                     {
                        if(!_loc33_)
                        {
                           _loc31_.processNext = null;
                        }
                        break;
                     }
                  }
                  continue loop0;
               }
               if(_loc3_ != null)
               {
                  if(_loc32_ || Boolean(param1))
                  {
                     break;
                  }
                  addr09c5:
               }
               else
               {
                  _loc3_ = _loc31_;
               }
               _loc4_ = _loc31_;
               continue loop0;
            }
            addr09bf:
            _loc4_.processNext = _loc31_;
            §§goto(addr09c5);
         }
         while(true)
         {
            if(!(_loc33_ && Boolean(param2)))
            {
               if(_loc4_ == null)
               {
                  break;
               }
               if(_loc33_ && Boolean(_loc3_))
               {
                  break;
               }
            }
            _loc4_.processNext = null;
            break;
         }
         return _loc3_;
      }
      
      alternativa3d function clip(param1:Face, param2:int) : Face
      {
         §§push(false);
         var _loc39_:Boolean = true;
         var _loc40_:* = §§pop();
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Face = null;
         var _loc6_:Vertex = null;
         var _loc7_:Vertex = null;
         var _loc8_:Vertex = null;
         var _loc9_:Wrapper = null;
         var _loc10_:Vertex = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Wrapper = null;
         var _loc13_:Wrapper = null;
         var _loc14_:Wrapper = null;
         var _loc15_:Wrapper = null;
         var _loc16_:* = NaN;
         var _loc17_:* = NaN;
         var _loc18_:* = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = NaN;
         var _loc21_:* = NaN;
         var _loc22_:* = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:* = NaN;
         var _loc35_:* = 0;
         var _loc36_:* = NaN;
         var _loc38_:Face = null;
         while(true)
         {
            §§push(param2);
            if(!_loc40_)
            {
               §§push(1);
               if(!_loc39_)
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(_loc39_)
         {
            §§push(Boolean(§§pop()));
         }
         var _loc25_:* = §§pop();
         while(true)
         {
            §§push(param2);
            if(_loc39_ || Boolean(this))
            {
               §§push(2);
               if(_loc40_ && Boolean(param1))
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(!(_loc40_ && Boolean(param2)))
         {
            §§push(Boolean(§§pop()));
         }
         var _loc26_:* = §§pop();
         while(true)
         {
            §§push(param2);
            if(_loc39_ || Boolean(_loc3_))
            {
               §§push(4);
               if(_loc40_)
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(_loc39_)
         {
            §§push(Boolean(§§pop()));
         }
         var _loc27_:* = §§pop();
         while(true)
         {
            §§push(param2);
            if(_loc39_)
            {
               §§push(8);
               if(_loc40_ && Boolean(param2))
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(!(_loc40_ && Boolean(param1)))
         {
            §§push(Boolean(§§pop()));
         }
         var _loc28_:* = §§pop();
         while(true)
         {
            §§push(param2);
            if(!_loc40_)
            {
               §§push(16);
               if(_loc40_ && Boolean(param1))
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(!_loc40_)
         {
            §§push(Boolean(§§pop()));
         }
         var _loc29_:* = §§pop();
         while(true)
         {
            §§push(param2);
            if(!_loc40_)
            {
               §§push(32);
               if(_loc40_ && Boolean(param1))
               {
                  break;
               }
               §§push(§§pop() & §§pop());
            }
            §§push(0);
            break;
         }
         §§push(§§pop() > §§pop());
         if(_loc39_)
         {
            §§push(Boolean(§§pop()));
         }
         var _loc30_:* = §§pop();
         §§push(this.nearClipping);
         if(_loc39_)
         {
            §§push(Number(§§pop()));
         }
         var _loc31_:* = §§pop();
         §§push(this.farClipping);
         if(!_loc40_)
         {
            §§push(Number(§§pop()));
         }
         var _loc32_:* = §§pop();
         loop26:
         while(true)
         {
            loop27:
            while(true)
            {
               while(true)
               {
                  if(!(_loc40_ && Boolean(_loc3_)))
                  {
                     §§push(_loc27_);
                     if(!_loc39_)
                     {
                        break;
                     }
                     §§push(Boolean(§§pop()));
                     if(_loc40_)
                     {
                        break;
                     }
                     var _temp_374:* = §§pop();
                     §§push(_temp_374);
                     §§push(_temp_374);
                     if(_loc39_ || Boolean(param1))
                     {
                        §§push(Boolean(§§pop()));
                     }
                     if(§§pop())
                     {
                        break loop27;
                     }
                     if(_loc40_)
                     {
                        break loop26;
                     }
                     §§pop();
                  }
                  §§push(_loc28_);
                  if(_loc39_)
                  {
                     break;
                  }
                  break loop26;
               }
               §§push(Boolean(§§pop()));
               if(_loc39_ || Boolean(this))
               {
                  break;
               }
               break loop26;
            }
            §§push(Boolean(§§pop()));
            break;
         }
         var _loc33_:* = §§pop();
         while(true)
         {
            if(!_loc40_)
            {
               §§push(_loc29_);
               if(!_loc39_)
               {
                  break;
               }
               §§push(Boolean(§§pop()));
               if(!(_loc39_ || Boolean(param1)))
               {
                  break;
               }
               var _temp_11:* = §§pop();
               §§push(_temp_11);
               §§push(_temp_11);
               if(_loc39_)
               {
                  §§push(Boolean(§§pop()));
               }
               if(§§pop())
               {
                  break;
               }
               if(_loc40_)
               {
                  break;
               }
               §§pop();
            }
            §§push(_loc30_);
            if(!_loc40_)
            {
               §§push(Boolean(§§pop()));
               if(!_loc40_)
               {
                  break;
               }
               §§goto(addr020b);
            }
            break;
         }
         addr020b:
         var _loc34_:* = §§pop();
         var _loc37_:Face = param1;
         loop0:
         for(; _loc37_ != null; _loc37_ = _loc5_)
         {
            _loc5_ = _loc37_.processNext;
            _loc9_ = _loc37_.wrapper;
            _loc6_ = _loc9_.vertex;
            _loc9_ = _loc9_.next;
            _loc7_ = _loc9_.vertex;
            _loc9_ = _loc9_.next;
            _loc8_ = _loc9_.vertex;
            _loc9_ = _loc9_.next;
            loop29:
            while(true)
            {
               loop30:
               while(true)
               {
                  loop206:
                  while(true)
                  {
                     loop234:
                     while(true)
                     {
                        loop239:
                        while(true)
                        {
                           loop240:
                           while(true)
                           {
                              loop241:
                              while(true)
                              {
                                 loop242:
                                 while(true)
                                 {
                                    loop248:
                                    while(true)
                                    {
                                       loop249:
                                       while(true)
                                       {
                                          loop250:
                                          while(true)
                                          {
                                             loop251:
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
                                                         loop255:
                                                         while(true)
                                                         {
                                                            loop256:
                                                            while(true)
                                                            {
                                                               loop257:
                                                               while(true)
                                                               {
                                                                  loop258:
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
                                                                                       loop265:
                                                                                       while(true)
                                                                                       {
                                                                                          loop266:
                                                                                          while(true)
                                                                                          {
                                                                                             loop267:
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
                                                                                                            if(_loc39_ || Boolean(param1))
                                                                                                            {
                                                                                                               while(true)
                                                                                                               {
                                                                                                                  §§push(_loc33_);
                                                                                                                  if(!_loc40_)
                                                                                                                  {
                                                                                                                     loop273:
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        loop274:
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           if(§§pop())
                                                                                                                           {
                                                                                                                              if(_loc40_ && Boolean(this))
                                                                                                                              {
                                                                                                                                 break loop273;
                                                                                                                              }
                                                                                                                              §§push(_loc6_.cameraX);
                                                                                                                              if(!_loc39_)
                                                                                                                              {
                                                                                                                                 break;
                                                                                                                              }
                                                                                                                              _loc16_ = Number(§§pop());
                                                                                                                              if(!_loc39_)
                                                                                                                              {
                                                                                                                                 break loop250;
                                                                                                                              }
                                                                                                                              _loc19_ = _loc7_.cameraX;
                                                                                                                              §§push(_loc8_.cameraX);
                                                                                                                              if(_loc40_ && Boolean(param2))
                                                                                                                              {
                                                                                                                                 break loop249;
                                                                                                                              }
                                                                                                                              _loc22_ = §§pop();
                                                                                                                              if(!(_loc39_ || Boolean(param1)))
                                                                                                                              {
                                                                                                                                 break loop273;
                                                                                                                              }
                                                                                                                           }
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              if(_loc34_)
                                                                                                                              {
                                                                                                                                 §§push(_loc6_.cameraY);
                                                                                                                                 if(!(_loc39_ || Boolean(param2)))
                                                                                                                                 {
                                                                                                                                    break loop248;
                                                                                                                                 }
                                                                                                                                 _loc17_ = Number(§§pop());
                                                                                                                                 if(_loc40_)
                                                                                                                                 {
                                                                                                                                    break loop214;
                                                                                                                                 }
                                                                                                                                 §§push(_loc7_.cameraY);
                                                                                                                                 if(!_loc39_)
                                                                                                                                 {
                                                                                                                                    break loop242;
                                                                                                                                 }
                                                                                                                                 _loc20_ = Number(§§pop());
                                                                                                                                 if(!_loc39_)
                                                                                                                                 {
                                                                                                                                    break;
                                                                                                                                 }
                                                                                                                                 §§push(_loc8_.cameraY);
                                                                                                                                 if(!(_loc39_ || Boolean(param1)))
                                                                                                                                 {
                                                                                                                                    break loop274;
                                                                                                                                 }
                                                                                                                                 _loc23_ = §§pop();
                                                                                                                              }
                                                                                                                              §§push(_loc6_.cameraZ);
                                                                                                                              if(!(_loc40_ && Boolean(param2)))
                                                                                                                              {
                                                                                                                                 break loop274;
                                                                                                                              }
                                                                                                                              break loop241;
                                                                                                                           }
                                                                                                                           §§goto(addr05d9);
                                                                                                                        }
                                                                                                                        _loc18_ = Number(§§pop());
                                                                                                                        §§push(_loc7_.cameraZ);
                                                                                                                        if(_loc40_)
                                                                                                                        {
                                                                                                                           break loop240;
                                                                                                                        }
                                                                                                                        _loc21_ = Number(§§pop());
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           loop299:
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              while(true)
                                                                                                                              {
                                                                                                                                 while(true)
                                                                                                                                 {
                                                                                                                                    §§push(_loc8_.cameraZ);
                                                                                                                                    if(!(_loc40_ && Boolean(this)))
                                                                                                                                    {
                                                                                                                                       while(true)
                                                                                                                                       {
                                                                                                                                          while(true)
                                                                                                                                          {
                                                                                                                                             §§push(Number(§§pop()));
                                                                                                                                             if(!_loc40_)
                                                                                                                                             {
                                                                                                                                                _loc24_ = §§pop();
                                                                                                                                                if(_loc40_)
                                                                                                                                                {
                                                                                                                                                   break loop239;
                                                                                                                                                }
                                                                                                                                                §§push(0);
                                                                                                                                                if(_loc40_ && Boolean(param2))
                                                                                                                                                {
                                                                                                                                                   break loop299;
                                                                                                                                                }
                                                                                                                                                _loc35_ = int(§§pop());
                                                                                                                                                if(!_loc25_)
                                                                                                                                                {
                                                                                                                                                   continue loop291;
                                                                                                                                                }
                                                                                                                                                §§push(_loc18_);
                                                                                                                                                §§push(_loc31_);
                                                                                                                                                if(!(_loc39_ || Boolean(_loc3_)))
                                                                                                                                                {
                                                                                                                                                   break loop224;
                                                                                                                                                }
                                                                                                                                                §§push(§§pop() <= §§pop());
                                                                                                                                                if(_loc40_ && Boolean(_loc3_))
                                                                                                                                                {
                                                                                                                                                   break loop234;
                                                                                                                                                }
                                                                                                                                                var _temp_356:* = §§pop();
                                                                                                                                                while(true)
                                                                                                                                                {
                                                                                                                                                   §§push(_temp_356);
                                                                                                                                                   §§push(Boolean(_temp_356));
                                                                                                                                                   if(!(_loc40_ && Boolean(param1)))
                                                                                                                                                   {
                                                                                                                                                      if(§§pop())
                                                                                                                                                      {
                                                                                                                                                         §§pop();
                                                                                                                                                         if(_loc39_ || Boolean(_loc3_))
                                                                                                                                                         {
                                                                                                                                                            §§push(_loc21_ <= _loc31_);
                                                                                                                                                            if(!_loc39_)
                                                                                                                                                            {
                                                                                                                                                               break loop258;
                                                                                                                                                            }
                                                                                                                                                         }
                                                                                                                                                         else
                                                                                                                                                         {
                                                                                                                                                            §§goto(addr0589);
                                                                                                                                                         }
                                                                                                                                                      }
                                                                                                                                                      var _temp_359:* = §§pop();
                                                                                                                                                      while(true)
                                                                                                                                                      {
                                                                                                                                                         loop306:
                                                                                                                                                         while(true)
                                                                                                                                                         {
                                                                                                                                                            loop307:
                                                                                                                                                            while(true)
                                                                                                                                                            {
                                                                                                                                                               while(true)
                                                                                                                                                               {
                                                                                                                                                                  §§push(_temp_359);
                                                                                                                                                                  §§push(Boolean(_temp_359));
                                                                                                                                                                  if(_loc39_ || Boolean(param1))
                                                                                                                                                                  {
                                                                                                                                                                     if(§§pop())
                                                                                                                                                                     {
                                                                                                                                                                        §§pop();
                                                                                                                                                                        if(_loc39_)
                                                                                                                                                                        {
                                                                                                                                                                           §§push(_loc24_ <= _loc31_);
                                                                                                                                                                           if(_loc40_)
                                                                                                                                                                           {
                                                                                                                                                                              break;
                                                                                                                                                                           }
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                           §§goto(addr0feb);
                                                                                                                                                                        }
                                                                                                                                                                     }
                                                                                                                                                                     if(§§pop())
                                                                                                                                                                     {
                                                                                                                                                                        if(_loc39_)
                                                                                                                                                                        {
                                                                                                                                                                           break loop273;
                                                                                                                                                                        }
                                                                                                                                                                        §§goto(addr0ed5);
                                                                                                                                                                     }
                                                                                                                                                                     else
                                                                                                                                                                     {
                                                                                                                                                                        §§push(_loc18_);
                                                                                                                                                                        if(_loc40_)
                                                                                                                                                                        {
                                                                                                                                                                           break loop236;
                                                                                                                                                                        }
                                                                                                                                                                        §§push(_loc31_);
                                                                                                                                                                        if(_loc40_ && Boolean(param1))
                                                                                                                                                                        {
                                                                                                                                                                           break loop257;
                                                                                                                                                                        }
                                                                                                                                                                        §§push(§§pop() > §§pop());
                                                                                                                                                                        if(_loc40_)
                                                                                                                                                                        {
                                                                                                                                                                           break loop307;
                                                                                                                                                                        }
                                                                                                                                                                        §§push(Boolean(§§pop()));
                                                                                                                                                                        if(!(_loc40_ && Boolean(param1)))
                                                                                                                                                                        {
                                                                                                                                                                           var _temp_363:* = §§pop();
                                                                                                                                                                           §§push(_temp_363);
                                                                                                                                                                           §§push(_temp_363);
                                                                                                                                                                           if(!(_loc39_ || Boolean(_loc3_)))
                                                                                                                                                                           {
                                                                                                                                                                              break loop256;
                                                                                                                                                                           }
                                                                                                                                                                           if(Boolean(§§pop()))
                                                                                                                                                                           {
                                                                                                                                                                              §§pop();
                                                                                                                                                                              §§push(_loc21_);
                                                                                                                                                                              §§push(_loc31_);
                                                                                                                                                                              if(!_loc39_)
                                                                                                                                                                              {
                                                                                                                                                                                 break loop255;
                                                                                                                                                                              }
                                                                                                                                                                              §§push(§§pop() > §§pop());
                                                                                                                                                                              if(_loc40_)
                                                                                                                                                                              {
                                                                                                                                                                                 break loop254;
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           var _temp_365:* = §§pop();
                                                                                                                                                                           §§push(_temp_365);
                                                                                                                                                                           §§push(_temp_365);
                                                                                                                                                                           if(!_loc39_)
                                                                                                                                                                           {
                                                                                                                                                                              break loop253;
                                                                                                                                                                           }
                                                                                                                                                                           if(Boolean(§§pop()))
                                                                                                                                                                           {
                                                                                                                                                                              if(_loc40_)
                                                                                                                                                                              {
                                                                                                                                                                                 break loop306;
                                                                                                                                                                              }
                                                                                                                                                                              §§pop();
                                                                                                                                                                              if(!(_loc39_ || Boolean(param1)))
                                                                                                                                                                              {
                                                                                                                                                                                 break loop250;
                                                                                                                                                                              }
                                                                                                                                                                              §§push(_loc24_);
                                                                                                                                                                              §§push(_loc31_);
                                                                                                                                                                              if(_loc39_)
                                                                                                                                                                              {
                                                                                                                                                                                 §§push(§§pop() > §§pop());
                                                                                                                                                                                 if(_loc40_ && Boolean(param1))
                                                                                                                                                                                 {
                                                                                                                                                                                    break loop252;
                                                                                                                                                                                 }
                                                                                                                                                                                 §§push(Boolean(§§pop()));
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                 §§goto(addr06c2);
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           if(§§pop())
                                                                                                                                                                           {
                                                                                                                                                                              if(_loc40_ && Boolean(param1))
                                                                                                                                                                              {
                                                                                                                                                                                 break loop251;
                                                                                                                                                                              }
                                                                                                                                                                              _loc11_ = _loc9_;
                                                                                                                                                                              loop309:
                                                                                                                                                                              while(true)
                                                                                                                                                                              {
                                                                                                                                                                                 if(_loc39_)
                                                                                                                                                                                 {
                                                                                                                                                                                    while(true)
                                                                                                                                                                                    {
                                                                                                                                                                                       if(_loc11_ == null)
                                                                                                                                                                                       {
                                                                                                                                                                                          break loop309;
                                                                                                                                                                                       }
                                                                                                                                                                                       if(_loc11_.vertex.cameraZ > _loc31_)
                                                                                                                                                                                       {
                                                                                                                                                                                          continue;
                                                                                                                                                                                       }
                                                                                                                                                                                       if(_loc39_)
                                                                                                                                                                                       {
                                                                                                                                                                                          while(true)
                                                                                                                                                                                          {
                                                                                                                                                                                             §§push(_loc35_);
                                                                                                                                                                                             if(_loc39_)
                                                                                                                                                                                             {
                                                                                                                                                                                                §§push(§§pop() | 1);
                                                                                                                                                                                                if(!(_loc39_ || Boolean(param2)))
                                                                                                                                                                                                {
                                                                                                                                                                                                   break;
                                                                                                                                                                                                }
                                                                                                                                                                                             }
                                                                                                                                                                                             §§push(int(§§pop()));
                                                                                                                                                                                             break;
                                                                                                                                                                                          }
                                                                                                                                                                                          _loc35_ = §§pop();
                                                                                                                                                                                          if(!_loc39_)
                                                                                                                                                                                          {
                                                                                                                                                                                             break loop309;
                                                                                                                                                                                          }
                                                                                                                                                                                       }
                                                                                                                                                                                       _loc11_ = _loc11_.next;
                                                                                                                                                                                    }
                                                                                                                                                                                 }
                                                                                                                                                                                 break;
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           else
                                                                                                                                                                           {
                                                                                                                                                                              §§push(_loc35_ | 1);
                                                                                                                                                                              if(_loc40_ && Boolean(param2))
                                                                                                                                                                              {
                                                                                                                                                                                 break loop259;
                                                                                                                                                                              }
                                                                                                                                                                              _loc35_ = int(§§pop());
                                                                                                                                                                              if(_loc40_ && Boolean(param1))
                                                                                                                                                                              {
                                                                                                                                                                                 break loop235;
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           continue loop291;
                                                                                                                                                                        }
                                                                                                                                                                        §§goto(addr0b4c);
                                                                                                                                                                     }
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                     §§goto(addr06a5);
                                                                                                                                                                  }
                                                                                                                                                                  §§goto(addr06d8);
                                                                                                                                                               }
                                                                                                                                                               §§goto(addr0a64);
                                                                                                                                                            }
                                                                                                                                                            §§goto(addr07f2);
                                                                                                                                                         }
                                                                                                                                                         §§goto(addr06f2);
                                                                                                                                                      }
                                                                                                                                                      §§goto(addr0960);
                                                                                                                                                   }
                                                                                                                                                   §§goto(addr05ce);
                                                                                                                                                }
                                                                                                                                                §§goto(addr05d9);
                                                                                                                                             }
                                                                                                                                             §§goto(addr05db);
                                                                                                                                          }
                                                                                                                                          §§goto(addr093e);
                                                                                                                                       }
                                                                                                                                       §§goto(addr05f3);
                                                                                                                                    }
                                                                                                                                    §§goto(addr0911);
                                                                                                                                 }
                                                                                                                                 §§goto(addr0a0b);
                                                                                                                              }
                                                                                                                              §§goto(addr0b65);
                                                                                                                           }
                                                                                                                           §§goto(addr0c06);
                                                                                                                        }
                                                                                                                        §§goto(addr0944);
                                                                                                                     }
                                                                                                                     _loc11_ = _loc9_;
                                                                                                                     if(_loc40_)
                                                                                                                     {
                                                                                                                        break loop275;
                                                                                                                     }
                                                                                                                     loop1:
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        loop275:
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              if(_loc11_ == null)
                                                                                                                              {
                                                                                                                                 if(!_loc39_)
                                                                                                                                 {
                                                                                                                                    break loop275;
                                                                                                                                 }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                 if(_loc11_.vertex.cameraZ <= _loc31_)
                                                                                                                                 {
                                                                                                                                    continue loop1;
                                                                                                                                 }
                                                                                                                                 if(_loc39_ || Boolean(_loc3_))
                                                                                                                                 {
                                                                                                                                    §§push(_loc35_);
                                                                                                                                    if(!_loc40_)
                                                                                                                                    {
                                                                                                                                       §§push(§§pop() | 1);
                                                                                                                                       if(_loc39_)
                                                                                                                                       {
                                                                                                                                          §§push(int(§§pop()));
                                                                                                                                       }
                                                                                                                                    }
                                                                                                                                    _loc35_ = §§pop();
                                                                                                                                    if(_loc40_)
                                                                                                                                    {
                                                                                                                                       break;
                                                                                                                                    }
                                                                                                                                 }
                                                                                                                              }
                                                                                                                              if(_loc11_ == null)
                                                                                                                              {
                                                                                                                                 if(_loc39_)
                                                                                                                                 {
                                                                                                                                    break;
                                                                                                                                 }
                                                                                                                                 break loop275;
                                                                                                                              }
                                                                                                                              loop277:
                                                                                                                              while(true)
                                                                                                                              {
                                                                                                                                 loop278:
                                                                                                                                 while(true)
                                                                                                                                 {
                                                                                                                                    loop279:
                                                                                                                                    while(true)
                                                                                                                                    {
                                                                                                                                       loop282:
                                                                                                                                       while(true)
                                                                                                                                       {
                                                                                                                                          loop283:
                                                                                                                                          while(true)
                                                                                                                                          {
                                                                                                                                             loop288:
                                                                                                                                             while(true)
                                                                                                                                             {
                                                                                                                                                loop291:
                                                                                                                                                while(true)
                                                                                                                                                {
                                                                                                                                                   while(true)
                                                                                                                                                   {
                                                                                                                                                      §§push(_loc26_);
                                                                                                                                                      if(_loc39_)
                                                                                                                                                      {
                                                                                                                                                         if(!§§pop())
                                                                                                                                                         {
                                                                                                                                                            break loop282;
                                                                                                                                                         }
                                                                                                                                                         §§push(_loc18_ >= _loc32_);
                                                                                                                                                         if(_loc40_ && Boolean(this))
                                                                                                                                                         {
                                                                                                                                                            break;
                                                                                                                                                         }
                                                                                                                                                         §§push(Boolean(§§pop()));
                                                                                                                                                         if(!(_loc39_ || Boolean(_loc3_)))
                                                                                                                                                         {
                                                                                                                                                            break loop291;
                                                                                                                                                         }
                                                                                                                                                         var _temp_331:* = §§pop();
                                                                                                                                                         while(true)
                                                                                                                                                         {
                                                                                                                                                            §§push(_temp_331);
                                                                                                                                                            if(Boolean(_temp_331))
                                                                                                                                                            {
                                                                                                                                                               §§pop();
                                                                                                                                                               if(!_loc39_)
                                                                                                                                                               {
                                                                                                                                                                  break;
                                                                                                                                                               }
                                                                                                                                                               §§push(_loc21_ >= _loc32_);
                                                                                                                                                               if(!(_loc39_ || Boolean(this)))
                                                                                                                                                               {
                                                                                                                                                                  break loop270;
                                                                                                                                                               }
                                                                                                                                                               §§push(Boolean(§§pop()));
                                                                                                                                                            }
                                                                                                                                                            var _temp_333:* = §§pop();
                                                                                                                                                            addr05ce:
                                                                                                                                                            §§push(_temp_333);
                                                                                                                                                            if(Boolean(_temp_333))
                                                                                                                                                            {
                                                                                                                                                               if(!_loc40_)
                                                                                                                                                               {
                                                                                                                                                                  §§pop();
                                                                                                                                                                  break;
                                                                                                                                                               }
                                                                                                                                                               break loop252;
                                                                                                                                                            }
                                                                                                                                                            addr05f3:
                                                                                                                                                            if(§§pop())
                                                                                                                                                            {
                                                                                                                                                               if(!(_loc39_ || Boolean(_loc3_)))
                                                                                                                                                               {
                                                                                                                                                                  break loop283;
                                                                                                                                                               }
                                                                                                                                                               _loc11_ = _loc9_;
                                                                                                                                                               loop294:
                                                                                                                                                               while(true)
                                                                                                                                                               {
                                                                                                                                                                  loop295:
                                                                                                                                                                  while(true)
                                                                                                                                                                  {
                                                                                                                                                                     if(_loc39_)
                                                                                                                                                                     {
                                                                                                                                                                        while(true)
                                                                                                                                                                        {
                                                                                                                                                                           if(_loc11_ == null)
                                                                                                                                                                           {
                                                                                                                                                                              if(!_loc39_)
                                                                                                                                                                              {
                                                                                                                                                                                 break loop294;
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           else
                                                                                                                                                                           {
                                                                                                                                                                              if(_loc11_.vertex.cameraZ >= _loc32_)
                                                                                                                                                                              {
                                                                                                                                                                                 continue;
                                                                                                                                                                              }
                                                                                                                                                                              if(!_loc40_)
                                                                                                                                                                              {
                                                                                                                                                                                 §§push(_loc35_);
                                                                                                                                                                                 if(!_loc40_)
                                                                                                                                                                                 {
                                                                                                                                                                                    §§push(§§pop() | 2);
                                                                                                                                                                                    if(_loc39_)
                                                                                                                                                                                    {
                                                                                                                                                                                       §§push(int(§§pop()));
                                                                                                                                                                                    }
                                                                                                                                                                                 }
                                                                                                                                                                                 _loc35_ = §§pop();
                                                                                                                                                                                 if(_loc40_ && Boolean(param1))
                                                                                                                                                                                 {
                                                                                                                                                                                    break loop295;
                                                                                                                                                                                 }
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           _loc11_ = _loc11_.next;
                                                                                                                                                                        }
                                                                                                                                                                        break loop1;
                                                                                                                                                                     }
                                                                                                                                                                     if(_loc11_ == null)
                                                                                                                                                                     {
                                                                                                                                                                        if(!_loc40_)
                                                                                                                                                                        {
                                                                                                                                                                           break;
                                                                                                                                                                        }
                                                                                                                                                                        break loop294;
                                                                                                                                                                     }
                                                                                                                                                                     break loop282;
                                                                                                                                                                  }
                                                                                                                                                                  _loc37_.processNext = null;
                                                                                                                                                                  break;
                                                                                                                                                               }
                                                                                                                                                               continue loop0;
                                                                                                                                                            }
                                                                                                                                                            §§push(_loc18_);
                                                                                                                                                            if(!_loc39_)
                                                                                                                                                            {
                                                                                                                                                               break loop241;
                                                                                                                                                            }
                                                                                                                                                            §§push(_loc32_);
                                                                                                                                                            if(_loc40_)
                                                                                                                                                            {
                                                                                                                                                               break loop278;
                                                                                                                                                            }
                                                                                                                                                            §§push(§§pop() < §§pop());
                                                                                                                                                            if(!(_loc39_ || Boolean(this)))
                                                                                                                                                            {
                                                                                                                                                               break loop277;
                                                                                                                                                            }
                                                                                                                                                         }
                                                                                                                                                         §§push(_loc24_);
                                                                                                                                                         §§push(_loc32_);
                                                                                                                                                         if(_loc40_ && Boolean(this))
                                                                                                                                                         {
                                                                                                                                                            break loop271;
                                                                                                                                                         }
                                                                                                                                                         §§push(§§pop() >= §§pop());
                                                                                                                                                         if(!_loc39_)
                                                                                                                                                         {
                                                                                                                                                            break loop288;
                                                                                                                                                         }
                                                                                                                                                         §§goto(addr05f3);
                                                                                                                                                      }
                                                                                                                                                      §§push(Boolean(§§pop()));
                                                                                                                                                      if(!_loc39_)
                                                                                                                                                      {
                                                                                                                                                         continue loop31;
                                                                                                                                                      }
                                                                                                                                                      var _temp_338:* = §§pop();
                                                                                                                                                      while(true)
                                                                                                                                                      {
                                                                                                                                                         §§push(_temp_338);
                                                                                                                                                         if(Boolean(_temp_338))
                                                                                                                                                         {
                                                                                                                                                            if(_loc40_ && Boolean(this))
                                                                                                                                                            {
                                                                                                                                                               break loop269;
                                                                                                                                                            }
                                                                                                                                                            §§pop();
                                                                                                                                                            §§push(_loc21_);
                                                                                                                                                            §§push(_loc32_);
                                                                                                                                                            if(!_loc39_)
                                                                                                                                                            {
                                                                                                                                                               break loop266;
                                                                                                                                                            }
                                                                                                                                                            §§push(§§pop() < §§pop());
                                                                                                                                                            if(!(_loc39_ || Boolean(param2)))
                                                                                                                                                            {
                                                                                                                                                               continue loop221;
                                                                                                                                                            }
                                                                                                                                                            §§push(Boolean(§§pop()));
                                                                                                                                                            if(!_loc39_)
                                                                                                                                                            {
                                                                                                                                                               break;
                                                                                                                                                            }
                                                                                                                                                         }
                                                                                                                                                         addr06d8:
                                                                                                                                                         var _temp_341:* = §§pop();
                                                                                                                                                         §§push(_temp_341);
                                                                                                                                                         §§push(_temp_341);
                                                                                                                                                         if(!(_loc39_ || Boolean(param1)))
                                                                                                                                                         {
                                                                                                                                                            break loop221;
                                                                                                                                                         }
                                                                                                                                                         §§push(Boolean(§§pop()));
                                                                                                                                                         if(_loc40_)
                                                                                                                                                         {
                                                                                                                                                            continue loop236;
                                                                                                                                                         }
                                                                                                                                                         if(§§pop())
                                                                                                                                                         {
                                                                                                                                                            addr06f2:
                                                                                                                                                            §§pop();
                                                                                                                                                            if(!_loc39_)
                                                                                                                                                            {
                                                                                                                                                               break loop217;
                                                                                                                                                            }
                                                                                                                                                            §§push(_loc24_);
                                                                                                                                                            if(_loc40_ && Boolean(this))
                                                                                                                                                            {
                                                                                                                                                               break loop268;
                                                                                                                                                            }
                                                                                                                                                            §§push(§§pop() < _loc32_);
                                                                                                                                                         }
                                                                                                                                                         if(!§§pop())
                                                                                                                                                         {
                                                                                                                                                            §§push(_loc35_);
                                                                                                                                                            if(_loc39_)
                                                                                                                                                            {
                                                                                                                                                               §§push(§§pop() | 2);
                                                                                                                                                               if(!(_loc40_ && Boolean(_loc3_)))
                                                                                                                                                               {
                                                                                                                                                                  _loc35_ = §§pop();
                                                                                                                                                                  break loop282;
                                                                                                                                                               }
                                                                                                                                                               break loop267;
                                                                                                                                                            }
                                                                                                                                                            break loop279;
                                                                                                                                                         }
                                                                                                                                                         if(!(_loc40_ && Boolean(param2)))
                                                                                                                                                         {
                                                                                                                                                            break loop283;
                                                                                                                                                         }
                                                                                                                                                         §§goto(addr0b7f);
                                                                                                                                                      }
                                                                                                                                                      §§goto(addr0960);
                                                                                                                                                   }
                                                                                                                                                   §§goto(addr093e);
                                                                                                                                                }
                                                                                                                                                §§goto(addr0a13);
                                                                                                                                             }
                                                                                                                                             §§goto(addr0946);
                                                                                                                                          }
                                                                                                                                          _loc11_ = _loc9_;
                                                                                                                                          loop289:
                                                                                                                                          while(true)
                                                                                                                                          {
                                                                                                                                             if(_loc39_ || Boolean(_loc3_))
                                                                                                                                             {
                                                                                                                                                while(true)
                                                                                                                                                {
                                                                                                                                                   if(_loc11_ == null)
                                                                                                                                                   {
                                                                                                                                                      break loop289;
                                                                                                                                                   }
                                                                                                                                                   if(_loc11_.vertex.cameraZ < _loc32_)
                                                                                                                                                   {
                                                                                                                                                      continue;
                                                                                                                                                   }
                                                                                                                                                   if(!_loc39_)
                                                                                                                                                   {
                                                                                                                                                      break loop289;
                                                                                                                                                   }
                                                                                                                                                   _loc11_ = _loc11_.next;
                                                                                                                                                }
                                                                                                                                                break;
                                                                                                                                             }
                                                                                                                                             while(true)
                                                                                                                                             {
                                                                                                                                                §§push(_loc35_);
                                                                                                                                                if(!(_loc40_ && Boolean(this)))
                                                                                                                                                {
                                                                                                                                                   §§push(§§pop() | 2);
                                                                                                                                                   if(_loc40_)
                                                                                                                                                   {
                                                                                                                                                      break;
                                                                                                                                                   }
                                                                                                                                                }
                                                                                                                                                §§push(int(§§pop()));
                                                                                                                                                break;
                                                                                                                                             }
                                                                                                                                             _loc35_ = §§pop();
                                                                                                                                             if(_loc39_ || Boolean(this))
                                                                                                                                             {
                                                                                                                                             }
                                                                                                                                             break;
                                                                                                                                          }
                                                                                                                                          break;
                                                                                                                                       }
                                                                                                                                       §§push(_loc27_);
                                                                                                                                       if(!(_loc40_ && Boolean(param2)))
                                                                                                                                       {
                                                                                                                                          if(§§pop())
                                                                                                                                          {
                                                                                                                                             §§push(_loc18_);
                                                                                                                                             if(!(_loc40_ && Boolean(param1)))
                                                                                                                                             {
                                                                                                                                                §§push(_loc16_);
                                                                                                                                                if(_loc40_ && Boolean(param1))
                                                                                                                                                {
                                                                                                                                                   break loop266;
                                                                                                                                                }
                                                                                                                                                §§push(-§§pop());
                                                                                                                                                if(!(_loc39_ || Boolean(param2)))
                                                                                                                                                {
                                                                                                                                                   break loop265;
                                                                                                                                                }
                                                                                                                                                §§push(§§pop() <= §§pop());
                                                                                                                                                if(!_loc39_)
                                                                                                                                                {
                                                                                                                                                   break loop258;
                                                                                                                                                }
                                                                                                                                                var _temp_311:* = §§pop();
                                                                                                                                                §§push(_temp_311);
                                                                                                                                                §§push(Boolean(_temp_311));
                                                                                                                                                if(_loc40_ && Boolean(param2))
                                                                                                                                                {
                                                                                                                                                   continue loop210;
                                                                                                                                                }
                                                                                                                                                loop284:
                                                                                                                                                while(true)
                                                                                                                                                {
                                                                                                                                                   if(§§pop())
                                                                                                                                                   {
                                                                                                                                                      §§pop();
                                                                                                                                                      §§push(_loc21_ <= -_loc19_);
                                                                                                                                                      if(_loc40_ && Boolean(param2))
                                                                                                                                                      {
                                                                                                                                                         break loop264;
                                                                                                                                                      }
                                                                                                                                                      §§push(Boolean(§§pop()));
                                                                                                                                                      if(!(_loc39_ || Boolean(this)))
                                                                                                                                                      {
                                                                                                                                                         break;
                                                                                                                                                      }
                                                                                                                                                   }
                                                                                                                                                   var _temp_315:* = §§pop();
                                                                                                                                                   §§push(_temp_315);
                                                                                                                                                   §§push(_temp_315);
                                                                                                                                                   if(!_loc39_)
                                                                                                                                                   {
                                                                                                                                                      break loop263;
                                                                                                                                                   }
                                                                                                                                                   if(!Boolean(§§pop()))
                                                                                                                                                   {
                                                                                                                                                      break;
                                                                                                                                                   }
                                                                                                                                                   §§pop();
                                                                                                                                                   if(!_loc39_)
                                                                                                                                                   {
                                                                                                                                                      break loop214;
                                                                                                                                                   }
                                                                                                                                                   §§push(_loc24_);
                                                                                                                                                   §§push(_loc22_);
                                                                                                                                                   if(_loc40_)
                                                                                                                                                   {
                                                                                                                                                      break loop262;
                                                                                                                                                   }
                                                                                                                                                   while(true)
                                                                                                                                                   {
                                                                                                                                                      §§push(-§§pop());
                                                                                                                                                      if(!(_loc40_ && Boolean(param2)))
                                                                                                                                                      {
                                                                                                                                                         §§push(§§pop() <= §§pop());
                                                                                                                                                         if(_loc39_ || Boolean(_loc3_))
                                                                                                                                                         {
                                                                                                                                                            §§push(Boolean(§§pop()));
                                                                                                                                                            break loop284;
                                                                                                                                                         }
                                                                                                                                                         break loop261;
                                                                                                                                                      }
                                                                                                                                                      addr0944:
                                                                                                                                                      §§push(§§pop() > §§pop());
                                                                                                                                                      break;
                                                                                                                                                   }
                                                                                                                                                   var _temp_318:* = §§pop();
                                                                                                                                                   §§push(_temp_318);
                                                                                                                                                   if(Boolean(_temp_318))
                                                                                                                                                   {
                                                                                                                                                      §§pop();
                                                                                                                                                      if(!_loc40_)
                                                                                                                                                      {
                                                                                                                                                         §§push(_loc24_);
                                                                                                                                                         §§push(-_loc22_);
                                                                                                                                                         break loop278;
                                                                                                                                                      }
                                                                                                                                                      break loop250;
                                                                                                                                                   }
                                                                                                                                                   §§goto(addr0960);
                                                                                                                                                }
                                                                                                                                                if(§§pop())
                                                                                                                                                {
                                                                                                                                                   if(_loc40_)
                                                                                                                                                   {
                                                                                                                                                      break loop251;
                                                                                                                                                   }
                                                                                                                                                   _loc11_ = _loc9_;
                                                                                                                                                   loop286:
                                                                                                                                                   while(true)
                                                                                                                                                   {
                                                                                                                                                      if(_loc39_ || Boolean(_loc3_))
                                                                                                                                                      {
                                                                                                                                                         while(true)
                                                                                                                                                         {
                                                                                                                                                            if(_loc11_ != null)
                                                                                                                                                            {
                                                                                                                                                               _loc10_ = _loc11_.vertex;
                                                                                                                                                               if(_loc40_)
                                                                                                                                                               {
                                                                                                                                                                  break;
                                                                                                                                                               }
                                                                                                                                                               §§push(_loc10_.cameraX);
                                                                                                                                                               if(_loc39_ || Boolean(this))
                                                                                                                                                               {
                                                                                                                                                                  §§push(-§§pop());
                                                                                                                                                               }
                                                                                                                                                               if(§§pop() < _loc10_.cameraZ)
                                                                                                                                                               {
                                                                                                                                                                  if(_loc39_ || Boolean(this))
                                                                                                                                                                  {
                                                                                                                                                                     while(true)
                                                                                                                                                                     {
                                                                                                                                                                        §§push(_loc35_);
                                                                                                                                                                        if(_loc39_ || Boolean(param2))
                                                                                                                                                                        {
                                                                                                                                                                           §§push(§§pop() | 4);
                                                                                                                                                                           if(_loc40_)
                                                                                                                                                                           {
                                                                                                                                                                              break;
                                                                                                                                                                           }
                                                                                                                                                                        }
                                                                                                                                                                        §§push(int(§§pop()));
                                                                                                                                                                        break;
                                                                                                                                                                     }
                                                                                                                                                                     _loc35_ = §§pop();
                                                                                                                                                                     if(!_loc40_)
                                                                                                                                                                     {
                                                                                                                                                                        break;
                                                                                                                                                                     }
                                                                                                                                                                     break loop286;
                                                                                                                                                                  }
                                                                                                                                                                  break;
                                                                                                                                                               }
                                                                                                                                                               continue;
                                                                                                                                                            }
                                                                                                                                                            _loc11_ = _loc11_.next;
                                                                                                                                                         }
                                                                                                                                                      }
                                                                                                                                                      if(_loc11_ == null)
                                                                                                                                                      {
                                                                                                                                                         if(!_loc40_)
                                                                                                                                                         {
                                                                                                                                                            _loc37_.processNext = null;
                                                                                                                                                         }
                                                                                                                                                         break;
                                                                                                                                                      }
                                                                                                                                                   }
                                                                                                                                                   continue loop0;
                                                                                                                                                }
                                                                                                                                                addr0911:
                                                                                                                                                §§push(_loc18_);
                                                                                                                                                §§push(_loc16_);
                                                                                                                                                if(!(_loc40_ && Boolean(_loc3_)))
                                                                                                                                                {
                                                                                                                                                   §§push(§§pop() > -§§pop());
                                                                                                                                                   if(!(_loc39_ || Boolean(_loc3_)))
                                                                                                                                                   {
                                                                                                                                                      continue loop219;
                                                                                                                                                   }
                                                                                                                                                   var _temp_325:* = §§pop();
                                                                                                                                                   §§push(_temp_325);
                                                                                                                                                   §§push(_temp_325);
                                                                                                                                                   if(!_loc39_)
                                                                                                                                                   {
                                                                                                                                                      break loop221;
                                                                                                                                                   }
                                                                                                                                                   if(Boolean(§§pop()))
                                                                                                                                                   {
                                                                                                                                                      addr093e:
                                                                                                                                                      §§pop();
                                                                                                                                                      §§goto(addr0944);
                                                                                                                                                      §§push(_loc21_);
                                                                                                                                                      §§push(-_loc19_);
                                                                                                                                                   }
                                                                                                                                                   §§goto(addr0946);
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                   §§goto(addr0b65);
                                                                                                                                                }
                                                                                                                                             }
                                                                                                                                             else
                                                                                                                                             {
                                                                                                                                                §§goto(addr0b63);
                                                                                                                                             }
                                                                                                                                             §§goto(addr0b65);
                                                                                                                                          }
                                                                                                                                          §§goto(addr0a0b);
                                                                                                                                       }
                                                                                                                                       else
                                                                                                                                       {
                                                                                                                                          §§goto(addr0a64);
                                                                                                                                       }
                                                                                                                                    }
                                                                                                                                    §§goto(addr0c07);
                                                                                                                                 }
                                                                                                                                 §§push(§§pop() > §§pop());
                                                                                                                                 if(!_loc40_)
                                                                                                                                 {
                                                                                                                                    addr0960:
                                                                                                                                    if(§§pop())
                                                                                                                                    {
                                                                                                                                       _loc11_ = _loc9_;
                                                                                                                                       if(!(_loc40_ && Boolean(_loc3_)))
                                                                                                                                       {
                                                                                                                                          loop6:
                                                                                                                                          while(_loc11_ != null)
                                                                                                                                          {
                                                                                                                                             _loc10_ = _loc11_.vertex;
                                                                                                                                             while(true)
                                                                                                                                             {
                                                                                                                                                if(!_loc40_)
                                                                                                                                                {
                                                                                                                                                   §§push(_loc10_.cameraX);
                                                                                                                                                   if(!(_loc40_ && Boolean(this)))
                                                                                                                                                   {
                                                                                                                                                      §§push(-§§pop());
                                                                                                                                                   }
                                                                                                                                                   if(§§pop() < _loc10_.cameraZ)
                                                                                                                                                   {
                                                                                                                                                      _loc11_ = _loc11_.next;
                                                                                                                                                      continue loop6;
                                                                                                                                                   }
                                                                                                                                                   if(!_loc39_)
                                                                                                                                                   {
                                                                                                                                                      break;
                                                                                                                                                   }
                                                                                                                                                }
                                                                                                                                                while(true)
                                                                                                                                                {
                                                                                                                                                   §§push(_loc35_);
                                                                                                                                                   if(!(_loc40_ && Boolean(param1)))
                                                                                                                                                   {
                                                                                                                                                      §§push(§§pop() | 4);
                                                                                                                                                      if(!(_loc39_ || Boolean(param1)))
                                                                                                                                                      {
                                                                                                                                                         break;
                                                                                                                                                      }
                                                                                                                                                   }
                                                                                                                                                   §§push(int(§§pop()));
                                                                                                                                                   break;
                                                                                                                                                }
                                                                                                                                                _loc35_ = §§pop();
                                                                                                                                                break;
                                                                                                                                             }
                                                                                                                                             break;
                                                                                                                                          }
                                                                                                                                       }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                       §§push(_loc35_);
                                                                                                                                       if(!(_loc40_ && Boolean(param2)))
                                                                                                                                       {
                                                                                                                                          _loc35_ = §§pop() | 4;
                                                                                                                                          if(_loc40_ && Boolean(_loc3_))
                                                                                                                                          {
                                                                                                                                             break loop260;
                                                                                                                                          }
                                                                                                                                       }
                                                                                                                                       else
                                                                                                                                       {
                                                                                                                                          §§goto(addr0bf5);
                                                                                                                                       }
                                                                                                                                    }
                                                                                                                                    addr0a0b:
                                                                                                                                    §§push(_loc28_);
                                                                                                                                    if(_loc39_)
                                                                                                                                    {
                                                                                                                                       addr0a13:
                                                                                                                                       if(§§pop())
                                                                                                                                       {
                                                                                                                                          if(!(_loc40_ && Boolean(param1)))
                                                                                                                                          {
                                                                                                                                             addr0a25:
                                                                                                                                             §§push(_loc18_);
                                                                                                                                             break loop241;
                                                                                                                                          }
                                                                                                                                          break loop29;
                                                                                                                                       }
                                                                                                                                       break loop30;
                                                                                                                                    }
                                                                                                                                    break loop206;
                                                                                                                                 }
                                                                                                                                 break;
                                                                                                                              }
                                                                                                                              §§goto(addr0b6c);
                                                                                                                           }
                                                                                                                           _loc37_.processNext = null;
                                                                                                                           break;
                                                                                                                        }
                                                                                                                        _loc11_ = _loc11_.next;
                                                                                                                     }
                                                                                                                     continue loop0;
                                                                                                                  }
                                                                                                                  §§goto(addr0ec6);
                                                                                                                  §§goto(addr0ed5);
                                                                                                               }
                                                                                                               §§goto(addr2fcd);
                                                                                                            }
                                                                                                            §§goto(addr0a25);
                                                                                                         }
                                                                                                         §§goto(addr0d9c);
                                                                                                      }
                                                                                                      §§goto(addr0c7c);
                                                                                                   }
                                                                                                   §§goto(addr0ee0);
                                                                                                }
                                                                                                §§goto(addr0d99);
                                                                                             }
                                                                                             §§goto(addr0e73);
                                                                                          }
                                                                                          §§goto(addr0d51);
                                                                                       }
                                                                                       §§goto(addr0ca1);
                                                                                    }
                                                                                    §§goto(addr0c58);
                                                                                 }
                                                                                 §§goto(addr0a2c);
                                                                              }
                                                                              §§goto(addr0d52);
                                                                           }
                                                                           §§goto(addr0d9d);
                                                                        }
                                                                        §§goto(addr0c67);
                                                                     }
                                                                     §§goto(addr1070);
                                                                  }
                                                                  §§goto(addr0ca4);
                                                               }
                                                               §§goto(addr0eb8);
                                                            }
                                                            §§goto(addr0fb9);
                                                         }
                                                         §§goto(addr0f87);
                                                      }
                                                      §§goto(addr0ca3);
                                                   }
                                                   §§goto(addr0a33);
                                                }
                                                §§goto(addr0d59);
                                             }
                                             §§goto(addr0dde);
                                          }
                                          §§goto(addr0db9);
                                       }
                                       §§goto(addr0a3a);
                                    }
                                    §§goto(addr0c69);
                                 }
                                 §§push(§§pop() > _loc16_);
                                 if(!(_loc39_ || Boolean(param1)))
                                 {
                                    continue loop221;
                                 }
                                 var _temp_298:* = §§pop();
                                 §§goto(addr0b0d);
                                 §§push(_temp_298);
                                 §§push(Boolean(_temp_298));
                              }
                              var _temp_290:* = §§pop() <= _loc16_;
                              addr0a2c:
                              §§push(_temp_290);
                              §§push(_temp_290);
                              if(!_loc40_)
                              {
                                 addr0a33:
                                 while(true)
                                 {
                                    if(§§pop())
                                    {
                                       §§pop();
                                       addr0a3a:
                                       §§push(_loc21_ <= _loc19_);
                                       if(!(_loc39_ || Boolean(param1)))
                                       {
                                          break;
                                       }
                                    }
                                    var _temp_292:* = §§pop();
                                    loop244:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_temp_292);
                                          if(Boolean(_temp_292))
                                          {
                                             §§pop();
                                             §§push(_loc24_);
                                             if(_loc40_)
                                             {
                                                break;
                                             }
                                             §§push(§§pop() <= _loc22_);
                                             if(_loc40_)
                                             {
                                                break loop244;
                                             }
                                             §§push(Boolean(§§pop()));
                                          }
                                          if(§§pop())
                                          {
                                             _loc11_ = _loc9_;
                                             while(true)
                                             {
                                                if(_loc39_ || Boolean(_loc3_))
                                                {
                                                   while(true)
                                                   {
                                                      if(_loc11_ != null)
                                                      {
                                                         _loc10_ = _loc11_.vertex;
                                                         if(!_loc39_)
                                                         {
                                                            break;
                                                         }
                                                         if(_loc10_.cameraX >= _loc10_.cameraZ)
                                                         {
                                                            continue;
                                                         }
                                                         if(!_loc40_)
                                                         {
                                                            break;
                                                         }
                                                      }
                                                      _loc11_ = _loc11_.next;
                                                   }
                                                   §§push(_loc35_);
                                                   if(_loc39_)
                                                   {
                                                      §§push(§§pop() | 8);
                                                      if(_loc39_)
                                                      {
                                                         §§push(int(§§pop()));
                                                      }
                                                   }
                                                   _loc35_ = §§pop();
                                                   if(!_loc39_)
                                                   {
                                                      break;
                                                   }
                                                   §§goto(addr0abc);
                                                }
                                                if(_loc11_ == null)
                                                {
                                                   if(!(_loc40_ && Boolean(param2)))
                                                   {
                                                      _loc37_.processNext = null;
                                                   }
                                                   break;
                                                }
                                                break loop30;
                                             }
                                             continue loop0;
                                          }
                                          while(true)
                                          {
                                             §§push(_loc18_);
                                             if(_loc39_)
                                             {
                                                break loop242;
                                             }
                                             §§goto(addr0d49);
                                          }
                                          §§goto(addr0dde);
                                       }
                                       §§goto(addr0ed7);
                                    }
                                    §§goto(addr0d60);
                                 }
                                 §§goto(addr0ee0);
                              }
                              addr0b0d:
                              if(!§§pop())
                              {
                                 break loop206;
                              }
                              if(_loc40_)
                              {
                                 continue loop219;
                              }
                              §§pop();
                              if(!(_loc40_ && Boolean(_loc3_)))
                              {
                                 §§push(_loc21_);
                                 if(_loc40_ && Boolean(param2))
                                 {
                                    break loop236;
                                 }
                                 §§push(§§pop() > _loc19_);
                                 if(!_loc40_)
                                 {
                                    §§push(Boolean(§§pop()));
                                    break loop206;
                                 }
                                 §§goto(addr0c58);
                              }
                              else
                              {
                                 §§goto(addr0c1b);
                              }
                           }
                           §§goto(addr0e9d);
                        }
                        §§goto(addr0fa4);
                     }
                     §§goto(addr0ead);
                  }
                  var _temp_283:* = §§pop();
                  §§push(_temp_283);
                  §§push(_temp_283);
                  if(!_loc39_)
                  {
                     break loop218;
                  }
                  loop235:
                  while(true)
                  {
                     loop236:
                     while(true)
                     {
                        while(true)
                        {
                           if(Boolean(§§pop()))
                           {
                              addr0b4c:
                              §§pop();
                              if(!_loc39_)
                              {
                                 break;
                              }
                              §§push(_loc24_);
                              if(!(_loc39_ || Boolean(this)))
                              {
                                 break loop236;
                              }
                              §§push(§§pop() > _loc22_);
                              if(!_loc40_)
                              {
                                 addr0b6c:
                                 §§push(Boolean(§§pop()));
                              }
                              else
                              {
                                 §§goto(addr0c58);
                              }
                           }
                           if(!§§pop())
                           {
                              addr0bf5:
                              §§push(_loc35_);
                              §§push(8);
                              if(!(_loc40_ && Boolean(param2)))
                              {
                                 addr0c07:
                                 _loc35_ = §§pop() | §§pop();
                                 addr0c06:
                                 if(_loc39_)
                                 {
                                    break loop30;
                                 }
                                 break loop235;
                              }
                              break loop31;
                           }
                           if(_loc39_ || Boolean(param2))
                           {
                              addr0b7f:
                              _loc11_ = _loc9_;
                              if(_loc39_ || Boolean(_loc3_))
                              {
                                 loop8:
                                 while(_loc11_ != null)
                                 {
                                    _loc10_ = _loc11_.vertex;
                                    while(true)
                                    {
                                       if(_loc39_)
                                       {
                                          if(_loc10_.cameraX < _loc10_.cameraZ)
                                          {
                                             _loc11_ = _loc11_.next;
                                             continue loop8;
                                          }
                                          if(!_loc39_)
                                          {
                                             break;
                                          }
                                       }
                                       §§push(_loc35_);
                                       if(_loc39_ || Boolean(_loc3_))
                                       {
                                          §§push(§§pop() | 8);
                                          if(!(_loc40_ && Boolean(param2)))
                                          {
                                             §§push(int(§§pop()));
                                          }
                                       }
                                       _loc35_ = §§pop();
                                       break;
                                    }
                                    break;
                                 }
                              }
                              break loop30;
                           }
                           continue loop215;
                        }
                        §§goto(addr0d91);
                     }
                     §§goto(addr0c99);
                  }
                  §§goto(addr0c97);
               }
               loop207:
               while(true)
               {
                  loop208:
                  while(true)
                  {
                     loop214:
                     while(true)
                     {
                        loop217:
                        while(true)
                        {
                           loop218:
                           while(true)
                           {
                              loop219:
                              while(true)
                              {
                                 loop220:
                                 while(true)
                                 {
                                    if(_loc29_)
                                    {
                                       if(!_loc40_)
                                       {
                                          addr0c1b:
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
                                                         loop229:
                                                         while(true)
                                                         {
                                                            §§push(_loc18_ <= -_loc17_);
                                                            if(_loc39_ || Boolean(this))
                                                            {
                                                               §§push(Boolean(§§pop()));
                                                               if(_loc40_ && Boolean(param2))
                                                               {
                                                                  break loop208;
                                                               }
                                                               var _temp_268:* = §§pop();
                                                               §§push(_temp_268);
                                                               §§push(_temp_268);
                                                               if(_loc40_ && Boolean(param2))
                                                               {
                                                                  break loop207;
                                                               }
                                                               while(true)
                                                               {
                                                                  if(Boolean(§§pop()))
                                                                  {
                                                                     if(!_loc39_)
                                                                     {
                                                                        break;
                                                                     }
                                                                     §§pop();
                                                                     if(!(_loc39_ || Boolean(_loc3_)))
                                                                     {
                                                                        break loop229;
                                                                     }
                                                                     §§push(_loc21_ <= -_loc20_);
                                                                     if(_loc40_ && Boolean(param1))
                                                                     {
                                                                        continue loop31;
                                                                     }
                                                                     §§push(Boolean(§§pop()));
                                                                  }
                                                                  addr0c7c:
                                                                  var _temp_272:* = §§pop();
                                                                  §§push(_temp_272);
                                                                  if(Boolean(_temp_272))
                                                                  {
                                                                     if(!_loc40_)
                                                                     {
                                                                        §§pop();
                                                                        if(!(_loc40_ && Boolean(this)))
                                                                        {
                                                                           addr0c97:
                                                                           addr0c99:
                                                                           §§push(_loc24_);
                                                                           §§push(_loc23_);
                                                                           if(!_loc40_)
                                                                           {
                                                                              addr0ca1:
                                                                              §§push(§§pop() <= -§§pop());
                                                                              break;
                                                                           }
                                                                           break loop227;
                                                                        }
                                                                        break loop229;
                                                                     }
                                                                  }
                                                                  addr0ca4:
                                                                  if(§§pop())
                                                                  {
                                                                     _loc11_ = _loc9_;
                                                                     loop231:
                                                                     while(true)
                                                                     {
                                                                        loop232:
                                                                        while(true)
                                                                        {
                                                                           if(!(_loc40_ && Boolean(_loc3_)))
                                                                           {
                                                                              while(true)
                                                                              {
                                                                                 if(_loc11_ != null)
                                                                                 {
                                                                                    _loc10_ = _loc11_.vertex;
                                                                                    if(!(_loc39_ || Boolean(_loc3_)))
                                                                                    {
                                                                                       break;
                                                                                    }
                                                                                    §§push(_loc10_.cameraY);
                                                                                    if(!_loc40_)
                                                                                    {
                                                                                       §§push(-§§pop());
                                                                                    }
                                                                                    if(§§pop() < _loc10_.cameraZ)
                                                                                    {
                                                                                       if(!_loc40_)
                                                                                       {
                                                                                          while(true)
                                                                                          {
                                                                                             §§push(_loc35_);
                                                                                             if(!_loc40_)
                                                                                             {
                                                                                                §§push(§§pop() | 0x10);
                                                                                                if(!(_loc39_ || Boolean(param1)))
                                                                                                {
                                                                                                   break;
                                                                                                }
                                                                                             }
                                                                                             §§push(int(§§pop()));
                                                                                             break;
                                                                                          }
                                                                                          _loc35_ = §§pop();
                                                                                          if(_loc39_ || Boolean(param2))
                                                                                          {
                                                                                             break;
                                                                                          }
                                                                                          break loop231;
                                                                                       }
                                                                                       break loop232;
                                                                                    }
                                                                                    continue;
                                                                                 }
                                                                                 _loc11_ = _loc11_.next;
                                                                              }
                                                                           }
                                                                           if(_loc11_ == null)
                                                                           {
                                                                              if(_loc39_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              break loop231;
                                                                           }
                                                                           §§goto(addr0e7b);
                                                                        }
                                                                        _loc37_.processNext = null;
                                                                        break;
                                                                     }
                                                                     continue loop0;
                                                                  }
                                                                  addr0d49:
                                                                  §§push(_loc18_);
                                                                  §§push(_loc17_);
                                                                  if(_loc40_)
                                                                  {
                                                                     break loop227;
                                                                  }
                                                                  §§push(§§pop() > -§§pop());
                                                                  if(_loc40_)
                                                                  {
                                                                     break loop220;
                                                                  }
                                                                  §§push(Boolean(§§pop()));
                                                                  if(_loc40_)
                                                                  {
                                                                     break loop219;
                                                                  }
                                                                  var _temp_278:* = §§pop();
                                                                  §§push(_temp_278);
                                                                  §§push(_temp_278);
                                                                  if(_loc40_ && Boolean(_loc3_))
                                                                  {
                                                                     break loop226;
                                                                  }
                                                                  §§push(Boolean(§§pop()));
                                                                  if(_loc40_ && Boolean(_loc3_))
                                                                  {
                                                                     break loop218;
                                                                  }
                                                                  if(!§§pop())
                                                                  {
                                                                     break loop225;
                                                                  }
                                                                  if(!(_loc40_ && Boolean(_loc3_)))
                                                                  {
                                                                     §§pop();
                                                                     addr0d91:
                                                                     §§push(_loc21_);
                                                                     if(_loc39_)
                                                                     {
                                                                        addr0d9d:
                                                                        addr0d99:
                                                                        addr0d9c:
                                                                        §§push(§§pop() > -_loc20_);
                                                                        if(_loc39_ || Boolean(_loc3_))
                                                                        {
                                                                           break loop225;
                                                                        }
                                                                        continue loop31;
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     §§goto(addr0ead);
                                                                  }
                                                                  §§goto(addr0eb6);
                                                               }
                                                               §§goto(addr0ca4);
                                                            }
                                                            §§goto(addr0d9d);
                                                         }
                                                         §§goto(addr0dde);
                                                      }
                                                      §§goto(addr0dd4);
                                                   }
                                                   if(§§pop())
                                                   {
                                                      if(_loc39_)
                                                      {
                                                         §§pop();
                                                         addr0db9:
                                                         §§push(_loc24_);
                                                         if(_loc39_)
                                                         {
                                                            §§push(_loc23_);
                                                            if(_loc39_ || Boolean(_loc3_))
                                                            {
                                                               break loop227;
                                                            }
                                                            break loop224;
                                                         }
                                                         break loop223;
                                                      }
                                                      §§goto(addr0fbe);
                                                   }
                                                   addr0dd4:
                                                   if(§§pop())
                                                   {
                                                      if(_loc40_)
                                                      {
                                                         break loop217;
                                                      }
                                                      addr0dde:
                                                      _loc11_ = _loc9_;
                                                      if(_loc39_ || Boolean(this))
                                                      {
                                                         loop10:
                                                         while(_loc11_ != null)
                                                         {
                                                            _loc10_ = _loc11_.vertex;
                                                            while(true)
                                                            {
                                                               if(!_loc40_)
                                                               {
                                                                  §§push(_loc10_.cameraY);
                                                                  if(_loc39_ || Boolean(this))
                                                                  {
                                                                     §§push(-§§pop());
                                                                  }
                                                                  if(§§pop() < _loc10_.cameraZ)
                                                                  {
                                                                     _loc11_ = _loc11_.next;
                                                                     continue loop10;
                                                                  }
                                                                  if(_loc40_ && Boolean(_loc3_))
                                                                  {
                                                                     break;
                                                                  }
                                                               }
                                                               §§push(_loc35_);
                                                               if(_loc39_)
                                                               {
                                                                  §§push(§§pop() | 0x10);
                                                                  if(_loc39_ || Boolean(param2))
                                                                  {
                                                                     §§push(int(§§pop()));
                                                                  }
                                                               }
                                                               _loc35_ = §§pop();
                                                               break;
                                                            }
                                                            break;
                                                         }
                                                      }
                                                   }
                                                   else
                                                   {
                                                      §§push(_loc35_);
                                                      §§push(16);
                                                      if(!_loc40_)
                                                      {
                                                         §§push(§§pop() | §§pop());
                                                         if(!_loc40_)
                                                         {
                                                            addr0e73:
                                                            _loc35_ = int(§§pop());
                                                            if(_loc40_)
                                                            {
                                                               break loop29;
                                                            }
                                                            addr0e7b:
                                                            §§push(_loc30_);
                                                            if(_loc39_)
                                                            {
                                                               break loop219;
                                                            }
                                                            §§goto(addr0fe0);
                                                         }
                                                         else
                                                         {
                                                            §§goto(addr105f);
                                                         }
                                                      }
                                                      §§goto(addr106f);
                                                   }
                                                }
                                                var _temp_261:* = §§pop();
                                                §§push(_temp_261);
                                                §§push(Boolean(_temp_261));
                                                break loop226;
                                             }
                                             §§goto(addr0edf);
                                          }
                                          §§goto(addr0fa6);
                                       }
                                       else
                                       {
                                          §§goto(addr0feb);
                                       }
                                    }
                                    §§goto(addr0e7b);
                                 }
                                 §§goto(addr0faa);
                              }
                              if(!§§pop())
                              {
                                 break loop214;
                              }
                              if(!(_loc39_ || Boolean(param1)))
                              {
                                 break loop214;
                              }
                              §§push(_loc18_);
                              if(!_loc40_)
                              {
                                 var _temp_259:* = §§pop() <= _loc17_;
                                 addr0e9d:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_temp_259);
                                       §§push(_temp_259);
                                       if(_loc39_)
                                       {
                                          break loop207;
                                       }
                                       §§goto(addr0f9f);
                                    }
                                    §§goto(addr0fa6);
                                 }
                                 §§goto(addr0fba);
                              }
                              §§goto(addr0fcf);
                           }
                           §§goto(addr0ea9);
                        }
                        §§goto(addr2fc7);
                     }
                     §§goto(addr1073);
                  }
                  if(§§pop())
                  {
                     _loc11_ = _loc9_;
                     loop215:
                     while(true)
                     {
                        loop216:
                        while(true)
                        {
                           if(!_loc40_)
                           {
                              while(_loc11_ != null)
                              {
                                 _loc10_ = _loc11_.vertex;
                                 if(_loc40_ && Boolean(_loc3_))
                                 {
                                    break loop216;
                                 }
                                 if(_loc10_.cameraY < _loc10_.cameraZ)
                                 {
                                    if(_loc39_)
                                    {
                                       §§push(_loc35_);
                                       if(_loc39_ || Boolean(param1))
                                       {
                                          §§push(§§pop() | 0x20);
                                          if(!_loc40_)
                                          {
                                             §§push(int(§§pop()));
                                          }
                                       }
                                       _loc35_ = §§pop();
                                       if(!(_loc40_ && Boolean(param1)))
                                       {
                                          break;
                                       }
                                       break loop215;
                                    }
                                    break loop216;
                                 }
                                 _loc11_ = _loc11_.next;
                              }
                           }
                           if(_loc11_ == null)
                           {
                              if(_loc39_ || Boolean(param2))
                              {
                                 break;
                              }
                              break loop215;
                           }
                           break loop214;
                        }
                        _loc37_.processNext = null;
                        break;
                     }
                     continue loop0;
                  }
                  §§push(_loc18_);
                  if(_loc39_)
                  {
                     §§goto(addr0f87);
                     §§push(_loc17_);
                  }
                  §§goto(addr0fa6);
               }
               addr0ea9:
               loop209:
               while(true)
               {
                  if(Boolean(§§pop()))
                  {
                     addr0ead:
                     §§pop();
                     §§push(_loc21_);
                     if(_loc40_)
                     {
                        break;
                     }
                     §§push(§§pop() <= _loc20_);
                  }
                  var _temp_247:* = §§pop();
                  loop210:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_temp_247);
                        §§push(Boolean(_temp_247));
                        if(!_loc40_)
                        {
                           if(!§§pop())
                           {
                              break loop208;
                           }
                           §§pop();
                           while(true)
                           {
                              if(_loc39_ || Boolean(param2))
                              {
                                 addr0ed5:
                                 §§push(_loc24_);
                                 break loop209;
                              }
                              §§goto(addr2fcd);
                           }
                           §§goto(addr2fd6);
                        }
                        addr0f98:
                        addr0fba:
                        §§push(Boolean(§§pop()));
                        if(_loc39_)
                        {
                           addr0f9f:
                           if(§§pop())
                           {
                              break loop210;
                           }
                           addr0faa:
                           var _temp_249:* = §§pop();
                           §§push(_temp_249);
                           §§push(_temp_249);
                           if(_loc39_ || Boolean(_loc3_))
                           {
                              addr0fb9:
                              §§push(Boolean(§§pop()));
                           }
                        }
                        if(!§§pop())
                        {
                           continue loop31;
                        }
                        §§pop();
                        if(!(_loc40_ && Boolean(param2)))
                        {
                           break loop29;
                        }
                        §§goto(addr2fcd);
                     }
                     addr0fa6:
                     §§goto(addr0faa);
                  }
                  §§pop();
                  addr0fa4:
                  §§push(_loc21_);
                  break loop211;
               }
               addr0ed7:
               while(true)
               {
                  addr0f87:
                  §§push(_loc23_);
                  if(_loc39_)
                  {
                     addr0edf:
                     addr0ee0:
                     §§push(§§pop() <= §§pop());
                     break loop208;
                  }
                  §§push(§§pop() > §§pop());
                  if(_loc40_ && Boolean(param2))
                  {
                     break loop210;
                  }
                  var _temp_253:* = Boolean(§§pop());
                  §§goto(addr0f98);
                  §§push(_temp_253);
                  §§push(_temp_253);
               }
               §§goto(addr0fa6);
            }
            addr0fcf:
            §§push(_loc24_ > _loc23_);
            if(_loc39_ || Boolean(param2))
            {
               addr0fe0:
               §§push(Boolean(§§pop()));
            }
            loop31:
            while(true)
            {
               while(true)
               {
                  if(§§pop())
                  {
                     if(!_loc39_)
                     {
                        break;
                     }
                     _loc11_ = _loc9_;
                     if(_loc39_)
                     {
                        loop12:
                        while(_loc11_ != null)
                        {
                           _loc10_ = _loc11_.vertex;
                           while(true)
                           {
                              if(!(_loc40_ && Boolean(param2)))
                              {
                                 if(_loc10_.cameraY < _loc10_.cameraZ)
                                 {
                                    _loc11_ = _loc11_.next;
                                    continue loop12;
                                 }
                                 if(!_loc39_)
                                 {
                                    break;
                                 }
                              }
                              §§push(_loc35_);
                              if(_loc39_ || Boolean(this))
                              {
                                 §§push(§§pop() | 0x20);
                                 if(!_loc40_)
                                 {
                                    §§push(int(§§pop()));
                                 }
                              }
                              _loc35_ = §§pop();
                              break;
                           }
                           break;
                        }
                     }
                     addr1073:
                     §§push(_loc35_);
                  }
                  else
                  {
                     §§push(_loc35_);
                     if(_loc39_)
                     {
                        addr105f:
                        §§push(32);
                        if(!(_loc39_ || Boolean(param2)))
                        {
                           break loop31;
                        }
                        _loc35_ = §§pop() | §§pop();
                        §§goto(addr1073);
                     }
                  }
                  §§push(0);
                  break loop31;
               }
               _loc12_ = null;
               _loc13_ = null;
               _loc11_ = _loc37_.wrapper;
               while(_loc11_ != null)
               {
                  _loc15_ = _loc11_.create();
                  while(true)
                  {
                     if(!_loc40_)
                     {
                        _loc15_.vertex = _loc11_.vertex;
                        if(_loc40_)
                        {
                           break;
                        }
                     }
                     if(_loc12_ != null)
                     {
                        if(_loc39_ || Boolean(this))
                        {
                           _loc13_.next = _loc15_;
                        }
                        break;
                     }
                     _loc12_ = _loc15_;
                     break;
                  }
                  _loc13_ = _loc15_;
                  _loc11_ = _loc11_.next;
               }
               loop36:
               while(true)
               {
                  loop37:
                  while(true)
                  {
                     loop172:
                     while(true)
                     {
                        loop173:
                        while(true)
                        {
                           loop174:
                           while(true)
                           {
                              if(!(_loc40_ && Boolean(this)))
                              {
                                 loop175:
                                 while(true)
                                 {
                                    loop176:
                                    while(true)
                                    {
                                       §§push(_loc35_);
                                       if(!_loc40_)
                                       {
                                          §§push(1);
                                          if(!(_loc40_ && Boolean(this)))
                                          {
                                             §§push(Boolean(§§pop() & §§pop()));
                                             if(!_loc39_)
                                             {
                                                break loop174;
                                             }
                                             if(§§pop())
                                             {
                                                if(_loc40_ && Boolean(param1))
                                                {
                                                   break loop175;
                                                }
                                                §§push(_loc13_.vertex);
                                                if(!(_loc40_ && Boolean(this)))
                                                {
                                                   _loc6_ = §§pop();
                                                   if(_loc39_)
                                                   {
                                                      §§push(_loc6_.cameraZ);
                                                      if(!_loc40_)
                                                      {
                                                         §§push(Number(§§pop()));
                                                      }
                                                      _loc18_ = §§pop();
                                                   }
                                                   _loc11_ = _loc12_;
                                                   _loc12_ = null;
                                                   _loc13_ = null;
                                                   while(true)
                                                   {
                                                      if(_loc39_ || Boolean(param2))
                                                      {
                                                         loop14:
                                                         while(_loc11_ != null)
                                                         {
                                                            _loc14_ = _loc11_.next;
                                                            _loc7_ = _loc11_.vertex;
                                                            loop178:
                                                            while(true)
                                                            {
                                                               §§push(_loc7_.cameraZ);
                                                               if(!(_loc40_ && Boolean(param1)))
                                                               {
                                                                  _loc21_ = §§pop();
                                                                  if(!(_loc39_ || Boolean(param2)))
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(_loc21_);
                                                               }
                                                               loop179:
                                                               while(true)
                                                               {
                                                                  loop180:
                                                                  while(true)
                                                                  {
                                                                     loop181:
                                                                     while(true)
                                                                     {
                                                                        loop182:
                                                                        while(true)
                                                                        {
                                                                           loop183:
                                                                           while(true)
                                                                           {
                                                                              loop184:
                                                                              while(true)
                                                                              {
                                                                                 §§push(_loc31_);
                                                                                 if(!_loc40_)
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
                                                                                             §§push(§§pop() > §§pop());
                                                                                             if(!(_loc40_ && Boolean(this)))
                                                                                             {
                                                                                                var _temp_214:* = Boolean(§§pop());
                                                                                                loop188:
                                                                                                while(true)
                                                                                                {
                                                                                                   §§push(_temp_214);
                                                                                                   §§push(_temp_214);
                                                                                                   if(_loc39_)
                                                                                                   {
                                                                                                      §§push(Boolean(§§pop()));
                                                                                                      if(!(_loc39_ || Boolean(this)))
                                                                                                      {
                                                                                                         break;
                                                                                                      }
                                                                                                   }
                                                                                                   loop189:
                                                                                                   while(true)
                                                                                                   {
                                                                                                      while(true)
                                                                                                      {
                                                                                                         if(§§pop())
                                                                                                         {
                                                                                                            §§pop();
                                                                                                            if(!(_loc39_ || Boolean(_loc3_)))
                                                                                                            {
                                                                                                               break loop178;
                                                                                                            }
                                                                                                            §§push(_loc18_ <= _loc31_);
                                                                                                            if(_loc40_)
                                                                                                            {
                                                                                                               break;
                                                                                                            }
                                                                                                            §§push(Boolean(§§pop()));
                                                                                                            if(_loc40_)
                                                                                                            {
                                                                                                               break loop189;
                                                                                                            }
                                                                                                         }
                                                                                                         var _temp_220:* = §§pop();
                                                                                                         while(true)
                                                                                                         {
                                                                                                            §§push(_temp_220);
                                                                                                            §§push(_temp_220);
                                                                                                            if(!(_loc40_ && Boolean(param1)))
                                                                                                            {
                                                                                                               §§push(Boolean(§§pop()));
                                                                                                               if(_loc40_)
                                                                                                               {
                                                                                                                  break;
                                                                                                               }
                                                                                                            }
                                                                                                            if(!§§pop())
                                                                                                            {
                                                                                                               break loop189;
                                                                                                            }
                                                                                                            break loop187;
                                                                                                         }
                                                                                                         addr125d:
                                                                                                         §§push(Boolean(§§pop()));
                                                                                                         break loop188;
                                                                                                      }
                                                                                                      var _temp_222:* = §§pop();
                                                                                                      §§push(_temp_222);
                                                                                                      §§push(_temp_222);
                                                                                                      if(_loc40_ && Boolean(param2))
                                                                                                      {
                                                                                                         break loop188;
                                                                                                      }
                                                                                                      §§goto(addr125d);
                                                                                                   }
                                                                                                   §§pop();
                                                                                                   if(_loc40_ && Boolean(param2))
                                                                                                   {
                                                                                                      break loop181;
                                                                                                   }
                                                                                                   §§push(_loc21_);
                                                                                                   if(!(_loc39_ || Boolean(param1)))
                                                                                                   {
                                                                                                      break loop186;
                                                                                                   }
                                                                                                   §§push(§§pop() <= _loc31_);
                                                                                                   if(!(_loc40_ && Boolean(param1)))
                                                                                                   {
                                                                                                      break loop190;
                                                                                                   }
                                                                                                }
                                                                                                if(!§§pop())
                                                                                                {
                                                                                                   break;
                                                                                                }
                                                                                                if(_loc40_)
                                                                                                {
                                                                                                   break loop185;
                                                                                                }
                                                                                             }
                                                                                             §§pop();
                                                                                             §§push(_loc18_);
                                                                                             if(!_loc40_)
                                                                                             {
                                                                                                §§push(§§pop() > _loc31_);
                                                                                                if(_loc39_)
                                                                                                {
                                                                                                   break loop185;
                                                                                                }
                                                                                                break;
                                                                                             }
                                                                                             break loop184;
                                                                                          }
                                                                                          §§goto(addr127b);
                                                                                       }
                                                                                       §§push(_loc21_ - _loc18_);
                                                                                       if(_loc40_)
                                                                                       {
                                                                                          break loop179;
                                                                                       }
                                                                                    }
                                                                                    addr127b:
                                                                                    if(Boolean(§§pop()))
                                                                                    {
                                                                                       if(_loc39_ || Boolean(param1))
                                                                                       {
                                                                                          §§push(_loc31_);
                                                                                          §§push(_loc18_);
                                                                                          if(!_loc40_)
                                                                                          {
                                                                                             §§push(§§pop() - §§pop());
                                                                                             if(!_loc40_)
                                                                                             {
                                                                                                break loop186;
                                                                                             }
                                                                                             break loop180;
                                                                                          }
                                                                                          break loop179;
                                                                                       }
                                                                                       break loop182;
                                                                                    }
                                                                                    break loop183;
                                                                                 }
                                                                                 §§push(§§pop() / §§pop());
                                                                                 if(!_loc40_)
                                                                                 {
                                                                                    break loop180;
                                                                                 }
                                                                                 break;
                                                                              }
                                                                              §§push(_loc31_);
                                                                              break loop179;
                                                                           }
                                                                           §§push(_loc21_);
                                                                           break loop184;
                                                                        }
                                                                        §§goto(addr1587);
                                                                     }
                                                                     §§goto(addr1535);
                                                                  }
                                                                  _loc36_ = §§pop();
                                                                  if(_loc39_)
                                                                  {
                                                                     break loop178;
                                                                  }
                                                                  §§goto(addr152e);
                                                               }
                                                               if(§§pop() > §§pop())
                                                               {
                                                                  addr152e:
                                                                  if(_loc12_ != null)
                                                                  {
                                                                     addr1535:
                                                                     _loc13_.next = _loc11_;
                                                                  }
                                                                  else
                                                                  {
                                                                     _loc12_ = _loc11_;
                                                                  }
                                                                  _loc13_ = _loc11_;
                                                                  if(!(_loc40_ && Boolean(param1)))
                                                                  {
                                                                     _loc11_.next = null;
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  _loc11_.vertex = null;
                                                                  if(_loc39_ || Boolean(param1))
                                                                  {
                                                                     _loc11_.next = Wrapper.collector;
                                                                     Wrapper.collector = _loc11_;
                                                                  }
                                                               }
                                                               addr1587:
                                                               _loc6_ = _loc7_;
                                                               if(!_loc40_)
                                                               {
                                                                  §§push(_loc21_);
                                                                  if(_loc39_ || Boolean(param2))
                                                                  {
                                                                     §§push(Number(§§pop()));
                                                                  }
                                                                  _loc18_ = §§pop();
                                                               }
                                                               _loc11_ = _loc14_;
                                                               continue loop14;
                                                            }
                                                            _loc10_ = _loc7_.create();
                                                            this.lastVertex.next = _loc10_;
                                                            this.lastVertex = _loc10_;
                                                            §§push(_loc10_);
                                                            §§push(_loc6_.cameraX);
                                                            if(!_loc40_)
                                                            {
                                                               loop192:
                                                               while(true)
                                                               {
                                                                  while(true)
                                                                  {
                                                                     §§push(_loc7_.cameraX);
                                                                     if(_loc39_)
                                                                     {
                                                                        §§push(_loc6_.cameraX);
                                                                        if(_loc40_)
                                                                        {
                                                                           break;
                                                                        }
                                                                        §§push(§§pop() - §§pop());
                                                                        if(_loc40_ && Boolean(_loc3_))
                                                                        {
                                                                           break loop192;
                                                                        }
                                                                     }
                                                                     §§push(_loc36_);
                                                                     break;
                                                                  }
                                                                  §§push(§§pop() * §§pop());
                                                                  break;
                                                               }
                                                            }
                                                            §§pop().alternativa3d::cameraX = §§pop();
                                                            if(!(_loc40_ && Boolean(param2)))
                                                            {
                                                               §§push(_loc10_);
                                                               §§push(_loc6_.cameraY);
                                                               if(!_loc40_)
                                                               {
                                                                  §§push(_loc7_.cameraY);
                                                                  if(!_loc40_)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc6_.cameraY);
                                                                        if(_loc39_ || Boolean(param2))
                                                                        {
                                                                           §§push(§§pop() - §§pop());
                                                                           if(!_loc39_)
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(_loc36_);
                                                                        }
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§push(§§pop() + §§pop());
                                                               }
                                                               §§pop().alternativa3d::cameraY = §§pop();
                                                               if(_loc39_ || Boolean(param1))
                                                               {
                                                                  §§push(_loc10_);
                                                                  §§push(_loc18_);
                                                                  if(_loc39_)
                                                                  {
                                                                     §§push(_loc21_);
                                                                     if(_loc39_ || Boolean(param1))
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc18_);
                                                                           if(_loc39_ || Boolean(_loc3_))
                                                                           {
                                                                              §§push(§§pop() - §§pop());
                                                                              if(!_loc39_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(_loc36_);
                                                                           }
                                                                           §§push(§§pop() * §§pop());
                                                                           break;
                                                                        }
                                                                     }
                                                                     §§push(§§pop() + §§pop());
                                                                  }
                                                                  §§pop().alternativa3d::cameraZ = §§pop();
                                                                  §§push(_loc10_);
                                                                  §§push(_loc6_.x);
                                                                  if(!_loc40_)
                                                                  {
                                                                     §§push(_loc7_.x);
                                                                     if(!(_loc40_ && Boolean(param1)))
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc6_.x);
                                                                           if(!_loc40_)
                                                                           {
                                                                              §§push(§§pop() - §§pop());
                                                                              if(!_loc39_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(_loc36_);
                                                                           }
                                                                           §§push(§§pop() * §§pop());
                                                                           break;
                                                                        }
                                                                     }
                                                                     §§push(§§pop() + §§pop());
                                                                  }
                                                                  §§pop().x = §§pop();
                                                               }
                                                            }
                                                            §§push(_loc10_);
                                                            §§push(_loc6_.y);
                                                            if(!(_loc40_ && Boolean(_loc3_)))
                                                            {
                                                               §§push(_loc7_.y);
                                                               if(!(_loc40_ && Boolean(param2)))
                                                               {
                                                                  while(true)
                                                                  {
                                                                     §§push(_loc6_.y);
                                                                     if(!(_loc40_ && Boolean(param2)))
                                                                     {
                                                                        §§push(§§pop() - §§pop());
                                                                        if(!(_loc39_ || Boolean(param2)))
                                                                        {
                                                                           break;
                                                                        }
                                                                        §§push(_loc36_);
                                                                     }
                                                                     §§push(§§pop() * §§pop());
                                                                     break;
                                                                  }
                                                               }
                                                               §§push(§§pop() + §§pop());
                                                            }
                                                            §§pop().y = §§pop();
                                                            while(true)
                                                            {
                                                               if(_loc39_ || Boolean(this))
                                                               {
                                                                  §§push(_loc10_);
                                                                  §§push(_loc6_.z);
                                                                  if(!(_loc40_ && Boolean(_loc3_)))
                                                                  {
                                                                     loop199:
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc7_.z);
                                                                           if(_loc39_ || Boolean(this))
                                                                           {
                                                                              §§push(_loc6_.z);
                                                                              if(!_loc39_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(§§pop() - §§pop());
                                                                              if(_loc40_)
                                                                              {
                                                                                 break loop199;
                                                                              }
                                                                           }
                                                                           §§push(_loc36_);
                                                                           break;
                                                                        }
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§pop().z = §§pop();
                                                                  if(!(_loc39_ || Boolean(param2)))
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(_loc10_);
                                                                  §§push(_loc6_.u);
                                                                  if(!(_loc40_ && Boolean(param1)))
                                                                  {
                                                                     loop201:
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc7_.u);
                                                                           if(_loc39_ || Boolean(this))
                                                                           {
                                                                              §§push(_loc6_.u);
                                                                              if(_loc40_ && Boolean(param1))
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(§§pop() - §§pop());
                                                                              if(_loc40_)
                                                                              {
                                                                                 break loop201;
                                                                              }
                                                                           }
                                                                           §§push(_loc36_);
                                                                           break;
                                                                        }
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§pop().u = §§pop();
                                                               }
                                                               §§push(_loc10_);
                                                               §§push(_loc6_.v);
                                                               if(_loc39_)
                                                               {
                                                                  loop203:
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc7_.v);
                                                                        if(!(_loc40_ && Boolean(this)))
                                                                        {
                                                                           §§push(_loc6_.v);
                                                                           if(_loc40_)
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(§§pop() - §§pop());
                                                                           if(_loc40_ && Boolean(_loc3_))
                                                                           {
                                                                              break loop203;
                                                                           }
                                                                        }
                                                                        §§push(_loc36_);
                                                                        break;
                                                                     }
                                                                     §§push(§§pop() * §§pop());
                                                                     break;
                                                                  }
                                                               }
                                                               §§pop().v = §§pop();
                                                               break;
                                                            }
                                                            _loc15_ = _loc11_.create();
                                                            while(true)
                                                            {
                                                               if(!_loc40_)
                                                               {
                                                                  _loc15_.vertex = _loc10_;
                                                                  if(_loc40_)
                                                                  {
                                                                     break;
                                                                  }
                                                               }
                                                               if(_loc12_ != null)
                                                               {
                                                                  if(_loc39_)
                                                                  {
                                                                     _loc13_.next = _loc15_;
                                                                  }
                                                                  break;
                                                               }
                                                               addr1520:
                                                               _loc12_ = _loc15_;
                                                               _loc13_ = _loc15_;
                                                               break loop183;
                                                            }
                                                            §§goto(addr1520);
                                                         }
                                                         if(_loc40_)
                                                         {
                                                            break;
                                                         }
                                                         if(_loc12_ != null)
                                                         {
                                                            addr15cf:
                                                            §§push(_loc35_);
                                                            if(!_loc40_)
                                                            {
                                                               addr15d7:
                                                               §§push(2);
                                                               if(_loc39_ || Boolean(this))
                                                               {
                                                                  §§push(§§pop() & §§pop());
                                                                  if(!(_loc40_ && Boolean(param2)))
                                                                  {
                                                                     §§push(Boolean(§§pop()));
                                                                     if(!_loc40_)
                                                                     {
                                                                        if(§§pop())
                                                                        {
                                                                           if(_loc39_ || Boolean(param2))
                                                                           {
                                                                              break loop175;
                                                                           }
                                                                           break loop36;
                                                                        }
                                                                        break loop37;
                                                                     }
                                                                     break loop176;
                                                                  }
                                                                  break loop74;
                                                               }
                                                               break loop172;
                                                            }
                                                            break loop173;
                                                         }
                                                         if(!_loc39_)
                                                         {
                                                            break;
                                                         }
                                                      }
                                                      _loc37_.processNext = null;
                                                      break;
                                                   }
                                                   continue loop0;
                                                }
                                                continue loop76;
                                             }
                                             §§goto(addr15cf);
                                          }
                                          else
                                          {
                                             §§goto(addr1fcd);
                                          }
                                       }
                                       §§goto(addr15d7);
                                    }
                                    §§goto(addr1fdd);
                                 }
                              }
                              break loop175;
                           }
                           §§goto(addr1aa7);
                        }
                        §§goto(addr1a81);
                     }
                     §§push(§§pop() & §§pop());
                     if(_loc39_)
                     {
                        §§push(Boolean(§§pop()));
                        if(_loc39_ || Boolean(this))
                        {
                           addr1aa7:
                           if(§§pop())
                           {
                              break loop36;
                           }
                           §§goto(addr1fbb);
                        }
                        else
                        {
                           §§goto(addr2a70);
                        }
                     }
                     §§goto(addr1fbd);
                  }
                  addr1a81:
                  §§push(_loc35_);
                  §§push(4);
                  if(!(_loc40_ && Boolean(param1)))
                  {
                     break loop172;
                  }
                  break loop73;
               }
               loop38:
               while(true)
               {
                  loop39:
                  while(true)
                  {
                     §§push(_loc13_.vertex);
                     if(_loc39_ || Boolean(param1))
                     {
                        _loc6_ = §§pop();
                        loop41:
                        while(true)
                        {
                           while(true)
                           {
                              if(_loc39_)
                              {
                                 §§push(_loc6_.cameraX);
                                 if(!_loc39_)
                                 {
                                    break;
                                 }
                                 §§push(Number(§§pop()));
                                 if(_loc40_)
                                 {
                                    break;
                                 }
                                 _loc16_ = §§pop();
                                 if(_loc40_ && Boolean(param2))
                                 {
                                    break loop41;
                                 }
                              }
                              §§push(_loc6_.cameraZ);
                              if(_loc39_ || Boolean(param2))
                              {
                                 §§push(Number(§§pop()));
                              }
                              break;
                           }
                           _loc18_ = §§pop();
                           break;
                        }
                        _loc11_ = _loc12_;
                        _loc12_ = null;
                        _loc13_ = null;
                        while(true)
                        {
                           if(_loc39_)
                           {
                              loop16:
                              for(; _loc11_ != null; _loc11_ = _loc14_)
                              {
                                 _loc14_ = _loc11_.next;
                                 _loc7_ = _loc11_.vertex;
                                 if(!(_loc40_ && Boolean(this)))
                                 {
                                    _loc19_ = _loc7_.cameraX;
                                    loop44:
                                    while(true)
                                    {
                                       loop45:
                                       while(true)
                                       {
                                          §§push(_loc7_.cameraZ);
                                          if(!_loc40_)
                                          {
                                             loop60:
                                             while(true)
                                             {
                                                loop61:
                                                while(true)
                                                {
                                                   loop62:
                                                   while(true)
                                                   {
                                                      loop66:
                                                      while(true)
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
                                                                  §§push(Number(§§pop()));
                                                                  if(_loc39_ || Boolean(_loc3_))
                                                                  {
                                                                     _loc21_ = §§pop();
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc21_ > -_loc19_);
                                                                        if(_loc39_ || Boolean(_loc3_))
                                                                        {
                                                                           var _temp_47:* = Boolean(§§pop());
                                                                           §§push(_temp_47);
                                                                           §§push(_temp_47);
                                                                           if(!(_loc39_ || Boolean(this)))
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(Boolean(§§pop()));
                                                                           if(!(_loc39_ || Boolean(param1)))
                                                                           {
                                                                              break loop69;
                                                                           }
                                                                           if(§§pop())
                                                                           {
                                                                              §§pop();
                                                                              if(_loc40_)
                                                                              {
                                                                                 break loop45;
                                                                              }
                                                                              §§push(_loc18_);
                                                                              if(!(_loc39_ || Boolean(param1)))
                                                                              {
                                                                                 break loop68;
                                                                              }
                                                                              §§push(-_loc16_);
                                                                              if(_loc40_)
                                                                              {
                                                                                 break loop67;
                                                                              }
                                                                              §§push(§§pop() <= §§pop());
                                                                           }
                                                                        }
                                                                        var _temp_51:* = §§pop();
                                                                        §§push(_temp_51);
                                                                        §§push(_temp_51);
                                                                        if(_loc39_ || Boolean(param1))
                                                                        {
                                                                           break;
                                                                        }
                                                                        addr1bc7:
                                                                        if(§§pop())
                                                                        {
                                                                           break loop62;
                                                                        }
                                                                        if(_loc40_)
                                                                        {
                                                                           break loop61;
                                                                        }
                                                                        §§pop();
                                                                        if(_loc40_)
                                                                        {
                                                                           break loop60;
                                                                        }
                                                                        §§push(_loc21_);
                                                                     }
                                                                     §§push(Boolean(§§pop()));
                                                                     if(!_loc39_)
                                                                     {
                                                                        break loop66;
                                                                     }
                                                                     §§goto(addr1bc7);
                                                                  }
                                                                  §§push(§§pop() <= -_loc19_);
                                                                  break loop61;
                                                               }
                                                               §§goto(addr1be7);
                                                            }
                                                            §§goto(addr1c32);
                                                         }
                                                         §§goto(addr1ecc);
                                                      }
                                                      §§goto(addr1be6);
                                                   }
                                                   if(§§pop())
                                                   {
                                                      §§goto(addr1c2b);
                                                      §§push(_loc16_);
                                                      §§push(_loc18_);
                                                   }
                                                   else
                                                   {
                                                      §§goto(addr1ec8);
                                                   }
                                                }
                                                var _temp_41:* = §§pop();
                                                addr1be7:
                                                §§push(_temp_41);
                                                §§push(_temp_41);
                                                if(_loc39_)
                                                {
                                                   addr1be6:
                                                   §§push(Boolean(§§pop()));
                                                }
                                                if(!§§pop())
                                                {
                                                   break loop62;
                                                }
                                                loop63:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      if(_loc39_)
                                                      {
                                                         §§pop();
                                                         if(_loc40_ && Boolean(_loc3_))
                                                         {
                                                            break loop45;
                                                         }
                                                         §§push(_loc18_);
                                                         §§push(_loc16_);
                                                         if(_loc40_ && Boolean(param2))
                                                         {
                                                            break;
                                                         }
                                                         §§push(-§§pop());
                                                         if(!(_loc39_ || Boolean(_loc3_)))
                                                         {
                                                            break loop63;
                                                         }
                                                         §§push(§§pop() > §§pop());
                                                      }
                                                      §§push(Boolean(§§pop()));
                                                      break loop62;
                                                   }
                                                   addr1c2b:
                                                   §§push(§§pop() + §§pop());
                                                   if(!_loc40_)
                                                   {
                                                      addr1c32:
                                                      while(true)
                                                      {
                                                         §§push(_loc16_);
                                                         if(_loc39_)
                                                         {
                                                            §§push(_loc18_);
                                                            if(_loc40_)
                                                            {
                                                               break;
                                                            }
                                                            §§push(§§pop() + §§pop());
                                                         }
                                                         §§push(_loc19_);
                                                         if(_loc39_ || Boolean(_loc3_))
                                                         {
                                                            §§push(§§pop() - §§pop());
                                                            break loop63;
                                                         }
                                                         break;
                                                      }
                                                      §§goto(addr1c56);
                                                   }
                                                }
                                                addr1c56:
                                                §§push(§§pop() / (§§pop() - _loc21_));
                                                if(_loc40_)
                                                {
                                                   break loop44;
                                                }
                                             }
                                             _loc13_.next = _loc11_;
                                             §§goto(addr1efa);
                                          }
                                          §§push(Number(§§pop()));
                                          break loop44;
                                       }
                                       if(_loc12_ != null)
                                       {
                                          if(_loc39_ || Boolean(this))
                                          {
                                             break loop60;
                                          }
                                          §§goto(addr1f34);
                                       }
                                       else
                                       {
                                          _loc12_ = _loc11_;
                                          §§goto(addr1f04);
                                       }
                                    }
                                    _loc36_ = §§pop();
                                    loop46:
                                    while(true)
                                    {
                                       if(!(_loc40_ && Boolean(_loc3_)))
                                       {
                                          _loc10_ = _loc7_.create();
                                          this.lastVertex.next = _loc10_;
                                          loop47:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                if(_loc39_ || Boolean(this))
                                                {
                                                   this.lastVertex = _loc10_;
                                                   §§push(_loc10_);
                                                   §§push(_loc16_);
                                                   if(!(_loc40_ && Boolean(_loc3_)))
                                                   {
                                                      loop54:
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc19_);
                                                            if(_loc39_)
                                                            {
                                                               §§push(_loc16_);
                                                               if(!(_loc39_ || Boolean(param1)))
                                                               {
                                                                  break;
                                                               }
                                                               §§push(§§pop() - §§pop());
                                                               if(!(_loc39_ || Boolean(param2)))
                                                               {
                                                                  break loop54;
                                                               }
                                                            }
                                                            §§push(_loc36_);
                                                            break;
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         break;
                                                      }
                                                   }
                                                   §§pop().alternativa3d::cameraX = §§pop();
                                                   if(_loc39_)
                                                   {
                                                      §§push(_loc10_);
                                                      §§push(_loc6_.cameraY);
                                                      if(_loc39_ || Boolean(param1))
                                                      {
                                                         §§push(_loc7_.cameraY);
                                                         if(_loc39_)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc6_.cameraY);
                                                               if(_loc39_)
                                                               {
                                                                  §§push(§§pop() - §§pop());
                                                                  if(_loc40_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(_loc36_);
                                                               }
                                                               §§push(§§pop() * §§pop());
                                                               break;
                                                            }
                                                         }
                                                         §§push(§§pop() + §§pop());
                                                      }
                                                      §§pop().alternativa3d::cameraY = §§pop();
                                                      if(_loc40_)
                                                      {
                                                         break;
                                                      }
                                                   }
                                                   §§push(_loc10_);
                                                   §§push(_loc18_);
                                                   if(!_loc40_)
                                                   {
                                                      §§push(_loc21_);
                                                      if(_loc39_)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc18_);
                                                            if(!_loc40_)
                                                            {
                                                               §§push(§§pop() - §§pop());
                                                               if(_loc40_ && Boolean(param1))
                                                               {
                                                                  break;
                                                               }
                                                               §§push(_loc36_);
                                                            }
                                                            §§push(§§pop() * §§pop());
                                                            break;
                                                         }
                                                      }
                                                      §§push(§§pop() + §§pop());
                                                   }
                                                   §§pop().alternativa3d::cameraZ = §§pop();
                                                   if(!_loc39_)
                                                   {
                                                      break loop47;
                                                   }
                                                }
                                                §§push(_loc10_);
                                                §§push(_loc6_.x);
                                                if(!_loc40_)
                                                {
                                                   §§push(_loc7_.x);
                                                   if(_loc39_)
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_loc6_.x);
                                                         if(_loc39_)
                                                         {
                                                            §§push(§§pop() - §§pop());
                                                            if(!(_loc39_ || Boolean(this)))
                                                            {
                                                               break;
                                                            }
                                                            §§push(_loc36_);
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         break;
                                                      }
                                                   }
                                                   §§push(§§pop() + §§pop());
                                                }
                                                §§pop().x = §§pop();
                                                if(_loc39_ || Boolean(param2))
                                                {
                                                   break;
                                                }
                                                break loop47;
                                             }
                                             §§push(_loc10_);
                                             §§push(_loc6_.y);
                                             if(_loc39_)
                                             {
                                                §§push(_loc7_.y);
                                                if(!_loc40_)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(_loc6_.y);
                                                      if(!_loc40_)
                                                      {
                                                         §§push(§§pop() - §§pop());
                                                         if(!(_loc39_ || Boolean(param1)))
                                                         {
                                                            break;
                                                         }
                                                         §§push(_loc36_);
                                                      }
                                                      §§push(§§pop() * §§pop());
                                                      break;
                                                   }
                                                }
                                                §§push(§§pop() + §§pop());
                                             }
                                             §§pop().y = §§pop();
                                             if(!_loc40_)
                                             {
                                                break;
                                             }
                                             §§goto(addr1e8a);
                                          }
                                          §§push(_loc10_);
                                          §§push(_loc6_.z);
                                          if(_loc39_ || Boolean(param2))
                                          {
                                             loop49:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   §§push(_loc7_.z);
                                                   if(!(_loc40_ && Boolean(param1)))
                                                   {
                                                      §§push(_loc6_.z);
                                                      if(!_loc39_)
                                                      {
                                                         break;
                                                      }
                                                      §§push(§§pop() - §§pop());
                                                      if(_loc40_)
                                                      {
                                                         break loop49;
                                                      }
                                                   }
                                                   §§push(_loc36_);
                                                   break;
                                                }
                                                §§push(§§pop() * §§pop());
                                                break;
                                             }
                                          }
                                          §§pop().z = §§pop();
                                          if(!(_loc40_ && Boolean(_loc3_)))
                                          {
                                             §§push(_loc10_);
                                             §§push(_loc6_.u);
                                             if(_loc39_)
                                             {
                                                §§push(_loc7_.u);
                                                if(!(_loc40_ && Boolean(param1)))
                                                {
                                                   while(true)
                                                   {
                                                      §§push(_loc6_.u);
                                                      if(!_loc40_)
                                                      {
                                                         §§push(§§pop() - §§pop());
                                                         if(_loc40_)
                                                         {
                                                            break;
                                                         }
                                                         §§push(_loc36_);
                                                      }
                                                      §§push(§§pop() * §§pop());
                                                      break;
                                                   }
                                                }
                                                §§push(§§pop() + §§pop());
                                             }
                                             §§pop().u = §§pop();
                                          }
                                          §§push(_loc10_);
                                          §§push(_loc6_.v);
                                          if(_loc39_)
                                          {
                                             §§push(_loc7_.v);
                                             if(_loc39_ || Boolean(_loc3_))
                                             {
                                                while(true)
                                                {
                                                   §§push(_loc6_.v);
                                                   if(!(_loc40_ && Boolean(_loc3_)))
                                                   {
                                                      §§push(§§pop() - §§pop());
                                                      if(_loc40_ && Boolean(this))
                                                      {
                                                         break;
                                                      }
                                                      §§push(_loc36_);
                                                   }
                                                   §§push(§§pop() * §§pop());
                                                   break;
                                                }
                                             }
                                             §§push(§§pop() + §§pop());
                                          }
                                          §§pop().v = §§pop();
                                          addr1e8a:
                                          _loc15_ = _loc11_.create();
                                          while(true)
                                          {
                                             if(_loc39_)
                                             {
                                                _loc15_.vertex = _loc10_;
                                                if(_loc39_)
                                                {
                                                   if(_loc12_ == null)
                                                   {
                                                      _loc12_ = _loc15_;
                                                      addr1ec2:
                                                      _loc13_ = _loc15_;
                                                      addr1ec8:
                                                      addr1ecc:
                                                      if(_loc21_ > -_loc19_)
                                                      {
                                                         if(!(_loc40_ && Boolean(param1)))
                                                         {
                                                            break loop45;
                                                         }
                                                         break loop46;
                                                      }
                                                      addr1f34:
                                                      _loc11_.vertex = null;
                                                      if(_loc39_)
                                                      {
                                                         _loc11_.next = Wrapper.collector;
                                                         if(!_loc39_)
                                                         {
                                                            break loop46;
                                                         }
                                                      }
                                                      Wrapper.collector = _loc11_;
                                                      break loop46;
                                                   }
                                                   if(!_loc39_)
                                                   {
                                                      break;
                                                   }
                                                }
                                             }
                                             _loc13_.next = _loc15_;
                                             break;
                                          }
                                          §§goto(addr1ec2);
                                       }
                                       addr1f04:
                                       _loc13_ = _loc11_;
                                       if(!_loc40_)
                                       {
                                          _loc11_.next = null;
                                       }
                                       break;
                                       addr1efa:
                                    }
                                 }
                                 _loc6_ = _loc7_;
                                 loop71:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       if(!(_loc40_ && Boolean(param2)))
                                       {
                                          §§push(_loc19_);
                                          if(_loc40_ && Boolean(this))
                                          {
                                             break;
                                          }
                                          §§push(Number(§§pop()));
                                          if(_loc40_ && Boolean(param2))
                                          {
                                             break loop71;
                                          }
                                          _loc16_ = §§pop();
                                          if(_loc40_)
                                          {
                                             continue loop16;
                                          }
                                       }
                                       §§push(_loc21_);
                                       if(!_loc40_)
                                       {
                                          break loop71;
                                       }
                                       break;
                                    }
                                    _loc18_ = §§pop();
                                    continue loop16;
                                 }
                                 §§push(Number(§§pop()));
                                 break loop72;
                              }
                              if(!(_loc39_ || Boolean(param1)))
                              {
                                 break;
                              }
                              if(_loc12_ != null)
                              {
                                 addr1fbb:
                                 addr1fbd:
                                 loop73:
                                 while(true)
                                 {
                                    loop74:
                                    while(true)
                                    {
                                       loop75:
                                       while(true)
                                       {
                                          loop106:
                                          while(true)
                                          {
                                             §§push(_loc35_);
                                             §§push(8);
                                             if(_loc39_ || Boolean(param2))
                                             {
                                                addr1fcd:
                                                §§push(Boolean(§§pop() & §§pop()));
                                                if(_loc40_ && Boolean(param1))
                                                {
                                                   break;
                                                }
                                                if(§§pop())
                                                {
                                                   if(_loc40_)
                                                   {
                                                      break loop38;
                                                   }
                                                   §§push(_loc13_.vertex);
                                                   if(_loc40_ && Boolean(_loc3_))
                                                   {
                                                      break loop75;
                                                   }
                                                   _loc6_ = §§pop();
                                                   loop140:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         if(_loc39_ || Boolean(this))
                                                         {
                                                            §§push(_loc6_.cameraX);
                                                            if(_loc40_)
                                                            {
                                                               break;
                                                            }
                                                            §§push(Number(§§pop()));
                                                            if(_loc40_)
                                                            {
                                                               break;
                                                            }
                                                            _loc16_ = §§pop();
                                                            if(_loc40_)
                                                            {
                                                               break loop140;
                                                            }
                                                         }
                                                         §§push(_loc6_.cameraZ);
                                                         if(_loc39_)
                                                         {
                                                            §§push(Number(§§pop()));
                                                         }
                                                         break;
                                                      }
                                                      _loc18_ = §§pop();
                                                      break;
                                                   }
                                                   _loc11_ = _loc12_;
                                                   _loc12_ = null;
                                                   _loc13_ = null;
                                                   if(_loc39_ || Boolean(param2))
                                                   {
                                                      loop17:
                                                      for(; _loc11_ != null; _loc11_ = _loc14_)
                                                      {
                                                         _loc14_ = _loc11_.next;
                                                         _loc7_ = _loc11_.vertex;
                                                         loop142:
                                                         while(true)
                                                         {
                                                            loop143:
                                                            while(true)
                                                            {
                                                               loop145:
                                                               while(true)
                                                               {
                                                                  while(true)
                                                                  {
                                                                     if(_loc39_ || Boolean(param2))
                                                                     {
                                                                        _loc19_ = _loc7_.cameraX;
                                                                        if(_loc39_ || Boolean(_loc3_))
                                                                        {
                                                                           §§push(_loc7_.cameraZ);
                                                                           if(_loc40_ && Boolean(_loc3_))
                                                                           {
                                                                              break loop149;
                                                                           }
                                                                           §§push(Number(§§pop()));
                                                                           if(!_loc40_)
                                                                           {
                                                                              _loc21_ = §§pop();
                                                                              if(_loc40_ && Boolean(param2))
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(_loc21_);
                                                                           }
                                                                           §§push(§§pop() > _loc19_);
                                                                           if(!(_loc40_ && Boolean(param2)))
                                                                           {
                                                                              §§push(Boolean(§§pop()));
                                                                           }
                                                                           var _temp_193:* = §§pop();
                                                                           §§push(_temp_193);
                                                                           §§push(_temp_193);
                                                                           if(_loc39_)
                                                                           {
                                                                              §§push(Boolean(§§pop()));
                                                                              if(!(_loc39_ || Boolean(param1)))
                                                                              {
                                                                                 break loop145;
                                                                              }
                                                                              if(!§§pop())
                                                                              {
                                                                                 break loop143;
                                                                              }
                                                                              §§pop();
                                                                              if(!_loc39_)
                                                                              {
                                                                                 break loop142;
                                                                              }
                                                                           }
                                                                           else
                                                                           {
                                                                              §§goto(addr215f);
                                                                           }
                                                                        }
                                                                     }
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc18_);
                                                                        §§push(_loc16_);
                                                                        if(_loc39_)
                                                                        {
                                                                           §§push(§§pop() <= §§pop());
                                                                           if(!(_loc40_ && Boolean(this)))
                                                                           {
                                                                              §§push(Boolean(§§pop()));
                                                                              break loop143;
                                                                           }
                                                                           §§goto(addr2177);
                                                                        }
                                                                        else
                                                                        {
                                                                           §§goto(addr219e);
                                                                        }
                                                                     }
                                                                     §§goto(addr2430);
                                                                  }
                                                                  §§goto(addr2434);
                                                               }
                                                               while(true)
                                                               {
                                                                  if(§§pop())
                                                                  {
                                                                     if(_loc39_)
                                                                     {
                                                                        §§pop();
                                                                        §§goto(addr216b);
                                                                     }
                                                                  }
                                                                  §§goto(addr2177);
                                                               }
                                                               §§goto(addr2430);
                                                            }
                                                            var _temp_158:* = §§pop();
                                                            §§push(_temp_158);
                                                            §§push(_temp_158);
                                                            if(!(_loc39_ || Boolean(param1)))
                                                            {
                                                               break loop145;
                                                            }
                                                            §§push(Boolean(§§pop()));
                                                            if(!(_loc39_ || Boolean(param1)))
                                                            {
                                                               break loop145;
                                                            }
                                                            loop146:
                                                            while(true)
                                                            {
                                                               addr2177:
                                                               if(!§§pop())
                                                               {
                                                                  loop147:
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        if(_loc39_ || Boolean(param1))
                                                                        {
                                                                           §§pop();
                                                                           if(_loc40_ && Boolean(this))
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(_loc21_);
                                                                           if(!_loc39_)
                                                                           {
                                                                              break loop147;
                                                                           }
                                                                           §§push(§§pop() <= _loc19_);
                                                                           if(_loc39_)
                                                                           {
                                                                              §§push(Boolean(§§pop()));
                                                                           }
                                                                        }
                                                                        var _temp_163:* = §§pop();
                                                                        §§push(_temp_163);
                                                                        §§push(_temp_163);
                                                                        if(!(_loc40_ && Boolean(this)))
                                                                        {
                                                                           addr215f:
                                                                           §§push(Boolean(§§pop()));
                                                                        }
                                                                        break loop145;
                                                                     }
                                                                     addr216b:
                                                                     §§push(_loc18_);
                                                                     §§push(_loc16_);
                                                                     if(!_loc39_)
                                                                     {
                                                                        break loop146;
                                                                     }
                                                                     §§push(§§pop() > §§pop());
                                                                  }
                                                                  §§push(_loc19_);
                                                                  break;
                                                               }
                                                               if(§§pop())
                                                               {
                                                                  loop149:
                                                                  while(true)
                                                                  {
                                                                     loop150:
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc18_);
                                                                        §§push(_loc16_);
                                                                        if(!(_loc40_ && Boolean(this)))
                                                                        {
                                                                           §§push(§§pop() - §§pop());
                                                                           if(_loc40_ && Boolean(_loc3_))
                                                                           {
                                                                              break loop149;
                                                                           }
                                                                           while(true)
                                                                           {
                                                                              §§push(_loc18_);
                                                                              §§push(_loc16_);
                                                                              if(!(_loc40_ && Boolean(param1)))
                                                                              {
                                                                                 §§push(§§pop() - §§pop());
                                                                                 if(_loc40_ && Boolean(_loc3_))
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(_loc19_);
                                                                                 if(!(_loc39_ || Boolean(_loc3_)))
                                                                                 {
                                                                                    break loop150;
                                                                                 }
                                                                              }
                                                                              §§push(§§pop() + §§pop());
                                                                              break;
                                                                           }
                                                                        }
                                                                        §§push(_loc21_);
                                                                        break;
                                                                     }
                                                                     §§push(§§pop() - §§pop());
                                                                     if(!(_loc39_ || Boolean(this)))
                                                                     {
                                                                        break loop146;
                                                                     }
                                                                     §§push(§§pop() / §§pop());
                                                                     if(_loc39_ || Boolean(param1))
                                                                     {
                                                                        break;
                                                                     }
                                                                     §§goto(addr21ef);
                                                                  }
                                                                  addr21ef:
                                                                  _loc36_ = Number(§§pop());
                                                                  _loc10_ = _loc7_.create();
                                                                  this.lastVertex.next = _loc10_;
                                                                  this.lastVertex = _loc10_;
                                                                  §§push(_loc10_);
                                                                  §§push(_loc16_);
                                                                  if(!_loc40_)
                                                                  {
                                                                     loop151:
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc19_);
                                                                           if(_loc39_)
                                                                           {
                                                                              §§push(_loc16_);
                                                                              if(_loc40_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(§§pop() - §§pop());
                                                                              if(_loc40_)
                                                                              {
                                                                                 break loop151;
                                                                              }
                                                                           }
                                                                           §§push(_loc36_);
                                                                           break;
                                                                        }
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§pop().alternativa3d::cameraX = §§pop();
                                                                  if(_loc39_)
                                                                  {
                                                                     §§push(_loc10_);
                                                                     §§push(_loc6_.cameraY);
                                                                     if(!(_loc40_ && Boolean(this)))
                                                                     {
                                                                        §§push(_loc7_.cameraY);
                                                                        if(_loc39_)
                                                                        {
                                                                           while(true)
                                                                           {
                                                                              §§push(_loc6_.cameraY);
                                                                              if(_loc39_ || Boolean(this))
                                                                              {
                                                                                 §§push(§§pop() - §§pop());
                                                                                 if(_loc40_ && Boolean(_loc3_))
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(_loc36_);
                                                                              }
                                                                              §§push(§§pop() * §§pop());
                                                                              break;
                                                                           }
                                                                        }
                                                                        §§push(§§pop() + §§pop());
                                                                     }
                                                                     §§pop().alternativa3d::cameraY = §§pop();
                                                                     §§push(_loc10_);
                                                                     §§push(_loc18_);
                                                                     if(_loc39_)
                                                                     {
                                                                        loop154:
                                                                        while(true)
                                                                        {
                                                                           while(true)
                                                                           {
                                                                              §§push(_loc21_);
                                                                              if(_loc39_ || Boolean(param1))
                                                                              {
                                                                                 §§push(_loc18_);
                                                                                 if(!_loc39_)
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(§§pop() - §§pop());
                                                                                 if(_loc40_ && Boolean(_loc3_))
                                                                                 {
                                                                                    break loop154;
                                                                                 }
                                                                              }
                                                                              §§push(_loc36_);
                                                                              break;
                                                                           }
                                                                           §§push(§§pop() * §§pop());
                                                                           break;
                                                                        }
                                                                     }
                                                                     §§pop().alternativa3d::cameraZ = §§pop();
                                                                  }
                                                                  §§push(_loc10_);
                                                                  §§push(_loc6_.x);
                                                                  if(!(_loc40_ && Boolean(this)))
                                                                  {
                                                                     loop156:
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc7_.x);
                                                                           if(_loc39_ || Boolean(this))
                                                                           {
                                                                              §§push(_loc6_.x);
                                                                              if(!(_loc39_ || Boolean(_loc3_)))
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(§§pop() - §§pop());
                                                                              if(_loc40_)
                                                                              {
                                                                                 break loop156;
                                                                              }
                                                                           }
                                                                           §§push(_loc36_);
                                                                           break;
                                                                        }
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§pop().x = §§pop();
                                                                  if(_loc39_)
                                                                  {
                                                                     §§push(_loc10_);
                                                                     §§push(_loc6_.y);
                                                                     if(!(_loc40_ && Boolean(_loc3_)))
                                                                     {
                                                                        loop158:
                                                                        while(true)
                                                                        {
                                                                           while(true)
                                                                           {
                                                                              §§push(_loc7_.y);
                                                                              if(!(_loc40_ && Boolean(_loc3_)))
                                                                              {
                                                                                 §§push(_loc6_.y);
                                                                                 if(_loc40_ && Boolean(this))
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(§§pop() - §§pop());
                                                                                 if(_loc40_)
                                                                                 {
                                                                                    break loop158;
                                                                                 }
                                                                              }
                                                                              §§push(_loc36_);
                                                                              break;
                                                                           }
                                                                           §§push(§§pop() * §§pop());
                                                                           break;
                                                                        }
                                                                     }
                                                                     §§pop().y = §§pop();
                                                                     §§push(_loc10_);
                                                                     §§push(_loc6_.z);
                                                                     if(!_loc40_)
                                                                     {
                                                                        loop160:
                                                                        while(true)
                                                                        {
                                                                           while(true)
                                                                           {
                                                                              §§push(_loc7_.z);
                                                                              if(_loc39_)
                                                                              {
                                                                                 §§push(_loc6_.z);
                                                                                 if(!(_loc39_ || Boolean(param1)))
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(§§pop() - §§pop());
                                                                                 if(_loc40_)
                                                                                 {
                                                                                    break loop160;
                                                                                 }
                                                                              }
                                                                              §§push(_loc36_);
                                                                              break;
                                                                           }
                                                                           §§push(§§pop() * §§pop());
                                                                           break;
                                                                        }
                                                                     }
                                                                     §§pop().z = §§pop();
                                                                  }
                                                                  §§push(_loc10_);
                                                                  §§push(_loc6_.u);
                                                                  if(!_loc40_)
                                                                  {
                                                                     §§push(_loc7_.u);
                                                                     if(!_loc40_)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc6_.u);
                                                                           if(!_loc40_)
                                                                           {
                                                                              §§push(§§pop() - §§pop());
                                                                              if(!(_loc39_ || Boolean(_loc3_)))
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(_loc36_);
                                                                           }
                                                                           §§push(§§pop() * §§pop());
                                                                           break;
                                                                        }
                                                                     }
                                                                     §§push(§§pop() + §§pop());
                                                                  }
                                                                  §§pop().u = §§pop();
                                                                  §§push(_loc10_);
                                                                  §§push(_loc6_.v);
                                                                  if(_loc39_ || Boolean(_loc3_))
                                                                  {
                                                                     loop163:
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc7_.v);
                                                                           if(_loc39_ || Boolean(_loc3_))
                                                                           {
                                                                              §§push(_loc6_.v);
                                                                              if(!_loc39_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(§§pop() - §§pop());
                                                                              if(_loc40_ && Boolean(this))
                                                                              {
                                                                                 break loop163;
                                                                              }
                                                                           }
                                                                           §§push(_loc36_);
                                                                           break;
                                                                        }
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§pop().v = §§pop();
                                                                  _loc15_ = _loc11_.create();
                                                                  while(true)
                                                                  {
                                                                     if(!_loc40_)
                                                                     {
                                                                        _loc15_.vertex = _loc10_;
                                                                        if(!_loc40_)
                                                                        {
                                                                           if(_loc12_ == null)
                                                                           {
                                                                              _loc12_ = _loc15_;
                                                                              break;
                                                                           }
                                                                           if(!_loc40_)
                                                                           {
                                                                              _loc13_.next = _loc15_;
                                                                           }
                                                                        }
                                                                     }
                                                                     break;
                                                                  }
                                                                  _loc13_ = _loc15_;
                                                               }
                                                               addr242c:
                                                               §§push(_loc21_);
                                                               break loop147;
                                                            }
                                                            addr2430:
                                                            if(§§pop() <= §§pop())
                                                            {
                                                               _loc11_.vertex = null;
                                                               break;
                                                            }
                                                            addr2434:
                                                            while(true)
                                                            {
                                                               if(_loc12_ != null)
                                                               {
                                                                  _loc13_.next = _loc11_;
                                                                  if(!(_loc39_ || Boolean(_loc3_)))
                                                                  {
                                                                     §§goto(addr2483);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  _loc12_ = _loc11_;
                                                               }
                                                               _loc13_ = _loc11_;
                                                               if(!_loc40_)
                                                               {
                                                                  _loc11_.next = null;
                                                               }
                                                               break;
                                                            }
                                                            §§goto(addr248b);
                                                         }
                                                         _loc11_.next = Wrapper.collector;
                                                         if(_loc39_)
                                                         {
                                                            addr2483:
                                                            Wrapper.collector = _loc11_;
                                                         }
                                                         addr248b:
                                                         _loc6_ = _loc7_;
                                                         while(true)
                                                         {
                                                            if(!(_loc40_ && Boolean(this)))
                                                            {
                                                               §§push(_loc19_);
                                                               if(!_loc39_)
                                                               {
                                                                  break;
                                                               }
                                                               §§push(Number(§§pop()));
                                                               if(_loc40_)
                                                               {
                                                                  break;
                                                               }
                                                               _loc16_ = §§pop();
                                                               if(_loc40_)
                                                               {
                                                                  continue loop17;
                                                               }
                                                            }
                                                            §§push(_loc21_);
                                                            if(!_loc40_)
                                                            {
                                                               §§push(Number(§§pop()));
                                                            }
                                                            break;
                                                         }
                                                         _loc18_ = §§pop();
                                                      }
                                                      while(true)
                                                      {
                                                         if(!(_loc40_ && Boolean(this)))
                                                         {
                                                            if(_loc12_ == null)
                                                            {
                                                               if(_loc40_)
                                                               {
                                                                  break;
                                                               }
                                                            }
                                                            else
                                                            {
                                                               addr24f2:
                                                               §§push(_loc35_);
                                                               if(_loc40_)
                                                               {
                                                                  break loop74;
                                                               }
                                                               §§push(16);
                                                               if(_loc40_)
                                                               {
                                                                  break loop73;
                                                               }
                                                               §§push(Boolean(§§pop() & §§pop()));
                                                               if(!_loc39_)
                                                               {
                                                                  break loop106;
                                                               }
                                                               if(§§pop())
                                                               {
                                                                  §§push(_loc13_.vertex);
                                                                  if(_loc39_ || Boolean(param2))
                                                                  {
                                                                     break loop75;
                                                                  }
                                                                  continue loop76;
                                                               }
                                                               §§goto(addr2a6a);
                                                            }
                                                         }
                                                         _loc37_.processNext = null;
                                                         break;
                                                      }
                                                   }
                                                   continue loop0;
                                                }
                                                §§goto(addr24f2);
                                             }
                                             §§goto(addr2502);
                                          }
                                          §§goto(addr2a70);
                                       }
                                       _loc6_ = §§pop();
                                       if(!(_loc40_ && Boolean(this)))
                                       {
                                          while(true)
                                          {
                                             §§push(_loc6_.cameraY);
                                             if(_loc39_)
                                             {
                                                §§push(Number(§§pop()));
                                                if(!(_loc39_ || Boolean(this)))
                                                {
                                                   break;
                                                }
                                             }
                                             _loc17_ = §§pop();
                                             if(!_loc40_)
                                             {
                                                §§push(_loc6_.cameraZ);
                                                if(!(_loc40_ && Boolean(param2)))
                                                {
                                                   §§push(Number(§§pop()));
                                                }
                                                break;
                                             }
                                          }
                                          _loc18_ = §§pop();
                                       }
                                       _loc11_ = _loc12_;
                                       _loc12_ = null;
                                       _loc13_ = null;
                                       while(true)
                                       {
                                          if(!(_loc40_ && Boolean(param1)))
                                          {
                                             for(; _loc11_ != null; _loc11_ = _loc14_)
                                             {
                                                _loc14_ = _loc11_.next;
                                                _loc7_ = _loc11_.vertex;
                                                §§push(_loc7_.cameraY);
                                                if(_loc39_)
                                                {
                                                   §§push(Number(§§pop()));
                                                }
                                                _loc20_ = §§pop();
                                                loop109:
                                                while(true)
                                                {
                                                   loop110:
                                                   while(true)
                                                   {
                                                      §§push(_loc7_.cameraZ);
                                                      if(!(_loc40_ && Boolean(param1)))
                                                      {
                                                         _loc21_ = Number(§§pop());
                                                         loop128:
                                                         while(true)
                                                         {
                                                            loop129:
                                                            while(true)
                                                            {
                                                               loop130:
                                                               while(true)
                                                               {
                                                                  if(!(_loc40_ && Boolean(this)))
                                                                  {
                                                                     loop131:
                                                                     while(true)
                                                                     {
                                                                        loop132:
                                                                        while(true)
                                                                        {
                                                                           loop135:
                                                                           while(true)
                                                                           {
                                                                              loop136:
                                                                              while(true)
                                                                              {
                                                                                 loop137:
                                                                                 while(true)
                                                                                 {
                                                                                    while(true)
                                                                                    {
                                                                                       §§push(_loc21_);
                                                                                       §§push(_loc20_);
                                                                                       if(_loc39_)
                                                                                       {
                                                                                          §§push(§§pop() > -§§pop());
                                                                                          if(!(_loc39_ || Boolean(param1)))
                                                                                          {
                                                                                             break;
                                                                                          }
                                                                                          while(true)
                                                                                          {
                                                                                             §§push(Boolean(§§pop()));
                                                                                             if(_loc39_)
                                                                                             {
                                                                                                var _temp_142:* = §§pop();
                                                                                                §§push(_temp_142);
                                                                                                §§push(_temp_142);
                                                                                                if(_loc40_)
                                                                                                {
                                                                                                   break;
                                                                                                }
                                                                                                §§push(Boolean(§§pop()));
                                                                                                if(_loc40_ && Boolean(param1))
                                                                                                {
                                                                                                   break loop137;
                                                                                                }
                                                                                                if(§§pop())
                                                                                                {
                                                                                                   §§pop();
                                                                                                   if(_loc40_ && Boolean(param1))
                                                                                                   {
                                                                                                      break loop136;
                                                                                                   }
                                                                                                   §§push(_loc18_);
                                                                                                   if(_loc40_)
                                                                                                   {
                                                                                                      break loop135;
                                                                                                   }
                                                                                                   §§push(§§pop() <= -_loc17_);
                                                                                                   if(_loc39_)
                                                                                                   {
                                                                                                      §§push(Boolean(§§pop()));
                                                                                                   }
                                                                                                }
                                                                                             }
                                                                                             var _temp_145:* = §§pop();
                                                                                             §§push(_temp_145);
                                                                                             §§push(_temp_145);
                                                                                             if(_loc39_ || Boolean(this))
                                                                                             {
                                                                                                break;
                                                                                             }
                                                                                             break loop132;
                                                                                          }
                                                                                          §§push(Boolean(§§pop()));
                                                                                          if(_loc40_)
                                                                                          {
                                                                                             break loop132;
                                                                                          }
                                                                                          if(§§pop())
                                                                                          {
                                                                                             break loop131;
                                                                                          }
                                                                                          §§pop();
                                                                                          if(_loc40_ && Boolean(param2))
                                                                                          {
                                                                                             break loop111;
                                                                                          }
                                                                                          §§push(_loc21_);
                                                                                          if(_loc40_)
                                                                                          {
                                                                                             break loop128;
                                                                                          }
                                                                                          §§push(_loc20_);
                                                                                       }
                                                                                       §§push(§§pop() <= -§§pop());
                                                                                       break;
                                                                                    }
                                                                                    §§push(Boolean(§§pop()));
                                                                                    if(!_loc40_)
                                                                                    {
                                                                                       var _temp_148:* = §§pop();
                                                                                       §§push(_temp_148);
                                                                                       §§push(_temp_148);
                                                                                       if(!(_loc40_ && Boolean(this)))
                                                                                       {
                                                                                          break;
                                                                                       }
                                                                                       break loop132;
                                                                                    }
                                                                                    break loop131;
                                                                                 }
                                                                                 §§push(Boolean(§§pop()));
                                                                                 break loop132;
                                                                              }
                                                                              §§goto(addr2687);
                                                                           }
                                                                           §§goto(addr271d);
                                                                        }
                                                                        if(!§§pop())
                                                                        {
                                                                           break;
                                                                        }
                                                                        §§pop();
                                                                        if(!(_loc39_ || Boolean(_loc3_)))
                                                                        {
                                                                           break loop130;
                                                                        }
                                                                        addr2687:
                                                                        §§push(_loc18_);
                                                                        if(_loc39_ || Boolean(_loc3_))
                                                                        {
                                                                           §§push(-_loc17_);
                                                                           if(!(_loc40_ && Boolean(_loc3_)))
                                                                           {
                                                                              §§push(§§pop() > §§pop());
                                                                              break;
                                                                           }
                                                                           §§goto(addr26ee);
                                                                        }
                                                                        §§goto(addr26b6);
                                                                     }
                                                                     if(!§§pop())
                                                                     {
                                                                        break loop129;
                                                                     }
                                                                     if(!_loc40_)
                                                                     {
                                                                        addr26b6:
                                                                        §§push(_loc17_);
                                                                        §§push(_loc18_);
                                                                        if(_loc39_)
                                                                        {
                                                                           §§push(§§pop() + §§pop());
                                                                           if(_loc39_ || Boolean(this))
                                                                           {
                                                                              loop133:
                                                                              while(true)
                                                                              {
                                                                                 while(true)
                                                                                 {
                                                                                    §§push(_loc17_);
                                                                                    §§push(_loc18_);
                                                                                    if(_loc39_ || Boolean(_loc3_))
                                                                                    {
                                                                                       §§push(§§pop() + §§pop());
                                                                                       if(_loc40_ && Boolean(_loc3_))
                                                                                       {
                                                                                          break;
                                                                                       }
                                                                                       §§push(_loc20_);
                                                                                       if(_loc39_ || Boolean(this))
                                                                                       {
                                                                                          §§push(§§pop() - §§pop());
                                                                                          if(!_loc39_)
                                                                                          {
                                                                                             break loop133;
                                                                                          }
                                                                                          §§push(_loc21_);
                                                                                       }
                                                                                    }
                                                                                    §§push(§§pop() - §§pop());
                                                                                    if(_loc39_)
                                                                                    {
                                                                                       break loop133;
                                                                                    }
                                                                                    break loop110;
                                                                                 }
                                                                                 addr2998:
                                                                                 if(§§pop() <= §§pop())
                                                                                 {
                                                                                    _loc11_.vertex = null;
                                                                                    _loc11_.next = Wrapper.collector;
                                                                                    if(_loc39_)
                                                                                    {
                                                                                       Wrapper.collector = _loc11_;
                                                                                    }
                                                                                    break loop111;
                                                                                 }
                                                                                 if(_loc12_ != null)
                                                                                 {
                                                                                    break loop130;
                                                                                 }
                                                                                 _loc12_ = _loc11_;
                                                                                 §§goto(addr29b9);
                                                                              }
                                                                              §§push(§§pop() / §§pop());
                                                                              if(_loc39_ || Boolean(param2))
                                                                              {
                                                                                 addr271d:
                                                                                 §§push(Number(§§pop()));
                                                                              }
                                                                              break loop109;
                                                                           }
                                                                           break loop128;
                                                                        }
                                                                        break loop110;
                                                                     }
                                                                  }
                                                                  §§goto(addr272e);
                                                               }
                                                               §§goto(addr29a3);
                                                            }
                                                            §§goto(addr2993);
                                                         }
                                                         §§goto(addr2995);
                                                      }
                                                      break loop135;
                                                   }
                                                   §§goto(addr2998);
                                                }
                                                _loc36_ = §§pop();
                                                loop111:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      if(_loc39_ || Boolean(_loc3_))
                                                      {
                                                         addr272e:
                                                         _loc10_ = _loc7_.create();
                                                         if(_loc39_)
                                                         {
                                                            this.lastVertex.next = _loc10_;
                                                            this.lastVertex = _loc10_;
                                                            §§push(_loc10_);
                                                            §§push(_loc6_.cameraX);
                                                            if(_loc39_ || Boolean(param2))
                                                            {
                                                               §§push(_loc7_.cameraX);
                                                               if(_loc39_ || Boolean(_loc3_))
                                                               {
                                                                  while(true)
                                                                  {
                                                                     §§push(_loc6_.cameraX);
                                                                     if(!(_loc40_ && Boolean(param1)))
                                                                     {
                                                                        §§push(§§pop() - §§pop());
                                                                        if(!(_loc39_ || Boolean(this)))
                                                                        {
                                                                           break;
                                                                        }
                                                                        §§push(_loc36_);
                                                                     }
                                                                     §§push(§§pop() * §§pop());
                                                                     break;
                                                                  }
                                                               }
                                                               §§push(§§pop() + §§pop());
                                                            }
                                                            §§pop().alternativa3d::cameraX = §§pop();
                                                            if(_loc39_ || Boolean(_loc3_))
                                                            {
                                                               §§push(_loc10_);
                                                               §§push(_loc17_);
                                                               if(_loc39_ || Boolean(param1))
                                                               {
                                                                  §§push(_loc20_);
                                                                  if(!_loc40_)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc17_);
                                                                        if(!_loc40_)
                                                                        {
                                                                           §§push(§§pop() - §§pop());
                                                                           if(!(_loc39_ || Boolean(_loc3_)))
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(_loc36_);
                                                                        }
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§push(§§pop() + §§pop());
                                                               }
                                                               §§pop().alternativa3d::cameraY = §§pop();
                                                               while(true)
                                                               {
                                                                  if(!(_loc40_ && Boolean(_loc3_)))
                                                                  {
                                                                     §§push(_loc10_);
                                                                     §§push(_loc18_);
                                                                     if(_loc39_)
                                                                     {
                                                                        loop116:
                                                                        while(true)
                                                                        {
                                                                           while(true)
                                                                           {
                                                                              §§push(_loc21_);
                                                                              if(_loc39_ || Boolean(this))
                                                                              {
                                                                                 §§push(_loc18_);
                                                                                 if(!(_loc39_ || Boolean(this)))
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(§§pop() - §§pop());
                                                                                 if(_loc40_ && Boolean(this))
                                                                                 {
                                                                                    break loop116;
                                                                                 }
                                                                              }
                                                                              §§push(_loc36_);
                                                                              break;
                                                                           }
                                                                           §§push(§§pop() * §§pop());
                                                                           break;
                                                                        }
                                                                     }
                                                                     §§pop().alternativa3d::cameraZ = §§pop();
                                                                     if(!_loc39_)
                                                                     {
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§push(_loc10_);
                                                                  §§push(_loc6_.x);
                                                                  if(!_loc40_)
                                                                  {
                                                                     loop118:
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc7_.x);
                                                                           if(!(_loc40_ && Boolean(this)))
                                                                           {
                                                                              §§push(_loc6_.x);
                                                                              if(!_loc39_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(§§pop() - §§pop());
                                                                              if(_loc40_ && Boolean(this))
                                                                              {
                                                                                 break loop118;
                                                                              }
                                                                           }
                                                                           §§push(_loc36_);
                                                                           break;
                                                                        }
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§pop().x = §§pop();
                                                                  if(_loc39_)
                                                                  {
                                                                     break;
                                                                  }
                                                               }
                                                               §§push(_loc10_);
                                                               §§push(_loc6_.y);
                                                               if(!_loc40_)
                                                               {
                                                                  loop120:
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc7_.y);
                                                                        if(_loc39_)
                                                                        {
                                                                           §§push(_loc6_.y);
                                                                           if(_loc40_ && Boolean(_loc3_))
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(§§pop() - §§pop());
                                                                           if(_loc40_)
                                                                           {
                                                                              break loop120;
                                                                           }
                                                                        }
                                                                        §§push(_loc36_);
                                                                        break;
                                                                     }
                                                                     §§push(§§pop() * §§pop());
                                                                     break;
                                                                  }
                                                               }
                                                               §§pop().y = §§pop();
                                                               §§push(_loc10_);
                                                               §§push(_loc6_.z);
                                                               if(_loc39_)
                                                               {
                                                                  loop122:
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc7_.z);
                                                                        if(!(_loc40_ && Boolean(_loc3_)))
                                                                        {
                                                                           §§push(_loc6_.z);
                                                                           if(_loc40_)
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(§§pop() - §§pop());
                                                                           if(_loc40_)
                                                                           {
                                                                              break loop122;
                                                                           }
                                                                        }
                                                                        §§push(_loc36_);
                                                                        break;
                                                                     }
                                                                     §§push(§§pop() * §§pop());
                                                                     break;
                                                                  }
                                                               }
                                                               §§pop().z = §§pop();
                                                            }
                                                            §§push(_loc10_);
                                                            §§push(_loc6_.u);
                                                            if(!(_loc40_ && Boolean(this)))
                                                            {
                                                               §§push(_loc7_.u);
                                                               if(_loc39_)
                                                               {
                                                                  while(true)
                                                                  {
                                                                     §§push(_loc6_.u);
                                                                     if(!_loc40_)
                                                                     {
                                                                        §§push(§§pop() - §§pop());
                                                                        if(!_loc39_)
                                                                        {
                                                                           break;
                                                                        }
                                                                        §§push(_loc36_);
                                                                     }
                                                                     §§push(§§pop() * §§pop());
                                                                     break;
                                                                  }
                                                               }
                                                               §§push(§§pop() + §§pop());
                                                            }
                                                            §§pop().u = §§pop();
                                                         }
                                                         §§push(_loc10_);
                                                         §§push(_loc6_.v);
                                                         if(!(_loc40_ && Boolean(this)))
                                                         {
                                                            loop125:
                                                            while(true)
                                                            {
                                                               while(true)
                                                               {
                                                                  §§push(_loc7_.v);
                                                                  if(!_loc40_)
                                                                  {
                                                                     §§push(_loc6_.v);
                                                                     if(_loc40_)
                                                                     {
                                                                        break;
                                                                     }
                                                                     §§push(§§pop() - §§pop());
                                                                     if(_loc40_)
                                                                     {
                                                                        break loop125;
                                                                     }
                                                                  }
                                                                  §§push(_loc36_);
                                                                  break;
                                                               }
                                                               §§push(§§pop() * §§pop());
                                                               break;
                                                            }
                                                         }
                                                         §§pop().v = §§pop();
                                                         _loc15_ = _loc11_.create();
                                                         while(true)
                                                         {
                                                            if(_loc39_ || Boolean(param2))
                                                            {
                                                               _loc15_.vertex = _loc10_;
                                                               if(_loc40_)
                                                               {
                                                                  break;
                                                               }
                                                            }
                                                            if(_loc12_ != null)
                                                            {
                                                               if(_loc39_ || Boolean(_loc3_))
                                                               {
                                                                  break;
                                                               }
                                                               addr2983:
                                                            }
                                                            else
                                                            {
                                                               _loc12_ = _loc15_;
                                                            }
                                                            _loc13_ = _loc15_;
                                                            addr2995:
                                                            addr2993:
                                                            §§push(_loc21_);
                                                            §§push(_loc20_);
                                                            break loop110;
                                                         }
                                                         _loc13_.next = _loc15_;
                                                         §§goto(addr2983);
                                                      }
                                                      addr29a3:
                                                      _loc13_.next = _loc11_;
                                                      if(!_loc40_)
                                                      {
                                                         break;
                                                      }
                                                      break loop111;
                                                   }
                                                   addr29b9:
                                                   _loc13_ = _loc11_;
                                                   if(!_loc40_)
                                                   {
                                                      _loc11_.next = null;
                                                   }
                                                   break;
                                                }
                                                _loc6_ = _loc7_;
                                                if(!(_loc40_ && Boolean(this)))
                                                {
                                                   §§push(_loc20_);
                                                   if(_loc39_)
                                                   {
                                                      §§push(Number(§§pop()));
                                                      if(_loc39_ || Boolean(param2))
                                                      {
                                                         _loc17_ = §§pop();
                                                         if(_loc40_)
                                                         {
                                                            continue;
                                                         }
                                                         §§push(_loc21_);
                                                         if(_loc39_ || Boolean(param2))
                                                         {
                                                            §§push(Number(§§pop()));
                                                         }
                                                      }
                                                   }
                                                   _loc18_ = §§pop();
                                                }
                                             }
                                             if(!(_loc39_ || Boolean(param1)))
                                             {
                                                break;
                                             }
                                          }
                                          if(_loc12_ == null)
                                          {
                                             if(_loc39_ || Boolean(param2))
                                             {
                                                _loc37_.processNext = null;
                                             }
                                             break;
                                          }
                                          addr2a6a:
                                          §§push(_loc35_);
                                          §§push(32);
                                          break loop73;
                                       }
                                       continue loop0;
                                    }
                                    addr2a70:
                                    if(!Boolean(§§pop()))
                                    {
                                       break loop39;
                                    }
                                    _loc6_ = _loc13_.vertex;
                                    loop76:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          if(_loc39_)
                                          {
                                             §§push(_loc6_.cameraY);
                                             if(_loc39_)
                                             {
                                                §§push(Number(§§pop()));
                                                if(!_loc39_)
                                                {
                                                   break;
                                                }
                                             }
                                             _loc17_ = §§pop();
                                             if(_loc40_ && Boolean(this))
                                             {
                                                break loop76;
                                             }
                                          }
                                          §§push(_loc6_.cameraZ);
                                          if(!(_loc40_ && Boolean(_loc3_)))
                                          {
                                             break;
                                          }
                                          addr2ab6:
                                          _loc18_ = §§pop();
                                          break loop76;
                                       }
                                       §§goto(addr2ab6);
                                    }
                                    _loc11_ = _loc12_;
                                    _loc12_ = null;
                                    _loc13_ = null;
                                    while(true)
                                    {
                                       if(!_loc40_)
                                       {
                                          loop19:
                                          for(; _loc11_ != null; _loc11_ = _loc14_)
                                          {
                                             _loc14_ = _loc11_.next;
                                             _loc7_ = _loc11_.vertex;
                                             loop79:
                                             while(true)
                                             {
                                                loop80:
                                                while(true)
                                                {
                                                   loop82:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         loop100:
                                                         while(true)
                                                         {
                                                            loop104:
                                                            while(true)
                                                            {
                                                               while(true)
                                                               {
                                                                  if(_loc39_ || Boolean(param2))
                                                                  {
                                                                     _loc20_ = _loc7_.cameraY;
                                                                     _loc21_ = _loc7_.cameraZ;
                                                                     if(!(_loc39_ || Boolean(param2)))
                                                                     {
                                                                        break;
                                                                     }
                                                                     §§push(_loc21_ > _loc20_);
                                                                     if(!_loc39_)
                                                                     {
                                                                        break loop104;
                                                                     }
                                                                     var _temp_97:* = §§pop();
                                                                     §§push(_temp_97);
                                                                     §§push(_temp_97);
                                                                     if(!_loc39_)
                                                                     {
                                                                        break loop100;
                                                                     }
                                                                     §§push(Boolean(§§pop()));
                                                                     if(!(_loc39_ || Boolean(_loc3_)))
                                                                     {
                                                                        continue loop101;
                                                                     }
                                                                     if(!§§pop())
                                                                     {
                                                                        break loop82;
                                                                     }
                                                                     if(!(_loc39_ || Boolean(param1)))
                                                                     {
                                                                        break loop80;
                                                                     }
                                                                     §§pop();
                                                                     if(_loc40_)
                                                                     {
                                                                        break loop79;
                                                                     }
                                                                  }
                                                                  §§push(_loc18_);
                                                                  if(!(_loc40_ && Boolean(this)))
                                                                  {
                                                                     §§push(§§pop() <= _loc17_);
                                                                     break loop82;
                                                                  }
                                                                  §§goto(addr2b7f);
                                                               }
                                                               §§goto(addr2eec);
                                                            }
                                                            §§goto(addr2ba9);
                                                         }
                                                         §§goto(addr2b98);
                                                      }
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            if(!§§pop())
                                                            {
                                                               §§pop();
                                                               §§push(_loc21_);
                                                               if(_loc40_)
                                                               {
                                                                  break;
                                                               }
                                                               while(true)
                                                               {
                                                                  §§push(§§pop() <= _loc20_);
                                                                  if(_loc39_)
                                                                  {
                                                                     §§push(Boolean(§§pop()));
                                                                     break loop80;
                                                                  }
                                                                  §§goto(addr2ba9);
                                                               }
                                                            }
                                                            §§goto(addr2baa);
                                                         }
                                                         §§goto(addr2bbe);
                                                      }
                                                      §§goto(addr2c12);
                                                   }
                                                   var _temp_94:* = §§pop();
                                                   while(true)
                                                   {
                                                      §§push(_temp_94);
                                                      §§push(_temp_94);
                                                      if(_loc39_ || Boolean(param2))
                                                      {
                                                         §§push(Boolean(§§pop()));
                                                         if(!_loc40_)
                                                         {
                                                            break loop98;
                                                         }
                                                      }
                                                      §§goto(addr2b98);
                                                   }
                                                   §§goto(addr2b99);
                                                }
                                                var _temp_66:* = §§pop();
                                                addr2b99:
                                                §§push(_temp_66);
                                                §§push(_temp_66);
                                                if(!(_loc40_ && Boolean(param1)))
                                                {
                                                   addr2b98:
                                                   §§push(Boolean(§§pop()));
                                                }
                                                loop83:
                                                while(true)
                                                {
                                                   if(§§pop())
                                                   {
                                                      §§pop();
                                                      if(_loc40_)
                                                      {
                                                         break;
                                                      }
                                                      §§push(_loc18_ > _loc17_);
                                                   }
                                                   addr2baa:
                                                   if(§§pop())
                                                   {
                                                      if(!(_loc39_ || Boolean(this)))
                                                      {
                                                         break loop79;
                                                      }
                                                      while(true)
                                                      {
                                                         §§push(_loc18_ - _loc17_);
                                                         §§push(_loc18_);
                                                         if(!(_loc40_ && Boolean(this)))
                                                         {
                                                            §§push(_loc17_);
                                                            if(!_loc40_)
                                                            {
                                                               §§push(§§pop() - §§pop());
                                                               §§push(_loc20_);
                                                               if(_loc39_)
                                                               {
                                                                  §§push(§§pop() + §§pop());
                                                                  if(!_loc39_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(_loc21_);
                                                               }
                                                            }
                                                            §§push(§§pop() - §§pop());
                                                            if(!(_loc39_ || Boolean(this)))
                                                            {
                                                               break;
                                                            }
                                                         }
                                                         §§push(§§pop() / §§pop());
                                                         if(_loc39_ || Boolean(param2))
                                                         {
                                                            §§push(Number(§§pop()));
                                                            if(_loc39_)
                                                            {
                                                               _loc36_ = §§pop();
                                                               break loop83;
                                                            }
                                                         }
                                                         addr2e79:
                                                         §§push(_loc20_);
                                                         break;
                                                      }
                                                      if(§§pop() > §§pop())
                                                      {
                                                         if(!(_loc40_ && Boolean(_loc3_)))
                                                         {
                                                            if(_loc12_ != null)
                                                            {
                                                               if(!(_loc40_ && Boolean(this)))
                                                               {
                                                                  break loop79;
                                                               }
                                                            }
                                                            else
                                                            {
                                                               _loc12_ = _loc11_;
                                                               §§goto(addr2eb2);
                                                            }
                                                            §§goto(addr2ef4);
                                                         }
                                                         §§goto(addr2ea8);
                                                      }
                                                      else
                                                      {
                                                         _loc11_.vertex = null;
                                                         if(_loc39_ || Boolean(param1))
                                                         {
                                                            _loc11_.next = Wrapper.collector;
                                                         }
                                                         addr2eec:
                                                         Wrapper.collector = _loc11_;
                                                      }
                                                      §§goto(addr2ef4);
                                                   }
                                                   addr2e77:
                                                   §§goto(addr2e79);
                                                }
                                                addr2c12:
                                                _loc10_ = _loc7_.create();
                                                if(!(_loc40_ && Boolean(param1)))
                                                {
                                                   this.lastVertex.next = _loc10_;
                                                   this.lastVertex = _loc10_;
                                                   if(_loc39_)
                                                   {
                                                      §§push(_loc10_);
                                                      §§push(_loc6_.cameraX);
                                                      if(!_loc40_)
                                                      {
                                                         §§push(_loc7_.cameraX);
                                                         if(!_loc40_)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc6_.cameraX);
                                                               if(_loc39_)
                                                               {
                                                                  §§push(§§pop() - §§pop());
                                                                  if(_loc40_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(_loc36_);
                                                               }
                                                               §§push(§§pop() * §§pop());
                                                               break;
                                                            }
                                                         }
                                                         §§push(§§pop() + §§pop());
                                                      }
                                                      §§pop().alternativa3d::cameraX = §§pop();
                                                      §§push(_loc10_);
                                                      §§push(_loc17_);
                                                      if(_loc39_ || Boolean(this))
                                                      {
                                                         loop86:
                                                         while(true)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc20_);
                                                               if(!_loc40_)
                                                               {
                                                                  §§push(_loc17_);
                                                                  if(!(_loc39_ || Boolean(this)))
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(§§pop() - §§pop());
                                                                  if(_loc40_ && Boolean(_loc3_))
                                                                  {
                                                                     break loop86;
                                                                  }
                                                               }
                                                               §§push(_loc36_);
                                                               break;
                                                            }
                                                            §§push(§§pop() * §§pop());
                                                            break;
                                                         }
                                                      }
                                                      §§pop().alternativa3d::cameraY = §§pop();
                                                   }
                                                }
                                                §§push(_loc10_);
                                                §§push(_loc18_);
                                                if(!_loc40_)
                                                {
                                                   §§push(_loc21_);
                                                   if(_loc39_ || Boolean(this))
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_loc18_);
                                                         if(!(_loc40_ && Boolean(_loc3_)))
                                                         {
                                                            §§push(§§pop() - §§pop());
                                                            if(!_loc39_)
                                                            {
                                                               break;
                                                            }
                                                            §§push(_loc36_);
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         break;
                                                      }
                                                   }
                                                   §§push(§§pop() + §§pop());
                                                }
                                                §§pop().alternativa3d::cameraZ = §§pop();
                                                §§push(_loc10_);
                                                §§push(_loc6_.x);
                                                if(!_loc40_)
                                                {
                                                   §§push(_loc7_.x);
                                                   if(!_loc40_)
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_loc6_.x);
                                                         if(_loc39_)
                                                         {
                                                            §§push(§§pop() - §§pop());
                                                            if(!(_loc39_ || Boolean(param2)))
                                                            {
                                                               break;
                                                            }
                                                            §§push(_loc36_);
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         break;
                                                      }
                                                   }
                                                   §§push(§§pop() + §§pop());
                                                }
                                                §§pop().x = §§pop();
                                                while(true)
                                                {
                                                   if(_loc39_)
                                                   {
                                                      §§push(_loc10_);
                                                      §§push(_loc6_.y);
                                                      if(_loc39_)
                                                      {
                                                         §§push(_loc7_.y);
                                                         if(!_loc40_)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc6_.y);
                                                               if(_loc39_)
                                                               {
                                                                  §§push(§§pop() - §§pop());
                                                                  if(!(_loc39_ || Boolean(param1)))
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(_loc36_);
                                                               }
                                                               §§push(§§pop() * §§pop());
                                                               break;
                                                            }
                                                         }
                                                         §§push(§§pop() + §§pop());
                                                      }
                                                      §§pop().y = §§pop();
                                                      §§push(_loc10_);
                                                      §§push(_loc6_.z);
                                                      if(_loc39_)
                                                      {
                                                         §§push(_loc7_.z);
                                                         if(!_loc40_)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc6_.z);
                                                               if(_loc39_ || Boolean(param1))
                                                               {
                                                                  §§push(§§pop() - §§pop());
                                                                  if(!_loc39_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(_loc36_);
                                                               }
                                                               §§push(§§pop() * §§pop());
                                                               break;
                                                            }
                                                         }
                                                         §§push(§§pop() + §§pop());
                                                      }
                                                      §§pop().z = §§pop();
                                                      if(_loc40_ && Boolean(param2))
                                                      {
                                                         break;
                                                      }
                                                      §§push(_loc10_);
                                                      §§push(_loc6_.u);
                                                      if(_loc39_ || Boolean(param2))
                                                      {
                                                         loop93:
                                                         while(true)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc7_.u);
                                                               if(_loc39_ || Boolean(param1))
                                                               {
                                                                  §§push(_loc6_.u);
                                                                  if(_loc40_ && Boolean(param1))
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(§§pop() - §§pop());
                                                                  if(_loc40_ && Boolean(param2))
                                                                  {
                                                                     break loop93;
                                                                  }
                                                               }
                                                               §§push(_loc36_);
                                                               break;
                                                            }
                                                            §§push(§§pop() * §§pop());
                                                            break;
                                                         }
                                                      }
                                                      §§pop().u = §§pop();
                                                      if(_loc40_ && Boolean(param2))
                                                      {
                                                         break;
                                                      }
                                                   }
                                                   §§push(_loc10_);
                                                   §§push(_loc6_.v);
                                                   if(!_loc40_)
                                                   {
                                                      loop95:
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc7_.v);
                                                            if(_loc39_ || Boolean(param2))
                                                            {
                                                               §§push(_loc6_.v);
                                                               if(_loc40_ && Boolean(this))
                                                               {
                                                                  break;
                                                               }
                                                               §§push(§§pop() - §§pop());
                                                               if(_loc40_ && Boolean(_loc3_))
                                                               {
                                                                  break loop95;
                                                               }
                                                            }
                                                            §§push(_loc36_);
                                                            break;
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         break;
                                                      }
                                                   }
                                                   §§pop().v = §§pop();
                                                   break;
                                                }
                                                _loc15_ = _loc11_.create();
                                                while(true)
                                                {
                                                   if(!_loc40_)
                                                   {
                                                      _loc15_.vertex = _loc10_;
                                                      if(!_loc39_)
                                                      {
                                                         break;
                                                      }
                                                   }
                                                   if(_loc12_ != null)
                                                   {
                                                      if(!(_loc40_ && Boolean(_loc3_)))
                                                      {
                                                         break;
                                                      }
                                                      addr2e67:
                                                   }
                                                   else
                                                   {
                                                      _loc12_ = _loc15_;
                                                   }
                                                   _loc13_ = _loc15_;
                                                   §§goto(addr2e77);
                                                }
                                                _loc13_.next = _loc15_;
                                                §§goto(addr2e67);
                                             }
                                             _loc13_.next = _loc11_;
                                             addr2eb2:
                                             _loc13_ = _loc11_;
                                             if(_loc39_ || Boolean(this))
                                             {
                                                _loc11_.next = null;
                                             }
                                             addr2ef4:
                                             _loc6_ = _loc7_;
                                             if(!(_loc40_ && Boolean(param2)))
                                             {
                                                while(true)
                                                {
                                                   §§push(_loc20_);
                                                   if(!(_loc40_ && Boolean(this)))
                                                   {
                                                      §§push(Number(§§pop()));
                                                      if(_loc40_)
                                                      {
                                                         break;
                                                      }
                                                   }
                                                   _loc17_ = §§pop();
                                                   if(!(_loc40_ && Boolean(param1)))
                                                   {
                                                      §§push(_loc21_);
                                                      if(!(_loc40_ && Boolean(this)))
                                                      {
                                                         §§push(Number(§§pop()));
                                                      }
                                                      break;
                                                   }
                                                   continue loop19;
                                                }
                                                _loc18_ = §§pop();
                                             }
                                             continue;
                                             addr2ea8:
                                          }
                                          if(_loc40_ && Boolean(this))
                                          {
                                             break;
                                          }
                                       }
                                       if(_loc12_ == null)
                                       {
                                          if(_loc39_)
                                          {
                                             _loc37_.processNext = null;
                                          }
                                          break;
                                       }
                                       break loop39;
                                    }
                                    continue loop0;
                                 }
                                 §§push(§§pop() & §§pop());
                                 break loop74;
                              }
                              if(!(_loc39_ || Boolean(param1)))
                              {
                                 break;
                              }
                           }
                           _loc37_.processNext = null;
                           break;
                        }
                        continue loop0;
                     }
                     continue loop76;
                  }
                  _loc37_.processNext = null;
                  break;
               }
               _loc38_ = _loc37_.create();
               while(true)
               {
                  if(_loc39_)
                  {
                     _loc38_.material = _loc37_.material;
                     if(!(_loc40_ && Boolean(this)))
                     {
                        this.lastFace.next = _loc38_;
                        if(_loc40_)
                        {
                           break;
                        }
                     }
                     this.lastFace = _loc38_;
                     if(_loc40_)
                     {
                        break;
                     }
                  }
                  _loc38_.wrapper = _loc12_;
                  break;
               }
               _loc37_ = _loc38_;
               §§goto(addr2fc1);
            }
            if(§§pop() > §§pop())
            {
               while(true)
               {
                  if(_loc39_)
                  {
                     break loop32;
                  }
                  addr2fcd:
                  break;
               }
               addr2fd6:
               _loc4_ = _loc37_;
               continue;
            }
            addr2fc1:
            if(_loc3_ != null)
            {
               addr2fc7:
               _loc4_.processNext = _loc37_;
               §§goto(addr2fcd);
            }
            else
            {
               _loc3_ = _loc37_;
            }
            §§goto(addr2fd6);
         }
         if(_loc39_ || Boolean(param2))
         {
            if(_loc4_ != null)
            {
               if(!(_loc40_ && Boolean(param2)))
               {
                  _loc4_.processNext = null;
               }
            }
         }
         return _loc3_;
      }
   }
}

§§push(false);
true;
§§pop();
if(_loc1_)
{
   Camera3D = §§newclass(Camera3D,Object3D);
}

