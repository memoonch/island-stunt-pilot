package alternativa.engine3d.objects
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.Material;
   
   use namespace alternativa3d;
   
   public class AnimSprite extends Sprite3D
   {
      
      private var _materials:Vector.<Material>;
      
      private var _frame:int = 0;
      
      private var _loop:Boolean = false;
      
      public function AnimSprite(param1:Number, param2:Number, param3:Vector.<Material> = null, param4:Boolean = false, param5:int = 0)
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         while(true)
         {
            if(!(_loc6_ && Boolean(param2)))
            {
               super(param1,param2);
               if(!_loc7_)
               {
                  break;
               }
            }
            this._materials = param3;
            if(!(_loc6_ && Boolean(param1)))
            {
               break;
            }
            §§goto(addr005d);
         }
         this._loop = param4;
         if(!_loc6_)
         {
            addr005d:
            this.frame = param5;
            §§goto(addr0062);
         }
         addr0062:
      }
      
      public function get materials() : Vector.<Material>
      {
         return this._materials;
      }
      
      public function set materials(param1:Vector.<Material>) : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         while(true)
         {
            if(_loc3_)
            {
               this._materials = param1;
               if(_loc2_)
               {
                  break;
               }
               if(param1 == null)
               {
                  material = null;
                  break;
               }
               if(_loc3_ || Boolean(this))
               {
                  this.frame = this._frame;
                  if(_loc2_ && Boolean(this))
                  {
                     break;
                  }
               }
            }
            break;
         }
      }
      
      public function get loop() : Boolean
      {
         return this._loop;
      }
      
      public function set loop(param1:Boolean) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         if(_loc2_)
         {
            this._loop = param1;
            if(_loc2_ || Boolean(_loc3_))
            {
               this.frame = this._frame;
            }
         }
      }
      
      public function get frame() : int
      {
         return this._frame;
      }
      
      public function set frame(param1:int) : void
      {
         §§push(false);
         var _loc5_:Boolean = true;
         var _loc6_:* = §§pop();
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         this._frame = param1;
         if(!(_loc6_ && Boolean(_loc3_)))
         {
            if(this._materials != null)
            {
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
                              loop5:
                              while(true)
                              {
                                 loop6:
                                 while(true)
                                 {
                                    loop7:
                                    while(true)
                                    {
                                       if(!_loc6_)
                                       {
                                          §§push(int(this._materials.length));
                                          if(_loc6_ && Boolean(_loc2_))
                                          {
                                             break loop2;
                                          }
                                          _loc2_ = §§pop();
                                          §§push(this._frame);
                                          if(_loc6_)
                                          {
                                             break loop6;
                                          }
                                          _loc3_ = §§pop();
                                          if(_loc6_)
                                          {
                                             break loop5;
                                          }
                                          §§push(this._frame);
                                          §§push(0);
                                          if(_loc6_ && Boolean(this))
                                          {
                                             break loop4;
                                          }
                                          if(§§pop() < §§pop())
                                          {
                                             loop8:
                                             while(true)
                                             {
                                                loop9:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(this._frame);
                                                      if(!(_loc6_ && Boolean(param1)))
                                                      {
                                                         §§push(_loc2_);
                                                         if(!(_loc5_ || Boolean(_loc2_)))
                                                         {
                                                            break loop4;
                                                         }
                                                         §§push(§§pop() % §§pop());
                                                         if(_loc6_ && Boolean(this))
                                                         {
                                                            break;
                                                         }
                                                         §§push(int(§§pop()));
                                                         if(_loc6_ && Boolean(param1))
                                                         {
                                                            break loop9;
                                                         }
                                                         _loc4_ = §§pop();
                                                         §§push(this._loop);
                                                         if(!_loc5_)
                                                         {
                                                            break loop3;
                                                         }
                                                         var _temp_9:* = §§pop();
                                                         §§push(_temp_9);
                                                         §§push(_temp_9);
                                                         if(!_loc6_)
                                                         {
                                                            §§push(Boolean(§§pop()));
                                                         }
                                                         if(!§§pop())
                                                         {
                                                            break loop8;
                                                         }
                                                         §§pop();
                                                         §§push(_loc4_);
                                                      }
                                                      §§push(0);
                                                      if(_loc5_ || Boolean(this))
                                                      {
                                                         §§push(§§pop() == §§pop());
                                                         if(!_loc6_)
                                                         {
                                                            §§push(!§§pop());
                                                         }
                                                         §§push(Boolean(§§pop()));
                                                         break loop8;
                                                      }
                                                      break loop4;
                                                   }
                                                   §§goto(addr0117);
                                                }
                                                _loc3_ = int(§§pop());
                                                break loop7;
                                             }
                                             if(!§§pop())
                                             {
                                                §§push(0);
                                                break loop9;
                                             }
                                             if(!(_loc6_ && Boolean(_loc2_)))
                                             {
                                                §§push(_loc4_);
                                                if(!_loc5_)
                                                {
                                                   break loop2;
                                                }
                                                §§push(§§pop() + _loc2_);
                                                if(_loc5_)
                                                {
                                                   addr0117:
                                                   §§push(int(§§pop()));
                                                   if(!_loc6_)
                                                   {
                                                      break loop9;
                                                   }
                                                   §§goto(addr016f);
                                                }
                                                else
                                                {
                                                   §§goto(addr0154);
                                                }
                                             }
                                          }
                                          else
                                          {
                                             if(this._frame <= _loc2_ - 1)
                                             {
                                                break;
                                             }
                                             if(!_loc5_)
                                             {
                                                break loop0;
                                             }
                                          }
                                       }
                                       §§push(this._loop);
                                       break loop3;
                                    }
                                    §§goto(addr0170);
                                 }
                                 §§goto(addr0155);
                              }
                           }
                           §§goto(addr0162);
                        }
                        if(§§pop())
                        {
                           break loop0;
                        }
                        §§push(_loc2_);
                        if(!_loc6_)
                        {
                           break;
                        }
                        break loop1;
                     }
                     addr0162:
                     §§goto(addr016d);
                  }
                  §§goto(addr016f);
               }
               addr016f:
               §§push(this._frame);
               if(_loc5_)
               {
                  §§push(§§pop() % _loc2_);
                  if(!_loc6_)
                  {
                     addr0155:
                     addr0154:
                     §§push(int(§§pop()));
                     break loop1;
                  }
                  addr016d:
                  §§push(int(§§pop()));
                  break loop1;
               }
               _loc3_ = §§pop();
               addr0170:
               material = this._materials[_loc3_];
            }
         }
         break loop5;
      }
      
      override public function clone() : Object3D
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         var _loc1_:AnimSprite = new AnimSprite(width,height);
         if(_loc2_)
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
         if(_loc4_ || Boolean(this))
         {
            super.clonePropertiesFrom(param1);
         }
         var _loc2_:AnimSprite = param1 as AnimSprite;
         if(!_loc3_)
         {
            this._materials = _loc2_._materials;
            if(_loc4_ || Boolean(this))
            {
               this._loop = _loc2_._loop;
               if(_loc4_)
               {
                  this._frame = _loc2_._frame;
               }
            }
         }
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(!_loc1_)
{
   this.AnimSprite = §§newclass(AnimSprite,Sprite3D);
}

