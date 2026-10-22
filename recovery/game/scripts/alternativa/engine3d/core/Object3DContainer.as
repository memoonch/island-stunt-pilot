package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.geom.ColorTransform;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class Object3DContainer extends Object3D
   {
      
      public var mouseChildren:Boolean = true;
      
      alternativa3d var childrenList:Object3D;
      
      alternativa3d var visibleChildren:Vector.<Object3D>;
      
      alternativa3d var numVisibleChildren:int = 0;
      
      public function Object3DContainer()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         while(true)
         {
            if(_loc1_)
            {
               this.visibleChildren = new Vector.<Object3D>();
               if(!_loc1_)
               {
                  break;
               }
            }
            super();
            break;
         }
      }
      
      public function addChild(param1:Object3D) : Object3D
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         if(_loc4_)
         {
            if(param1 != null)
            {
               if(param1 == this)
               {
                  throw new ArgumentError("An object cannot be added as a child of itself.");
               }
               var _loc2_:Object3DContainer = _parent;
               while(_loc2_ != null)
               {
                  if(_loc2_ == param1)
                  {
                     throw new ArgumentError("An object cannot be added as a child to one of it\'s children (or children\'s children, etc.).");
                  }
                  _loc2_ = _loc2_._parent;
               }
               if(param1._parent != null)
               {
                  param1._parent.removeChild(param1);
               }
               this.addToList(param1);
               return param1;
            }
         }
         throw new TypeError("Parameter child must be non-null.");
      }
      
      public function removeChild(param1:Object3D) : Object3D
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         var _loc2_:Object3D = null;
         var _loc3_:Object3D = null;
         if(!(_loc5_ && Boolean(_loc2_)))
         {
            if(param1 != null)
            {
               if(param1._parent != this)
               {
                  throw new ArgumentError("The supplied Object3D must be a child of the caller.");
               }
               _loc3_ = this.childrenList;
               while(_loc3_ != null)
               {
                  if(_loc3_ == param1)
                  {
                     if(!(_loc5_ && Boolean(_loc2_)))
                     {
                        if(_loc2_ != null)
                        {
                           if(!_loc5_)
                           {
                              _loc2_.next = _loc3_.next;
                           }
                        }
                        else
                        {
                           this.childrenList = _loc3_.next;
                        }
                        _loc3_.next = null;
                     }
                     _loc3_._parent = null;
                     if(!_loc5_)
                     {
                        return param1;
                     }
                  }
                  _loc2_ = _loc3_;
                  _loc3_ = _loc3_.next;
               }
               throw new ArgumentError("Cannot remove child.");
            }
         }
         throw new TypeError("Parameter child must be non-null.");
      }
      
      public function addChildAt(param1:Object3D, param2:int) : Object3D
      {
         §§push(false);
         var _loc6_:Boolean = true;
         var _loc7_:* = §§pop();
         if(_loc6_ || Boolean(_loc3_))
         {
            if(param1 != null)
            {
               if(param1 == this)
               {
                  throw new ArgumentError("An object cannot be added as a child of itself.");
               }
               if(param2 < 0)
               {
                  throw new RangeError("The supplied index is out of bounds.");
               }
               var _loc3_:Object3DContainer = _parent;
               while(_loc3_ != null)
               {
                  if(_loc3_ == param1)
                  {
                     throw new ArgumentError("An object cannot be added as a child to one of it\'s children (or children\'s children, etc.).");
                  }
                  _loc3_ = _loc3_._parent;
               }
               var _loc4_:Object3D = this.childrenList;
               var _loc5_:int = 0;
               while(_loc5_ < param2)
               {
                  if(_loc4_ == null)
                  {
                     throw new RangeError("The supplied index is out of bounds.");
                  }
                  _loc4_ = _loc4_.next;
                  _loc5_++;
               }
               if(param1._parent != null)
               {
                  param1._parent.removeChild(param1);
               }
               this.addToList(param1,_loc4_);
               return param1;
            }
         }
         throw new TypeError("Parameter child must be non-null.");
      }
      
      public function removeChildAt(param1:int) : Object3D
      {
         var _temp_1:* = true;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = _temp_1;
         if(!(_loc4_ && Boolean(this)))
         {
            if(param1 >= 0)
            {
               var _loc2_:Object3D = this.childrenList;
               var _loc3_:int = 0;
               while(_loc3_ < param1)
               {
                  if(_loc2_ == null)
                  {
                     throw new RangeError("The supplied index is out of bounds.");
                  }
                  _loc2_ = _loc2_.next;
                  _loc3_++;
               }
               if(_loc2_ == null)
               {
                  throw new RangeError("The supplied index is out of bounds.");
               }
               this.removeChild(_loc2_);
               return _loc2_;
            }
         }
         throw new RangeError("The supplied index is out of bounds.");
      }
      
      public function getChildAt(param1:int) : Object3D
      {
         var _temp_1:* = true;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = _temp_1;
         if(_loc5_)
         {
            if(param1 >= 0)
            {
               var _loc2_:Object3D = this.childrenList;
               var _loc3_:int = 0;
               while(_loc3_ < param1)
               {
                  if(_loc2_ == null)
                  {
                     throw new RangeError("The supplied index is out of bounds.");
                  }
                  _loc2_ = _loc2_.next;
                  _loc3_++;
               }
               if(_loc2_ == null)
               {
                  throw new RangeError("The supplied index is out of bounds.");
               }
               return _loc2_;
            }
         }
         throw new RangeError("The supplied index is out of bounds.");
      }
      
      public function getChildIndex(param1:Object3D) : int
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         if(_loc4_ || Boolean(param1))
         {
            if(param1 != null)
            {
               if(param1._parent != this)
               {
                  throw new ArgumentError("The supplied Object3D must be a child of the caller.");
               }
               var _loc2_:* = 0;
               var _loc3_:Object3D = this.childrenList;
               for(; _loc3_ != null; _loc3_ = _loc3_.next)
               {
                  if(_loc3_ == param1)
                  {
                     if(_loc5_)
                     {
                        continue;
                     }
                     §§push(_loc2_);
                     if(_loc4_ || Boolean(this))
                     {
                        return §§pop();
                     }
                     addr0088:
                     §§push(§§pop() + 1);
                     if(_loc4_ || Boolean(_loc3_))
                     {
                        §§push(int(§§pop()));
                     }
                  }
                  else
                  {
                     §§push(_loc2_);
                     if(!_loc5_)
                     {
                        §§goto(addr0088);
                     }
                  }
                  _loc2_ = §§pop();
               }
               throw new ArgumentError("Cannot get child index.");
            }
         }
         throw new TypeError("Parameter child must be non-null.");
      }
      
      public function setChildIndex(param1:Object3D, param2:int) : void
      {
         var _temp_1:* = true;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = _temp_1;
         if(!_loc5_)
         {
            if(param1 != null)
            {
               if(param1._parent != this)
               {
                  throw new ArgumentError("The supplied Object3D must be a child of the caller.");
               }
               if(param2 < 0)
               {
                  throw new RangeError("The supplied index is out of bounds.");
               }
               var _loc3_:Object3D = this.childrenList;
               var _loc4_:int = 0;
               while(_loc4_ < param2)
               {
                  if(_loc3_ == null)
                  {
                     throw new RangeError("The supplied index is out of bounds.");
                  }
                  _loc3_ = _loc3_.next;
                  _loc4_++;
               }
               this.removeChild(param1);
               this.addToList(param1,_loc3_);
               return;
            }
         }
         throw new TypeError("Parameter child must be non-null.");
      }
      
      public function swapChildren(param1:Object3D, param2:Object3D) : void
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         var _loc3_:Object3D = null;
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               while(true)
               {
                  if(!(_loc5_ && Boolean(param2)))
                  {
                     §§push(param1 == null);
                     if(!(_loc5_ && Boolean(param1)))
                     {
                        §§push(Boolean(§§pop()));
                        if(!(_loc4_ || Boolean(this)))
                        {
                           break loop1;
                        }
                        var _temp_4:* = §§pop();
                        §§push(_temp_4);
                        §§push(_temp_4);
                        if(!(_loc5_ && Boolean(_loc3_)))
                        {
                           §§push(Boolean(§§pop()));
                        }
                        if(§§pop())
                        {
                           break;
                        }
                        if(_loc5_)
                        {
                           break loop1;
                        }
                     }
                     §§pop();
                     if(!_loc4_)
                     {
                        break loop0;
                     }
                  }
                  §§push(param2 == null);
                  if(!(_loc5_ && Boolean(param2)))
                  {
                     break loop1;
                  }
                  break;
               }
               if(§§pop())
               {
                  break loop0;
               }
               if(param1._parent != this || param2._parent != this)
               {
                  throw new ArgumentError("The supplied Object3D must be a child of the caller.");
               }
               if(param1 != param2)
               {
                  if(param1.next == param2)
                  {
                     this.removeChild(param2);
                     this.addToList(param2,param1);
                  }
                  else if(param2.next == param1)
                  {
                     this.removeChild(param1);
                     this.addToList(param1,param2);
                  }
                  else
                  {
                     _loc3_ = param1.next;
                     this.removeChild(param1);
                     this.addToList(param1,param2);
                     this.removeChild(param2);
                     this.addToList(param2,_loc3_);
                  }
               }
               return;
            }
            §§push(Boolean(§§pop()));
            break loop2;
         }
         throw new TypeError("Parameter child must be non-null.");
      }
      
      public function swapChildrenAt(param1:int, param2:int) : void
      {
         §§push(false);
         var _loc7_:Boolean = true;
         var _loc8_:* = §§pop();
         var _loc3_:int = 0;
         var _loc4_:Object3D = null;
         var _loc5_:Object3D = null;
         var _loc6_:Object3D = null;
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
                     while(true)
                     {
                        if(!_loc8_)
                        {
                           §§push(param1);
                           if(_loc8_)
                           {
                              break;
                           }
                           §§push(0);
                           if(_loc8_)
                           {
                              break loop5;
                           }
                           §§push(§§pop() < §§pop());
                           if(_loc7_ || Boolean(param1))
                           {
                              §§push(Boolean(§§pop()));
                              if(_loc8_ && Boolean(param1))
                              {
                                 break loop4;
                              }
                              var _temp_3:* = §§pop();
                              §§push(_temp_3);
                              §§push(_temp_3);
                              if(_loc7_)
                              {
                                 §§push(Boolean(§§pop()));
                              }
                              if(§§pop())
                              {
                                 break loop4;
                              }
                              if(_loc8_)
                              {
                                 break loop3;
                              }
                           }
                           §§pop();
                           if(!(_loc7_ || Boolean(_loc3_)))
                           {
                              break loop2;
                           }
                        }
                        §§push(param2);
                        break;
                     }
                     §§push(0);
                     break;
                  }
                  §§push(§§pop() < §§pop());
                  if(!_loc8_)
                  {
                     break loop3;
                  }
                  break;
               }
               if(§§pop())
               {
                  break loop2;
               }
               if(param1 != param2)
               {
                  _loc4_ = this.childrenList;
                  _loc3_ = 0;
                  while(_loc3_ < param1)
                  {
                     if(_loc4_ == null)
                     {
                        throw new RangeError("The supplied index is out of bounds.");
                     }
                     _loc4_ = _loc4_.next;
                     _loc3_++;
                  }
                  if(_loc4_ == null)
                  {
                     throw new RangeError("The supplied index is out of bounds.");
                  }
                  _loc5_ = this.childrenList;
                  _loc3_ = 0;
                  while(_loc3_ < param2)
                  {
                     if(_loc5_ == null)
                     {
                        throw new RangeError("The supplied index is out of bounds.");
                     }
                     _loc5_ = _loc5_.next;
                     _loc3_++;
                  }
                  if(_loc5_ == null)
                  {
                     throw new RangeError("The supplied index is out of bounds.");
                  }
                  if(_loc4_ != _loc5_)
                  {
                     if(_loc4_.next == _loc5_)
                     {
                        this.removeChild(_loc5_);
                        this.addToList(_loc5_,_loc4_);
                     }
                     else if(_loc5_.next == _loc4_)
                     {
                        this.removeChild(_loc4_);
                        this.addToList(_loc4_,_loc5_);
                     }
                     else
                     {
                        _loc6_ = _loc4_.next;
                        this.removeChild(_loc4_);
                        this.addToList(_loc4_,_loc5_);
                        this.removeChild(_loc5_);
                        this.addToList(_loc5_,_loc6_);
                     }
                  }
               }
               return;
            }
            §§push(Boolean(§§pop()));
            break loop4;
         }
         throw new RangeError("The supplied index is out of bounds.");
      }
      
      public function getChildByName(param1:String) : Object3D
      {
         §§push(false);
         var _loc3_:Boolean = true;
         var _loc4_:* = §§pop();
         if(!_loc4_)
         {
            if(param1 != null)
            {
               var _loc2_:Object3D = this.childrenList;
               while(_loc2_ != null)
               {
                  if(_loc2_.name == param1)
                  {
                     if(_loc3_)
                     {
                        return _loc2_;
                     }
                  }
                  _loc2_ = _loc2_.next;
               }
               return null;
            }
         }
         throw new TypeError("Parameter name must be non-null.");
      }
      
      public function contains(param1:Object3D) : Boolean
      {
         §§push(false);
         var _loc3_:Boolean = true;
         var _loc4_:* = §§pop();
         if(!_loc4_)
         {
            if(param1 != null)
            {
               if(param1 == this)
               {
                  return true;
               }
               var _loc2_:Object3D = this.childrenList;
               while(true)
               {
                  if(_loc2_ == null)
                  {
                     return false;
                  }
                  §§push(_loc2_ is Object3DContainer);
                  if(_loc4_)
                  {
                     break;
                  }
                  if(§§pop())
                  {
                     if(!(_loc4_ && Boolean(param1)))
                     {
                        §§push((_loc2_ as Object3DContainer).contains(param1));
                        if(_loc4_)
                        {
                           break;
                        }
                        if(§§pop())
                        {
                           if(_loc3_ || Boolean(param1))
                           {
                              §§push(true);
                              if(_loc3_)
                              {
                                 return §§pop();
                              }
                              break;
                           }
                        }
                     }
                  }
                  else if(_loc2_ == param1)
                  {
                     if(!(_loc4_ && _loc3_))
                     {
                        §§push(true);
                        break;
                     }
                  }
                  _loc2_ = _loc2_.next;
               }
               return §§pop();
            }
         }
         throw new TypeError("Parameter child must be non-null.");
      }
      
      public function get numChildren() : int
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         §§push(0);
         if(_loc4_ || _loc3_)
         {
            §§push(int(§§pop()));
         }
         var _loc1_:* = §§pop();
         var _loc2_:Object3D = this.childrenList;
         while(true)
         {
            if(_loc2_ != null)
            {
               §§push(_loc1_);
               if(_loc3_ && Boolean(_loc1_))
               {
                  break;
               }
               §§push(§§pop() + 1);
               if(_loc4_ || Boolean(this))
               {
                  §§push(int(§§pop()));
                  if(_loc3_)
                  {
                     break;
                  }
               }
               _loc1_ = §§pop();
               if(!(_loc3_ && Boolean(this)))
               {
                  continue;
               }
            }
            §§push(_loc1_);
            break;
            _loc2_ = _loc2_.next;
         }
         return §§pop();
      }
      
      override public function intersectRay(param1:Vector3D, param2:Vector3D, param3:Dictionary = null, param4:Camera3D = null) : RayIntersectionData
      {
         var _temp_1:* = true;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = _temp_1;
         var _loc5_:Vector3D = null;
         var _loc6_:Vector3D = null;
         var _loc7_:RayIntersectionData = null;
         var _loc10_:RayIntersectionData = null;
         if(!_loc11_)
         {
            loop1:
            while(true)
            {
               while(true)
               {
                  §§push(param3 == null);
                  if(_loc12_ || Boolean(param3))
                  {
                     §§push(!§§pop());
                     if(_loc12_ || Boolean(this))
                     {
                        §§push(Boolean(§§pop()));
                        if(!_loc12_)
                        {
                           break loop1;
                        }
                        var _temp_4:* = §§pop();
                        §§push(_temp_4);
                        §§push(_temp_4);
                        if(!_loc11_)
                        {
                           §§push(Boolean(§§pop()));
                        }
                        if(§§pop())
                        {
                           if(_loc11_ && Boolean(this))
                           {
                              break loop1;
                           }
                           §§pop();
                           if(!(_loc12_ || Boolean(param3)))
                           {
                              break;
                           }
                           §§push(Boolean(param3[this]));
                           if(_loc11_ && Boolean(param1))
                           {
                              break loop1;
                           }
                        }
                     }
                  }
                  if(!§§pop())
                  {
                     §§push(!boundIntersectRay(param1,param2,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ));
                     break loop1;
                  }
                  if(!_loc11_)
                  {
                     §§push(null);
                     if(_loc12_)
                     {
                        return §§pop();
                     }
                  }
                  else
                  {
                     §§goto(addr00da);
                  }
                  §§goto(addr00db);
               }
            }
            if(!§§pop())
            {
               break loop2;
            }
            if(_loc11_)
            {
               break loop2;
            }
            addr00db:
            return null;
            addr00da:
         }
         §§push(1e+22);
         if(!_loc11_)
         {
            §§push(Number(§§pop()));
         }
         var _loc8_:* = §§pop();
         var _loc9_:Object3D = this.childrenList;
         loop0:
         for(; _loc9_ != null; _loc9_ = _loc9_.next)
         {
            _loc9_.composeMatrix();
            _loc9_.invertMatrix();
            if(_loc5_ == null)
            {
               _loc5_ = new Vector3D();
               _loc6_ = new Vector3D();
            }
            _loc5_.x = _loc9_.ma * param1.x + _loc9_.mb * param1.y + _loc9_.mc * param1.z + _loc9_.md;
            if(!_loc11_)
            {
               _loc5_.y = _loc9_.me * param1.x + _loc9_.mf * param1.y + _loc9_.mg * param1.z + _loc9_.mh;
               if(!_loc12_)
               {
                  break;
               }
               _loc5_.z = _loc9_.mi * param1.x + _loc9_.mj * param1.y + _loc9_.mk * param1.z + _loc9_.ml;
               if(_loc12_ || Boolean(this))
               {
                  _loc6_.x = _loc9_.ma * param2.x + _loc9_.mb * param2.y + _loc9_.mc * param2.z;
                  _loc6_.y = _loc9_.me * param2.x + _loc9_.mf * param2.y + _loc9_.mg * param2.z;
                  if(!_loc12_)
                  {
                     break;
                  }
               }
               _loc6_.z = _loc9_.mi * param2.x + _loc9_.mj * param2.y + _loc9_.mk * param2.z;
            }
            _loc10_ = _loc9_.intersectRay(_loc5_,_loc6_,param3,param4);
            loop3:
            while(true)
            {
               loop4:
               while(true)
               {
                  if(!_loc11_)
                  {
                     while(true)
                     {
                        §§push(_loc10_ == null);
                        if(!(_loc11_ && Boolean(this)))
                        {
                           §§push(!§§pop());
                           if(_loc11_ && Boolean(param1))
                           {
                              break loop4;
                           }
                           §§push(Boolean(§§pop()));
                           if(_loc11_ && Boolean(param3))
                           {
                              break;
                           }
                        }
                        var _temp_12:* = §§pop();
                        §§push(_temp_12);
                        §§push(_temp_12);
                        if(!_loc11_)
                        {
                           §§push(Boolean(§§pop()));
                        }
                        if(§§pop())
                        {
                           if(!(_loc11_ && Boolean(param3)))
                           {
                              break;
                           }
                        }
                        break loop4;
                     }
                     §§pop();
                     if(_loc11_)
                     {
                        break loop3;
                     }
                  }
                  §§push(_loc10_.time);
                  if(!(_loc11_ && Boolean(this)))
                  {
                     §§push(§§pop() < _loc8_);
                     if(_loc12_ || Boolean(param1))
                     {
                        §§push(Boolean(§§pop()));
                     }
                     break;
                  }
                  addr02b5:
                  _loc8_ = §§pop();
                  break loop3;
               }
               if(!§§pop())
               {
                  continue loop0;
               }
               if(!(_loc12_ || Boolean(param3)))
               {
                  break;
               }
               §§push(_loc10_.time);
               if(!(_loc11_ && Boolean(param2)))
               {
                  §§push(Number(§§pop()));
               }
               §§goto(addr02b5);
            }
            _loc7_ = _loc10_;
         }
         return _loc7_;
      }
      
      override public function clone() : Object3D
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         var _loc1_:Object3DContainer = new Object3DContainer();
         if(_loc2_ || Boolean(_loc1_))
         {
            _loc1_.clonePropertiesFrom(this);
         }
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         §§push(false);
         var _loc6_:Boolean = true;
         var _loc7_:* = §§pop();
         var _loc4_:Object3D = null;
         var _loc5_:Object3D = null;
         if(_loc6_)
         {
            super.clonePropertiesFrom(param1);
         }
         var _loc2_:Object3DContainer = param1 as Object3DContainer;
         if(_loc6_ || Boolean(_loc3_))
         {
            this.mouseChildren = _loc2_.mouseChildren;
         }
         var _loc3_:Object3D = _loc2_.childrenList;
         while(_loc3_ != null)
         {
            _loc5_ = _loc3_.clone();
            while(true)
            {
               if(_loc6_)
               {
                  if(this.childrenList == null)
                  {
                     this.childrenList = _loc5_;
                     break;
                  }
                  if(_loc6_)
                  {
                     _loc4_.next = _loc5_;
                     if(!(_loc6_ || Boolean(this)))
                     {
                        break;
                     }
                  }
               }
               break;
            }
            _loc4_ = _loc5_;
            if(!_loc7_)
            {
               _loc5_._parent = this;
            }
            _loc3_ = _loc3_.next;
         }
      }
      
      override alternativa3d function draw(param1:Camera3D, param2:Canvas) : void
      {
         §§push(false);
         var _loc8_:Boolean = true;
         var _loc9_:* = §§pop();
         var _loc3_:Canvas = null;
         var _loc4_:* = 0;
         if(!_loc9_)
         {
            this.numVisibleChildren = 0;
         }
         var _loc5_:Object3D = this.childrenList;
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               loop2:
               while(true)
               {
                  loop5:
                  while(true)
                  {
                     loop6:
                     while(true)
                     {
                        while(true)
                        {
                           if(_loc5_ != null)
                           {
                              §§push(_loc5_.visible);
                              if(_loc9_ && Boolean(_loc3_))
                              {
                                 break;
                              }
                              if(!§§pop())
                              {
                                 continue loop0;
                              }
                              _loc5_.composeAndAppend(this);
                              if(_loc9_ && Boolean(param1))
                              {
                                 break loop6;
                              }
                              §§push(_loc5_.cullingInCamera(param1,culling));
                              if(!_loc8_)
                              {
                                 break loop5;
                              }
                              §§push(0);
                              if(_loc9_ && Boolean(this))
                              {
                                 break loop2;
                              }
                              if(§§pop() < §§pop())
                              {
                                 continue loop0;
                              }
                              if(!_loc8_)
                              {
                                 break loop1;
                              }
                              this.visibleChildren[this.numVisibleChildren] = _loc5_;
                              if(!_loc9_)
                              {
                                 var _loc6_:* = this;
                                 §§push(_loc6_.alternativa3d::numVisibleChildren);
                                 if(_loc8_ || Boolean(param2))
                                 {
                                    §§push(§§pop() + 1);
                                 }
                                 var _loc7_:* = §§pop();
                                 if(!_loc9_)
                                 {
                                    _loc6_.alternativa3d::numVisibleChildren = _loc7_;
                                 }
                                 if(!(_loc9_ && Boolean(_loc3_)))
                                 {
                                    continue loop0;
                                 }
                              }
                           }
                           §§push(this.numVisibleChildren);
                           if(!(_loc9_ && Boolean(param2)))
                           {
                              break loop5;
                           }
                           §§goto(addr0189);
                        }
                        §§pop();
                        break loop1;
                     }
                     while(true)
                     {
                        §§push(param1.debug);
                        if(_loc8_)
                        {
                           §§push(Boolean(§§pop()));
                           if(_loc9_ && Boolean(this))
                           {
                              break;
                           }
                        }
                        var _temp_17:* = §§pop();
                        §§push(_temp_17);
                        §§push(_temp_17);
                        if(_loc8_ || Boolean(param1))
                        {
                           §§push(Boolean(§§pop()));
                        }
                        if(§§pop())
                        {
                           if(_loc8_)
                           {
                              break loop7;
                           }
                        }
                        §§goto(addr0193);
                     }
                     §§goto(addr0192);
                  }
                  §§push(0);
                  if(_loc8_ || Boolean(param1))
                  {
                     if(§§pop() > §§pop())
                     {
                        if(!(_loc9_ && Boolean(param1)))
                        {
                           break loop6;
                        }
                        break loop1;
                     }
                     break loop0;
                  }
                  break;
               }
               _loc6_ = §§pop();
               if(!(_loc9_ && Boolean(param2)))
               {
                  §§push(int(§§pop()));
                  if(_loc8_ || Boolean(this))
                  {
                     _loc4_ = §§pop();
                     §§push(_loc6_);
                  }
               }
               §§goto(addr0189);
            }
            _loc5_ = _loc5_.next;
            §§push(param1.checkInDebug(this));
            if(!_loc9_)
            {
               var _temp_1:* = §§pop();
               §§push(_temp_1);
               §§push(_temp_1);
               if(!(_loc9_ && Boolean(_loc3_)))
               {
                  break loop2;
               }
               addr018b:
               addr0193:
               §§push(§§pop() > §§pop());
               if(_loc8_)
               {
                  addr0192:
                  §§push(Boolean(§§pop()));
               }
               while(true)
               {
                  if(§§pop())
                  {
                     §§push(param2.getChildCanvas(true,false));
                     if(_loc9_ && Boolean(param2))
                     {
                        break;
                     }
                     _loc3_ = §§pop();
                     while(true)
                     {
                        if(_loc8_ || Boolean(param2))
                        {
                           §§push(_loc4_);
                           if(_loc8_ || Boolean(param2))
                           {
                              §§push(§§pop() & Debug.BOUNDS);
                           }
                           if(!Boolean(§§pop()))
                           {
                              break;
                           }
                           if(_loc9_ && Boolean(param2))
                           {
                              break;
                           }
                        }
                        Debug.drawBounds(param1,_loc3_,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
                        break;
                     }
                  }
                  §§push(param2.getChildCanvas(false,true,this,alpha,blendMode,colorTransform,filters));
                  break;
               }
               _loc3_ = §§pop();
               if(!_loc9_)
               {
                  _loc3_.numDraws = 0;
                  if(_loc9_ && Boolean(param2))
                  {
                     break;
                  }
                  this.drawVisibleChildren(param1,_loc3_);
                  if(!_loc9_)
                  {
                     if(_loc3_.numDraws <= 0)
                     {
                        _loc6_ = param2;
                        §§push(_loc6_.alternativa3d::numDraws);
                        if(_loc8_ || Boolean(_loc3_))
                        {
                           §§push(§§pop() - 1);
                        }
                        _loc7_ = §§pop();
                        if(_loc8_ || Boolean(param1))
                        {
                           _loc6_.alternativa3d::numDraws = _loc7_;
                        }
                        break;
                     }
                     if(_loc8_ || Boolean(_loc3_))
                     {
                        _loc3_.removeChildren(_loc3_.numDraws);
                        if(!_loc8_)
                        {
                           break;
                        }
                     }
                  }
               }
               break;
            }
            addr0189:
            §§goto(addr018b);
         }
      }
      
      alternativa3d function drawVisibleChildren(param1:Camera3D, param2:Canvas) : void
      {
         var _temp_1:* = true;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = _temp_1;
         var _loc4_:Object3D = null;
         §§push(this.numVisibleChildren);
         if(_loc6_)
         {
            §§push(int(§§pop() - 1));
         }
         var _loc3_:* = §§pop();
         while(_loc3_ >= 0)
         {
            _loc4_ = this.visibleChildren[_loc3_];
            if(_loc6_)
            {
               _loc4_.draw(param1,param2);
               if(_loc5_)
               {
                  continue;
               }
            }
            this.visibleChildren[_loc3_] = null;
            if(_loc6_)
            {
               while(true)
               {
                  §§push(_loc3_);
                  if(_loc6_ || Boolean(param2))
                  {
                     §§push(§§pop() - 1);
                     if(!_loc6_)
                     {
                        break;
                     }
                  }
                  §§push(int(§§pop()));
                  break;
               }
               _loc3_ = §§pop();
            }
         }
      }
      
      override alternativa3d function getVG(param1:Camera3D) : VG
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         var _loc2_:VG = this.collectVG(param1);
         if(!_loc3_)
         {
            this.colorizeVG(_loc2_);
         }
         return _loc2_;
      }
      
      alternativa3d function collectVG(param1:Camera3D) : VG
      {
         §§push(false);
         var _loc6_:Boolean = true;
         var _loc7_:* = §§pop();
         var _loc2_:VG = null;
         var _loc3_:VG = null;
         var _loc5_:VG = null;
         var _loc4_:Object3D = this.childrenList;
         loop0:
         for(; _loc4_ != null; _loc4_ = _loc4_.next)
         {
            if(_loc4_.visible)
            {
               if(!(_loc6_ || Boolean(this)))
               {
                  break;
               }
               _loc4_.composeAndAppend(this);
               if(!_loc6_)
               {
                  break;
               }
               if(_loc4_.cullingInCamera(param1,culling) >= 0)
               {
                  if(_loc7_ && Boolean(this))
                  {
                     break;
                  }
                  _loc5_ = _loc4_.getVG(param1);
                  while(true)
                  {
                     if(!(_loc7_ && Boolean(_loc3_)))
                     {
                        if(_loc5_ == null)
                        {
                           continue loop0;
                        }
                        if(_loc6_ || Boolean(this))
                        {
                           if(_loc2_ == null)
                           {
                              _loc2_ = _loc5_;
                              _loc3_ = _loc5_;
                              break;
                           }
                           if(_loc7_)
                           {
                              continue loop0;
                           }
                        }
                     }
                     _loc3_.next = _loc5_;
                     if(_loc6_ || Boolean(this))
                     {
                        break;
                     }
                     continue loop0;
                  }
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
                     while(!_loc6_);
                     _loc3_ = §§pop();
                  }
               }
            }
         }
         return _loc2_;
      }
      
      alternativa3d function colorizeVG(param1:VG) : void
      {
         §§push(false);
         var _loc8_:Boolean = true;
         var _loc9_:* = §§pop();
         var _loc2_:VG = null;
         var _loc3_:ColorTransform = null;
         var _loc4_:* = 0;
         var _loc5_:Array = null;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         loop6:
         while(true)
         {
            if(_loc8_)
            {
               if(alpha == 1)
               {
                  break;
               }
            }
            _loc2_ = param1;
            while(true)
            {
               if(_loc2_ == null)
               {
                  break loop6;
               }
               §§push(_loc2_);
               §§push(_loc2_.alpha);
               if(!_loc9_)
               {
                  §§push(§§pop() * alpha);
               }
               §§pop().alternativa3d::alpha = §§pop();
               if(!_loc8_)
               {
                  break loop6;
               }
               _loc2_ = _loc2_.next;
            }
            break;
         }
         loop7:
         while(true)
         {
            if(blendMode != "normal")
            {
               if(_loc9_ && Boolean(_loc2_))
               {
                  break;
               }
               _loc2_ = param1;
               loop8:
               while(true)
               {
                  if(_loc8_ || Boolean(_loc2_))
                  {
                     while(true)
                     {
                        if(_loc2_ == null)
                        {
                           break loop8;
                        }
                        if(_loc2_.blendMode != "normal")
                        {
                           continue;
                        }
                        if(!(_loc8_ || Boolean(param1)))
                        {
                           continue;
                        }
                        _loc2_ = _loc2_.next;
                     }
                     break;
                     addr00c0:
                  }
                  _loc2_.blendMode = blendMode;
                  if(!_loc8_)
                  {
                     break;
                  }
                  _loc2_ = _loc2_.next;
                  §§goto(addr00c0);
               }
            }
            if(colorTransform != null)
            {
               loop9:
               while(true)
               {
                  if(_loc8_ || Boolean(param1))
                  {
                     break loop7;
                  }
                  addr0182:
                  _loc2_ = param1;
                  if(_loc8_)
                  {
                     loop3:
                     while(true)
                     {
                        if(_loc2_ == null)
                        {
                           break loop9;
                        }
                        if(_loc2_.filters == null)
                        {
                           _loc2_.filters = filters;
                           if(!_loc8_)
                           {
                              break loop9;
                           }
                           continue;
                        }
                        if(!_loc8_)
                        {
                           break loop9;
                        }
                        _loc5_ = new Array();
                        loop10:
                        while(true)
                        {
                           §§push(0);
                           if(!_loc9_)
                           {
                              §§push(int(§§pop()));
                              if(_loc9_ && Boolean(this))
                              {
                                 break;
                              }
                           }
                           _loc6_ = §§pop();
                           _loc7_ = int(_loc2_.filters.length);
                           _loc4_ = 0;
                           loop11:
                           while(true)
                           {
                              if(!(_loc9_ && Boolean(_loc3_)))
                              {
                                 loop4:
                                 while(true)
                                 {
                                    §§push(_loc4_);
                                    §§push(_loc7_);
                                    if(_loc9_)
                                    {
                                       break loop11;
                                    }
                                    while(true)
                                    {
                                       if(§§pop() >= §§pop())
                                       {
                                          addr0236:
                                          _loc7_ = int(filters.length);
                                          if(!(_loc9_ && Boolean(_loc3_)))
                                          {
                                             §§push(0);
                                             if(!(_loc9_ && Boolean(param1)))
                                             {
                                                §§push(int(§§pop()));
                                                if(_loc8_)
                                                {
                                                   break loop4;
                                                }
                                                addr0298:
                                                §§push(int(§§pop()));
                                                if(!(_loc9_ && Boolean(this)))
                                                {
                                                   _loc6_ = §§pop();
                                                   §§push(_loc4_);
                                                   if(!_loc8_)
                                                   {
                                                      break loop10;
                                                   }
                                                   addr02b1:
                                                   §§push(§§pop() + 1);
                                                }
                                                §§push(int(§§pop()));
                                                break loop10;
                                             }
                                             break loop4;
                                          }
                                          while(true)
                                          {
                                             §§push(_loc4_);
                                             §§push(_loc7_);
                                             break loop11;
                                          }
                                          break loop9;
                                          addr02c3:
                                       }
                                       else
                                       {
                                          addr0287:
                                       }
                                       _loc5_[_loc6_] = _loc2_.filters[_loc4_];
                                       if(!_loc9_)
                                       {
                                          §§push(_loc6_);
                                          if(_loc8_)
                                          {
                                             _loc6_ = int(§§pop() + 1);
                                             §§push(_loc4_);
                                             if(_loc8_ || Boolean(param1))
                                             {
                                                §§push(int(§§pop() + 1));
                                                if(_loc9_)
                                                {
                                                   break loop4;
                                                }
                                                _loc4_ = §§pop();
                                                if(_loc9_ && Boolean(this))
                                                {
                                                   addr02d1:
                                                   _loc2_.filters = _loc5_;
                                                   break;
                                                }
                                                continue loop4;
                                             }
                                             §§goto(addr02b1);
                                          }
                                          §§goto(addr0298);
                                       }
                                       §§push(_loc6_);
                                       if(!(_loc8_ || Boolean(_loc3_)))
                                       {
                                          break loop10;
                                       }
                                       §§push(§§pop() + 1);
                                       §§goto(addr0298);
                                    }
                                    continue loop3;
                                 }
                                 _loc4_ = §§pop();
                                 §§goto(addr02c3);
                              }
                              §§goto(addr0236);
                           }
                           if(§§pop() < §§pop())
                           {
                              _loc5_[_loc6_] = filters[_loc4_];
                              if(_loc8_ || Boolean(param1))
                              {
                                 §§goto(addr0287);
                              }
                              §§goto(addr02d6);
                           }
                           if(_loc8_)
                           {
                              §§goto(addr02d1);
                           }
                           §§goto(addr02d6);
                        }
                        _loc4_ = §§pop();
                        if(!(_loc9_ && Boolean(this)))
                        {
                           §§goto(addr02c3);
                        }
                        §§goto(addr02d6);
                        _loc2_ = _loc2_.next;
                     }
                  }
                  break;
               }
               §§goto(addr02fd);
            }
            §§goto(addr0179);
         }
         _loc2_ = param1;
         loop13:
         while(true)
         {
            if(_loc8_)
            {
               while(true)
               {
                  if(_loc2_ == null)
                  {
                     break loop13;
                  }
                  if(_loc2_.colorTransform == null)
                  {
                     _loc2_.colorTransform = colorTransform;
                     if(!_loc8_)
                     {
                        break loop13;
                     }
                     continue;
                  }
                  if(!_loc8_)
                  {
                     break loop13;
                  }
                  _loc2_ = _loc2_.next;
               }
               break;
               addr0169:
            }
            _loc3_ = new ColorTransform(colorTransform.redMultiplier,colorTransform.greenMultiplier,colorTransform.blueMultiplier,colorTransform.alphaMultiplier,colorTransform.redOffset,colorTransform.greenOffset,colorTransform.blueOffset,colorTransform.alphaOffset);
            if(!_loc9_)
            {
               _loc3_.concat(_loc2_.colorTransform);
               if(_loc8_ || Boolean(_loc3_))
               {
                  _loc2_.colorTransform = _loc3_;
               }
            }
            _loc2_ = _loc2_.next;
            §§goto(addr0169);
         }
         addr0179:
         if(filters != null)
         {
            §§goto(addr0182);
         }
         addr02fd:
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         var _loc3_:Object3D = this.childrenList;
         while(_loc3_ != null)
         {
            if(param2 != null)
            {
               if(_loc4_)
               {
                  _loc3_.composeAndAppend(param2);
                  if(_loc5_ && Boolean(this))
                  {
                     break;
                  }
               }
            }
            else
            {
               _loc3_.composeMatrix();
               if(!_loc4_)
               {
                  break;
               }
            }
            _loc3_.updateBounds(param1,_loc3_);
            if(_loc5_)
            {
               break;
            }
            _loc3_ = _loc3_.next;
         }
      }
      
      override alternativa3d function split(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Number) : Vector.<Object3D>
      {
         §§push(false);
         var _loc20_:Boolean = true;
         var _loc21_:* = §§pop();
         var _loc10_:Object3D = null;
         var _loc11_:Object3D = null;
         var _loc13_:Object3D = null;
         var _loc14_:Vector3D = null;
         var _loc15_:Vector3D = null;
         var _loc16_:Vector3D = null;
         var _loc17_:* = 0;
         var _loc18_:Vector.<Object3D> = null;
         var _loc19_:* = NaN;
         var _loc5_:Vector.<Object3D> = new Vector.<Object3D>(2);
         var _loc6_:Vector3D = calculatePlane(param1,param2,param3);
         var _loc7_:Object3D = this.childrenList;
         if(_loc20_ || Boolean(param2))
         {
            this.childrenList = null;
         }
         var _loc8_:Object3DContainer = this.clone() as Object3DContainer;
         var _loc9_:Object3DContainer = this.clone() as Object3DContainer;
         var _loc12_:Object3D = _loc7_;
         loop0:
         for(; _loc12_ != null; _loc12_ = _loc13_)
         {
            _loc13_ = _loc12_.next;
            while(true)
            {
               if(!(_loc21_ && Boolean(param2)))
               {
                  _loc12_.next = null;
                  if(_loc21_)
                  {
                     break;
                  }
               }
               _loc12_._parent = null;
               if(!(_loc21_ && Boolean(param1)))
               {
                  _loc12_.composeMatrix();
                  if(_loc21_ && Boolean(this))
                  {
                     break;
                  }
               }
               _loc12_.calculateInverseMatrix();
               break;
            }
            _loc14_ = new Vector3D(_loc12_.ima * param1.x + _loc12_.imb * param1.y + _loc12_.imc * param1.z + _loc12_.imd,_loc12_.ime * param1.x + _loc12_.imf * param1.y + _loc12_.img * param1.z + _loc12_.imh,_loc12_.imi * param1.x + _loc12_.imj * param1.y + _loc12_.imk * param1.z + _loc12_.iml);
            _loc15_ = new Vector3D(_loc12_.ima * param2.x + _loc12_.imb * param2.y + _loc12_.imc * param2.z + _loc12_.imd,_loc12_.ime * param2.x + _loc12_.imf * param2.y + _loc12_.img * param2.z + _loc12_.imh,_loc12_.imi * param2.x + _loc12_.imj * param2.y + _loc12_.imk * param2.z + _loc12_.iml);
            _loc16_ = new Vector3D(_loc12_.ima * param3.x + _loc12_.imb * param3.y + _loc12_.imc * param3.z + _loc12_.imd,_loc12_.ime * param3.x + _loc12_.imf * param3.y + _loc12_.img * param3.z + _loc12_.imh,_loc12_.imi * param3.x + _loc12_.imj * param3.y + _loc12_.imk * param3.z + _loc12_.iml);
            loop2:
            while(true)
            {
               §§push(_loc12_.testSplit(_loc14_,_loc15_,_loc16_,param4));
               if(_loc20_ || Boolean(param1))
               {
                  §§push(int(§§pop()));
                  if(!_loc20_)
                  {
                     break;
                  }
               }
               _loc17_ = §§pop();
               if(!(_loc21_ && Boolean(this)))
               {
                  loop3:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_loc17_);
                        if(_loc20_)
                        {
                           break loop2;
                        }
                        addr02b9:
                        addr02bb:
                        if(§§pop() > 0)
                        {
                           if(_loc11_ != null)
                           {
                              if(!_loc21_)
                              {
                                 break;
                              }
                              break loop3;
                           }
                           _loc9_.childrenList = _loc12_;
                           break loop3;
                        }
                        _loc18_ = _loc12_.split(_loc14_,_loc15_,_loc16_,param4);
                        while(true)
                        {
                           if(_loc20_)
                           {
                              §§push(_loc12_.distance);
                              if(_loc20_ || Boolean(param3))
                              {
                                 §§push(Number(§§pop()));
                              }
                              _loc19_ = §§pop();
                              if(_loc21_)
                              {
                                 break;
                              }
                           }
                           if(_loc18_[0] != null)
                           {
                              if(_loc20_)
                              {
                                 break;
                              }
                              addr03a7:
                              _loc12_ = _loc18_[1];
                              while(true)
                              {
                                 if(!(_loc21_ && Boolean(param3)))
                                 {
                                    if(_loc11_ == null)
                                    {
                                       _loc9_.childrenList = _loc12_;
                                       break;
                                    }
                                    if(!_loc20_)
                                    {
                                       break;
                                    }
                                    _loc11_.next = _loc12_;
                                    if(!_loc20_)
                                    {
                                       break;
                                    }
                                 }
                                 break;
                              }
                              _loc11_ = _loc12_;
                              if(_loc20_ || Boolean(param3))
                              {
                                 _loc12_._parent = _loc9_;
                                 if(!_loc20_)
                                 {
                                    continue loop0;
                                 }
                              }
                              _loc12_.distance = _loc19_;
                              continue loop0;
                           }
                           addr039c:
                           if(_loc18_[1] == null)
                           {
                              continue loop0;
                           }
                           §§goto(addr03a7);
                        }
                        _loc12_ = _loc18_[0];
                        while(true)
                        {
                           if(_loc20_)
                           {
                              if(_loc10_ == null)
                              {
                                 _loc8_.childrenList = _loc12_;
                                 break;
                              }
                              if(_loc20_)
                              {
                                 _loc10_.next = _loc12_;
                                 if(!_loc20_)
                                 {
                                    break;
                                 }
                              }
                           }
                           break;
                        }
                        _loc10_ = _loc12_;
                        if(!(_loc21_ && Boolean(param3)))
                        {
                           _loc12_._parent = _loc8_;
                           if(_loc20_ || Boolean(this))
                           {
                              _loc12_.distance = _loc19_;
                           }
                        }
                        §§goto(addr039c);
                     }
                     addr02cc:
                     _loc11_.next = _loc12_;
                     if(_loc21_)
                     {
                     }
                     break;
                  }
               }
               break loop3;
            }
            while(true)
            {
               §§push(0);
               if(!_loc21_)
               {
                  if(§§pop() < §§pop())
                  {
                     if(_loc10_ != null)
                     {
                        if(_loc21_ && Boolean(param2))
                        {
                           break loop3;
                        }
                        _loc10_.next = _loc12_;
                        if(_loc21_)
                        {
                           break;
                        }
                     }
                     else
                     {
                        _loc8_.childrenList = _loc12_;
                        if(_loc21_)
                        {
                           break loop3;
                        }
                     }
                     _loc10_ = _loc12_;
                     if(_loc20_ || Boolean(param1))
                     {
                        _loc12_._parent = _loc8_;
                     }
                     continue loop0;
                  }
                  §§goto(addr02b9);
                  §§push(_loc17_);
               }
               §§goto(addr02bb);
            }
            §§goto(addr02cc);
         }
         while(true)
         {
            if(_loc10_ != null)
            {
               _loc8_.calculateBounds();
               if(!(_loc20_ || Boolean(this)))
               {
                  break;
               }
               _loc5_[0] = _loc8_;
            }
            if(_loc11_ != null)
            {
               if(_loc20_ || Boolean(param3))
               {
                  _loc9_.calculateBounds();
               }
               break;
            }
            §§goto(addr0465);
         }
         _loc5_[1] = _loc9_;
         addr0465:
         return _loc5_;
      }
      
      alternativa3d function addToList(param1:Object3D, param2:Object3D = null) : void
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         var _loc3_:Object3D = null;
         while(true)
         {
            if(!(_loc5_ && Boolean(param2)))
            {
               param1.next = param2;
               if(!_loc5_)
               {
                  param1._parent = this;
                  if(!(_loc4_ || Boolean(param2)))
                  {
                     break;
                  }
                  if(param2 != this.childrenList)
                  {
                     _loc3_ = this.childrenList;
                     while(_loc3_ != null)
                     {
                        §§push(_loc3_.next);
                        if(!(_loc5_ && Boolean(param2)))
                        {
                           if(§§pop() == param2)
                           {
                              if(!(_loc5_ && Boolean(_loc3_)))
                              {
                                 _loc3_.next = param1;
                                 if(!_loc4_)
                                 {
                                    break;
                                 }
                              }
                              break;
                           }
                           §§push(_loc3_.next);
                        }
                        _loc3_ = §§pop();
                     }
                     §§goto(addr00bb);
                  }
                  if(!(_loc4_ || Boolean(this)))
                  {
                     break;
                  }
               }
            }
            this.childrenList = param1;
            break;
         }
         addr00bb:
      }
   }
}

§§push(false);
true;
§§pop();
if(!(_loc2_ && _loc1_))
{
   Object3DContainer = §§newclass(Object3DContainer,Object3D);
}

