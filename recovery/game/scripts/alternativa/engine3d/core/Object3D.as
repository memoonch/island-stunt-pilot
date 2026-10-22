package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   use namespace alternativa3d;
   
   [Event(name="mouseWheel",type="alternativa.engine3d.core.MouseEvent3D")]
   [Event(name="mouseMove",type="alternativa.engine3d.core.MouseEvent3D")]
   [Event(name="rollOut",type="alternativa.engine3d.core.MouseEvent3D")]
   [Event(name="rollOver",type="alternativa.engine3d.core.MouseEvent3D")]
   [Event(name="mouseOut",type="alternativa.engine3d.core.MouseEvent3D")]
   [Event(name="mouseOver",type="alternativa.engine3d.core.MouseEvent3D")]
   [Event(name="mouseUp",type="alternativa.engine3d.core.MouseEvent3D")]
   [Event(name="mouseDown",type="alternativa.engine3d.core.MouseEvent3D")]
   [Event(name="doubleClick",type="alternativa.engine3d.core.MouseEvent3D")]
   [Event(name="click",type="alternativa.engine3d.core.MouseEvent3D")]
   public class Object3D implements IEventDispatcher
   {
      
      private static const boundVertexList:Vertex;
      
      §§push(false);
      var _loc1_:Boolean = true;
      var _loc2_:* = §§pop();
      if(_loc1_ || Boolean(_loc2_))
      {
         boundVertexList = Vertex.createList(8);
      }
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var z:Number = 0;
      
      public var rotationX:Number = 0;
      
      public var rotationY:Number = 0;
      
      public var rotationZ:Number = 0;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var scaleZ:Number = 1;
      
      public var name:String;
      
      public var visible:Boolean = true;
      
      public var alpha:Number = 1;
      
      public var blendMode:String = "normal";
      
      public var colorTransform:ColorTransform = null;
      
      public var filters:Array = null;
      
      public var mouseEnabled:Boolean = true;
      
      public var doubleClickEnabled:Boolean = false;
      
      public var boundMinX:Number = -1e+22;
      
      public var boundMinY:Number = -1e+22;
      
      public var boundMinZ:Number = -1e+22;
      
      public var boundMaxX:Number = 1e+22;
      
      public var boundMaxY:Number = 1e+22;
      
      public var boundMaxZ:Number = 1e+22;
      
      alternativa3d var ma:Number;
      
      alternativa3d var mb:Number;
      
      alternativa3d var mc:Number;
      
      alternativa3d var md:Number;
      
      alternativa3d var me:Number;
      
      alternativa3d var mf:Number;
      
      alternativa3d var mg:Number;
      
      alternativa3d var mh:Number;
      
      alternativa3d var mi:Number;
      
      alternativa3d var mj:Number;
      
      alternativa3d var mk:Number;
      
      alternativa3d var ml:Number;
      
      alternativa3d var ima:Number;
      
      alternativa3d var imb:Number;
      
      alternativa3d var imc:Number;
      
      alternativa3d var imd:Number;
      
      alternativa3d var ime:Number;
      
      alternativa3d var imf:Number;
      
      alternativa3d var img:Number;
      
      alternativa3d var imh:Number;
      
      alternativa3d var imi:Number;
      
      alternativa3d var imj:Number;
      
      alternativa3d var imk:Number;
      
      alternativa3d var iml:Number;
      
      alternativa3d var weightsSum:Vector.<Number>;
      
      alternativa3d var _parent:Object3DContainer;
      
      alternativa3d var next:Object3D;
      
      alternativa3d var culling:int = 0;
      
      alternativa3d var transformId:int = 0;
      
      alternativa3d var distance:Number;
      
      alternativa3d var bubbleListeners:Object;
      
      alternativa3d var captureListeners:Object;
      
      public function Object3D()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(_loc1_ || Boolean(_loc2_))
         {
            super();
         }
      }
      
      public function get matrix() : Matrix3D
      {
         §§push(false);
         var _loc6_:Boolean = true;
         var _loc7_:* = §§pop();
         var _loc1_:Matrix3D = new Matrix3D();
         var _loc2_:Vector3D = new Vector3D(this.x,this.y,this.z);
         var _loc3_:Vector3D = new Vector3D(this.rotationX,this.rotationY,this.rotationZ);
         var _loc4_:Vector3D = new Vector3D(this.scaleX,this.scaleY,this.scaleZ);
         var _loc5_:Vector.<Vector3D> = new Vector.<Vector3D>();
         if(!_loc7_)
         {
            _loc5_[0] = _loc2_;
            if(!_loc7_)
            {
               _loc5_[1] = _loc3_;
               while(true)
               {
                  if(!_loc7_)
                  {
                     _loc5_[2] = _loc4_;
                     if(_loc7_)
                     {
                        break;
                     }
                  }
                  _loc1_.recompose(_loc5_);
                  break;
               }
            }
         }
         return _loc1_;
      }
      
      public function set matrix(param1:Matrix3D) : void
      {
         §§push(false);
         var _loc6_:Boolean = true;
         var _loc7_:* = §§pop();
         var _loc2_:Vector.<Vector3D> = param1.decompose();
         var _loc3_:Vector3D = _loc2_[0];
         var _loc4_:Vector3D = _loc2_[1];
         var _loc5_:Vector3D = _loc2_[2];
         this.x = _loc3_.x;
         this.y = _loc3_.y;
         if(!(_loc7_ && Boolean(_loc3_)))
         {
            this.z = _loc3_.z;
            loop0:
            while(true)
            {
               while(true)
               {
                  if(!_loc7_)
                  {
                     this.rotationX = _loc4_.x;
                     if(!_loc6_)
                     {
                        break;
                     }
                     this.rotationY = _loc4_.y;
                     this.rotationZ = _loc4_.z;
                     if(!(_loc6_ || Boolean(this)))
                     {
                        break loop0;
                     }
                  }
                  this.scaleX = _loc5_.x;
                  break loop0;
               }
            }
            this.scaleY = _loc5_.y;
            this.scaleZ = _loc5_.z;
            break loop1;
         }
      }
      
      public function get parent() : Object3DContainer
      {
         return this._parent;
      }
      
      public function calculateBounds() : void
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         this.boundMinX = 1e+22;
         loop0:
         while(true)
         {
            while(true)
            {
               if(!_loc2_)
               {
                  this.boundMinY = 1e+22;
                  this.boundMinZ = 1e+22;
                  if(_loc1_)
                  {
                     this.boundMaxX = -1e+22;
                     if(_loc2_ && Boolean(_loc2_))
                     {
                        break;
                     }
                     this.boundMaxY = -1e+22;
                  }
                  this.boundMaxZ = -1e+22;
                  this.updateBounds(this,null);
                  if(this.boundMinX <= this.boundMaxX)
                  {
                     break loop0;
                  }
                  this.boundMinX = -1e+22;
                  this.boundMinY = -1e+22;
                  this.boundMinZ = -1e+22;
                  if(!(_loc1_ || Boolean(_loc2_)))
                  {
                     break loop0;
                  }
               }
               this.boundMaxX = 1e+22;
               this.boundMaxY = 1e+22;
               break;
            }
            this.boundMaxZ = 1e+22;
            break;
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _temp_1:* = true;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = _temp_1;
         var _loc6_:Object = null;
         if(_loc9_ || Boolean(param2))
         {
            if(param2 != null)
            {
               if(param3)
               {
                  if(this.captureListeners == null)
                  {
                     this.captureListeners = new Object();
                  }
                  _loc6_ = this.captureListeners;
               }
               else
               {
                  if(this.bubbleListeners == null)
                  {
                     this.bubbleListeners = new Object();
                  }
                  _loc6_ = this.bubbleListeners;
               }
               var _loc7_:Vector.<Function> = _loc6_[param1];
               if(_loc7_ == null)
               {
                  _loc7_ = new Vector.<Function>();
                  _loc6_[param1] = _loc7_;
               }
               if(_loc7_.indexOf(param2) < 0)
               {
                  _loc7_.push(param2);
               }
               return;
            }
         }
         throw new TypeError("Parameter listener must be non-null.");
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _temp_1:* = true;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = _temp_1;
         var _loc5_:Vector.<Function> = null;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:* = undefined;
         if(!(_loc12_ && Boolean(param1)))
         {
            if(param2 != null)
            {
               var _loc4_:Object = param3 ? this.captureListeners : this.bubbleListeners;
               if(_loc4_ != null)
               {
                  _loc5_ = _loc4_[param1];
                  if(_loc5_ != null)
                  {
                     _loc6_ = int(_loc5_.indexOf(param2));
                     if(_loc6_ >= 0)
                     {
                        _loc7_ = int(_loc5_.length);
                        _loc8_ = int(_loc6_ + 1);
                        loop0:
                        while(_loc8_ < _loc7_)
                        {
                           _loc5_[_loc6_] = _loc5_[_loc8_];
                           if(!(_loc13_ || Boolean(this)))
                           {
                              continue;
                           }
                           loop1:
                           while(true)
                           {
                              §§push(_loc8_);
                              if(!_loc12_)
                              {
                                 §§push(§§pop() + 1);
                                 if(!_loc13_)
                                 {
                                    break;
                                 }
                              }
                              while(true)
                              {
                                 §§push(int(§§pop()));
                                 if(_loc13_ || Boolean(this))
                                 {
                                    break loop1;
                                 }
                                 addr00f0:
                                 §§push(int(§§pop()));
                                 break;
                              }
                              addr00f1:
                              _loc6_ = §§pop();
                              continue loop0;
                           }
                           _loc8_ = §§pop();
                           if(!_loc13_)
                           {
                              continue;
                           }
                           §§push(_loc6_);
                           if(!_loc12_)
                           {
                              §§push(§§pop() + 1);
                              if(!_loc12_)
                              {
                                 §§goto(addr00f0);
                              }
                           }
                           §§goto(addr00f1);
                        }
                        if(_loc7_ > 1)
                        {
                           _loc5_.length = _loc7_ - 1;
                        }
                        else
                        {
                           delete _loc4_[param1];
                           var _loc10_:int = 0;
                           var _loc11_:* = _loc4_;
                           for(_loc9_ in _loc11_)
                           {
                           }
                           if(!_loc9_)
                           {
                              if(_loc4_ == this.captureListeners)
                              {
                                 this.captureListeners = null;
                              }
                              else
                              {
                                 this.bubbleListeners = null;
                              }
                           }
                        }
                     }
                  }
               }
               return;
            }
         }
         throw new TypeError("Parameter listener must be non-null.");
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         loop0:
         while(true)
         {
            if(_loc2_ || Boolean(this))
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
                        loop4:
                        while(true)
                        {
                           loop5:
                           while(true)
                           {
                              §§push(this.captureListeners == null);
                              if(_loc2_)
                              {
                                 while(true)
                                 {
                                    §§push(!§§pop());
                                    if(!_loc3_)
                                    {
                                       var _temp_3:* = §§pop();
                                       §§push(_temp_3);
                                       §§push(_temp_3);
                                       if(_loc3_)
                                       {
                                          break loop5;
                                       }
                                       §§push(Boolean(§§pop()));
                                       if(_loc3_)
                                       {
                                          break loop4;
                                       }
                                       if(!§§pop())
                                       {
                                          break;
                                       }
                                    }
                                    §§pop();
                                    if(!_loc3_)
                                    {
                                       §§push(Boolean(this.captureListeners[param1]));
                                       break;
                                    }
                                    break loop2;
                                 }
                                 var _temp_4:* = §§pop();
                                 §§push(_temp_4);
                                 §§push(_temp_4);
                                 if(_loc3_ && Boolean(_loc3_))
                                 {
                                    break;
                                 }
                                 §§push(Boolean(§§pop()));
                                 if(_loc3_)
                                 {
                                    break loop4;
                                 }
                                 if(§§pop())
                                 {
                                    break loop0;
                                 }
                                 if(!(_loc2_ || _loc2_))
                                 {
                                    break loop3;
                                 }
                                 §§pop();
                                 if(_loc3_ && Boolean(param1))
                                 {
                                    break loop2;
                                 }
                                 §§push(this.bubbleListeners != null);
                                 if(!(_loc2_ || Boolean(this)))
                                 {
                                    break loop1;
                                 }
                              }
                              §§push(Boolean(§§pop()));
                              break loop3;
                           }
                           §§goto(addr00ad);
                        }
                        §§push(Boolean(§§pop()));
                        break loop5;
                     }
                     var _temp_2:* = §§pop();
                     §§push(_temp_2);
                     §§push(_temp_2);
                     if(!_loc3_)
                     {
                        break loop4;
                     }
                     addr00ad:
                     if(§§pop())
                     {
                        break loop1;
                     }
                     break loop0;
                  }
               }
               §§pop();
            }
            break loop2;
         }
         return §§pop();
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         var _loc2_:Object3D = this;
         loop0:
         for(; _loc2_ != null; _loc2_ = _loc2_._parent)
         {
            loop1:
            while(true)
            {
               while(true)
               {
                  §§push(_loc2_.captureListeners != null);
                  if(_loc4_ || Boolean(param1))
                  {
                     var _temp_7:* = Boolean(§§pop());
                     §§push(_temp_7);
                     §§push(_temp_7);
                     if(_loc3_)
                     {
                        break;
                     }
                     §§push(Boolean(§§pop()));
                     if(!(_loc4_ || Boolean(this)))
                     {
                        break;
                     }
                     if(!§§pop())
                     {
                        break loop1;
                     }
                  }
                  §§pop();
                  if(!(_loc3_ && _loc3_))
                  {
                     §§push(Boolean(_loc2_.captureListeners[param1]));
                     break loop1;
                  }
                  break loop0;
               }
               while(true)
               {
                  §§push(Boolean(§§pop()));
                  if(!(_loc3_ && _loc3_))
                  {
                     if(§§pop())
                     {
                        break;
                     }
                     §§pop();
                     if(_loc3_ && Boolean(_loc2_))
                     {
                        break loop6;
                     }
                     §§push(Boolean(_loc2_.bubbleListeners != null));
                     if(_loc3_ && Boolean(this))
                     {
                        break loop4;
                     }
                     var _temp_13:* = §§pop();
                     §§push(_temp_13);
                     §§push(_temp_13);
                     if(_loc3_ && Boolean(param1))
                     {
                        break loop3;
                     }
                  }
                  §§goto(addr00bb);
               }
               §§goto(addr00e9);
            }
            var _temp_3:* = §§pop();
            loop3:
            while(true)
            {
               while(true)
               {
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_temp_3);
                        §§push(_temp_3);
                        if(!(_loc3_ && Boolean(this)))
                        {
                           break loop2;
                        }
                        addr00bb:
                        §§push(Boolean(§§pop()));
                        break loop3;
                     }
                     §§goto(addr00e9);
                  }
                  §§goto(addr00f3);
               }
               return §§pop();
            }
            while(true)
            {
               if(§§pop())
               {
                  if(_loc3_ && Boolean(_loc2_))
                  {
                     break loop4;
                  }
                  §§pop();
                  if(!(_loc4_ || Boolean(this)))
                  {
                     continue loop0;
                  }
                  §§push(Boolean(_loc2_.bubbleListeners[param1]));
                  if(_loc3_)
                  {
                     break;
                  }
               }
               addr00e9:
               if(§§pop())
               {
                  if(_loc4_)
                  {
                     addr00f3:
                     §§push(true);
                     if(_loc4_)
                     {
                        break;
                     }
                     break loop4;
                  }
                  break loop0;
               }
               continue loop0;
            }
            return §§pop();
         }
         §§push(false);
         break loop4;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         var _temp_1:* = true;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = _temp_1;
         var _loc4_:Object3D = null;
         var _loc6_:Vector.<Function> = null;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:Vector.<Function> = null;
         loop4:
         while(true)
         {
            if(!_loc10_)
            {
               if(param1 == null)
               {
                  break;
               }
               if(param1 is MouseEvent3D)
               {
                  MouseEvent3D(param1)._target = this;
               }
               var _loc2_:Vector.<Object3D> = new Vector.<Object3D>();
               var _loc3_:* = 0;
               _loc4_ = this;
               while(_loc4_ != null)
               {
                  _loc2_[_loc3_] = _loc4_;
                  if(!(_loc10_ && Boolean(this)))
                  {
                     while(true)
                     {
                        §§push(_loc3_);
                        if(_loc11_ || Boolean(this))
                        {
                           §§push(§§pop() + 1);
                           if(!(_loc11_ || Boolean(this)))
                           {
                              break;
                           }
                        }
                        §§push(int(§§pop()));
                        break;
                     }
                     _loc3_ = §§pop();
                  }
                  _loc4_ = _loc4_._parent;
               }
               var _loc5_:* = 0;
               loop1:
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_];
                  loop6:
                  while(true)
                  {
                     while(true)
                     {
                        if(_loc11_)
                        {
                           §§push(param1 is MouseEvent3D);
                           if(_loc10_)
                           {
                              break;
                           }
                           while(true)
                           {
                              if(§§pop())
                              {
                                 if(_loc10_ && Boolean(this))
                                 {
                                    break;
                                 }
                                 MouseEvent3D(param1)._currentTarget = _loc4_;
                                 if(_loc10_)
                                 {
                                    continue loop1;
                                 }
                              }
                              if(this.bubbleListeners == null)
                              {
                                 break loop6;
                              }
                              if(!(_loc10_ && Boolean(_loc3_)))
                              {
                                 break;
                              }
                              continue loop1;
                           }
                        }
                        _loc6_ = this.bubbleListeners[param1.type];
                        while(true)
                        {
                           if(!_loc10_)
                           {
                              if(_loc6_ == null)
                              {
                                 break loop6;
                              }
                              if(_loc10_)
                              {
                                 break;
                              }
                           }
                           _loc8_ = int(_loc6_.length);
                           break;
                        }
                        _loc9_ = new Vector.<Function>();
                        §§push(0);
                        if(_loc11_ || Boolean(this))
                        {
                           _loc7_ = int(§§pop());
                           loop2:
                           while(true)
                           {
                              §§push(_loc7_);
                              if(_loc11_)
                              {
                                 §§push(_loc8_);
                                 if(_loc11_)
                                 {
                                    if(§§pop() >= §§pop())
                                    {
                                       if(!(_loc10_ && Boolean(this)))
                                       {
                                          _loc7_ = 0;
                                       }
                                    }
                                    else
                                    {
                                       _loc9_[_loc7_] = _loc6_[_loc7_];
                                       §§push(_loc7_ + 1);
                                       if(_loc11_ || Boolean(param1))
                                       {
                                          _loc7_ = int(§§pop());
                                          if(_loc10_ && Boolean(param1))
                                          {
                                             break loop6;
                                          }
                                          continue;
                                       }
                                       addr01ec:
                                       _loc7_ = §§pop();
                                    }
                                    while(true)
                                    {
                                       §§push(_loc7_);
                                       §§push(_loc8_);
                                       break loop2;
                                    }
                                    break loop4;
                                    addr01ee:
                                 }
                                 break;
                              }
                           }
                           if(§§pop() >= §§pop())
                           {
                              break loop6;
                           }
                           (_loc9_[_loc7_] as Function).call(null,param1);
                           if(_loc11_ || Boolean(this))
                           {
                              §§push(_loc7_);
                              if(!_loc10_)
                              {
                                 addr01ea:
                                 §§push(int(§§pop() + 1));
                              }
                              §§goto(addr01ec);
                           }
                           §§goto(addr01ee);
                        }
                        §§goto(addr01ea);
                     }
                     if(§§pop())
                     {
                        if(_loc11_ || Boolean(this))
                        {
                           break loop1;
                        }
                     }
                     else
                     {
                        while(true)
                        {
                           §§push(_loc5_);
                           if(!_loc10_)
                           {
                              §§push(§§pop() + 1);
                              if(!_loc11_)
                              {
                                 break;
                              }
                           }
                           §§push(int(§§pop()));
                           break;
                        }
                        _loc5_ = §§pop();
                     }
                     continue loop1;
                  }
                  §§push(!param1.bubbles);
                  break loop7;
               }
               return true;
            }
            break;
         }
         throw new TypeError("Parameter event must be non-null.");
      }
      
      public function calculateResolution(param1:int, param2:int, param3:int = 1, param4:Matrix3D = null) : Number
      {
         return 1;
      }
      
      public function localToGlobal(param1:Vector3D) : Vector3D
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         if(!(_loc5_ && Boolean(_loc2_)))
         {
            this.composeMatrix();
         }
         var _loc2_:Object3D = this;
         loop0:
         while(true)
         {
            §§push(_loc2_._parent);
            do
            {
               if(§§pop() == null)
               {
                  break loop0;
               }
               §§push(_loc2_._parent);
            }
            while(!_loc4_);
            _loc2_ = §§pop();
            if(!(_loc5_ && Boolean(this)))
            {
               _loc2_.composeMatrix();
               if(!_loc5_)
               {
                  this.appendMatrix(_loc2_);
               }
            }
         }
         var _loc3_:Vector3D = new Vector3D();
         while(true)
         {
            if(!_loc5_)
            {
               _loc3_.x = this.ma * param1.x + this.mb * param1.y + this.mc * param1.z + this.md;
               if(!_loc4_)
               {
                  break;
               }
            }
            _loc3_.y = this.me * param1.x + this.mf * param1.y + this.mg * param1.z + this.mh;
            if(_loc4_)
            {
               break;
            }
            §§goto(addr00e9);
         }
         _loc3_.z = this.mi * param1.x + this.mj * param1.y + this.mk * param1.z + this.ml;
         addr00e9:
         return _loc3_;
      }
      
      public function globalToLocal(param1:Vector3D) : Vector3D
      {
         var _temp_1:* = true;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = _temp_1;
         if(_loc5_)
         {
            this.composeMatrix();
         }
         var _loc2_:Object3D = this;
         loop0:
         while(true)
         {
            §§push(_loc2_._parent);
            do
            {
               if(§§pop() == null)
               {
                  break loop0;
               }
               §§push(_loc2_._parent);
            }
            while(_loc4_);
            _loc2_ = §§pop();
            if(!_loc4_)
            {
               _loc2_.composeMatrix();
               if(_loc4_ && Boolean(_loc3_))
               {
                  continue;
               }
            }
            this.appendMatrix(_loc2_);
         }
         if(_loc5_ || Boolean(param1))
         {
            this.invertMatrix();
         }
         var _loc3_:Vector3D = new Vector3D();
         if(_loc5_)
         {
            _loc3_.x = this.ma * param1.x + this.mb * param1.y + this.mc * param1.z + this.md;
            while(true)
            {
               if(_loc5_ || Boolean(_loc2_))
               {
                  _loc3_.y = this.me * param1.x + this.mf * param1.y + this.mg * param1.z + this.mh;
                  if(_loc4_)
                  {
                     break;
                  }
               }
               _loc3_.z = this.mi * param1.x + this.mj * param1.y + this.mk * param1.z + this.ml;
               break;
            }
         }
         return _loc3_;
      }
      
      public function intersectRay(param1:Vector3D, param2:Vector3D, param3:Dictionary = null, param4:Camera3D = null) : RayIntersectionData
      {
         return null;
      }
      
      public function clone() : Object3D
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         var _loc1_:Object3D = new Object3D();
         if(!(_loc3_ && _loc2_))
         {
            _loc1_.clonePropertiesFrom(this);
         }
         return _loc1_;
      }
      
      protected function clonePropertiesFrom(param1:Object3D) : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         if(_loc3_)
         {
            this.name = param1.name;
            this.visible = param1.visible;
            this.alpha = param1.alpha;
            this.blendMode = param1.blendMode;
            this.mouseEnabled = param1.mouseEnabled;
            if(_loc3_)
            {
               this.doubleClickEnabled = param1.doubleClickEnabled;
            }
            this.transformId = param1.transformId;
         }
         this.distance = param1.distance;
         loop0:
         while(true)
         {
            if(param1.colorTransform != null)
            {
               if(!_loc3_)
               {
                  break;
               }
               this.colorTransform = new ColorTransform();
               this.colorTransform.concat(param1.colorTransform);
            }
            while(true)
            {
               if(param1.filters != null)
               {
                  this.filters = new Array().concat(param1.filters);
                  if(!(_loc3_ || Boolean(param1)))
                  {
                     break;
                  }
               }
               this.x = param1.x;
               this.y = param1.y;
               if(_loc3_ || _loc3_)
               {
                  this.z = param1.z;
                  if(!(_loc2_ && _loc3_))
                  {
                     this.rotationX = param1.rotationX;
                     break;
                  }
                  §§goto(addr00f4);
               }
               §§goto(addr00d5);
            }
            this.rotationY = param1.rotationY;
            if(_loc3_)
            {
               addr00d5:
               this.rotationZ = param1.rotationZ;
               §§goto(addr00db);
            }
            addr00db:
            this.scaleX = param1.scaleX;
            this.scaleY = param1.scaleY;
            if(_loc2_ && Boolean(this))
            {
               break;
            }
            addr00f4:
            this.scaleZ = param1.scaleZ;
            while(true)
            {
               if(_loc3_)
               {
                  this.boundMinX = param1.boundMinX;
                  this.boundMinY = param1.boundMinY;
                  if(!(_loc3_ || Boolean(param1)))
                  {
                     break;
                  }
               }
               this.boundMinZ = param1.boundMinZ;
               break loop0;
            }
            §§goto(addr0134);
         }
         this.boundMaxX = param1.boundMaxX;
         this.boundMaxY = param1.boundMaxY;
         addr0134:
         this.boundMaxZ = param1.boundMaxZ;
      }
      
      public function toString() : String
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         var _loc1_:String = getQualifiedClassName(this);
         while(true)
         {
            §§push("[" + _loc1_.substr(_loc1_.indexOf("::") + 2));
            if(_loc2_ || Boolean(_loc1_))
            {
               §§push(§§pop() + " ");
               if(!(_loc3_ && _loc2_))
               {
                  §§push(§§pop() + this.name);
                  if(_loc3_ && _loc2_)
                  {
                     break;
                  }
               }
            }
            return §§pop() + "]";
         }
         return §§pop();
      }
      
      alternativa3d function draw(param1:Camera3D, param2:Canvas) : void
      {
      }
      
      alternativa3d function getVG(param1:Camera3D) : VG
      {
         return null;
      }
      
      alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
      }
      
      alternativa3d function boundIntersectRay(param1:Vector3D, param2:Vector3D, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Boolean
      {
         §§push(false);
         var _loc14_:Boolean = true;
         var _loc15_:* = §§pop();
         var _loc9_:* = NaN;
         var _loc10_:* = NaN;
         var _loc11_:* = NaN;
         var _loc12_:* = NaN;
         loop0:
         while(true)
         {
            if(_loc14_)
            {
               var _temp_2:* = param1.x >= param3 && param1.x <= param6;
               while(true)
               {
                  loop2:
                  while(true)
                  {
                     loop40:
                     while(true)
                     {
                        loop43:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(_temp_2);
                              §§push(_temp_2);
                              if(!_loc15_)
                              {
                                 loop45:
                                 while(true)
                                 {
                                    loop46:
                                    while(true)
                                    {
                                       loop47:
                                       while(true)
                                       {
                                          §§push(Boolean(§§pop()));
                                          if(!(_loc15_ && Boolean(param2)))
                                          {
                                             loop48:
                                             while(true)
                                             {
                                                if(§§pop())
                                                {
                                                   if(!_loc14_)
                                                   {
                                                      break loop45;
                                                   }
                                                   §§pop();
                                                   if(!(_loc14_ || Boolean(param3)))
                                                   {
                                                      break;
                                                   }
                                                   §§push(param1.y >= param4);
                                                   if(_loc15_ && Boolean(param3))
                                                   {
                                                      break loop47;
                                                   }
                                                }
                                                var _temp_45:* = §§pop();
                                                loop49:
                                                while(true)
                                                {
                                                   loop50:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_temp_45);
                                                         §§push(Boolean(_temp_45));
                                                         if(!_loc15_)
                                                         {
                                                            if(§§pop())
                                                            {
                                                               §§pop();
                                                               if(!_loc14_)
                                                               {
                                                                  break;
                                                               }
                                                               §§push(param1.y <= param7);
                                                               if(!(_loc14_ || Boolean(param2)))
                                                               {
                                                                  break loop50;
                                                               }
                                                               §§push(Boolean(§§pop()));
                                                            }
                                                            var _temp_51:* = §§pop();
                                                            §§push(_temp_51);
                                                            §§push(_temp_51);
                                                            if(!_loc14_)
                                                            {
                                                               break loop46;
                                                            }
                                                            if(Boolean(§§pop()))
                                                            {
                                                               if(_loc14_)
                                                               {
                                                                  §§pop();
                                                                  if(_loc14_ || Boolean(param3))
                                                                  {
                                                                     break loop48;
                                                                  }
                                                                  addr00fa:
                                                                  var _temp_53:* = param1.x < param3;
                                                                  §§push(_temp_53);
                                                                  §§push(_temp_53);
                                                                  break loop49;
                                                               }
                                                               continue loop3;
                                                            }
                                                            var _temp_54:* = §§pop();
                                                            §§push(_temp_54);
                                                            §§push(_temp_54);
                                                            if(_loc15_)
                                                            {
                                                               break loop49;
                                                            }
                                                            §§push(Boolean(§§pop()));
                                                         }
                                                         if(§§pop())
                                                         {
                                                            §§pop();
                                                            §§push(param1.z <= param8);
                                                            if(_loc14_ || Boolean(param2))
                                                            {
                                                               §§push(Boolean(§§pop()));
                                                            }
                                                            else
                                                            {
                                                               §§goto(addr020e);
                                                            }
                                                         }
                                                         if(§§pop())
                                                         {
                                                            break;
                                                         }
                                                         §§goto(addr00fa);
                                                      }
                                                      return true;
                                                   }
                                                   §§pop();
                                                   if(!(_loc14_ || Boolean(param2)))
                                                   {
                                                      break loop41;
                                                   }
                                                   §§goto(addr012a);
                                                   §§push(param2.x <= 0);
                                                }
                                                if(§§pop())
                                                {
                                                   if(!(_loc15_ && Boolean(param2)))
                                                   {
                                                      break loop50;
                                                   }
                                                   break loop43;
                                                }
                                                addr012a:
                                                if(§§pop())
                                                {
                                                   if(_loc14_ || Boolean(param3))
                                                   {
                                                      return false;
                                                   }
                                                   §§goto(addr01e3);
                                                }
                                                else
                                                {
                                                   var _temp_48:* = param1.x > param6;
                                                   §§push(_temp_48);
                                                   §§push(_temp_48);
                                                }
                                             }
                                             §§push(param1.z >= param5);
                                             if(!_loc14_)
                                             {
                                                break loop45;
                                             }
                                             §§goto(addr00d2);
                                          }
                                          §§push(Boolean(§§pop()));
                                          if(!(_loc15_ && Boolean(param1)))
                                          {
                                             if(§§pop())
                                             {
                                                §§pop();
                                                §§push(param2.x >= 0);
                                             }
                                             if(§§pop())
                                             {
                                                §§push(false);
                                                if(!_loc15_)
                                                {
                                                   return §§pop();
                                                }
                                                break loop0;
                                             }
                                             §§push(param1.y < param4);
                                             break;
                                          }
                                          break loop40;
                                       }
                                       var _temp_57:* = Boolean(§§pop());
                                       §§push(_temp_57);
                                       §§push(_temp_57);
                                       break;
                                    }
                                    if(§§pop())
                                    {
                                       §§pop();
                                       §§push(param2.y <= 0);
                                       break;
                                    }
                                    §§goto(addr0196);
                                 }
                                 §§push(Boolean(§§pop()));
                                 if(_loc14_)
                                 {
                                    addr0196:
                                    if(§§pop())
                                    {
                                       return false;
                                    }
                                    §§push(param1.y > param7);
                                    if(_loc15_ && Boolean(param1))
                                    {
                                       break loop2;
                                    }
                                 }
                                 §§push(Boolean(§§pop()));
                                 if(_loc15_)
                                 {
                                    continue loop3;
                                 }
                                 var _temp_42:* = §§pop();
                                 §§push(_temp_42);
                                 §§push(_temp_42);
                              }
                              §§push(Boolean(§§pop()));
                              if(_loc14_ || Boolean(param3))
                              {
                                 break loop40;
                              }
                              break;
                           }
                           §§goto(addr0260);
                        }
                        §§goto(addr026c);
                     }
                     if(§§pop())
                     {
                        continue loop3;
                     }
                     §§goto(addr01df);
                  }
                  loop41:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(Boolean(§§pop()));
                        if(!(_loc15_ && Boolean(param3)))
                        {
                           addr020e:
                           var _temp_37:* = §§pop();
                           §§push(_temp_37);
                           if(!Boolean(_temp_37))
                           {
                              break;
                           }
                           §§pop();
                           if(!(_loc14_ || Boolean(param1)))
                           {
                              break loop41;
                           }
                           §§push(param2.z <= 0);
                           if(_loc15_ && Boolean(param2))
                           {
                              break loop3;
                           }
                        }
                        §§push(Boolean(§§pop()));
                        break;
                     }
                     if(!§§pop())
                     {
                        §§goto(addr0244);
                     }
                  }
                  §§goto(addr0266);
               }
               §§pop();
               loop3:
               while(true)
               {
                  loop4:
                  while(true)
                  {
                     if(_loc14_)
                     {
                        addr01df:
                        if(param2.y >= 0)
                        {
                           addr01e3:
                           return false;
                        }
                        loop5:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(param1.z < param5);
                              if(!(_loc15_ && Boolean(param1)))
                              {
                                 break loop2;
                              }
                              addr025f:
                              var _temp_34:* = §§pop();
                              addr0260:
                              §§push(_temp_34);
                              if(Boolean(_temp_34))
                              {
                                 break;
                              }
                              break loop5;
                           }
                           addr0265:
                           §§pop();
                           break loop4;
                        }
                        if(§§pop())
                        {
                           §§push(false);
                           break loop3;
                        }
                        §§push(0.000001);
                        if(_loc14_)
                        {
                           §§push(Number(§§pop()));
                        }
                        var _loc13_:* = §§pop();
                        loop7:
                        while(true)
                        {
                           loop8:
                           while(true)
                           {
                              while(true)
                              {
                                 loop12:
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
                                                         loop25:
                                                         while(true)
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
                                                                        loop30:
                                                                        while(true)
                                                                        {
                                                                           loop31:
                                                                           while(true)
                                                                           {
                                                                              if(param2.x <= _loc13_)
                                                                              {
                                                                                 if(param2.x < -_loc13_)
                                                                                 {
                                                                                    §§push(param6);
                                                                                    if(!(_loc14_ || Boolean(param3)))
                                                                                    {
                                                                                       break loop24;
                                                                                    }
                                                                                    while(true)
                                                                                    {
                                                                                       while(true)
                                                                                       {
                                                                                          while(true)
                                                                                          {
                                                                                             §§push(§§pop() - param1.x);
                                                                                             if(!(_loc15_ && Boolean(this)))
                                                                                             {
                                                                                                while(true)
                                                                                                {
                                                                                                   §§push(§§pop() / param2.x);
                                                                                                   if(_loc14_)
                                                                                                   {
                                                                                                      _loc9_ = §§pop();
                                                                                                      if(_loc15_)
                                                                                                      {
                                                                                                         break loop23;
                                                                                                      }
                                                                                                      §§push((param3 - param1.x) / param2.x);
                                                                                                      if(!(_loc15_ && Boolean(this)))
                                                                                                      {
                                                                                                         §§push(Number(§§pop()));
                                                                                                      }
                                                                                                      _loc10_ = §§pop();
                                                                                                      §§goto(addr0351);
                                                                                                   }
                                                                                                   §§goto(addr03d0);
                                                                                                }
                                                                                                §§goto(addr043a);
                                                                                             }
                                                                                             else
                                                                                             {
                                                                                                addr033b:
                                                                                                _loc9_ = Number(§§pop());
                                                                                                _loc10_ = 1e+22;
                                                                                                if(!(_loc15_ && Boolean(this)))
                                                                                                {
                                                                                                   §§goto(addr0351);
                                                                                                }
                                                                                             }
                                                                                             §§goto(addr0465);
                                                                                          }
                                                                                          §§goto(addr048d);
                                                                                       }
                                                                                    }
                                                                                    §§goto(addr0471);
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    §§push(-1e+22);
                                                                                    if(_loc15_)
                                                                                    {
                                                                                       break loop37;
                                                                                    }
                                                                                    §§goto(addr033b);
                                                                                 }
                                                                              }
                                                                              loop32:
                                                                              while(true)
                                                                              {
                                                                                 loop33:
                                                                                 while(true)
                                                                                 {
                                                                                    while(true)
                                                                                    {
                                                                                       if(!(_loc15_ && Boolean(param1)))
                                                                                       {
                                                                                          _loc9_ = (param3 - param1.x) / param2.x;
                                                                                          if(_loc15_)
                                                                                          {
                                                                                             break loop23;
                                                                                          }
                                                                                          §§push(param6);
                                                                                          if(_loc15_ && Boolean(param2))
                                                                                          {
                                                                                             break loop7;
                                                                                          }
                                                                                          _loc10_ = (§§pop() - param1.x) / param2.x;
                                                                                          if(param2.y <= _loc13_)
                                                                                          {
                                                                                             if(param2.y >= -_loc13_)
                                                                                             {
                                                                                                _loc11_ = -1e+22;
                                                                                                §§push(1e+22);
                                                                                                if(!_loc15_)
                                                                                                {
                                                                                                   _loc12_ = Number(§§pop());
                                                                                                   if(_loc14_)
                                                                                                   {
                                                                                                      break;
                                                                                                   }
                                                                                                   break loop8;
                                                                                                }
                                                                                                break loop32;
                                                                                             }
                                                                                             if(_loc15_ && Boolean(param2))
                                                                                             {
                                                                                                break loop22;
                                                                                             }
                                                                                             §§push((param7 - param1.y) / param2.y);
                                                                                             if(!(_loc14_ || Boolean(param2)))
                                                                                             {
                                                                                                break loop18;
                                                                                             }
                                                                                             §§push(Number(§§pop()));
                                                                                             if(!(_loc14_ || Boolean(param3)))
                                                                                             {
                                                                                                break loop21;
                                                                                             }
                                                                                             _loc11_ = §§pop();
                                                                                             §§push((param4 - param1.y) / param2.y);
                                                                                             if(_loc14_ || Boolean(param3))
                                                                                             {
                                                                                                _loc12_ = Number(§§pop());
                                                                                                if(!(_loc15_ && Boolean(param1)))
                                                                                                {
                                                                                                   break;
                                                                                                }
                                                                                                continue loop13;
                                                                                             }
                                                                                             §§push(_loc10_);
                                                                                             if(_loc15_)
                                                                                             {
                                                                                                break loop19;
                                                                                             }
                                                                                             if(§§pop() < §§pop())
                                                                                             {
                                                                                                break loop33;
                                                                                             }
                                                                                             §§goto(addr04a4);
                                                                                          }
                                                                                       }
                                                                                       _loc11_ = (param4 - param1.y) / param2.y;
                                                                                       if(!(_loc14_ || Boolean(param2)))
                                                                                       {
                                                                                          break loop27;
                                                                                       }
                                                                                       §§push(param7);
                                                                                       if(_loc14_ || Boolean(param3))
                                                                                       {
                                                                                          §§push((§§pop() - param1.y) / param2.y);
                                                                                          if(!_loc15_)
                                                                                          {
                                                                                             §§push(Number(§§pop()));
                                                                                             if(!(_loc15_ && Boolean(param3)))
                                                                                             {
                                                                                                _loc12_ = §§pop();
                                                                                                if(!(_loc15_ && Boolean(param3)))
                                                                                                {
                                                                                                   break;
                                                                                                }
                                                                                                break loop33;
                                                                                             }
                                                                                             break loop25;
                                                                                          }
                                                                                          break loop26;
                                                                                       }
                                                                                       §§goto(addr04f3);
                                                                                    }
                                                                                    addr043a:
                                                                                    §§push(_loc11_);
                                                                                    if(_loc14_)
                                                                                    {
                                                                                       §§push(_loc10_);
                                                                                       if(_loc15_)
                                                                                       {
                                                                                          break loop31;
                                                                                       }
                                                                                       var _temp_29:* = §§pop() >= §§pop();
                                                                                       §§push(_temp_29);
                                                                                       §§push(_temp_29);
                                                                                       if(_loc15_)
                                                                                       {
                                                                                          break loop30;
                                                                                       }
                                                                                       §§push(Boolean(§§pop()));
                                                                                       if(!_loc14_)
                                                                                       {
                                                                                          break loop29;
                                                                                       }
                                                                                       if(!§§pop())
                                                                                       {
                                                                                          §§pop();
                                                                                          if(_loc15_)
                                                                                          {
                                                                                             break loop23;
                                                                                          }
                                                                                          addr0465:
                                                                                          §§push(_loc12_ <= _loc9_);
                                                                                          if(!_loc14_)
                                                                                          {
                                                                                             break loop28;
                                                                                          }
                                                                                       }
                                                                                       addr0471:
                                                                                       if(§§pop())
                                                                                       {
                                                                                          return false;
                                                                                       }
                                                                                       if(_loc11_ < _loc9_)
                                                                                       {
                                                                                          §§push(_loc12_);
                                                                                          if(_loc15_)
                                                                                          {
                                                                                             break loop21;
                                                                                          }
                                                                                          §§goto(addr048d);
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          §§push(_loc11_);
                                                                                          if(!_loc14_)
                                                                                          {
                                                                                             break loop7;
                                                                                          }
                                                                                       }
                                                                                    }
                                                                                 }
                                                                                 while(true)
                                                                                 {
                                                                                    §§push(Number(_loc12_));
                                                                                    if(!_loc15_)
                                                                                    {
                                                                                       _loc10_ = §§pop();
                                                                                       addr04a4:
                                                                                       break loop20;
                                                                                    }
                                                                                    §§goto(addr050b);
                                                                                 }
                                                                                 §§goto(addr0536);
                                                                              }
                                                                              §§goto(addr04f4);
                                                                              break loop37;
                                                                           }
                                                                           §§goto(addr04d9);
                                                                        }
                                                                        §§goto(addr05fe);
                                                                     }
                                                                     §§goto(addr05ff);
                                                                  }
                                                                  §§goto(addr060f);
                                                               }
                                                               §§goto(addr0622);
                                                            }
                                                            §§goto(addr0516);
                                                         }
                                                         §§goto(addr05a2);
                                                      }
                                                      §§goto(addr05a3);
                                                   }
                                                   §§push(_loc12_);
                                                   if(!(_loc14_ || Boolean(param1)))
                                                   {
                                                      break loop18;
                                                   }
                                                   §§push(_loc10_);
                                                   if(_loc15_)
                                                   {
                                                      break loop19;
                                                   }
                                                   addr04d9:
                                                   if(§§pop() >= §§pop())
                                                   {
                                                      break loop20;
                                                   }
                                                   if(_loc15_ && Boolean(param1))
                                                   {
                                                      break loop12;
                                                   }
                                                   continue loop13;
                                                }
                                                §§goto(addr0604);
                                             }
                                             §§goto(addr058f);
                                          }
                                          §§goto(addr04f6);
                                       }
                                       §§goto(addr05df);
                                    }
                                    §§goto(addr050f);
                                 }
                                 §§goto(addr05d5);
                              }
                              loop13:
                              while(true)
                              {
                                 loop14:
                                 while(true)
                                 {
                                    §§push(_loc12_);
                                    if(_loc14_)
                                    {
                                       addr04f4:
                                       _loc10_ = Number(§§pop());
                                       addr04f6:
                                       loop15:
                                       while(true)
                                       {
                                          if(param2.z > _loc13_)
                                          {
                                             while(true)
                                             {
                                                §§push(param5 - param1.z);
                                                if(_loc14_)
                                                {
                                                   addr050f:
                                                   addr050b:
                                                   §§push(§§pop() / param2.z);
                                                   if(!_loc14_)
                                                   {
                                                      break loop14;
                                                   }
                                                   _loc11_ = §§pop();
                                                   if(!(_loc14_ || Boolean(param1)))
                                                   {
                                                      break loop13;
                                                   }
                                                   §§push(param8);
                                                   if(!(_loc14_ || Boolean(param3)))
                                                   {
                                                      break;
                                                   }
                                                }
                                                addr0536:
                                                §§push((§§pop() - param1.z) / param2.z);
                                                if(_loc15_ && Boolean(param1))
                                                {
                                                   break;
                                                }
                                                §§push(Number(§§pop()));
                                                if(!(_loc14_ || Boolean(param3)))
                                                {
                                                   break loop15;
                                                }
                                                _loc12_ = §§pop();
                                                if(_loc14_)
                                                {
                                                   break loop8;
                                                }
                                             }
                                             addr0579:
                                             §§push(§§pop() - param1.z);
                                             if(!(_loc15_ && Boolean(this)))
                                             {
                                                addr058f:
                                                §§push(§§pop() / param2.z);
                                             }
                                             _loc11_ = §§pop();
                                          }
                                          else
                                          {
                                             if(param2.z >= -_loc13_)
                                             {
                                                while(true)
                                                {
                                                   §§push(-1e+22);
                                                   if(!(_loc15_ && Boolean(param3)))
                                                   {
                                                      §§push(Number(§§pop()));
                                                      if(!_loc14_)
                                                      {
                                                         break;
                                                      }
                                                   }
                                                   _loc11_ = §§pop();
                                                   §§push(1e+22);
                                                   break;
                                                }
                                                _loc12_ = Number(§§pop());
                                                if(_loc14_ || Boolean(param2))
                                                {
                                                   break loop12;
                                                }
                                                break loop13;
                                             }
                                             if(_loc14_)
                                             {
                                                §§goto(addr0579);
                                                §§push(param8);
                                             }
                                          }
                                          §§push(param5);
                                          if(!_loc15_)
                                          {
                                             §§push(§§pop() - param1.z);
                                             break loop7;
                                          }
                                          break;
                                       }
                                       addr04f3:
                                    }
                                    §§goto(addr05a2);
                                 }
                                 §§goto(addr05dd);
                              }
                              §§goto(addr063c);
                           }
                           §§goto(addr05d5);
                        }
                        addr05a3:
                        _loc12_ = §§pop() / param2.z;
                        addr05d5:
                        while(true)
                        {
                           §§push(_loc11_);
                           if(_loc14_)
                           {
                              addr05dd:
                              addr05df:
                              §§push(§§pop() >= _loc10_);
                              if(_loc14_ || Boolean(param1))
                              {
                                 var _temp_5:* = §§pop();
                                 addr05ff:
                                 §§push(_temp_5);
                                 §§push(_temp_5);
                                 if(_loc14_ || Boolean(this))
                                 {
                                    addr05fe:
                                    §§push(Boolean(§§pop()));
                                 }
                                 if(§§pop())
                                 {
                                    break;
                                 }
                              }
                              §§pop();
                              addr0604:
                              §§push(_loc12_);
                           }
                           §§push(§§pop() <= _loc9_);
                           if(_loc14_)
                           {
                              addr060f:
                              §§push(Boolean(§§pop()));
                           }
                           break;
                        }
                        while(true)
                        {
                           if(§§pop())
                           {
                              if(!(_loc15_ && Boolean(param3)))
                              {
                                 addr0622:
                                 §§push(false);
                                 if(!(_loc15_ && Boolean(param1)))
                                 {
                                    return §§pop();
                                 }
                                 break;
                              }
                           }
                           addr063c:
                           §§push(true);
                           break;
                        }
                        return §§pop();
                        addr05a2:
                     }
                     addr0244:
                     §§push(param1.z > param8);
                     if(_loc14_)
                     {
                        §§push(Boolean(§§pop()));
                        if(_loc15_ && Boolean(this))
                        {
                           break loop5;
                        }
                        §§goto(addr025f);
                     }
                     §§goto(addr0265);
                  }
                  addr0266:
                  addr026c:
                  §§push(param2.z >= 0);
                  if(!_loc15_)
                  {
                     break loop5;
                  }
                  break;
               }
               return §§pop();
            }
            return false;
         }
         return §§pop();
      }
      
      alternativa3d function split(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Number) : Vector.<Object3D>
      {
         return new Vector.<Object3D>(2);
      }
      
      alternativa3d function testSplit(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Number) : int
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         var _loc5_:Vector3D = this.calculatePlane(param1,param2,param3);
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
                     loop4:
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
                                                if(_loc5_.x >= 0)
                                                {
                                                   if(_loc7_ || Boolean(param1))
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
                                                                  if(_loc5_.y >= 0)
                                                                  {
                                                                     if(_loc7_)
                                                                     {
                                                                        loop19:
                                                                        while(true)
                                                                        {
                                                                           loop20:
                                                                           while(true)
                                                                           {
                                                                              while(true)
                                                                              {
                                                                                 if(_loc5_.z >= 0)
                                                                                 {
                                                                                    §§push(this.boundMaxX * _loc5_.x);
                                                                                    §§push(this.boundMaxY);
                                                                                    if(_loc7_ || Boolean(param1))
                                                                                    {
                                                                                       §§push(§§pop() + §§pop() * _loc5_.y);
                                                                                       if(!_loc7_)
                                                                                       {
                                                                                          break loop9;
                                                                                       }
                                                                                       §§push(this.boundMaxZ);
                                                                                       if(!(_loc7_ || Boolean(this)))
                                                                                       {
                                                                                          break;
                                                                                       }
                                                                                       §§push(§§pop() + §§pop() * _loc5_.z);
                                                                                       if(!_loc7_)
                                                                                       {
                                                                                          break loop20;
                                                                                       }
                                                                                       if(§§pop() <= _loc5_.w + param4)
                                                                                       {
                                                                                          return -1;
                                                                                       }
                                                                                       §§push(this.boundMinX);
                                                                                       if(!(_loc6_ && Boolean(param1)))
                                                                                       {
                                                                                          §§push(§§pop() * _loc5_.x);
                                                                                          if(_loc7_ || Boolean(param2))
                                                                                          {
                                                                                             §§push(this.boundMinY * _loc5_.y);
                                                                                             if(_loc7_ || Boolean(param1))
                                                                                             {
                                                                                                §§push(§§pop() + §§pop());
                                                                                                if(!(_loc6_ && Boolean(param3)))
                                                                                                {
                                                                                                   if(§§pop() + this.boundMinZ * _loc5_.z >= _loc5_.w - param4)
                                                                                                   {
                                                                                                      if(_loc7_)
                                                                                                      {
                                                                                                         return 1;
                                                                                                      }
                                                                                                      addr0294:
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                      addr01bc:
                                                                                                   }
                                                                                                   break loop15;
                                                                                                }
                                                                                                break loop6;
                                                                                             }
                                                                                             break loop19;
                                                                                          }
                                                                                          break loop6;
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       addr039a:
                                                                                       while(true)
                                                                                       {
                                                                                          §§push(§§pop() + §§pop());
                                                                                          if(!_loc6_)
                                                                                          {
                                                                                             addr03a1:
                                                                                             addr03a9:
                                                                                             §§push(§§pop() + this.boundMaxZ * _loc5_.z);
                                                                                             if(!_loc6_)
                                                                                             {
                                                                                                addr03b0:
                                                                                                if(§§pop() <= _loc5_.w + param4)
                                                                                                {
                                                                                                   return -1;
                                                                                                }
                                                                                                §§push(this.boundMaxX);
                                                                                                if(_loc7_)
                                                                                                {
                                                                                                   addr03cd:
                                                                                                   §§push(§§pop() * _loc5_.x);
                                                                                                   if(!(_loc6_ && Boolean(param2)))
                                                                                                   {
                                                                                                      addr03e0:
                                                                                                      addr03e8:
                                                                                                      §§push(§§pop() + this.boundMinY * _loc5_.y + this.boundMinZ * _loc5_.z);
                                                                                                      §§push(_loc5_.w - param4);
                                                                                                      if(_loc7_)
                                                                                                      {
                                                                                                         addr03ff:
                                                                                                         if(§§pop() < §§pop())
                                                                                                         {
                                                                                                            break;
                                                                                                         }
                                                                                                         if(_loc6_ && Boolean(param2))
                                                                                                         {
                                                                                                            break;
                                                                                                         }
                                                                                                         §§push(1);
                                                                                                         if(_loc7_ || Boolean(param3))
                                                                                                         {
                                                                                                            return §§pop();
                                                                                                         }
                                                                                                         §§goto(addr05f9);
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                         §§goto(addr05dd);
                                                                                                      }
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                      §§goto(addr0548);
                                                                                                   }
                                                                                                }
                                                                                             }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                             addr0495:
                                                                                             §§push(this.boundMaxZ);
                                                                                             if(_loc6_)
                                                                                             {
                                                                                                break loop8;
                                                                                             }
                                                                                             §§push(§§pop() + §§pop() * _loc5_.z);
                                                                                          }
                                                                                          §§goto(addr04a4);
                                                                                       }
                                                                                       §§goto(addr04b2);
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    §§push(this.boundMaxX * _loc5_.x);
                                                                                 }
                                                                                 §§push(this.boundMaxY);
                                                                                 if(!_loc7_)
                                                                                 {
                                                                                    break loop14;
                                                                                 }
                                                                                 §§push(§§pop() + §§pop() * _loc5_.y);
                                                                                 §§push(this.boundMinZ);
                                                                                 if(_loc7_ || Boolean(param2))
                                                                                 {
                                                                                    §§push(§§pop() * _loc5_.z);
                                                                                    break loop19;
                                                                                 }
                                                                                 addr032d:
                                                                                 §§push(§§pop() + §§pop());
                                                                              }
                                                                              while(true)
                                                                              {
                                                                                 §§push(§§pop() * _loc5_.z);
                                                                                 if(!_loc6_)
                                                                                 {
                                                                                    while(true)
                                                                                    {
                                                                                       §§push(§§pop() + §§pop());
                                                                                       if(_loc7_)
                                                                                       {
                                                                                          if(§§pop() >= _loc5_.w - param4)
                                                                                          {
                                                                                             if(!_loc6_)
                                                                                             {
                                                                                                §§push(1);
                                                                                                if(!_loc6_)
                                                                                                {
                                                                                                   return §§pop();
                                                                                                }
                                                                                                break loop1;
                                                                                             }
                                                                                             addr0228:
                                                                                             §§push(this.boundMinX);
                                                                                             if(!_loc6_)
                                                                                             {
                                                                                                §§push(§§pop() * _loc5_.x);
                                                                                                §§push(this.boundMaxY);
                                                                                                if(_loc7_ || Boolean(param1))
                                                                                                {
                                                                                                   §§push(§§pop() + §§pop() * _loc5_.y);
                                                                                                   §§push(this.boundMinZ);
                                                                                                   if(!(_loc6_ && Boolean(param1)))
                                                                                                   {
                                                                                                      §§push(§§pop() + §§pop() * _loc5_.z);
                                                                                                      §§push(_loc5_.w - param4);
                                                                                                      if(!(_loc6_ && Boolean(param2)))
                                                                                                      {
                                                                                                         if(§§pop() >= §§pop())
                                                                                                         {
                                                                                                            §§push(1);
                                                                                                            if(!_loc6_)
                                                                                                            {
                                                                                                               return §§pop();
                                                                                                            }
                                                                                                            §§goto(addr052b);
                                                                                                         }
                                                                                                         else
                                                                                                         {
                                                                                                            §§goto(addr0294);
                                                                                                         }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                         §§goto(addr03ff);
                                                                                                      }
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                      §§goto(addr0636);
                                                                                                   }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                   addr0448:
                                                                                                   if(§§pop() + §§pop() * _loc5_.z <= _loc5_.w + param4)
                                                                                                   {
                                                                                                      return -1;
                                                                                                   }
                                                                                                   §§push(this.boundMaxX);
                                                                                                   if(_loc7_ || Boolean(param1))
                                                                                                   {
                                                                                                      §§push(§§pop() * _loc5_.x);
                                                                                                      §§push(this.boundMinY * _loc5_.y);
                                                                                                      if(_loc6_ && Boolean(this))
                                                                                                      {
                                                                                                         break loop8;
                                                                                                      }
                                                                                                      §§push(§§pop() + §§pop());
                                                                                                      if(!_loc7_)
                                                                                                      {
                                                                                                         break loop6;
                                                                                                      }
                                                                                                      §§goto(addr0495);
                                                                                                   }
                                                                                                   §§goto(addr05c6);
                                                                                                }
                                                                                             }
                                                                                             §§goto(addr063c);
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                             §§goto(addr01bc);
                                                                                          }
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          §§goto(addr03cd);
                                                                                       }
                                                                                       §§goto(addr03ff);
                                                                                    }
                                                                                    §§goto(addr04b2);
                                                                                 }
                                                                                 §§goto(addr0627);
                                                                              }
                                                                              §§goto(addr062c);
                                                                           }
                                                                           if(§§pop() <= _loc5_.w + param4)
                                                                           {
                                                                              if(!(_loc6_ && Boolean(param1)))
                                                                              {
                                                                                 return -1;
                                                                              }
                                                                              addr04c0:
                                                                              §§push(this.boundMinX);
                                                                              if(!(_loc6_ && Boolean(param2)))
                                                                              {
                                                                                 §§push(§§pop() * _loc5_.x);
                                                                                 break loop12;
                                                                              }
                                                                              break loop6;
                                                                           }
                                                                           §§push(this.boundMinX * _loc5_.x + this.boundMinY * _loc5_.y);
                                                                           §§push(this.boundMaxZ);
                                                                           break loop22;
                                                                        }
                                                                        while(true)
                                                                        {
                                                                           §§push(§§pop() + §§pop());
                                                                           if(!_loc6_)
                                                                           {
                                                                              break loop20;
                                                                           }
                                                                           addr04a4:
                                                                           if(§§pop() >= _loc5_.w - param4)
                                                                           {
                                                                              §§push(1);
                                                                              break loop16;
                                                                           }
                                                                           break;
                                                                        }
                                                                        addr04b2:
                                                                        break loop0;
                                                                     }
                                                                     break loop11;
                                                                  }
                                                                  if(_loc5_.z >= 0)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(this.boundMaxX);
                                                                        if(_loc7_ || Boolean(param3))
                                                                        {
                                                                           §§push(§§pop() * _loc5_.x);
                                                                           §§push(this.boundMinY * _loc5_.y);
                                                                           if(!_loc6_)
                                                                           {
                                                                              §§push(§§pop() + §§pop());
                                                                              if(_loc6_)
                                                                              {
                                                                                 break loop12;
                                                                              }
                                                                              §§push(this.boundMaxZ);
                                                                              if(!(_loc7_ || Boolean(param2)))
                                                                              {
                                                                                 break loop17;
                                                                              }
                                                                              if(§§pop() + §§pop() * _loc5_.z <= _loc5_.w + param4)
                                                                              {
                                                                                 if(_loc7_ || Boolean(param2))
                                                                                 {
                                                                                    return -1;
                                                                                 }
                                                                                 §§goto(addr02d1);
                                                                              }
                                                                              §§goto(addr0228);
                                                                           }
                                                                           §§goto(addr056d);
                                                                        }
                                                                        else
                                                                        {
                                                                           §§goto(addr03e0);
                                                                        }
                                                                     }
                                                                     §§goto(addr04b2);
                                                                  }
                                                                  else
                                                                  {
                                                                     §§push(this.boundMaxX);
                                                                     if(_loc7_)
                                                                     {
                                                                        §§push(§§pop() * _loc5_.x + this.boundMinY * _loc5_.y);
                                                                        §§push(this.boundMinZ * _loc5_.z);
                                                                        if(!(_loc6_ && Boolean(param1)))
                                                                        {
                                                                           if(§§pop() + §§pop() <= _loc5_.w + param4)
                                                                           {
                                                                              addr02d1:
                                                                              return -1;
                                                                           }
                                                                           while(true)
                                                                           {
                                                                              §§push(this.boundMinX);
                                                                              if(!_loc6_)
                                                                              {
                                                                                 §§push(§§pop() * _loc5_.x);
                                                                                 if(_loc6_ && Boolean(param1))
                                                                                 {
                                                                                    break loop3;
                                                                                 }
                                                                                 §§push(§§pop() + this.boundMaxY * _loc5_.y);
                                                                                 if(!_loc7_)
                                                                                 {
                                                                                    break loop6;
                                                                                 }
                                                                                 §§push(this.boundMaxZ);
                                                                                 if(_loc7_ || Boolean(param1))
                                                                                 {
                                                                                    §§push(§§pop() * _loc5_.z);
                                                                                    if(_loc7_ || Boolean(param2))
                                                                                    {
                                                                                       §§goto(addr032d);
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       §§goto(addr03e8);
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    §§goto(addr04a3);
                                                                                 }
                                                                              }
                                                                              else
                                                                              {
                                                                                 §§goto(addr03a1);
                                                                              }
                                                                              §§goto(addr04a4);
                                                                           }
                                                                           §§goto(addr04b2);
                                                                        }
                                                                        else
                                                                        {
                                                                           §§goto(addr0512);
                                                                        }
                                                                        §§goto(addr0595);
                                                                     }
                                                                     addr032e:
                                                                     §§push(_loc5_.w - param4);
                                                                     if(!(_loc6_ && Boolean(param1)))
                                                                     {
                                                                        break loop17;
                                                                     }
                                                                     §§goto(addr05d4);
                                                                  }
                                                                  §§goto(addr032e);
                                                               }
                                                               §§goto(addr05d5);
                                                            }
                                                            if(§§pop() >= §§pop())
                                                            {
                                                               §§push(1);
                                                               if(_loc7_ || Boolean(this))
                                                               {
                                                                  return §§pop();
                                                               }
                                                               break;
                                                            }
                                                            break loop15;
                                                         }
                                                         return §§pop();
                                                      }
                                                      break loop0;
                                                   }
                                                   break loop13;
                                                }
                                                if(_loc5_.y >= 0)
                                                {
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            if(_loc5_.z >= 0)
                                                            {
                                                               if(_loc6_)
                                                               {
                                                                  break;
                                                               }
                                                               §§push(this.boundMinX);
                                                               if(!_loc6_)
                                                               {
                                                                  §§push(§§pop() * _loc5_.x);
                                                                  §§push(this.boundMaxY);
                                                                  if(!(_loc6_ && Boolean(param2)))
                                                                  {
                                                                     §§goto(addr039a);
                                                                     §§push(§§pop() * _loc5_.y);
                                                                  }
                                                                  §§goto(addr03a9);
                                                               }
                                                               §§goto(addr03b0);
                                                            }
                                                            else
                                                            {
                                                               §§goto(addr0448);
                                                               §§push(this.boundMinX * _loc5_.x + this.boundMaxY * _loc5_.y);
                                                               §§push(this.boundMinZ);
                                                            }
                                                            §§goto(addr0495);
                                                         }
                                                         §§goto(addr053a);
                                                      }
                                                      §§goto(addr05c6);
                                                   }
                                                   §§goto(addr04a4);
                                                }
                                                else if(_loc5_.z < 0)
                                                {
                                                   §§push(this.boundMinX);
                                                   break loop4;
                                                }
                                                §§goto(addr04c0);
                                             }
                                             §§goto(addr055a);
                                          }
                                          §§goto(addr0657);
                                       }
                                       §§push(this.boundMinY);
                                       if(!(_loc6_ && Boolean(param1)))
                                       {
                                          break loop8;
                                       }
                                       break loop7;
                                    }
                                    §§goto(addr0608);
                                 }
                                 §§goto(addr05de);
                              }
                              while(true)
                              {
                                 §§push(§§pop() * _loc5_.y);
                                 if(_loc7_ || Boolean(this))
                                 {
                                    §§push(§§pop() + §§pop());
                                    if(_loc6_ && Boolean(this))
                                    {
                                       break loop4;
                                    }
                                    §§push(this.boundMaxZ);
                                    if(_loc7_)
                                    {
                                       addr0512:
                                       if(§§pop() + §§pop() * _loc5_.z > _loc5_.w + param4)
                                       {
                                          addr053a:
                                          §§push(this.boundMaxX);
                                          if(_loc7_)
                                          {
                                             break loop6;
                                          }
                                          break loop4;
                                       }
                                       if(!_loc6_)
                                       {
                                          addr052b:
                                          return -1;
                                       }
                                       §§goto(addr0595);
                                    }
                                    §§goto(addr062c);
                                 }
                                 §§goto(addr0556);
                              }
                              §§goto(addr0591);
                           }
                           §§goto(addr05d8);
                        }
                        addr0548:
                        §§push(§§pop() * _loc5_.x);
                        §§push(this.boundMaxY * _loc5_.y);
                        if(_loc7_)
                        {
                           addr0556:
                           addr055a:
                           §§push(§§pop() + §§pop());
                           §§push(this.boundMinZ * _loc5_.z);
                           if(!(_loc7_ || Boolean(param3)))
                           {
                              break loop2;
                           }
                           addr056d:
                           §§push(§§pop() + §§pop());
                           if(_loc7_ || Boolean(this))
                           {
                              §§push(_loc5_.w - param4);
                              if(_loc6_ && Boolean(param1))
                              {
                                 §§goto(addr062c);
                              }
                           }
                           else
                           {
                              §§goto(addr05d5);
                           }
                        }
                        addr0591:
                        if(§§pop() >= §§pop())
                        {
                           addr0595:
                           §§push(1);
                           if(!(_loc6_ && Boolean(param1)))
                           {
                              return §§pop();
                           }
                           break loop1;
                        }
                        break loop0;
                     }
                     §§push(§§pop() * _loc5_.x);
                     if(_loc7_ || Boolean(param1))
                     {
                        addr05c6:
                        §§push(this.boundMinY);
                        break loop2;
                     }
                     break;
                  }
                  while(true)
                  {
                     §§push(§§pop() * _loc5_.x);
                     if(!_loc6_)
                     {
                        §§push(this.boundMaxY);
                        if(_loc7_ || Boolean(this))
                        {
                           addr0627:
                           §§push(§§pop() * _loc5_.y);
                        }
                        §§goto(addr062c);
                     }
                     §§goto(addr063c);
                  }
                  §§goto(addr064d);
               }
               §§push(§§pop() * _loc5_.y);
               if(_loc7_)
               {
                  addr05d5:
                  addr05d8:
                  addr05de:
                  addr05dd:
                  addr05d4:
                  if(§§pop() + §§pop() + this.boundMinZ * _loc5_.z <= _loc5_.w + param4)
                  {
                     §§push(-1);
                     if(!(_loc6_ && Boolean(param3)))
                     {
                        addr05f9:
                        return §§pop();
                     }
                     break;
                  }
                  addr0608:
                  §§push(this.boundMaxX);
                  break loop3;
               }
               addr062c:
               addr064d:
               §§push(§§pop() + §§pop());
               §§push(this.boundMaxZ);
               if(!_loc6_)
               {
                  addr063c:
                  addr0636:
                  §§push(§§pop() + §§pop() * _loc5_.z);
                  §§push(_loc5_.w - param4);
               }
               if(§§pop() >= §§pop())
               {
                  if(!_loc6_)
                  {
                     addr0657:
                     §§push(1);
                     if(!_loc6_)
                     {
                        return §§pop();
                     }
                     break;
                  }
               }
               break loop0;
            }
            return §§pop();
         }
         §§push(0);
         break loop1;
      }
      
      alternativa3d function calculatePlane(param1:Vector3D, param2:Vector3D, param3:Vector3D) : Vector3D
      {
         var _temp_1:* = true;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = _temp_1;
         var _loc4_:Vector3D = new Vector3D();
         §§push(param2.x - param1.x);
         if(_loc13_ || Boolean(param3))
         {
            §§push(Number(§§pop()));
         }
         var _loc5_:* = §§pop();
         §§push(param2.y - param1.y);
         if(!(_loc12_ && Boolean(param1)))
         {
            §§push(Number(§§pop()));
         }
         var _loc6_:* = §§pop();
         §§push(param2.z - param1.z);
         if(_loc13_)
         {
            §§push(Number(§§pop()));
         }
         var _loc7_:* = §§pop();
         §§push(param3.x - param1.x);
         if(_loc13_ || Boolean(param3))
         {
            §§push(Number(§§pop()));
         }
         var _loc8_:* = §§pop();
         §§push(param3.y - param1.y);
         if(!(_loc12_ && Boolean(param3)))
         {
            §§push(Number(§§pop()));
         }
         var _loc9_:* = §§pop();
         §§push(param3.z - param1.z);
         if(_loc13_ || Boolean(param1))
         {
            §§push(Number(§§pop()));
         }
         var _loc10_:* = §§pop();
         if(!_loc12_)
         {
            _loc4_.x = _loc10_ * _loc6_ - _loc9_ * _loc7_;
            if(!(_loc12_ && Boolean(param1)))
            {
               _loc4_.y = _loc8_ * _loc7_ - _loc10_ * _loc5_;
               if(_loc13_)
               {
                  _loc4_.z = _loc9_ * _loc5_ - _loc8_ * _loc6_;
               }
            }
         }
         §§push(_loc4_.x * _loc4_.x);
         if(!(_loc12_ && Boolean(param2)))
         {
            while(true)
            {
               §§push(_loc4_.y * _loc4_.y);
               if(!_loc12_)
               {
                  §§push(§§pop() + §§pop());
                  if(_loc12_)
                  {
                     break;
                  }
                  §§push(_loc4_.z * _loc4_.z);
               }
               §§push(§§pop() + §§pop());
               if(!_loc12_)
               {
                  §§push(Number(§§pop()));
               }
               break;
            }
         }
         var _loc11_:* = §§pop();
         while(true)
         {
            if(!_loc12_)
            {
               §§push(_loc11_);
               if(_loc13_ || Boolean(param3))
               {
                  if(§§pop() <= 0.0001)
                  {
                     break;
                  }
                  if(_loc12_)
                  {
                     break;
                  }
                  §§push(Math.sqrt(_loc11_));
               }
               _loc11_ = §§pop();
               _loc4_.x /= _loc11_;
               if(!_loc13_)
               {
                  break;
               }
            }
            _loc4_.y /= _loc11_;
            _loc4_.z /= _loc11_;
            if(!(_loc12_ && Boolean(param1)))
            {
               break;
            }
            §§goto(addr01c1);
         }
         _loc4_.w = param1.x * _loc4_.x + param1.y * _loc4_.y + param1.z * _loc4_.z;
         addr01c1:
         return _loc4_;
      }
      
      alternativa3d function composeMatrix() : void
      {
         §§push(false);
         var _loc14_:Boolean = true;
         var _loc15_:* = §§pop();
         var _loc1_:Number = Math.cos(this.rotationX);
         var _loc2_:Number = Math.sin(this.rotationX);
         var _loc3_:Number = Math.cos(this.rotationY);
         var _loc4_:Number = Math.sin(this.rotationY);
         var _loc5_:Number = Math.cos(this.rotationZ);
         var _loc6_:Number = Math.sin(this.rotationZ);
         §§push(_loc5_);
         if(!_loc15_)
         {
            §§push(§§pop() * _loc4_);
            if(!_loc15_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc7_:* = §§pop();
         §§push(_loc6_);
         if(_loc14_ || Boolean(this))
         {
            §§push(§§pop() * _loc4_);
            if(!_loc15_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc8_:* = §§pop();
         §§push(_loc3_);
         if(!_loc15_)
         {
            §§push(§§pop() * this.scaleX);
            if(_loc14_ || Boolean(_loc2_))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc9_:* = §§pop();
         §§push(_loc2_);
         if(!_loc15_)
         {
            §§push(§§pop() * this.scaleY);
            if(!_loc15_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc10_:* = §§pop();
         while(true)
         {
            §§push(_loc1_);
            if(_loc14_ || Boolean(_loc2_))
            {
               §§push(§§pop() * this.scaleY);
               if(!_loc14_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc11_:* = §§pop();
         while(true)
         {
            §§push(_loc1_);
            if(!_loc15_)
            {
               §§push(§§pop() * this.scaleZ);
               if(_loc15_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc12_:* = §§pop();
         §§push(_loc2_);
         if(_loc14_ || Boolean(_loc1_))
         {
            §§push(§§pop() * this.scaleZ);
            if(!_loc15_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc13_:* = §§pop();
         if(!_loc15_)
         {
            §§push(this);
            §§push(_loc5_);
            if(!(_loc15_ && Boolean(_loc1_)))
            {
               §§push(§§pop() * _loc9_);
            }
            §§pop().alternativa3d::ma = §§pop();
            loop2:
            while(true)
            {
               if(_loc14_ || Boolean(_loc3_))
               {
                  loop3:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(this);
                        §§push(_loc7_);
                        if(_loc14_)
                        {
                           §§push(_loc10_);
                           if(_loc15_)
                           {
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           if(_loc15_)
                           {
                              break loop3;
                           }
                        }
                        §§push(_loc6_);
                        if(_loc14_ || Boolean(_loc3_))
                        {
                           §§push(§§pop() * _loc11_);
                        }
                        break;
                     }
                     §§push(§§pop() - §§pop());
                     break;
                  }
                  §§pop().alternativa3d::mb = §§pop();
                  if(_loc15_ && Boolean(_loc1_))
                  {
                     break;
                  }
               }
               §§push(this);
               §§push(_loc7_);
               if(!(_loc15_ && Boolean(_loc1_)))
               {
                  loop5:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_loc12_);
                        if(!(_loc15_ && Boolean(this)))
                        {
                           §§push(§§pop() * §§pop());
                           if(_loc15_)
                           {
                              break;
                           }
                           §§push(_loc6_);
                           if(_loc15_ && Boolean(_loc1_))
                           {
                              break loop5;
                           }
                        }
                        §§push(§§pop() * _loc13_);
                        break loop5;
                     }
                  }
                  §§push(§§pop() + §§pop());
                  break loop6;
               }
               §§pop().alternativa3d::mc = §§pop();
               if(!_loc15_)
               {
                  this.md = this.x;
                  if(!_loc15_)
                  {
                     §§push(this);
                     §§push(_loc6_);
                     if(!(_loc15_ && Boolean(_loc2_)))
                     {
                        §§push(§§pop() * _loc9_);
                     }
                     §§pop().alternativa3d::me = §§pop();
                     §§push(this);
                     §§push(_loc8_);
                     if(!(_loc15_ && Boolean(_loc1_)))
                     {
                        loop7:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(_loc10_);
                              if(!(_loc15_ && Boolean(_loc3_)))
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc14_ || Boolean(_loc3_)))
                                 {
                                    break;
                                 }
                                 §§push(_loc5_);
                                 if(!_loc14_)
                                 {
                                    break loop7;
                                 }
                              }
                              §§push(§§pop() * _loc11_);
                              break loop7;
                           }
                        }
                        §§push(§§pop() + §§pop());
                        break loop8;
                     }
                     §§pop().alternativa3d::mf = §§pop();
                     if(!_loc14_)
                     {
                        break;
                     }
                     §§push(this);
                     §§push(_loc8_);
                     if(!(_loc15_ && Boolean(_loc1_)))
                     {
                        while(true)
                        {
                           §§push(_loc12_);
                           if(!(_loc15_ && Boolean(_loc1_)))
                           {
                              §§push(§§pop() * §§pop());
                              if(!(_loc14_ || Boolean(_loc1_)))
                              {
                                 break;
                              }
                              §§push(_loc5_);
                              if(_loc14_)
                              {
                                 §§push(§§pop() * _loc13_);
                              }
                           }
                           §§push(§§pop() - §§pop());
                           break;
                        }
                     }
                     §§pop().alternativa3d::mg = §§pop();
                     this.mh = this.y;
                     if(!(_loc14_ || Boolean(_loc2_)))
                     {
                        break;
                     }
                  }
                  while(true)
                  {
                     §§push(this);
                     §§push(_loc4_);
                     if(!(_loc15_ && Boolean(_loc3_)))
                     {
                        §§push(-§§pop());
                        if(!(_loc14_ || Boolean(_loc1_)))
                        {
                           break;
                        }
                     }
                     §§push(§§pop() * this.scaleX);
                     break;
                  }
                  §§pop().alternativa3d::mi = §§pop();
                  if(_loc15_)
                  {
                     break;
                  }
               }
               §§push(this);
               §§push(_loc3_);
               if(!(_loc15_ && Boolean(_loc1_)))
               {
                  §§push(§§pop() * _loc10_);
               }
               §§pop().alternativa3d::mj = §§pop();
               while(true)
               {
                  if(!_loc15_)
                  {
                     break loop2;
                  }
                  addr02d9:
                  this.ml = this.z;
                  break;
               }
            }
            §§push(this);
            §§push(_loc3_);
            if(!_loc15_)
            {
               §§push(§§pop() * _loc12_);
            }
            §§pop().alternativa3d::mk = §§pop();
            if(_loc14_)
            {
               §§goto(addr02d9);
            }
         }
      }
      
      alternativa3d function appendMatrix(param1:Object3D) : void
      {
         var _temp_1:* = true;
         var _loc14_:Boolean = false;
         var _loc15_:Boolean = _temp_1;
         §§push(this.ma);
         if(_loc15_ || Boolean(_loc3_))
         {
            §§push(Number(§§pop()));
         }
         var _loc2_:* = §§pop();
         §§push(this.mb);
         if(_loc15_)
         {
            §§push(Number(§§pop()));
         }
         var _loc3_:* = §§pop();
         §§push(this.mc);
         if(_loc15_)
         {
            §§push(Number(§§pop()));
         }
         var _loc4_:* = §§pop();
         §§push(this.md);
         if(!_loc14_)
         {
            §§push(Number(§§pop()));
         }
         var _loc5_:* = §§pop();
         §§push(this.me);
         if(!_loc14_)
         {
            §§push(Number(§§pop()));
         }
         var _loc6_:* = §§pop();
         §§push(this.mf);
         if(!(_loc14_ && Boolean(this)))
         {
            §§push(Number(§§pop()));
         }
         var _loc7_:* = §§pop();
         §§push(this.mg);
         if(_loc15_ || Boolean(_loc2_))
         {
            §§push(Number(§§pop()));
         }
         var _loc8_:* = §§pop();
         §§push(this.mh);
         if(_loc15_)
         {
            §§push(Number(§§pop()));
         }
         var _loc9_:* = §§pop();
         §§push(this.mi);
         if(!_loc14_)
         {
            §§push(Number(§§pop()));
         }
         var _loc10_:* = §§pop();
         §§push(this.mj);
         if(!(_loc14_ && Boolean(param1)))
         {
            §§push(Number(§§pop()));
         }
         var _loc11_:* = §§pop();
         §§push(this.mk);
         if(!_loc14_)
         {
            §§push(Number(§§pop()));
         }
         var _loc12_:* = §§pop();
         §§push(this.ml);
         if(!(_loc14_ && Boolean(param1)))
         {
            §§push(Number(§§pop()));
         }
         var _loc13_:* = §§pop();
         §§push(this);
         §§push(param1.ma);
         if(_loc15_ || Boolean(_loc2_))
         {
            loop0:
            while(true)
            {
               while(true)
               {
                  §§push(_loc2_);
                  if(_loc15_ || Boolean(this))
                  {
                     §§push(§§pop() * §§pop());
                     if(!(_loc15_ || Boolean(this)))
                     {
                        break;
                     }
                     §§push(param1.mb);
                     if(_loc14_ && Boolean(_loc3_))
                     {
                        break loop0;
                     }
                  }
                  §§push(_loc6_);
                  if(_loc15_ || Boolean(this))
                  {
                     §§push(§§pop() * §§pop());
                     if(_loc15_)
                     {
                        §§push(§§pop() + §§pop());
                        if(_loc14_ && Boolean(_loc2_))
                        {
                           break;
                        }
                        §§push(param1.mc);
                        if(!_loc14_)
                        {
                           break loop0;
                        }
                     }
                     §§goto(addr013c);
                  }
                  §§goto(addr013b);
               }
            }
            addr013c:
            addr013b:
            §§push(§§pop() + §§pop() * _loc10_);
            break loop1;
         }
         §§pop().alternativa3d::ma = §§pop();
         while(true)
         {
            loop3:
            while(true)
            {
               §§push(this);
               §§push(param1.ma);
               if(_loc15_ || Boolean(this))
               {
                  §§push(_loc3_);
                  if(!_loc15_)
                  {
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  if(_loc14_)
                  {
                     continue loop4;
                  }
               }
               while(true)
               {
                  addr018f:
                  §§push(param1.mb);
                  if(_loc15_)
                  {
                     §§push(_loc7_);
                     if(!_loc14_)
                     {
                        §§push(§§pop() * §§pop());
                        if(_loc15_ || Boolean(this))
                        {
                           break loop3;
                        }
                        break;
                     }
                     addr0191:
                     §§push(§§pop() * §§pop());
                     break;
                  }
                  §§goto(addr0191);
               }
               addr0192:
               §§push(§§pop() + §§pop());
               continue loop4;
            }
            §§push(§§pop() + §§pop());
            if(!_loc15_)
            {
               continue loop4;
            }
            §§push(param1.mc);
            if(_loc15_)
            {
               §§goto(addr018f);
            }
            §§goto(addr0192);
         }
         §§pop().alternativa3d::mb = §§pop();
         loop4:
         while(true)
         {
            loop5:
            while(true)
            {
               §§push(this);
               §§push(param1.ma);
               if(_loc15_)
               {
                  §§push(_loc4_);
                  if(_loc14_)
                  {
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  if(!(_loc15_ || Boolean(_loc2_)))
                  {
                     break loop4;
                  }
               }
               while(true)
               {
                  §§push(param1.mb);
                  if(_loc15_)
                  {
                     §§push(_loc8_);
                     if(_loc14_)
                     {
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     if(!_loc14_)
                     {
                        §§push(§§pop() + §§pop());
                        if(_loc14_)
                        {
                           break loop4;
                        }
                        §§push(param1.mc);
                        if(!_loc15_)
                        {
                           break loop5;
                        }
                     }
                  }
                  §§push(_loc12_);
                  break;
               }
               §§push(§§pop() * §§pop());
               break;
            }
            §§push(§§pop() + §§pop());
            break;
         }
         §§pop().alternativa3d::mc = §§pop();
         loop6:
         while(true)
         {
            if(!_loc14_)
            {
               loop7:
               while(true)
               {
                  loop8:
                  while(true)
                  {
                     loop28:
                     while(true)
                     {
                        §§push(this);
                        §§push(param1.ma);
                        if(_loc15_)
                        {
                           while(true)
                           {
                              §§push(_loc5_);
                              if(!(_loc14_ && Boolean(_loc2_)))
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc15_ || Boolean(_loc2_)))
                                 {
                                    break;
                                 }
                                 §§push(param1.mb);
                                 if(!_loc15_)
                                 {
                                    break loop8;
                                 }
                              }
                              §§push(_loc9_);
                              if(!_loc14_)
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc14_ && Boolean(param1)))
                                 {
                                    §§push(§§pop() + §§pop());
                                    if(_loc15_)
                                    {
                                       break;
                                    }
                                    break loop7;
                                 }
                                 break loop8;
                              }
                              break loop28;
                           }
                        }
                        §§push(param1.mc);
                        if(!_loc14_)
                        {
                           §§push(_loc13_);
                           break;
                        }
                        break loop8;
                     }
                     §§push(§§pop() * §§pop());
                     if(_loc15_)
                     {
                        break;
                     }
                     §§goto(addr025e);
                  }
                  §§push(§§pop() + §§pop());
                  if(!(_loc14_ && Boolean(_loc3_)))
                  {
                     break;
                  }
                  §§goto(addr025f);
               }
               addr025f:
               §§pop().alternativa3d::md = §§pop() + param1.md;
               addr025e:
               loop9:
               while(true)
               {
                  loop10:
                  while(true)
                  {
                     §§push(this);
                     §§push(param1.me);
                     if(_loc15_ || Boolean(param1))
                     {
                        §§push(_loc2_);
                        if(!_loc15_)
                        {
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        if(_loc14_)
                        {
                           break loop9;
                        }
                     }
                     while(true)
                     {
                        §§push(param1.mf);
                        if(_loc15_ || Boolean(_loc2_))
                        {
                           §§push(_loc6_);
                           if(_loc15_ || Boolean(_loc2_))
                           {
                              §§push(§§pop() * §§pop());
                              if(!_loc14_)
                              {
                                 break loop10;
                              }
                              break;
                           }
                           §§goto(addr02cb);
                        }
                        §§goto(addr02c9);
                     }
                     §§goto(addr02cc);
                  }
                  §§push(§§pop() + §§pop());
                  if(_loc15_ || Boolean(_loc3_))
                  {
                     break;
                  }
                  §§goto(addr02cd);
               }
               addr02cc:
               addr02cd:
               §§push(param1.mg);
               if(_loc15_ || Boolean(_loc2_))
               {
                  addr02cb:
                  addr02c9:
                  §§push(§§pop() * _loc10_);
               }
               §§pop().alternativa3d::me = §§pop() + §§pop();
               if(!_loc14_)
               {
                  §§push(this);
                  §§push(param1.me);
                  if(!_loc14_)
                  {
                     loop11:
                     while(true)
                     {
                        §§push(_loc3_);
                        if(!(_loc14_ && Boolean(this)))
                        {
                           §§push(§§pop() * §§pop());
                           if(!(_loc15_ || Boolean(_loc3_)))
                           {
                              break;
                           }
                           loop12:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(param1.mf);
                                 if(!(_loc14_ && Boolean(this)))
                                 {
                                    §§push(_loc7_);
                                    if(_loc14_)
                                    {
                                       break;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(!_loc14_)
                                    {
                                       §§push(§§pop() + §§pop());
                                       if(_loc14_ && Boolean(_loc3_))
                                       {
                                          break loop11;
                                       }
                                       §§push(param1.mg);
                                       if(_loc14_)
                                       {
                                          break loop12;
                                       }
                                    }
                                 }
                                 §§push(_loc11_);
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              break;
                           }
                        }
                        break loop12;
                     }
                  }
                  §§pop().alternativa3d::mf = §§pop();
               }
               loop14:
               while(true)
               {
                  while(true)
                  {
                     §§push(this);
                     §§push(param1.me);
                     if(!_loc14_)
                     {
                        §§push(_loc4_);
                        if(!_loc15_)
                        {
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        if(_loc14_)
                        {
                           break loop14;
                        }
                     }
                     while(true)
                     {
                        §§push(param1.mf);
                        if(!(_loc14_ && Boolean(this)))
                        {
                           §§push(_loc8_);
                           if(!_loc15_)
                           {
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           if(_loc15_)
                           {
                              §§push(§§pop() + §§pop());
                              if(_loc15_ || Boolean(_loc2_))
                              {
                                 break loop14;
                              }
                              addr039a:
                              §§pop().alternativa3d::mg = §§pop();
                              if(!(_loc14_ && Boolean(param1)))
                              {
                                 §§goto(addr03aa);
                              }
                              break loop6;
                           }
                        }
                        §§goto(addr0396);
                     }
                     §§goto(addr0398);
                  }
                  §§goto(addr039a);
               }
               §§push(param1.mg);
               if(_loc15_)
               {
                  addr0396:
                  addr0398:
                  §§push(§§pop() * _loc12_);
               }
               break loop15;
            }
            addr03aa:
            §§push(this);
            §§push(param1.me);
            if(_loc15_)
            {
               loop17:
               while(true)
               {
                  loop18:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_loc5_);
                        if(_loc15_)
                        {
                           §§push(§§pop() * §§pop());
                           if(_loc14_)
                           {
                              break;
                           }
                           §§push(param1.mf);
                           if(_loc15_ || Boolean(_loc3_))
                           {
                              §§push(_loc9_);
                              if(_loc14_ && Boolean(_loc2_))
                              {
                                 break loop18;
                              }
                              §§push(§§pop() * §§pop());
                              if(_loc14_ && Boolean(_loc2_))
                              {
                                 break loop17;
                              }
                           }
                        }
                        §§push(§§pop() + §§pop());
                        if(!(_loc14_ && Boolean(_loc2_)))
                        {
                           §§push(param1.mg);
                           if(_loc15_)
                           {
                              §§push(_loc13_);
                              break loop18;
                           }
                           break loop17;
                        }
                        break;
                     }
                  }
                  §§push(§§pop() * §§pop());
                  if(_loc15_)
                  {
                     §§push(§§pop() + §§pop());
                     if(!_loc14_)
                     {
                        §§push(param1.mh);
                        break;
                     }
                     break loop19;
                  }
                  break;
               }
            }
            §§pop().alternativa3d::mh = §§pop();
            if(!_loc14_)
            {
               break;
            }
            loop20:
            while(true)
            {
               while(true)
               {
                  §§push(this);
                  §§push(param1.mi);
                  if(_loc15_ || Boolean(_loc3_))
                  {
                     §§push(_loc4_);
                     if(!_loc15_)
                     {
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     if(!(_loc15_ || Boolean(_loc2_)))
                     {
                        break loop20;
                     }
                  }
                  §§push(param1.mj);
                  if(_loc15_)
                  {
                     break;
                  }
                  §§goto(addr055f);
               }
               while(true)
               {
                  §§push(_loc8_);
                  if(!(_loc14_ && Boolean(this)))
                  {
                     §§push(§§pop() * §§pop());
                     if(!(_loc14_ && Boolean(_loc2_)))
                     {
                        §§push(§§pop() + §§pop());
                        if(_loc15_ || Boolean(param1))
                        {
                           break loop20;
                        }
                        §§goto(addr0560);
                     }
                     §§goto(addr055c);
                  }
                  §§goto(addr055e);
               }
               §§goto(addr055f);
            }
            addr055f:
            addr0560:
            §§push(param1.mk);
            if(_loc15_ || Boolean(_loc2_))
            {
               addr055c:
               addr055e:
               §§push(§§pop() * _loc12_);
            }
            §§pop().alternativa3d::mk = §§pop() + §§pop();
            §§push(this);
            §§push(param1.mi);
            if(_loc15_)
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
                        while(true)
                        {
                           §§push(_loc5_);
                           if(!_loc14_)
                           {
                              §§push(§§pop() * §§pop());
                              if(_loc14_ && Boolean(this))
                              {
                                 break loop23;
                              }
                              §§push(param1.mj);
                              if(_loc14_ && Boolean(param1))
                              {
                                 break;
                              }
                              §§push(_loc9_);
                              if(_loc14_ && Boolean(param1))
                              {
                                 break loop24;
                              }
                              §§push(§§pop() * §§pop());
                              if(!(_loc14_ && Boolean(this)))
                              {
                                 §§push(§§pop() + §§pop());
                                 if(_loc14_ && Boolean(this))
                                 {
                                    break loop23;
                                 }
                                 §§push(param1.mk);
                                 if(!(_loc15_ || Boolean(this)))
                                 {
                                    break loop22;
                                 }
                              }
                           }
                           §§push(_loc13_);
                           break loop24;
                        }
                        §§goto(addr05f8);
                     }
                     §§push(§§pop() * §§pop());
                     if(!(_loc14_ && Boolean(this)))
                     {
                        break loop22;
                     }
                     break loop25;
                  }
                  addr05f8:
               }
               §§push(§§pop() + §§pop());
               if(!_loc14_)
               {
                  break loop23;
               }
            }
            §§pop().alternativa3d::ml = §§pop();
            return;
         }
         loop30:
         while(true)
         {
            while(true)
            {
               §§push(this);
               §§push(param1.mi);
               if(_loc15_ || Boolean(_loc3_))
               {
                  §§push(_loc2_);
                  if(!(_loc15_ || Boolean(param1)))
                  {
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  if(!_loc15_)
                  {
                     break loop30;
                  }
               }
               §§push(param1.mj);
               if(_loc15_)
               {
                  break;
               }
               addr048a:
               §§push(§§pop() + §§pop());
               break loop30;
            }
            while(true)
            {
               §§push(_loc6_);
               if(_loc15_ || Boolean(param1))
               {
                  §§push(§§pop() * §§pop());
                  if(_loc14_)
                  {
                     break;
                  }
                  §§push(§§pop() + §§pop());
                  if(!_loc15_)
                  {
                     break loop30;
                  }
                  §§push(param1.mk);
                  if(_loc14_ && Boolean(param1))
                  {
                     break;
                  }
                  §§push(_loc10_);
               }
               §§push(§§pop() * §§pop());
               break;
            }
            §§goto(addr048a);
         }
         §§pop().alternativa3d::mi = §§pop();
         §§push(this);
         §§push(param1.mi);
         if(_loc15_)
         {
            loop32:
            while(true)
            {
               loop33:
               while(true)
               {
                  while(true)
                  {
                     §§push(_loc3_);
                     if(_loc15_)
                     {
                        §§push(§§pop() * §§pop());
                        if(_loc14_)
                        {
                           break loop33;
                        }
                        §§push(param1.mj);
                        if(!(_loc14_ && Boolean(param1)))
                        {
                           §§push(_loc7_);
                           if(!(_loc15_ || Boolean(_loc3_)))
                           {
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           if(!(_loc14_ && Boolean(_loc3_)))
                           {
                              §§push(§§pop() + §§pop());
                              if(_loc14_)
                              {
                                 break loop33;
                              }
                              §§push(param1.mk);
                              if(!_loc15_)
                              {
                                 break loop32;
                              }
                           }
                        }
                     }
                     §§push(_loc11_);
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  break loop32;
               }
            }
            §§push(§§pop() + §§pop());
         }
         §§push(_loc11_);
         break loop33;
      }
      
      alternativa3d function composeAndAppend(param1:Object3D) : void
      {
         §§push(false);
         var _loc27_:Boolean = true;
         var _loc28_:* = §§pop();
         var _loc2_:Number = Math.cos(this.rotationX);
         var _loc3_:Number = Math.sin(this.rotationX);
         var _loc4_:Number = Math.cos(this.rotationY);
         var _loc5_:Number = Math.sin(this.rotationY);
         var _loc6_:Number = Math.cos(this.rotationZ);
         var _loc7_:Number = Math.sin(this.rotationZ);
         while(true)
         {
            §§push(_loc6_);
            if(_loc27_)
            {
               §§push(§§pop() * _loc5_);
               if(_loc28_ && Boolean(_loc3_))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc8_:* = §§pop();
         §§push(_loc7_);
         if(_loc27_ || Boolean(_loc2_))
         {
            §§push(§§pop() * _loc5_);
            if(!(_loc28_ && Boolean(_loc3_)))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc9_:* = §§pop();
         §§push(_loc4_);
         if(_loc27_ || Boolean(_loc3_))
         {
            §§push(§§pop() * this.scaleX);
            if(!(_loc28_ && Boolean(_loc3_)))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc10_:* = §§pop();
         while(true)
         {
            §§push(_loc3_);
            if(_loc27_ || Boolean(param1))
            {
               §§push(§§pop() * this.scaleY);
               if(!(_loc27_ || Boolean(this)))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc11_:* = §§pop();
         while(true)
         {
            §§push(_loc2_);
            if(_loc27_)
            {
               §§push(§§pop() * this.scaleY);
               if(!_loc27_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc12_:* = §§pop();
         while(true)
         {
            §§push(_loc2_);
            if(_loc27_ || Boolean(param1))
            {
               §§push(§§pop() * this.scaleZ);
               if(_loc28_ && Boolean(this))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc13_:* = §§pop();
         §§push(_loc3_);
         if(_loc27_ || Boolean(_loc3_))
         {
            §§push(§§pop() * this.scaleZ);
            if(_loc27_ || Boolean(_loc2_))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc14_:* = §§pop();
         §§push(_loc6_);
         if(_loc27_ || Boolean(param1))
         {
            §§push(§§pop() * _loc10_);
            if(_loc27_)
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc15_:* = §§pop();
         §§push(_loc8_);
         if(!_loc28_)
         {
            loop4:
            while(true)
            {
               while(true)
               {
                  §§push(_loc11_);
                  if(!_loc28_)
                  {
                     §§push(§§pop() * §§pop());
                     if(!_loc27_)
                     {
                        break;
                     }
                     §§push(_loc7_);
                     if(_loc28_)
                     {
                        break loop4;
                     }
                  }
                  §§push(§§pop() * _loc12_);
                  break loop4;
               }
            }
            §§push(§§pop() - §§pop());
            if(!(_loc28_ && Boolean(this)))
            {
               §§push(Number(§§pop()));
            }
            break loop5;
         }
         var _loc16_:* = §§pop();
         loop6:
         while(true)
         {
            §§push(_loc8_);
            if(_loc27_ || Boolean(param1))
            {
               while(true)
               {
                  §§push(_loc13_);
                  if(_loc27_ || Boolean(this))
                  {
                     §§push(§§pop() * §§pop());
                     if(_loc28_ && Boolean(this))
                     {
                        break;
                     }
                     §§push(_loc7_);
                     if(!(_loc28_ && Boolean(_loc3_)))
                     {
                        §§push(§§pop() * _loc14_);
                     }
                  }
                  §§push(§§pop() + §§pop());
                  if(!(_loc28_ && Boolean(this)))
                  {
                     break;
                  }
                  break loop6;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc17_:* = §§pop();
         §§push(this.x);
         if(_loc27_)
         {
            §§push(Number(§§pop()));
         }
         var _loc18_:* = §§pop();
         §§push(_loc7_);
         if(_loc27_)
         {
            §§push(§§pop() * _loc10_);
            if(!(_loc28_ && Boolean(this)))
            {
               §§push(Number(§§pop()));
            }
         }
         var _loc19_:* = §§pop();
         loop8:
         while(true)
         {
            while(true)
            {
               §§push(_loc9_);
               if(!(_loc28_ && Boolean(_loc3_)))
               {
                  §§push(_loc11_);
                  if(_loc28_ && Boolean(_loc2_))
                  {
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  if(!(_loc27_ || Boolean(this)))
                  {
                     break loop8;
                  }
               }
               §§push(_loc6_);
               if(!(_loc28_ && Boolean(param1)))
               {
                  break;
               }
               addr0251:
               §§push(§§pop() + §§pop());
               if(!_loc28_)
               {
                  §§push(Number(§§pop()));
               }
               break loop8;
            }
            §§goto(addr0251);
         }
         var _loc20_:* = §§pop();
         while(true)
         {
            §§push(_loc9_);
            if(_loc27_ || Boolean(this))
            {
               §§push(_loc13_);
               if(_loc27_ || Boolean(_loc2_))
               {
                  §§push(§§pop() * §§pop());
                  if(_loc28_ && Boolean(_loc2_))
                  {
                     break;
                  }
                  §§push(_loc6_);
                  if(!_loc28_)
                  {
                     §§push(§§pop() * _loc14_);
                  }
               }
               §§push(§§pop() - §§pop());
               if(_loc28_ && Boolean(param1))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc21_:* = §§pop();
         §§push(this.y);
         if(!_loc28_)
         {
            §§push(Number(§§pop()));
         }
         var _loc22_:* = §§pop();
         §§push(_loc5_);
         if(_loc27_ || Boolean(param1))
         {
            while(true)
            {
               §§push(-§§pop());
               if(_loc27_)
               {
                  §§push(§§pop() * this.scaleX);
                  if(!_loc27_)
                  {
                     break;
                  }
               }
               §§push(Number(§§pop()));
               break;
            }
         }
         var _loc23_:* = §§pop();
         while(true)
         {
            §§push(_loc4_);
            if(_loc27_ || Boolean(this))
            {
               §§push(§§pop() * _loc11_);
               if(_loc28_ && Boolean(_loc2_))
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc24_:* = §§pop();
         while(true)
         {
            §§push(_loc4_);
            if(!_loc28_)
            {
               §§push(§§pop() * _loc13_);
               if(!_loc27_)
               {
                  break;
               }
            }
            §§push(Number(§§pop()));
            break;
         }
         var _loc25_:* = §§pop();
         §§push(this.z);
         if(!(_loc28_ && Boolean(this)))
         {
            §§push(Number(§§pop()));
         }
         var _loc26_:* = §§pop();
         if(_loc27_)
         {
            loop14:
            while(true)
            {
               loop15:
               while(true)
               {
                  §§push(this);
                  §§push(param1.ma);
                  if(_loc27_ || Boolean(this))
                  {
                     §§push(_loc15_);
                     if(_loc28_)
                     {
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     if(!_loc27_)
                     {
                        break loop14;
                     }
                  }
                  while(true)
                  {
                     §§push(param1.mb);
                     if(_loc27_ || Boolean(this))
                     {
                        §§push(_loc19_);
                        if(!(_loc27_ || Boolean(this)))
                        {
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        if(!_loc27_)
                        {
                           break loop15;
                        }
                     }
                     §§push(§§pop() + §§pop());
                     if(!_loc28_)
                     {
                        break loop14;
                     }
                     §§pop().alternativa3d::ma = §§pop();
                     loop17:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(this);
                           §§push(param1.ma);
                           if(_loc27_)
                           {
                              §§push(_loc16_);
                              if(!_loc27_)
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(!_loc27_)
                              {
                                 break loop17;
                              }
                           }
                           §§push(param1.mb);
                           if(!(_loc28_ && Boolean(_loc3_)))
                           {
                              break;
                           }
                           §§goto(addr03e1);
                        }
                        §§push(_loc20_);
                        if(!_loc28_)
                        {
                           §§push(§§pop() * §§pop());
                           if(_loc27_ || Boolean(_loc2_))
                           {
                              §§push(§§pop() + §§pop());
                              if(_loc27_)
                              {
                                 break;
                              }
                              §§goto(addr03e5);
                           }
                           §§goto(addr03e1);
                        }
                        §§goto(addr03e3);
                     }
                     addr03e5:
                     §§push(param1.mc);
                     if(!_loc28_)
                     {
                        addr03e1:
                        addr03e3:
                        §§push(§§pop() * _loc24_);
                     }
                     §§pop().alternativa3d::mb = §§pop() + §§pop();
                     loop19:
                     while(true)
                     {
                        loop20:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(this);
                              §§push(param1.ma);
                              if(_loc27_ || Boolean(this))
                              {
                                 §§push(_loc17_);
                                 if(_loc27_ || Boolean(_loc3_))
                                 {
                                    §§push(§§pop() * §§pop());
                                    if(!_loc27_)
                                    {
                                       break loop19;
                                    }
                                    §§push(param1.mb);
                                    if(!(_loc28_ && Boolean(param1)))
                                    {
                                       §§push(_loc21_);
                                       if(!(_loc27_ || Boolean(_loc2_)))
                                       {
                                          break;
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(_loc28_)
                                       {
                                          break loop20;
                                       }
                                    }
                                 }
                                 §§push(§§pop() + §§pop());
                                 if(_loc28_ && Boolean(param1))
                                 {
                                    break loop19;
                                 }
                              }
                              §§push(param1.mc);
                              if(!(_loc28_ && Boolean(_loc2_)))
                              {
                                 §§push(_loc25_);
                                 break;
                              }
                              break loop20;
                           }
                           §§push(§§pop() * §§pop());
                           break;
                        }
                        §§push(§§pop() + §§pop());
                        break;
                     }
                     §§pop().alternativa3d::mc = §§pop();
                     while(true)
                     {
                        if(!_loc28_)
                        {
                           loop22:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(this);
                                 §§push(param1.ma);
                                 if(_loc27_)
                                 {
                                    §§push(_loc18_);
                                    if(!(_loc27_ || Boolean(_loc3_)))
                                    {
                                       break;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(!(_loc27_ || Boolean(this)))
                                    {
                                       break loop22;
                                    }
                                 }
                                 §§push(param1.mb);
                                 if(!(_loc28_ && Boolean(this)))
                                 {
                                    §§push(_loc22_);
                                    if(!_loc28_)
                                    {
                                       §§push(§§pop() * §§pop());
                                       if(!(_loc28_ && Boolean(this)))
                                       {
                                          break;
                                       }
                                       §§goto(addr04d7);
                                    }
                                    §§goto(addr04d9);
                                 }
                                 §§goto(addr04fa);
                              }
                              §§push(§§pop() + §§pop());
                              if(_loc27_ || Boolean(_loc2_))
                              {
                                 break;
                              }
                              continue loop26;
                           }
                           while(true)
                           {
                              §§push(param1.mc);
                              if(!_loc28_)
                              {
                                 addr04d7:
                                 addr04d9:
                                 §§push(§§pop() * _loc26_);
                                 if(!(_loc28_ && Boolean(param1)))
                                 {
                                    §§push(§§pop() + §§pop());
                                    if(!(_loc27_ || Boolean(param1)))
                                    {
                                       break;
                                    }
                                    §§push(param1.md);
                                 }
                              }
                              addr04fa:
                              §§push(§§pop() + §§pop());
                              break;
                           }
                           §§pop().alternativa3d::md = §§pop();
                           while(true)
                           {
                              loop26:
                              while(true)
                              {
                                 loop34:
                                 while(true)
                                 {
                                    §§push(this);
                                    §§push(param1.me);
                                    if(_loc27_)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc15_);
                                          if(!_loc28_)
                                          {
                                             §§push(§§pop() * §§pop());
                                             if(_loc28_)
                                             {
                                                break;
                                             }
                                             §§push(param1.mf);
                                             if(_loc27_ || Boolean(this))
                                             {
                                                §§push(_loc19_);
                                                if(_loc28_ && Boolean(param1))
                                                {
                                                   break loop34;
                                                }
                                                §§push(§§pop() * §§pop());
                                                if(_loc28_ && Boolean(_loc3_))
                                                {
                                                   break loop26;
                                                }
                                             }
                                          }
                                          §§push(§§pop() + §§pop());
                                          if(!_loc28_)
                                          {
                                             break;
                                          }
                                          continue loop32;
                                       }
                                    }
                                    §§push(param1.mg);
                                    if(!(_loc28_ && Boolean(_loc2_)))
                                    {
                                       break loop26;
                                    }
                                    addr0561:
                                    §§push(§§pop() + §§pop());
                                    continue loop32;
                                 }
                                 §§goto(addr0561);
                              }
                              §§push(_loc23_);
                              break loop34;
                           }
                           §§pop().alternativa3d::me = §§pop();
                           loop27:
                           while(true)
                           {
                              loop28:
                              while(true)
                              {
                                 loop32:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(this);
                                       §§push(param1.me);
                                       if(_loc27_)
                                       {
                                          §§push(_loc16_);
                                          if(_loc27_ || Boolean(param1))
                                          {
                                             §§push(§§pop() * §§pop());
                                             if(_loc28_ && Boolean(this))
                                             {
                                                break loop27;
                                             }
                                             §§push(param1.mf);
                                             if(!_loc27_)
                                             {
                                                break;
                                             }
                                             §§push(_loc20_);
                                             if(!_loc27_)
                                             {
                                                break loop32;
                                             }
                                             §§push(§§pop() * §§pop());
                                             if(_loc28_ && Boolean(this))
                                             {
                                                break loop28;
                                             }
                                          }
                                          §§push(§§pop() + §§pop());
                                          if(!(_loc27_ || Boolean(_loc2_)))
                                          {
                                             break loop27;
                                          }
                                       }
                                       §§push(param1.mg);
                                       if(!_loc28_)
                                       {
                                          break loop28;
                                       }
                                       break;
                                    }
                                    §§push(§§pop() + §§pop());
                                    break loop27;
                                 }
                                 §§push(§§pop() * §§pop());
                                 break loop33;
                              }
                              §§push(_loc24_);
                              break loop32;
                           }
                           §§pop().alternativa3d::mf = §§pop();
                           if(_loc28_ && Boolean(_loc2_))
                           {
                              break;
                           }
                           loop29:
                           while(true)
                           {
                              loop30:
                              while(true)
                              {
                                 §§push(this);
                                 §§push(param1.me);
                                 if(_loc27_)
                                 {
                                    §§push(_loc17_);
                                    if(_loc28_ && Boolean(this))
                                    {
                                       break;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(!_loc27_)
                                    {
                                       break loop29;
                                    }
                                 }
                                 §§push(param1.mf);
                                 if(!_loc28_)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc21_);
                                       if(_loc27_)
                                       {
                                          §§push(§§pop() * §§pop());
                                          if(!_loc28_)
                                          {
                                             break loop30;
                                          }
                                          break;
                                       }
                                       addr062c:
                                       §§push(§§pop() * §§pop());
                                       break;
                                    }
                                 }
                                 addr062d:
                                 §§push(§§pop() + §§pop());
                                 break loop29;
                              }
                              §§push(§§pop() + §§pop());
                              if(_loc28_ && Boolean(_loc3_))
                              {
                                 break;
                              }
                              §§push(param1.mg);
                              if(_loc27_)
                              {
                                 §§goto(addr062c);
                                 §§push(_loc25_);
                              }
                              §§goto(addr062d);
                           }
                           §§pop().alternativa3d::mg = §§pop();
                        }
                        loop36:
                        while(true)
                        {
                           loop37:
                           while(true)
                           {
                              loop48:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(this);
                                    §§push(param1.me);
                                    if(!(_loc28_ && Boolean(this)))
                                    {
                                       §§push(_loc18_);
                                       if(!_loc27_)
                                       {
                                          break;
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(_loc28_ && Boolean(_loc3_))
                                       {
                                          break loop36;
                                       }
                                       §§push(param1.mf);
                                       if(_loc28_)
                                       {
                                          break loop37;
                                       }
                                       §§push(_loc22_);
                                       if(_loc28_)
                                       {
                                          break loop48;
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(!(_loc27_ || Boolean(param1)))
                                       {
                                          break loop37;
                                       }
                                       §§push(§§pop() + §§pop());
                                       if(!_loc27_)
                                       {
                                          break loop36;
                                       }
                                    }
                                    §§push(param1.mg);
                                    if(!(_loc28_ && Boolean(_loc2_)))
                                    {
                                       break loop37;
                                    }
                                    §§goto(addr06ac);
                                 }
                                 §§push(§§pop() + §§pop());
                                 if(_loc27_)
                                 {
                                    break loop36;
                                 }
                                 §§goto(addr06ad);
                              }
                              §§push(§§pop() * §§pop());
                              if(!(_loc28_ && Boolean(this)))
                              {
                                 break loop49;
                              }
                              §§goto(addr06ac);
                           }
                           §§push(_loc26_);
                           break loop48;
                        }
                        addr06ad:
                        §§pop().alternativa3d::mh = §§pop() + param1.mh;
                        addr06ac:
                        if(_loc27_)
                        {
                           §§push(this);
                           §§push(param1.mi);
                           if(_loc27_ || Boolean(_loc3_))
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
                                       while(true)
                                       {
                                          §§push(_loc15_);
                                          if(!_loc28_)
                                          {
                                             §§push(§§pop() * §§pop());
                                             if(!(_loc27_ || Boolean(param1)))
                                             {
                                                break;
                                             }
                                             §§push(param1.mj);
                                             if(!_loc27_)
                                             {
                                                break loop40;
                                             }
                                             §§push(_loc19_);
                                             if(!_loc27_)
                                             {
                                                break loop39;
                                             }
                                             §§push(§§pop() * §§pop());
                                             if(_loc28_)
                                             {
                                                break loop38;
                                             }
                                          }
                                          §§push(§§pop() + §§pop());
                                          if(!(_loc28_ && Boolean(this)))
                                          {
                                             break;
                                          }
                                       }
                                       §§push(param1.mk);
                                       if(!_loc28_)
                                       {
                                          break;
                                       }
                                       break loop38;
                                    }
                                    §§push(_loc23_);
                                    break;
                                 }
                                 §§push(§§pop() * §§pop());
                                 break;
                              }
                           }
                           §§pop().alternativa3d::mi = §§pop();
                           if(_loc27_)
                           {
                              break;
                           }
                           addr0799:
                           while(true)
                           {
                              loop43:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(this);
                                    §§push(param1.mi);
                                    if(_loc27_ || Boolean(this))
                                    {
                                       §§push(_loc17_);
                                       if(!_loc27_)
                                       {
                                          break loop43;
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(_loc28_ && Boolean(param1))
                                       {
                                          continue loop44;
                                       }
                                       §§push(param1.mj);
                                       if(_loc27_)
                                       {
                                          §§push(_loc21_);
                                          if(_loc28_ && Boolean(_loc3_))
                                          {
                                             break;
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(!(_loc27_ || Boolean(param1)))
                                          {
                                             break loop43;
                                          }
                                       }
                                       §§push(§§pop() + §§pop());
                                       if(!_loc27_)
                                       {
                                          continue loop44;
                                       }
                                    }
                                    §§push(param1.mk);
                                    if(!_loc28_)
                                    {
                                       break loop43;
                                    }
                                    addr07fd:
                                    §§push(§§pop() + §§pop());
                                    continue loop44;
                                 }
                                 §§goto(addr07fd);
                              }
                              §§push(_loc25_);
                              break loop47;
                           }
                           §§pop().alternativa3d::mk = §§pop();
                           loop44:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(this);
                                 §§push(param1.mi);
                                 if(_loc27_)
                                 {
                                    §§push(_loc18_);
                                    if(!(_loc27_ || Boolean(param1)))
                                    {
                                       break;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(_loc28_)
                                    {
                                       break loop44;
                                    }
                                 }
                                 §§push(param1.mj);
                                 if(!(_loc28_ && Boolean(_loc3_)))
                                 {
                                    while(true)
                                    {
                                       §§push(_loc22_);
                                       if(!_loc28_)
                                       {
                                          §§push(§§pop() * §§pop());
                                          if(_loc27_)
                                          {
                                             §§push(§§pop() + §§pop());
                                             if(!_loc28_)
                                             {
                                                break loop44;
                                             }
                                             §§goto(addr0877);
                                          }
                                          §§goto(addr0859);
                                       }
                                       §§goto(addr085b);
                                    }
                                 }
                                 §§goto(addr086c);
                              }
                              §§goto(addr0877);
                           }
                           §§push(param1.mk);
                           if(!(_loc28_ && Boolean(param1)))
                           {
                              addr0859:
                              addr085b:
                              §§push(§§pop() * _loc26_);
                              if(!_loc27_)
                              {
                                 break loop45;
                              }
                           }
                           addr0877:
                           addr086c:
                           §§push(§§pop() + §§pop());
                           if(!_loc28_)
                           {
                              §§push(param1.ml);
                              break loop45;
                           }
                           §§pop().alternativa3d::ml = §§pop();
                        }
                     }
                     loop50:
                     while(true)
                     {
                        loop51:
                        while(true)
                        {
                           §§push(this);
                           §§push(param1.mi);
                           if(_loc27_ || Boolean(_loc2_))
                           {
                              §§push(_loc16_);
                              if(!(_loc27_ || Boolean(_loc2_)))
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(!(_loc27_ || Boolean(param1)))
                              {
                                 break loop50;
                              }
                           }
                           while(true)
                           {
                              §§push(param1.mj);
                              if(_loc27_ || Boolean(this))
                              {
                                 §§push(_loc20_);
                                 if(!_loc27_)
                                 {
                                    break;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc27_ || Boolean(_loc2_)))
                                 {
                                    break loop51;
                                 }
                                 §§push(§§pop() + §§pop());
                                 if(_loc28_ && Boolean(_loc2_))
                                 {
                                    break loop50;
                                 }
                                 §§push(param1.mk);
                                 if(!(_loc27_ || Boolean(_loc2_)))
                                 {
                                    break loop51;
                                 }
                              }
                              §§push(_loc24_);
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           break;
                        }
                        §§push(§§pop() + §§pop());
                        break;
                     }
                     §§pop().alternativa3d::mj = §§pop();
                     §§goto(addr0799);
                  }
                  §§goto(addr038c);
               }
               §§push(§§pop() + §§pop());
               continue loop17;
            }
            §§push(param1.mc);
            if(_loc27_ || Boolean(this))
            {
               addr038c:
               §§push(§§pop() * _loc23_);
            }
            break loop15;
         }
      }
      
      alternativa3d function invertMatrix() : void
      {
         §§push(false);
         var _loc14_:Boolean = true;
         var _loc15_:* = §§pop();
         §§push(this.ma);
         if(!(_loc15_ && Boolean(_loc2_)))
         {
            §§push(Number(§§pop()));
         }
         var _loc1_:* = §§pop();
         §§push(this.mb);
         if(!_loc15_)
         {
            §§push(Number(§§pop()));
         }
         var _loc2_:* = §§pop();
         §§push(this.mc);
         if(!_loc15_)
         {
            §§push(Number(§§pop()));
         }
         var _loc3_:* = §§pop();
         §§push(this.md);
         if(_loc14_)
         {
            §§push(Number(§§pop()));
         }
         var _loc4_:* = §§pop();
         §§push(this.me);
         if(!_loc15_)
         {
            §§push(Number(§§pop()));
         }
         var _loc5_:* = §§pop();
         §§push(this.mf);
         if(!(_loc15_ && Boolean(_loc2_)))
         {
            §§push(Number(§§pop()));
         }
         var _loc6_:* = §§pop();
         §§push(this.mg);
         if(!(_loc15_ && Boolean(this)))
         {
            §§push(Number(§§pop()));
         }
         var _loc7_:* = §§pop();
         §§push(this.mh);
         if(!_loc15_)
         {
            §§push(Number(§§pop()));
         }
         var _loc8_:* = §§pop();
         §§push(this.mi);
         if(_loc14_ || Boolean(_loc3_))
         {
            §§push(Number(§§pop()));
         }
         var _loc9_:* = §§pop();
         §§push(this.mj);
         if(_loc14_ || Boolean(_loc1_))
         {
            §§push(Number(§§pop()));
         }
         var _loc10_:* = §§pop();
         §§push(this.mk);
         if(!_loc15_)
         {
            §§push(Number(§§pop()));
         }
         var _loc11_:* = §§pop();
         §§push(this.ml);
         if(!_loc15_)
         {
            §§push(Number(§§pop()));
         }
         var _loc12_:* = §§pop();
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               loop19:
               while(true)
               {
                  loop23:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(1);
                        §§push(_loc3_);
                        if(_loc14_)
                        {
                           §§push(-§§pop());
                           if(!(_loc14_ || Boolean(_loc3_)))
                           {
                              break;
                           }
                           §§push(_loc6_);
                           if(_loc15_ && Boolean(_loc1_))
                           {
                              break loop23;
                           }
                           §§push(§§pop() * §§pop() * _loc9_);
                           §§push(_loc2_);
                           if(_loc15_ && Boolean(_loc3_))
                           {
                              break loop19;
                           }
                           §§push(§§pop() * _loc7_);
                           §§push(_loc9_);
                           if(!(_loc14_ || Boolean(this)))
                           {
                              break loop1;
                           }
                           §§push(§§pop() + §§pop() * §§pop());
                           if(!_loc14_)
                           {
                              break loop0;
                           }
                        }
                        §§push(_loc3_ * _loc5_);
                        break loop23;
                     }
                     §§push(_loc1_);
                     if(!(_loc15_ && Boolean(_loc1_)))
                     {
                        §§push(_loc7_);
                        if(_loc14_ || Boolean(this))
                        {
                           break loop1;
                        }
                        §§goto(addr0188);
                     }
                     §§goto(addr01a8);
                  }
                  §§push(_loc10_);
                  if(!_loc14_)
                  {
                     break loop1;
                  }
                  §§push(§§pop() * §§pop());
                  if(_loc14_ || Boolean(_loc3_))
                  {
                     §§push(§§pop() + §§pop());
                     if(!(_loc15_ && Boolean(_loc3_)))
                     {
                        break loop24;
                     }
                     §§goto(addr01af);
                  }
                  §§goto(addr01a8);
               }
               §§push(§§pop() - §§pop());
               if(!_loc15_)
               {
                  break loop0;
               }
               §§goto(addr01af);
            }
            loop20:
            while(true)
            {
               loop21:
               while(true)
               {
                  while(true)
                  {
                     §§push(§§pop() * §§pop() * _loc10_);
                     if(_loc14_ || Boolean(_loc3_))
                     {
                        §§push(§§pop() - §§pop());
                        if(!_loc14_)
                        {
                           break;
                        }
                        §§push(_loc2_);
                        §§push(_loc5_);
                        if(!_loc14_)
                        {
                           break loop21;
                        }
                        §§push(§§pop() * §§pop());
                        if(_loc15_ && Boolean(_loc3_))
                        {
                           break loop20;
                        }
                     }
                     §§push(_loc11_);
                     if(!_loc15_)
                     {
                        §§push(§§pop() * §§pop());
                        break loop19;
                     }
                     break loop21;
                  }
                  §§goto(addr01af);
               }
               §§goto(addr01ad);
            }
            §§goto(addr01ae);
         }
         addr01ae:
         addr01ad:
         addr01af:
         addr01a8:
         §§push(§§pop() / (§§pop() + _loc1_ * _loc6_ * _loc11_));
         if(!_loc15_)
         {
            §§push(Number(§§pop()));
         }
         var _loc13_:* = §§pop();
         loop2:
         while(true)
         {
            while(true)
            {
               §§push(this);
               §§push(_loc7_);
               if(_loc14_)
               {
                  §§push(-§§pop());
                  if(!(_loc15_ && Boolean(_loc2_)))
                  {
                     §§push(_loc10_);
                     if(_loc15_ && Boolean(_loc2_))
                     {
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     if(!_loc15_)
                     {
                        §§push(_loc6_);
                        if(!(_loc14_ || Boolean(_loc1_)))
                        {
                           break;
                        }
                        §§push(§§pop() * _loc11_);
                        if(_loc15_)
                        {
                           break;
                        }
                        §§push(§§pop() + §§pop());
                        if(!_loc14_)
                        {
                           break loop2;
                        }
                     }
                  }
               }
               §§push(_loc13_);
               break;
            }
            §§push(§§pop() * §§pop());
            break;
         }
         §§pop().alternativa3d::ma = §§pop();
         while(true)
         {
            if(!_loc15_)
            {
               loop5:
               while(true)
               {
                  while(true)
                  {
                     §§push(this);
                     §§push(_loc3_);
                     if(!(_loc15_ && Boolean(_loc3_)))
                     {
                        §§push(_loc10_);
                        if(_loc15_)
                        {
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        if(!(_loc15_ && Boolean(_loc1_)))
                        {
                           §§push(_loc2_);
                           if(_loc14_ || Boolean(_loc2_))
                           {
                              §§push(§§pop() * _loc11_);
                              if(!_loc14_)
                              {
                                 break;
                              }
                           }
                           §§push(§§pop() - §§pop());
                           if(!(_loc14_ || Boolean(_loc1_)))
                           {
                              break loop5;
                           }
                        }
                     }
                     §§push(_loc13_);
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  break;
               }
               §§pop().alternativa3d::mb = §§pop();
               §§push(this);
               §§push(_loc3_);
               if(!(_loc15_ && Boolean(this)))
               {
                  loop7:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(-§§pop());
                        if(!_loc15_)
                        {
                           §§push(_loc6_);
                           if(!(_loc14_ || Boolean(this)))
                           {
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           if(!(_loc14_ || Boolean(_loc2_)))
                           {
                              break loop7;
                           }
                        }
                        §§push(_loc2_);
                        if(_loc14_ || Boolean(this))
                        {
                           §§push(§§pop() * _loc7_);
                           if(_loc14_)
                           {
                              break;
                           }
                           addr02bd:
                           §§push(§§pop() * §§pop());
                           break loop7;
                        }
                        break;
                     }
                     §§push(§§pop() + §§pop());
                     if(!_loc14_)
                     {
                        break;
                     }
                     §§goto(addr02bd);
                     §§push(_loc13_);
                  }
               }
               break loop7;
            }
            §§push(this);
            §§push(_loc2_);
            if(!_loc15_)
            {
               §§push(-§§pop());
               if(!_loc15_)
               {
                  loop9:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_loc5_);
                        if(_loc14_)
                        {
                           §§push(§§pop() * §§pop());
                           if(_loc15_ && Boolean(_loc3_))
                           {
                              break;
                           }
                           §§push(_loc1_);
                           if(!_loc14_)
                           {
                              break loop9;
                           }
                        }
                        §§push(§§pop() * _loc6_);
                        if(!_loc15_)
                        {
                           break loop9;
                        }
                        addr060e:
                     }
                     §§goto(addr060e);
                  }
                  §§push(§§pop() + §§pop());
                  if(_loc14_)
                  {
                     break loop10;
                  }
                  §§push(§§pop() * §§pop());
               }
            }
            §§pop().alternativa3d::mk = §§pop();
            §§push(this);
            §§push(_loc4_ * _loc6_ * _loc9_);
            if(!_loc15_)
            {
               loop11:
               while(true)
               {
                  loop12:
                  while(true)
                  {
                     loop15:
                     while(true)
                     {
                        §§push(_loc2_);
                        §§push(_loc8_);
                        if(_loc14_)
                        {
                           §§push(§§pop() * §§pop());
                           if(_loc14_)
                           {
                              §§push(_loc9_);
                              if(_loc14_ || Boolean(this))
                              {
                                 §§push(§§pop() - §§pop() * §§pop());
                                 if(_loc15_)
                                 {
                                    break loop12;
                                 }
                                 §§push(_loc4_);
                                 §§push(_loc5_);
                                 if(!(_loc14_ || Boolean(_loc2_)))
                                 {
                                    break loop11;
                                 }
                              }
                              addr065a:
                              while(true)
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc15_ && Boolean(_loc1_)))
                                 {
                                    §§push(_loc10_);
                                    if(_loc15_)
                                    {
                                       break loop11;
                                    }
                                    §§push(§§pop() - §§pop() * §§pop());
                                    if(_loc15_)
                                    {
                                       break;
                                    }
                                    §§push(_loc1_);
                                 }
                                 §§push(§§pop() * _loc8_);
                                 if(!(_loc14_ || Boolean(_loc3_)))
                                 {
                                    break loop15;
                                 }
                                 §§push(_loc10_);
                                 if(_loc14_)
                                 {
                                    break loop11;
                                 }
                                 §§goto(addr06cb);
                              }
                              addr06c5:
                              §§goto(addr06c6);
                           }
                           §§goto(addr06aa);
                        }
                        §§goto(addr065a);
                     }
                     while(true)
                     {
                        §§push(_loc12_);
                        if(_loc14_)
                        {
                           §§push(§§pop() + §§pop() * §§pop());
                           if(!(_loc14_ || Boolean(_loc2_)))
                           {
                              break;
                           }
                           §§goto(addr06c5);
                        }
                        §§goto(addr06cb);
                     }
                     §§goto(addr06eb);
                  }
                  while(true)
                  {
                     addr06cb:
                     addr06c6:
                     §§push(_loc2_);
                     if(_loc14_)
                     {
                        addr06aa:
                        §§push(§§pop() * _loc5_);
                        break loop15;
                     }
                     §§push(§§pop() * _loc6_ * _loc12_);
                     if(!(_loc14_ || Boolean(_loc1_)))
                     {
                        break loop13;
                     }
                     §§goto(addr06e4);
                  }
                  §§goto(addr06eb);
               }
               while(true)
               {
                  while(true)
                  {
                     addr06e4:
                     §§push(§§pop() * §§pop());
                     if(!(_loc15_ && Boolean(_loc1_)))
                     {
                        §§push(§§pop() + §§pop());
                        break loop12;
                     }
                     §§push(§§pop() - §§pop());
                     if(!_loc15_)
                     {
                        break;
                     }
                  }
                  addr06eb:
                  §§push(_loc13_);
                  break;
               }
            }
            §§pop().alternativa3d::ml = §§pop();
            break;
         }
      }
      
      alternativa3d function calculateInverseMatrix() : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               loop2:
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
                           §§push(1);
                           §§push(this.mc);
                           if(!_loc2_)
                           {
                              while(true)
                              {
                                 §§push(-§§pop());
                                 §§push(this.mf);
                                 if(_loc3_ || Boolean(_loc1_))
                                 {
                                    §§push(§§pop() * §§pop() * this.mi);
                                    §§push(this.mb);
                                    §§push(this.mg);
                                    if(!_loc3_)
                                    {
                                       break loop43;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(_loc2_ && _loc2_)
                                    {
                                       break loop2;
                                    }
                                    §§push(this.mi);
                                    if(_loc2_ && _loc2_)
                                    {
                                       break loop1;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(_loc2_ && _loc2_)
                                    {
                                       break;
                                    }
                                    §§push(§§pop() + §§pop());
                                    §§push(this.mc);
                                    if(_loc3_)
                                    {
                                       §§push(§§pop() * this.me);
                                       §§push(this.mj);
                                       if(!(_loc3_ || Boolean(_loc1_)))
                                       {
                                          break loop1;
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(!_loc3_)
                                       {
                                          break loop45;
                                       }
                                    }
                                    §§push(§§pop() + §§pop());
                                    §§push(this.ma);
                                    if(!(_loc3_ || Boolean(_loc1_)))
                                    {
                                       break loop44;
                                    }
                                 }
                                 §§push(§§pop() * this.mg * this.mj);
                                 if(!(_loc2_ && Boolean(_loc1_)))
                                 {
                                    break;
                                 }
                                 break loop0;
                              }
                           }
                           §§push(this.mb);
                           if(_loc3_ || Boolean(_loc1_))
                           {
                              break loop0;
                           }
                           break loop2;
                        }
                        §§goto(addr00e0);
                     }
                     §§goto(addr00e8);
                  }
                  §§goto(addr00c5);
               }
               §§goto(addr00e4);
            }
            addr00e8:
            §§push(§§pop() / (§§pop() + §§pop() * §§pop()));
            if(!_loc2_)
            {
               §§push(Number(§§pop()));
            }
            var _loc1_:* = §§pop();
            if(!(_loc2_ && Boolean(_loc1_)))
            {
               loop3:
               while(true)
               {
                  while(true)
                  {
                     §§push(this);
                     §§push(this.mg);
                     if(!_loc2_)
                     {
                        §§push(-§§pop());
                        if(!(_loc3_ || _loc3_))
                        {
                           break loop3;
                        }
                        §§push(this.mj);
                        if(_loc2_ && Boolean(this))
                        {
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        if(!_loc3_)
                        {
                           break loop3;
                        }
                     }
                     §§push(this.mf);
                     if(!_loc2_)
                     {
                        §§push(§§pop() * this.mk);
                        if(!_loc2_)
                        {
                           break;
                        }
                     }
                     addr0143:
                     §§push(§§pop() * §§pop());
                     break loop3;
                  }
                  §§push(§§pop() + §§pop());
                  if(!_loc3_)
                  {
                     break;
                  }
                  §§goto(addr0143);
                  §§push(_loc1_);
               }
               §§pop().alternativa3d::ima = §§pop();
            }
            §§push(this);
            §§push(this.mc);
            if(!_loc2_)
            {
               loop5:
               while(true)
               {
                  while(true)
                  {
                     §§push(this.mj);
                     if(_loc3_ || Boolean(_loc1_))
                     {
                        §§push(§§pop() * §§pop());
                        if(!_loc3_)
                        {
                           break;
                        }
                        §§push(this.mb);
                        if(_loc2_ && _loc2_)
                        {
                           break loop5;
                        }
                     }
                     §§push(§§pop() * this.mk);
                     if(!_loc2_)
                     {
                        §§push(§§pop() - §§pop());
                        if(_loc3_)
                        {
                           §§push(_loc1_);
                           break loop5;
                        }
                        break;
                     }
                     break loop5;
                  }
               }
               §§push(§§pop() * §§pop());
               break loop6;
            }
            §§pop().alternativa3d::imb = §§pop();
            §§push(this);
            §§push(this.mc);
            if(!(_loc2_ && Boolean(this)))
            {
               §§push(-§§pop());
               if(_loc3_ || Boolean(_loc1_))
               {
                  loop7:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(this.mf);
                        if(_loc3_)
                        {
                           §§push(§§pop() * §§pop());
                           if(!_loc3_)
                           {
                              break;
                           }
                           §§push(this.mb);
                           if(_loc3_)
                           {
                              §§push(§§pop() * this.mg);
                              if(_loc2_)
                              {
                                 break loop7;
                              }
                           }
                        }
                        §§push(§§pop() + §§pop());
                        if(!_loc2_)
                        {
                           break;
                        }
                     }
                     §§push(_loc1_);
                     break;
                  }
               }
            }
            §§pop().alternativa3d::imc = §§pop();
            if(_loc3_)
            {
               loop9:
               while(true)
               {
                  loop10:
                  while(true)
                  {
                     loop39:
                     while(true)
                     {
                        loop40:
                        while(true)
                        {
                           loop41:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(this);
                                 §§push(this.md);
                                 §§push(this.mg);
                                 if(_loc3_ || _loc2_)
                                 {
                                    §§push(§§pop() * §§pop() * this.mj);
                                    if(!(_loc3_ || Boolean(_loc1_)))
                                    {
                                       break;
                                    }
                                    §§push(this.mc);
                                    if(_loc3_ || _loc2_)
                                    {
                                       §§push(§§pop() - §§pop() * this.mh * this.mj);
                                       §§push(this.md * this.mf);
                                       if(_loc3_ || _loc2_)
                                       {
                                          §§push(this.mk);
                                          if(_loc2_)
                                          {
                                             break loop39;
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(_loc2_ && Boolean(this))
                                          {
                                             break loop41;
                                          }
                                       }
                                    }
                                    §§push(§§pop() - §§pop());
                                    if(!_loc3_)
                                    {
                                       break loop40;
                                    }
                                    §§push(this.mb);
                                    §§push(this.mh);
                                    if(!(_loc3_ || _loc3_))
                                    {
                                       break loop39;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(_loc2_)
                                    {
                                       break loop9;
                                    }
                                    §§push(this.mk);
                                    if(!_loc3_)
                                    {
                                       break loop10;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(!_loc3_)
                                    {
                                       break loop9;
                                    }
                                    §§push(§§pop() + §§pop());
                                    §§push(this.mc);
                                 }
                                 §§push(this.mf);
                                 break loop10;
                              }
                              §§goto(addr0290);
                           }
                           §§goto(addr0284);
                        }
                        §§goto(addr028e);
                     }
                     addr0284:
                     §§push(§§pop() * §§pop() * this.ml);
                     if(_loc3_)
                     {
                        §§push(§§pop() - §§pop());
                        break loop40;
                     }
                     break loop9;
                  }
                  addr028e:
                  §§push(§§pop() + §§pop() * §§pop() * this.ml);
                  if(_loc3_)
                  {
                     §§push(this.mb);
                     §§push(this.mg);
                     break loop39;
                  }
                  §§push(_loc1_);
                  break;
               }
               addr0290:
               §§pop().alternativa3d::imd = §§pop() * §§pop();
               §§push(this);
               §§push(this.mg);
               if(_loc3_ || Boolean(this))
               {
                  loop11:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(this.mi);
                        if(!(_loc2_ && Boolean(this)))
                        {
                           §§push(§§pop() * §§pop());
                           if(_loc2_ && Boolean(_loc1_))
                           {
                              break;
                           }
                           §§push(this.me);
                           if(_loc2_ && _loc2_)
                           {
                              break loop11;
                           }
                        }
                        §§push(§§pop() * this.mk);
                        if(!(_loc2_ && Boolean(_loc1_)))
                        {
                           break loop11;
                        }
                        addr02e9:
                     }
                     §§goto(addr02e9);
                  }
                  §§push(§§pop() - §§pop());
                  if(_loc3_)
                  {
                     break loop12;
                  }
                  §§push(§§pop() * §§pop());
               }
               §§pop().alternativa3d::ime = §§pop();
               loop13:
               while(true)
               {
                  loop14:
                  while(true)
                  {
                     §§push(this);
                     §§push(this.mc);
                     if(_loc3_ || _loc3_)
                     {
                        §§push(-§§pop());
                        if(!(_loc2_ && Boolean(_loc1_)))
                        {
                           while(true)
                           {
                              §§push(this.mi);
                              if(_loc3_)
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc3_ || _loc2_))
                                 {
                                    break;
                                 }
                                 §§push(this.ma);
                                 if(_loc3_)
                                 {
                                    §§push(§§pop() * this.mk);
                                    if(_loc2_ && _loc2_)
                                    {
                                       break loop14;
                                    }
                                 }
                              }
                              §§push(§§pop() + §§pop());
                              if(_loc3_)
                              {
                                 break;
                              }
                              break loop13;
                           }
                        }
                     }
                     §§push(_loc1_);
                     break;
                  }
                  §§push(§§pop() * §§pop());
                  break;
               }
               §§pop().alternativa3d::imf = §§pop();
               §§push(this);
               §§push(this.mc);
               if(!_loc2_)
               {
                  loop15:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(this.me);
                        if(!_loc2_)
                        {
                           §§push(§§pop() * §§pop());
                           if(!_loc3_)
                           {
                              break;
                           }
                           §§push(this.ma);
                           if(_loc2_)
                           {
                              break loop15;
                           }
                           §§push(§§pop() * this.mg);
                           if(!(_loc3_ || _loc3_))
                           {
                              break loop15;
                           }
                        }
                        §§push(§§pop() - §§pop());
                        if(!_loc2_)
                        {
                           §§push(_loc1_);
                           break loop15;
                        }
                        break;
                     }
                  }
                  §§push(§§pop() * §§pop());
                  break loop16;
               }
               §§pop().alternativa3d::img = §§pop();
               loop17:
               while(true)
               {
                  loop18:
                  while(true)
                  {
                     loop19:
                     while(true)
                     {
                        loop35:
                        while(true)
                        {
                           loop36:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(this);
                                 §§push(this.mc);
                                 if(_loc3_ || _loc2_)
                                 {
                                    §§push(§§pop() * this.mh);
                                    if(!_loc3_)
                                    {
                                       break;
                                    }
                                    §§push(§§pop() * this.mi);
                                    §§push(this.md);
                                    §§push(this.mg);
                                    if(!(_loc2_ && _loc2_))
                                    {
                                       §§push(§§pop() * §§pop());
                                       §§push(this.mi);
                                       if(!_loc3_)
                                       {
                                          break loop36;
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(!(_loc3_ || Boolean(_loc1_)))
                                       {
                                          break loop35;
                                       }
                                       §§push(§§pop() - §§pop());
                                       §§push(this.md);
                                       if(!(_loc3_ || Boolean(_loc1_)))
                                       {
                                          break loop19;
                                       }
                                       §§push(§§pop() * this.me);
                                       if(!(_loc3_ || Boolean(_loc1_)))
                                       {
                                          break loop18;
                                       }
                                       §§push(this.mk);
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(!(_loc3_ || Boolean(_loc1_)))
                                    {
                                       break loop17;
                                    }
                                    §§push(§§pop() + §§pop());
                                 }
                                 §§push(this.ma * this.mh);
                                 if(_loc2_ && Boolean(_loc1_))
                                 {
                                    break loop19;
                                 }
                                 §§push(this.mk);
                                 if(_loc3_)
                                 {
                                    §§push(§§pop() * §§pop());
                                    if(_loc3_ || Boolean(_loc1_))
                                    {
                                       §§push(§§pop() - §§pop());
                                       §§push(this.mc);
                                       break loop17;
                                    }
                                    break loop19;
                                 }
                                 §§goto(addr045f);
                              }
                              §§goto(addr043b);
                           }
                           §§goto(addr0435);
                        }
                        §§goto(addr0467);
                     }
                     §§push(§§pop() + §§pop());
                     if(_loc3_)
                     {
                        §§push(_loc1_);
                        break loop35;
                     }
                     continue loop21;
                  }
                  addr043b:
                  while(true)
                  {
                     §§push(§§pop() - §§pop() * this.ml);
                     §§push(this.ma);
                     §§push(this.mg);
                     if(!(_loc2_ && _loc3_))
                     {
                        §§push(§§pop() * §§pop());
                        if(!(_loc3_ || _loc2_))
                        {
                           break;
                        }
                        §§push(this.ml);
                     }
                     addr045f:
                     §§push(§§pop() * §§pop());
                     break loop19;
                  }
                  §§pop().alternativa3d::imh = §§pop() * §§pop();
                  addr0467:
                  loop21:
                  while(true)
                  {
                     loop22:
                     while(true)
                     {
                        §§push(this);
                        §§push(this.mf);
                        if(!_loc2_)
                        {
                           while(true)
                           {
                              §§push(-§§pop());
                              if(!(_loc2_ && Boolean(this)))
                              {
                                 §§push(this.mi);
                                 if(_loc2_)
                                 {
                                    break;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(_loc2_ && Boolean(this))
                                 {
                                    break loop21;
                                 }
                              }
                              §§push(this.me);
                              if(!_loc2_)
                              {
                                 break;
                              }
                              break loop22;
                           }
                           §§push(§§pop() * this.mj);
                           if(_loc2_ && Boolean(_loc1_))
                           {
                              break;
                           }
                           §§push(§§pop() + §§pop());
                           if(_loc2_)
                           {
                              break loop21;
                           }
                        }
                        §§push(_loc1_);
                        break;
                     }
                     §§push(§§pop() * §§pop());
                     break;
                  }
                  §§pop().alternativa3d::imi = §§pop();
                  if(!(_loc2_ && Boolean(_loc1_)))
                  {
                     loop23:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(this);
                           §§push(this.mb);
                           if(_loc3_)
                           {
                              §§push(this.mi);
                              if(!(_loc3_ || _loc3_))
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(_loc3_)
                              {
                                 §§push(this.ma);
                                 if(_loc2_)
                                 {
                                    break;
                                 }
                                 §§push(§§pop() * this.mj);
                                 if(!_loc3_)
                                 {
                                    break;
                                 }
                                 §§push(§§pop() - §§pop());
                                 if(_loc2_ && Boolean(_loc1_))
                                 {
                                    break loop23;
                                 }
                              }
                           }
                           §§push(_loc1_);
                           break;
                        }
                        §§push(§§pop() * §§pop());
                        break;
                     }
                     §§pop().alternativa3d::imj = §§pop();
                     if(_loc3_ || Boolean(this))
                     {
                        loop25:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(this);
                              §§push(this.mb);
                              if(!(_loc2_ && Boolean(this)))
                              {
                                 §§push(-§§pop());
                                 if(_loc3_ || Boolean(this))
                                 {
                                    §§push(this.me);
                                    if(_loc2_ && _loc3_)
                                    {
                                       break;
                                    }
                                    §§push(§§pop() * §§pop());
                                    if(!_loc3_)
                                    {
                                       break loop25;
                                    }
                                 }
                              }
                              §§push(this.ma);
                              if(_loc2_ && _loc3_)
                              {
                                 break;
                              }
                              §§push(§§pop() * this.mf);
                              if(!(_loc3_ || Boolean(_loc1_)))
                              {
                                 break;
                              }
                              §§push(§§pop() + §§pop());
                              if(_loc3_ || _loc2_)
                              {
                                 break loop25;
                              }
                              §§pop().alternativa3d::imk = §§pop();
                              loop27:
                              while(true)
                              {
                                 loop28:
                                 while(true)
                                 {
                                    loop29:
                                    while(true)
                                    {
                                       loop32:
                                       while(true)
                                       {
                                          §§push(this);
                                          §§push(this.md * this.mf);
                                          if(_loc3_)
                                          {
                                             while(true)
                                             {
                                                §§push(this.mi);
                                                if(_loc3_ || Boolean(_loc1_))
                                                {
                                                   §§push(§§pop() * §§pop());
                                                   if(!(_loc3_ || Boolean(this)))
                                                   {
                                                      break;
                                                   }
                                                   §§push(this.mb * this.mh);
                                                   §§push(this.mi);
                                                   if(_loc2_ && _loc3_)
                                                   {
                                                      break loop32;
                                                   }
                                                   §§push(§§pop() * §§pop());
                                                   if(_loc2_ && Boolean(_loc1_))
                                                   {
                                                      break loop29;
                                                   }
                                                   §§push(§§pop() - §§pop());
                                                   §§push(this.md * this.me);
                                                   if(!(_loc3_ || _loc2_))
                                                   {
                                                      break loop28;
                                                   }
                                                }
                                                §§push(this.mj);
                                                if(!(_loc2_ && _loc3_))
                                                {
                                                   §§push(§§pop() - §§pop() * §§pop());
                                                   break;
                                                }
                                                break loop27;
                                             }
                                          }
                                          §§push(this.ma);
                                          break loop28;
                                       }
                                       §§goto(addr05fb);
                                    }
                                    §§push(this.ml);
                                    break loop27;
                                 }
                                 addr05fb:
                                 §§push(§§pop() * this.mh);
                                 if(_loc3_)
                                 {
                                    loop30:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(§§pop() + §§pop() * this.mj);
                                          §§push(this.mb);
                                          if(_loc3_ || _loc3_)
                                          {
                                             §§push(this.me);
                                             if(!(_loc3_ || _loc2_))
                                             {
                                                break;
                                             }
                                             §§push(§§pop() * §§pop());
                                             if(_loc2_)
                                             {
                                                break loop30;
                                             }
                                          }
                                          §§push(this.ml);
                                          break;
                                       }
                                       §§push(§§pop() + §§pop() * §§pop());
                                       §§push(this.ma);
                                       if(_loc3_)
                                       {
                                          §§push(this.mf);
                                          if(!_loc2_)
                                          {
                                             §§push(§§pop() * §§pop());
                                             break loop29;
                                          }
                                          break loop27;
                                       }
                                       §§goto(addr0650);
                                    }
                                 }
                                 break loop30;
                              }
                              §§pop().alternativa3d::iml = (§§pop() - §§pop() * §§pop()) * _loc1_;
                              addr0650:
                           }
                           §§push(§§pop() * §§pop());
                           continue loop29;
                        }
                        §§push(_loc1_);
                        break loop26;
                     }
                  }
               }
               addr0435:
               §§push(§§pop() * this.me);
               break loop18;
            }
            return;
         }
         addr00e4:
         addr00c5:
         §§push(§§pop() * this.me);
         if(!_loc2_)
         {
            §§push(§§pop() * this.mk);
            if(!(_loc2_ && Boolean(_loc1_)))
            {
               addr00e0:
               §§push(§§pop() - §§pop());
               §§push(this.ma * this.mf);
            }
         }
         §§push(this.mk);
         break loop1;
      }
      
      alternativa3d function cullingInCamera(param1:Camera3D, param2:int) : int
      {
         §§push(false);
         var _loc14_:Boolean = true;
         var _loc15_:* = §§pop();
         var _loc4_:Vertex = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:* = false;
         var _loc9_:* = false;
         var _loc10_:* = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:* = 0;
         var _loc13_:Vertex = null;
         while(true)
         {
            if(_loc14_)
            {
               if(param1.occludedAll)
               {
                  if(!(_loc15_ && Boolean(this)))
                  {
                     addr0050:
                     §§push(-1);
                     if(_loc14_)
                     {
                        return §§pop();
                     }
                     break;
                  }
               }
               §§push(param1.numOccluders);
               if(_loc14_ || Boolean(this))
               {
                  §§push(int(§§pop()));
               }
               break;
            }
            §§goto(addr0050);
         }
         var _loc3_:* = §§pop();
         loop11:
         while(true)
         {
            if(_loc14_ || Boolean(_loc3_))
            {
               loop12:
               while(true)
               {
                  loop13:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(param2);
                        if(!_loc15_)
                        {
                           §§push(0);
                           if(!(_loc14_ || Boolean(this)))
                           {
                              break;
                           }
                           §§push(§§pop() > §§pop());
                           if(!(_loc15_ && Boolean(param2)))
                           {
                              §§push(Boolean(§§pop()));
                              if(_loc15_ && Boolean(this))
                              {
                                 break loop13;
                              }
                              var _temp_7:* = §§pop();
                              §§push(_temp_7);
                              §§push(_temp_7);
                              if(!(_loc15_ && Boolean(param2)))
                              {
                                 §§push(Boolean(§§pop()));
                              }
                              if(§§pop())
                              {
                                 break loop13;
                              }
                              if(!_loc14_)
                              {
                                 break loop13;
                              }
                           }
                           §§pop();
                           if(_loc15_)
                           {
                              break loop12;
                           }
                           §§push(_loc3_);
                        }
                        §§push(0);
                        break;
                     }
                     §§push(§§pop() > §§pop());
                     if(_loc14_)
                     {
                        §§push(Boolean(§§pop()));
                     }
                     break;
                  }
                  if(§§pop())
                  {
                     break;
                  }
                  break loop11;
               }
            }
            break loop12;
         }
         loop15:
         while(true)
         {
            loop16:
            while(true)
            {
               while(true)
               {
                  if(param2 > 0)
                  {
                     if(!_loc14_)
                     {
                        break loop16;
                     }
                     loop24:
                     while(true)
                     {
                        loop25:
                        while(true)
                        {
                           loop48:
                           while(true)
                           {
                              loop49:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(param2);
                                    if(_loc14_)
                                    {
                                       §§push(Boolean(§§pop() & 1));
                                       if(_loc14_)
                                       {
                                          if(§§pop())
                                          {
                                             if(!_loc14_)
                                             {
                                                break loop49;
                                             }
                                             §§push(param1.nearClipping);
                                             if(!_loc15_)
                                             {
                                                §§push(Number(§§pop()));
                                                if(_loc15_ && Boolean(this))
                                                {
                                                   break loop48;
                                                }
                                             }
                                             _loc10_ = §§pop();
                                             if(!(_loc14_ || Boolean(param2)))
                                             {
                                                break loop25;
                                             }
                                             §§push(boundVertexList);
                                             if(_loc15_ && Boolean(param1))
                                             {
                                                break loop24;
                                             }
                                             _loc4_ = §§pop();
                                             loop57:
                                             while(true)
                                             {
                                                if(_loc14_)
                                                {
                                                   §§push(false);
                                                   if(_loc15_)
                                                   {
                                                      break;
                                                   }
                                                   _loc8_ = Boolean(§§pop());
                                                }
                                                addr0549:
                                                _loc9_ = false;
                                                loop1:
                                                while(true)
                                                {
                                                   loop58:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            if(_loc4_ == null)
                                                            {
                                                               if(_loc14_)
                                                               {
                                                                  addr05c7:
                                                                  addr05c9:
                                                                  if(_loc9_)
                                                                  {
                                                                     if(!(_loc14_ || Boolean(param2)))
                                                                     {
                                                                        break;
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     §§push(param2);
                                                                     if(!(_loc15_ && Boolean(this)))
                                                                     {
                                                                        §§push(§§pop() & 0x3E);
                                                                        if(!_loc15_)
                                                                        {
                                                                           §§push(int(§§pop()));
                                                                        }
                                                                     }
                                                                     §§goto(addr061c);
                                                                  }
                                                               }
                                                               §§push(_loc8_);
                                                               if(!_loc14_)
                                                               {
                                                                  break loop58;
                                                               }
                                                            }
                                                            else
                                                            {
                                                               if(_loc4_.cameraZ > _loc10_)
                                                               {
                                                                  §§push(true);
                                                                  break loop57;
                                                               }
                                                               §§push(true);
                                                               if(!(_loc15_ && Boolean(_loc3_)))
                                                               {
                                                                  _loc9_ = Boolean(§§pop());
                                                                  §§push(_loc8_);
                                                                  if(_loc14_)
                                                                  {
                                                                     if(!§§pop())
                                                                     {
                                                                        continue loop1;
                                                                     }
                                                                     if(_loc15_ && Boolean(this))
                                                                     {
                                                                     }
                                                                     §§goto(addr05c7);
                                                                  }
                                                                  §§goto(addr05c9);
                                                               }
                                                            }
                                                            addr05e3:
                                                            §§push(!§§pop());
                                                            break loop58;
                                                         }
                                                         §§goto(addr05ff);
                                                      }
                                                   }
                                                   _loc4_ = _loc4_.next;
                                                   if(§§pop())
                                                   {
                                                      if(!(_loc15_ && Boolean(param1)))
                                                      {
                                                         §§push(-1);
                                                         if(_loc14_)
                                                         {
                                                            return §§pop();
                                                         }
                                                         addr061c:
                                                         param2 = §§pop();
                                                      }
                                                      break loop59;
                                                   }
                                                   addr05ff:
                                                   addr05ff:
                                                   break loop59;
                                                }
                                                §§goto(addr0549);
                                             }
                                             _loc8_ = §§pop();
                                             if(!(_loc14_ || Boolean(param2)))
                                             {
                                                break loop59;
                                             }
                                             while(true)
                                             {
                                                §§push(_loc9_);
                                                if(_loc14_)
                                                {
                                                   if(!§§pop())
                                                   {
                                                      continue loop1;
                                                   }
                                                   §§goto(addr05c7);
                                                }
                                                §§goto(addr05e3);
                                             }
                                             §§goto(addr05ff);
                                          }
                                          break loop59;
                                       }
                                       break;
                                    }
                                    §§push(Boolean(§§pop()));
                                    if(_loc15_)
                                    {
                                       break;
                                    }
                                    if(!§§pop())
                                    {
                                       break loop54;
                                    }
                                    if(!(_loc15_ && Boolean(this)))
                                    {
                                       §§push(param1.farClipping);
                                       if(!(_loc15_ && Boolean(_loc3_)))
                                       {
                                          break loop48;
                                       }
                                       §§goto(addr065d);
                                    }
                                    §§goto(addr065f);
                                 }
                                 §§goto(addr0a6b);
                              }
                              §§push(boundVertexList);
                              if(_loc14_ || Boolean(param1))
                              {
                                 break loop24;
                              }
                              §§goto(addr0892);
                           }
                           addr065d:
                           _loc11_ = §§pop();
                           addr065f:
                           §§push(boundVertexList);
                           if(_loc15_)
                           {
                              break loop32;
                           }
                           _loc4_ = §§pop();
                           loop50:
                           while(true)
                           {
                              loop51:
                              while(true)
                              {
                                 if(_loc14_)
                                 {
                                    §§push(false);
                                    if(!(_loc14_ || Boolean(_loc3_)))
                                    {
                                       break;
                                    }
                                    _loc8_ = §§pop();
                                    if(!_loc14_)
                                    {
                                       break loop50;
                                    }
                                 }
                                 §§push(false);
                                 if(!_loc15_)
                                 {
                                    _loc9_ = §§pop();
                                    loop2:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          if(_loc4_ != null)
                                          {
                                             if(_loc4_.cameraZ >= _loc11_)
                                             {
                                                §§push(true);
                                                break loop51;
                                             }
                                             if(!(_loc15_ && Boolean(param1)))
                                             {
                                                §§push(true);
                                                if(!_loc14_)
                                                {
                                                   break;
                                                }
                                                _loc8_ = §§pop();
                                                if(_loc14_ || Boolean(_loc3_))
                                                {
                                                   if(!_loc9_)
                                                   {
                                                      continue loop2;
                                                   }
                                                }
                                             }
                                          }
                                          §§goto(addr0703);
                                       }
                                       _loc4_ = _loc4_.next;
                                       §§goto(addr070b);
                                    }
                                    break loop50;
                                 }
                                 break;
                              }
                              _loc9_ = §§pop();
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(_loc8_);
                                    if(_loc14_ || Boolean(this))
                                    {
                                       if(§§pop())
                                       {
                                          break loop50;
                                       }
                                       continue loop2;
                                    }
                                    §§goto(addr070c);
                                 }
                                 §§goto(addr0732);
                              }
                              §§goto(addr073d);
                           }
                           addr0703:
                           while(true)
                           {
                              if(_loc9_)
                              {
                                 addr070b:
                                 addr070c:
                                 if(!_loc8_)
                                 {
                                    §§push(-1);
                                    if(_loc14_ || Boolean(param1))
                                    {
                                       return §§pop();
                                    }
                                    addr0732:
                                    addr0732:
                                    §§push(§§pop() & 0x3D);
                                    if(_loc15_)
                                    {
                                       break;
                                    }
                                 }
                                 else
                                 {
                                    addr073d:
                                    §§push(param2);
                                    §§push(4);
                                    if(_loc14_ || Boolean(param1))
                                    {
                                       §§push(Boolean(§§pop() & §§pop()));
                                       if(_loc14_ || Boolean(param2))
                                       {
                                          if(§§pop())
                                          {
                                             break loop49;
                                          }
                                          continue loop32;
                                       }
                                       §§goto(addr0876);
                                    }
                                    §§goto(addr0a69);
                                 }
                              }
                              else
                              {
                                 §§push(param2);
                                 if(!_loc15_)
                                 {
                                    §§goto(addr0732);
                                 }
                              }
                              §§push(int(§§pop()));
                              break;
                           }
                           param2 = §§pop();
                           §§goto(addr073d);
                        }
                        §§push(boundVertexList);
                        break loop32;
                     }
                     _loc4_ = §§pop();
                     _loc8_ = false;
                     loop26:
                     while(true)
                     {
                        while(true)
                        {
                           if(_loc14_ || Boolean(param2))
                           {
                              §§push(false);
                              if(_loc14_)
                              {
                                 _loc9_ = Boolean(§§pop());
                                 if(!_loc15_)
                                 {
                                    break loop3;
                                 }
                                 break loop26;
                              }
                              break;
                           }
                           break loop3;
                        }
                        §§push(Boolean(§§pop()));
                        if(_loc14_)
                        {
                           _loc8_ = §§pop();
                           break;
                        }
                        §§goto(addr0825);
                     }
                     if(!_loc9_)
                     {
                        _loc4_ = _loc4_.next;
                        loop3:
                        while(true)
                        {
                           loop28:
                           while(true)
                           {
                              while(true)
                              {
                                 while(true)
                                 {
                                    if(_loc4_ == null)
                                    {
                                       if(_loc15_)
                                       {
                                          continue loop32;
                                       }
                                       addr080f:
                                       if(_loc9_)
                                       {
                                          §§push(_loc8_);
                                          if(!(_loc14_ || Boolean(param1)))
                                          {
                                             break loop28;
                                          }
                                       }
                                       else
                                       {
                                          while(true)
                                          {
                                             §§push(param2);
                                             if(_loc14_)
                                             {
                                                §§push(§§pop() & 0x3B);
                                                if(_loc15_)
                                                {
                                                   break;
                                                }
                                             }
                                             §§push(int(§§pop()));
                                             break;
                                          }
                                          §§goto(addr0856);
                                       }
                                    }
                                    else
                                    {
                                       §§push(_loc4_.cameraX);
                                       if(_loc14_)
                                       {
                                          §§push(-§§pop());
                                       }
                                       if(§§pop() < _loc4_.cameraZ)
                                       {
                                          §§push(true);
                                          break loop27;
                                       }
                                       _loc9_ = true;
                                       §§push(_loc8_);
                                       if(!(_loc15_ && Boolean(_loc3_)))
                                       {
                                          if(!§§pop())
                                          {
                                             continue loop3;
                                          }
                                          if(!_loc14_)
                                          {
                                             break;
                                          }
                                          §§goto(addr080f);
                                       }
                                    }
                                    addr0825:
                                    §§push(!§§pop());
                                    break loop28;
                                 }
                                 §§goto(addr082a);
                              }
                              loop31:
                              while(true)
                              {
                                 loop32:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(param2);
                                       §§push(8);
                                       if(_loc14_)
                                       {
                                          §§push(§§pop() & §§pop());
                                          if(_loc14_ || Boolean(this))
                                          {
                                             §§push(Boolean(§§pop()));
                                             if(!_loc15_)
                                             {
                                                addr0876:
                                                if(§§pop())
                                                {
                                                   if(_loc15_ && Boolean(param2))
                                                   {
                                                      break loop15;
                                                   }
                                                   §§push(boundVertexList);
                                                   if(_loc15_)
                                                   {
                                                      break loop32;
                                                   }
                                                   _loc4_ = §§pop();
                                                   loop42:
                                                   while(true)
                                                   {
                                                      §§push(false);
                                                      if(!(_loc15_ && Boolean(this)))
                                                      {
                                                         _loc8_ = §§pop();
                                                         loop43:
                                                         while(true)
                                                         {
                                                            if(_loc14_ || Boolean(param2))
                                                            {
                                                               _loc9_ = false;
                                                               while(true)
                                                               {
                                                                  if(_loc4_ == null)
                                                                  {
                                                                     break loop43;
                                                                  }
                                                                  if(_loc4_.cameraX < _loc4_.cameraZ)
                                                                  {
                                                                     §§push(true);
                                                                     if(!(_loc14_ || Boolean(param2)))
                                                                     {
                                                                        break loop42;
                                                                     }
                                                                     §§push(Boolean(§§pop()));
                                                                     if(_loc14_ || Boolean(param1))
                                                                     {
                                                                        _loc8_ = §§pop();
                                                                        if(_loc9_)
                                                                        {
                                                                           break loop43;
                                                                        }
                                                                        continue;
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     §§push(true);
                                                                  }
                                                                  _loc9_ = §§pop();
                                                                  §§push(_loc8_);
                                                                  if(!_loc14_)
                                                                  {
                                                                     break loop42;
                                                                  }
                                                                  if(!§§pop())
                                                                  {
                                                                     continue;
                                                                  }
                                                                  _loc4_ = _loc4_.next;
                                                               }
                                                            }
                                                            break;
                                                         }
                                                      }
                                                      if(§§pop())
                                                      {
                                                         §§push(!_loc8_);
                                                         break;
                                                      }
                                                      addr0957:
                                                      §§push(param2);
                                                      if(_loc14_ || Boolean(_loc3_))
                                                      {
                                                         §§push(§§pop() & 0x37);
                                                         if(!(_loc15_ && Boolean(param1)))
                                                         {
                                                            §§push(int(§§pop()));
                                                         }
                                                      }
                                                      param2 = §§pop();
                                                   }
                                                   if(§§pop())
                                                   {
                                                      §§push(-1);
                                                      if(_loc14_)
                                                      {
                                                         return §§pop();
                                                      }
                                                      §§goto(addr0957);
                                                   }
                                                }
                                                §§push(param2 & 0x10);
                                                if(!_loc15_)
                                                {
                                                   §§push(Boolean(§§pop()));
                                                   if(!(_loc15_ && Boolean(param2)))
                                                   {
                                                      if(§§pop())
                                                      {
                                                         §§push(boundVertexList);
                                                         if(_loc15_ && Boolean(_loc3_))
                                                         {
                                                            break loop32;
                                                         }
                                                         _loc4_ = §§pop();
                                                         _loc8_ = false;
                                                         loop44:
                                                         while(true)
                                                         {
                                                            loop45:
                                                            while(true)
                                                            {
                                                               loop46:
                                                               while(true)
                                                               {
                                                                  if(_loc14_)
                                                                  {
                                                                     _loc9_ = false;
                                                                     while(true)
                                                                     {
                                                                        if(_loc4_ == null)
                                                                        {
                                                                           break loop46;
                                                                        }
                                                                        §§push(_loc4_.cameraY);
                                                                        if(_loc14_ || Boolean(this))
                                                                        {
                                                                           §§push(-§§pop());
                                                                        }
                                                                        if(§§pop() < _loc4_.cameraZ)
                                                                        {
                                                                           if(_loc15_ && Boolean(this))
                                                                           {
                                                                              break loop45;
                                                                           }
                                                                           §§push(true);
                                                                           if(!_loc14_)
                                                                           {
                                                                              break loop44;
                                                                           }
                                                                           _loc8_ = Boolean(§§pop());
                                                                        }
                                                                        else
                                                                        {
                                                                           §§push(true);
                                                                           if(!_loc15_)
                                                                           {
                                                                              _loc9_ = §§pop();
                                                                              if(_loc15_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              if(_loc8_)
                                                                              {
                                                                                 break;
                                                                              }
                                                                              continue;
                                                                           }
                                                                           §§goto(addr0a1e);
                                                                        }
                                                                        _loc4_ = _loc4_.next;
                                                                     }
                                                                     break;
                                                                     addr0a01:
                                                                  }
                                                                  if(!_loc9_)
                                                                  {
                                                                     _loc4_ = _loc4_.next;
                                                                     §§goto(addr0a01);
                                                                  }
                                                                  break;
                                                               }
                                                               §§push(_loc9_);
                                                               break loop44;
                                                            }
                                                         }
                                                         if(§§pop())
                                                         {
                                                            if(!(_loc15_ && Boolean(param1)))
                                                            {
                                                               addr0a1e:
                                                               if(!_loc8_)
                                                               {
                                                                  if(_loc14_ || Boolean(param1))
                                                                  {
                                                                     §§push(-1);
                                                                     if(_loc14_)
                                                                     {
                                                                        return §§pop();
                                                                     }
                                                                     addr0a57:
                                                                     param2 = §§pop();
                                                                     break loop45;
                                                                  }
                                                               }
                                                            }
                                                            break loop45;
                                                         }
                                                         §§push(param2);
                                                         if(!_loc15_)
                                                         {
                                                            §§push(§§pop() & 0x2F);
                                                            if(_loc14_ || Boolean(param2))
                                                            {
                                                               §§push(int(§§pop()));
                                                            }
                                                         }
                                                         §§goto(addr0a57);
                                                      }
                                                      break loop45;
                                                   }
                                                   break;
                                                }
                                                break loop31;
                                             }
                                             break;
                                          }
                                          break loop31;
                                       }
                                       addr0a69:
                                       §§push(§§pop() & §§pop());
                                       break loop31;
                                    }
                                    §§goto(addr0a6b);
                                 }
                                 _loc4_ = §§pop();
                                 loop35:
                                 while(true)
                                 {
                                    loop36:
                                    while(true)
                                    {
                                       loop38:
                                       while(true)
                                       {
                                          loop40:
                                          while(true)
                                          {
                                             if(!(_loc15_ && Boolean(_loc3_)))
                                             {
                                                §§push(false);
                                                if(!_loc15_)
                                                {
                                                   _loc8_ = §§pop();
                                                   if(_loc14_ || Boolean(param2))
                                                   {
                                                      §§push(false);
                                                      if(_loc14_)
                                                      {
                                                         _loc9_ = Boolean(§§pop());
                                                         if(_loc14_)
                                                         {
                                                            loop6:
                                                            while(true)
                                                            {
                                                               if(_loc4_ == null)
                                                               {
                                                                  break loop36;
                                                               }
                                                               while(true)
                                                               {
                                                                  if(_loc4_.cameraY < _loc4_.cameraZ)
                                                                  {
                                                                     §§push(true);
                                                                     if(!(_loc14_ || Boolean(_loc3_)))
                                                                     {
                                                                        break;
                                                                     }
                                                                     _loc8_ = §§pop();
                                                                     §§push(_loc9_);
                                                                     if(_loc14_)
                                                                     {
                                                                        if(!§§pop())
                                                                        {
                                                                           continue loop6;
                                                                        }
                                                                        §§goto(addr0b15);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     §§push(true);
                                                                  }
                                                                  §§push(Boolean(§§pop()));
                                                                  if(!(_loc15_ && Boolean(_loc3_)))
                                                                  {
                                                                     _loc9_ = §§pop();
                                                                     addr0af6:
                                                                     §§push(_loc8_);
                                                                     break;
                                                                  }
                                                                  break loop35;
                                                               }
                                                               if(§§pop())
                                                               {
                                                                  break loop40;
                                                               }
                                                               _loc4_ = _loc4_.next;
                                                            }
                                                            break loop36;
                                                         }
                                                         break loop38;
                                                      }
                                                      break loop35;
                                                   }
                                                   break;
                                                }
                                                §§goto(addr0ace);
                                             }
                                             §§goto(addr0af6);
                                          }
                                          §§goto(addr0b15);
                                       }
                                       §§goto(addr0b81);
                                    }
                                    while(true)
                                    {
                                       if(!_loc15_)
                                       {
                                          addr0b15:
                                          if(_loc9_)
                                          {
                                             if(!_loc14_)
                                             {
                                                break;
                                             }
                                          }
                                          else
                                          {
                                             §§push(param2);
                                             if(!(_loc15_ && Boolean(_loc3_)))
                                             {
                                                §§push(§§pop() & 0x1F);
                                                if(_loc14_)
                                                {
                                                   §§push(int(§§pop()));
                                                }
                                             }
                                             §§goto(addr0b80);
                                          }
                                       }
                                       §§push(_loc8_);
                                       if(!(_loc15_ && Boolean(param1)))
                                       {
                                          §§push(!§§pop());
                                       }
                                       break loop35;
                                    }
                                    §§goto(addr0b44);
                                 }
                                 while(true)
                                 {
                                    if(§§pop())
                                    {
                                       if(!(_loc15_ && Boolean(this)))
                                       {
                                          addr0b44:
                                          §§push(-1);
                                          if(_loc14_ || Boolean(_loc3_))
                                          {
                                             return §§pop();
                                          }
                                          addr0b80:
                                          param2 = §§pop();
                                          break;
                                       }
                                    }
                                    break;
                                 }
                                 §§goto(addr0b81);
                              }
                              addr0a6b:
                              if(Boolean(§§pop()))
                              {
                                 break loop25;
                              }
                              addr0b81:
                              while(true)
                              {
                                 if(_loc3_ > 0)
                                 {
                                    break loop15;
                                 }
                                 §§goto(addr0ce8);
                              }
                              §§goto(addr0ced);
                           }
                           _loc4_ = _loc4_.next;
                           if(§§pop())
                           {
                              addr082a:
                              §§push(-1);
                              if(_loc14_ || Boolean(this))
                              {
                                 return §§pop();
                              }
                              addr0856:
                              param2 = §§pop();
                           }
                           break loop29;
                        }
                        continue loop28;
                     }
                     if(_loc15_ && Boolean(param2))
                     {
                        continue loop32;
                     }
                     §§goto(addr080f);
                  }
                  break loop38;
               }
               §§goto(addr0b99);
            }
            §§goto(addr0ced);
         }
         §§push(0);
         if(_loc14_ || Boolean(_loc3_))
         {
            addr0b99:
            _loc12_ = int(§§pop());
            while(true)
            {
               §§push(_loc12_);
               if(_loc15_)
               {
                  break;
               }
               if(§§pop() >= _loc3_)
               {
                  if(!(_loc15_ && Boolean(this)))
                  {
                     addr0ce8:
                     this.culling = param2;
                  }
                  break loop16;
               }
               _loc13_ = param1.occluders[_loc12_];
               loop17:
               while(true)
               {
                  loop18:
                  while(true)
                  {
                     if(_loc14_)
                     {
                        loop8:
                        while(_loc13_ != null)
                        {
                           _loc4_ = boundVertexList;
                           while(true)
                           {
                              if(_loc4_ == null)
                              {
                                 if(!_loc14_)
                                 {
                                    break loop17;
                                 }
                              }
                              else
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
                                          §§push(_loc13_.cameraX);
                                          if(!(_loc15_ && Boolean(_loc3_)))
                                          {
                                             while(true)
                                             {
                                                §§push(_loc4_.cameraX);
                                                if(!_loc15_)
                                                {
                                                   §§push(§§pop() * §§pop());
                                                   if(_loc15_)
                                                   {
                                                      break;
                                                   }
                                                   §§push(_loc13_.cameraY);
                                                   if(_loc14_ || Boolean(param2))
                                                   {
                                                      §§push(_loc4_.cameraY);
                                                      if(!(_loc14_ || Boolean(this)))
                                                      {
                                                         break loop21;
                                                      }
                                                      §§push(§§pop() * §§pop());
                                                      if(!(_loc14_ || Boolean(_loc3_)))
                                                      {
                                                         break loop20;
                                                      }
                                                   }
                                                }
                                                §§push(§§pop() + §§pop());
                                                if(!(_loc15_ && Boolean(param2)))
                                                {
                                                   break;
                                                }
                                                break loop19;
                                             }
                                          }
                                          §§push(_loc13_.cameraZ);
                                          if(_loc14_)
                                          {
                                             §§push(_loc4_.cameraZ);
                                             break;
                                          }
                                          break loop20;
                                       }
                                       §§push(§§pop() * §§pop());
                                       break;
                                    }
                                    §§push(§§pop() + §§pop());
                                    break;
                                 }
                                 if(§§pop() < 0)
                                 {
                                    §§push(_loc4_.next);
                                    if(_loc15_ && Boolean(param2))
                                    {
                                       break;
                                    }
                                    _loc4_ = §§pop();
                                    continue;
                                 }
                                 if(!_loc14_)
                                 {
                                    break loop18;
                                 }
                              }
                              if(_loc4_ != null)
                              {
                                 if(_loc14_ || Boolean(_loc3_))
                                 {
                                    break loop8;
                                 }
                                 break loop17;
                              }
                              §§push(_loc13_.next);
                              break;
                           }
                           _loc13_ = §§pop();
                        }
                     }
                     if(_loc13_ == null)
                     {
                        break;
                     }
                     break loop17;
                  }
                  §§push(-1);
                  if(_loc14_)
                  {
                     return §§pop();
                  }
                  §§goto(addr0cc0);
               }
               §§push(_loc12_);
               if(_loc14_)
               {
                  §§push(§§pop() + 1);
                  if(_loc15_)
                  {
                     continue;
                  }
               }
               addr0cc0:
               §§push(int(§§pop()));
               _loc12_ = §§pop();
            }
         }
         addr0ced:
         return §§pop();
      }
      
      alternativa3d function removeFromParent() : void
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(_loc1_ || Boolean(this))
         {
            while(true)
            {
               §§push(this._parent);
               if(_loc1_)
               {
                  if(§§pop() == null)
                  {
                     break;
                  }
                  if(!(_loc1_ || Boolean(this)))
                  {
                     break;
                  }
                  §§push(this._parent);
               }
               §§pop().removeChild(this);
               break;
            }
         }
      }
   }
}

§§push(false);
true;
§§pop();
if(!_loc2_)
{
   Object3D = §§newclass(Object3D,Object);
}

