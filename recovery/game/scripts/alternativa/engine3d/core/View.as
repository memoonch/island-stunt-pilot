package alternativa.engine3d.core
{
   import alternativa.Alternativa3D;
   import alternativa.engine3d.alternativa3d;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.StageAlign;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import flash.ui.Keyboard;
   import flash.utils.setTimeout;
   
   use namespace alternativa3d;
   
   public class View extends Canvas
   {
      
      private static const mouse:Point;
      
      private static const branch:Vector.<Object3D>;
      
      private static const overedBranch:Vector.<Object3D>;
      
      private static const functions:Vector.<Function>;
      
      §§push(false);
      var _loc1_:Boolean = true;
      var _loc2_:* = §§pop();
      loop0:
      while(true)
      {
         while(true)
         {
            if(_loc1_)
            {
               mouse = new Point();
               if(_loc2_ && Boolean(View))
               {
                  break;
               }
               branch = new Vector.<Object3D>();
               if(!_loc1_)
               {
                  break loop0;
               }
            }
            overedBranch = new Vector.<Object3D>();
            if(!_loc2_)
            {
               break loop0;
            }
            break;
         }
         return;
      }
      
      private static const changedBranch:Vector.<Object3D> = new Vector.<Object3D>();
      
      if(!(_loc2_ && _loc1_))
      {
         functions = new Vector.<Function>();
      }
      break loop1;
      
      alternativa3d var camera:Camera3D;
      
      alternativa3d var _width:Number;
      
      alternativa3d var _height:Number;
      
      alternativa3d var _interactive:Boolean = false;
      
      private var target:Object3D;
      
      private var pressedTarget:Object3D;
      
      private var clickedTarget:Object3D;
      
      private var overedTarget:Object3D;
      
      private var altKey:Boolean;
      
      private var ctrlKey:Boolean;
      
      private var shiftKey:Boolean;
      
      private var delta:int;
      
      private var buttonDown:Boolean;
      
      private var logo:Logo;
      
      private var border:Number = 5;
      
      private var _logoAlign:String = "BR";
      
      private var _logoHorizontalMargin:Number;
      
      private var _logoVerticalMargin:Number;
      
      private var bitmap:Bitmap;
      
      public function View(param1:Number, param2:Number, param3:Boolean = false)
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         this._logoHorizontalMargin = this.border;
         this._logoVerticalMargin = this.border;
         if(!(_loc6_ && Boolean(param1)))
         {
            super();
            this._width = param1;
            this._height = param2;
         }
         this._interactive = param3;
         mouseChildren = false;
         tabChildren = false;
         mouseEnabled = true;
         tabEnabled = false;
         var _loc4_:ContextMenuItem = new ContextMenuItem("Powered by Alternativa3D " + Alternativa3D.version);
         if(!_loc6_)
         {
            _loc4_.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.onItemSelect);
         }
         var _loc5_:ContextMenu = new ContextMenu();
         while(true)
         {
            if(!(_loc6_ && Boolean(param2)))
            {
               _loc5_.customItems = [_loc4_];
               if(!(_loc6_ && Boolean(this)))
               {
                  contextMenu = _loc5_;
                  if(!_loc7_)
                  {
                     break;
                  }
               }
               this.showLogo();
               if(_loc6_)
               {
                  break;
               }
            }
            addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
            if(_loc7_)
            {
               break;
            }
            §§goto(addr0104);
         }
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         addr0104:
      }
      
      private function onItemSelect(param1:ContextMenuEvent) : void
      {
         var e:ContextMenuEvent;
         var _temp_1:* = true;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = _temp_1;
         e = param1;
         if(_loc5_)
         {
            try
            {
               navigateToURL(new URLRequest("http://alternativaplatform.com"),"_blank");
            }
            catch(e:Error)
            {
            }
            §§goto(addr005b);
         }
         addr005b:
      }
      
      public function showLogo() : void
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(!(_loc1_ && _loc1_))
         {
            if(this.logo == null)
            {
               while(true)
               {
                  if(_loc2_)
                  {
                     this.logo = new Logo();
                     if(_loc1_ && _loc1_)
                     {
                        break;
                     }
                  }
                  super.addChild(this.logo);
                  if(_loc2_)
                  {
                     this.resizeLogo();
                  }
                  break;
               }
            }
         }
      }
      
      public function hideLogo() : void
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         while(true)
         {
            if(!_loc2_)
            {
               if(this.logo == null)
               {
                  break;
               }
               if(_loc1_ || Boolean(_loc2_))
               {
                  super.removeChild(this.logo);
                  if(_loc2_)
                  {
                     break;
                  }
               }
            }
            this.logo = null;
            break;
         }
      }
      
      public function get logoAlign() : String
      {
         return this._logoAlign;
      }
      
      public function set logoAlign(param1:String) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         while(true)
         {
            if(_loc2_ || Boolean(this))
            {
               this._logoAlign = param1;
               if(!_loc2_)
               {
                  break;
               }
            }
            this.resizeLogo();
            break;
         }
      }
      
      public function get logoHorizontalMargin() : Number
      {
         return this._logoHorizontalMargin;
      }
      
      public function set logoHorizontalMargin(param1:Number) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         while(true)
         {
            if(!_loc3_)
            {
               this._logoHorizontalMargin = param1;
               if(_loc3_)
               {
                  break;
               }
            }
            this.resizeLogo();
            break;
         }
      }
      
      public function get logoVerticalMargin() : Number
      {
         return this._logoVerticalMargin;
      }
      
      public function set logoVerticalMargin(param1:Number) : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         if(_loc3_)
         {
            this._logoVerticalMargin = param1;
            if(!(_loc2_ && _loc3_))
            {
               this.resizeLogo();
            }
         }
      }
      
      private function resizeLogo() : void
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               loop6:
               while(true)
               {
                  §§push(this.logo);
                  if(!(_loc1_ && Boolean(this)))
                  {
                     if(§§pop() != null)
                     {
                        loop13:
                        while(true)
                        {
                           loop14:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(this._logoAlign == StageAlign.TOP_LEFT);
                                 if(_loc2_)
                                 {
                                    §§push(Boolean(§§pop()));
                                    if(_loc2_)
                                    {
                                       var _temp_24:* = §§pop();
                                       loop16:
                                       while(true)
                                       {
                                          loop17:
                                          while(true)
                                          {
                                             §§push(_temp_24);
                                             if(!Boolean(_temp_24))
                                             {
                                                if(_loc1_ && _loc2_)
                                                {
                                                   break loop9;
                                                }
                                                §§pop();
                                                if(_loc1_)
                                                {
                                                   break;
                                                }
                                                §§push(this._logoAlign);
                                                if(!(_loc2_ || Boolean(this)))
                                                {
                                                   break loop3;
                                                }
                                                §§push(§§pop() == StageAlign.LEFT);
                                                if(!_loc2_)
                                                {
                                                   break loop16;
                                                }
                                             }
                                             var _temp_28:* = §§pop();
                                             loop18:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   §§push(_temp_28);
                                                   §§push(Boolean(_temp_28));
                                                   if(!_loc1_)
                                                   {
                                                      loop20:
                                                      while(true)
                                                      {
                                                         if(!§§pop())
                                                         {
                                                            §§pop();
                                                            if(_loc2_ || _loc1_)
                                                            {
                                                               §§push(this._logoAlign == StageAlign.BOTTOM_LEFT);
                                                            }
                                                            else
                                                            {
                                                               §§goto(addr020e);
                                                            }
                                                         }
                                                         if(§§pop())
                                                         {
                                                            this.logo.x = Math.round(this._logoHorizontalMargin);
                                                            if(_loc1_ && _loc1_)
                                                            {
                                                               break loop14;
                                                            }
                                                         }
                                                         loop21:
                                                         while(true)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(this._logoAlign);
                                                               if(!_loc1_)
                                                               {
                                                                  §§push(§§pop() == StageAlign.TOP);
                                                                  if(_loc1_ && _loc1_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(Boolean(§§pop()));
                                                                  if(!_loc2_)
                                                                  {
                                                                     break loop21;
                                                                  }
                                                                  §§push(§§pop() || this._logoAlign);
                                                               }
                                                               §§push(§§pop() == StageAlign.BOTTOM);
                                                               break loop21;
                                                            }
                                                            var _temp_35:* = §§pop();
                                                            §§push(_temp_35);
                                                            if(!Boolean(_temp_35))
                                                            {
                                                               if(!(_loc2_ || _loc2_))
                                                               {
                                                                  break loop13;
                                                               }
                                                               §§pop();
                                                               if(!(_loc2_ || _loc2_))
                                                               {
                                                                  break loop1;
                                                               }
                                                               §§push(this._logoAlign);
                                                               if(_loc2_)
                                                               {
                                                                  §§push(§§pop() == StageAlign.RIGHT);
                                                                  if(_loc2_)
                                                                  {
                                                                     §§push(Boolean(§§pop()));
                                                                     if(!_loc2_)
                                                                     {
                                                                        break loop18;
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     §§goto(addr0342);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  §§goto(addr025a);
                                                               }
                                                            }
                                                            var _temp_38:* = §§pop();
                                                            §§push(_temp_38);
                                                            §§push(_temp_38);
                                                            if(_loc1_)
                                                            {
                                                               continue loop10;
                                                            }
                                                            if(!Boolean(§§pop()))
                                                            {
                                                               if(!(_loc1_ && Boolean(this)))
                                                               {
                                                                  §§pop();
                                                                  break loop17;
                                                               }
                                                               §§goto(addr022c);
                                                            }
                                                            §§goto(addr01b5);
                                                         }
                                                         while(true)
                                                         {
                                                            if(§§pop())
                                                            {
                                                               this.logo.x = Math.round((this._width - this.logo.width) / 2);
                                                               if(!_loc2_)
                                                               {
                                                                  break;
                                                               }
                                                            }
                                                            while(true)
                                                            {
                                                               §§push(this._logoAlign);
                                                               if(_loc2_ || _loc2_)
                                                               {
                                                                  §§push(§§pop() == StageAlign.TOP_RIGHT);
                                                                  if(!(_loc1_ && _loc2_))
                                                                  {
                                                                     break loop22;
                                                                  }
                                                                  break loop20;
                                                               }
                                                               addr019a:
                                                               §§push(§§pop() == StageAlign.BOTTOM_RIGHT);
                                                               if(_loc2_)
                                                               {
                                                                  break loop16;
                                                               }
                                                               continue loop7;
                                                            }
                                                            §§goto(addr02df);
                                                         }
                                                         §§goto(addr01be);
                                                      }
                                                      §§goto(addr022b);
                                                   }
                                                   §§goto(addr023a);
                                                }
                                                §§goto(addr0358);
                                             }
                                             §§goto(addr02f4);
                                          }
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(this._logoAlign);
                                                if(!(_loc1_ && _loc2_))
                                                {
                                                   §§goto(addr019a);
                                                }
                                                §§goto(addr02df);
                                             }
                                             §§goto(addr0306);
                                          }
                                          §§goto(addr0358);
                                       }
                                       §§push(Boolean(§§pop()));
                                       if(!(_loc1_ && _loc2_))
                                       {
                                          addr01b5:
                                          if(§§pop())
                                          {
                                             if(_loc2_)
                                             {
                                                this.logo.x = Math.round(this._width - this._logoHorizontalMargin - this.logo.width);
                                                addr01be:
                                                addr01c1:
                                                break loop1;
                                             }
                                             break loop0;
                                          }
                                          break loop1;
                                       }
                                       break loop6;
                                    }
                                    break;
                                 }
                                 §§goto(addr026f);
                              }
                              §§goto(addr027d);
                           }
                           §§goto(addr039c);
                        }
                        §§goto(addr0373);
                     }
                     §§goto(addr03bf);
                  }
                  §§goto(addr01c1);
               }
               var _temp_41:* = §§pop();
               §§goto(addr02af);
            }
            §§push(this._logoAlign);
            if(_loc2_ || _loc1_)
            {
               var _temp_10:* = §§pop() == StageAlign.TOP_LEFT;
               loop7:
               while(true)
               {
                  while(true)
                  {
                     §§push(_temp_10);
                     if(!_temp_10)
                     {
                        if(!(_loc1_ && Boolean(this)))
                        {
                           §§pop();
                           addr020e:
                           §§push(this._logoAlign);
                           if(_loc1_)
                           {
                              break;
                           }
                           §§push(§§pop() == StageAlign.TOP);
                           if(!(_loc2_ || _loc1_))
                           {
                              break loop7;
                           }
                           §§push(Boolean(§§pop()));
                        }
                     }
                     addr022c:
                     var _temp_13:* = §§pop();
                     §§push(_temp_13);
                     §§push(_temp_13);
                     if(_loc2_ || Boolean(this))
                     {
                        addr023a:
                        §§push(Boolean(§§pop()));
                        if(_loc2_ || Boolean(this))
                        {
                           loop9:
                           while(true)
                           {
                              loop10:
                              while(true)
                              {
                                 while(true)
                                 {
                                    if(!§§pop())
                                    {
                                       if(!_loc2_)
                                       {
                                          break loop9;
                                       }
                                       §§pop();
                                       if(!_loc2_)
                                       {
                                          break;
                                       }
                                       §§push(this._logoAlign == StageAlign.TOP_RIGHT);
                                       if(!(_loc2_ || Boolean(this)))
                                       {
                                          break loop10;
                                       }
                                       §§push(Boolean(§§pop()));
                                       if(_loc1_ && Boolean(this))
                                       {
                                          break loop9;
                                       }
                                    }
                                    addr027d:
                                    if(!§§pop())
                                    {
                                       break;
                                    }
                                    §§push(this.logo);
                                    if(!_loc1_)
                                    {
                                       §§pop().y = Math.round(this._logoVerticalMargin);
                                       break;
                                    }
                                    §§goto(addr0309);
                                 }
                                 §§push(this._logoAlign);
                                 if(!(_loc1_ && _loc1_))
                                 {
                                    §§push(§§pop() == StageAlign.LEFT);
                                    break loop6;
                                 }
                                 break loop3;
                              }
                              if(!§§pop())
                              {
                                 break loop0;
                              }
                              if(_loc2_ || Boolean(this))
                              {
                                 §§goto(addr0306);
                              }
                              else
                              {
                                 §§goto(addr0348);
                              }
                           }
                           §§pop();
                           if(_loc2_ || _loc1_)
                           {
                              §§push(this._logoAlign);
                              if(_loc1_ && _loc2_)
                              {
                                 break;
                              }
                              while(true)
                              {
                                 §§push(§§pop() == StageAlign.RIGHT);
                                 if(_loc2_ || Boolean(this))
                                 {
                                    addr02f4:
                                    §§push(Boolean(§§pop()));
                                    break loop10;
                                 }
                                 §§goto(addr036d);
                              }
                              §§goto(addr0373);
                           }
                           addr0309:
                           this.logo.y = Math.round((this._height - this.logo.height) / 2);
                           addr0306:
                           break loop0;
                        }
                        addr02af:
                        if(!Boolean(§§pop()))
                        {
                           if(_loc2_ || Boolean(this))
                           {
                              break loop9;
                           }
                        }
                        break loop10;
                     }
                     continue loop3;
                  }
                  §§goto(addr0358);
               }
               §§goto(addr0397);
            }
            §§goto(addr0321);
         }
         addr0321:
         var _temp_3:* = this._logoAlign == StageAlign.BOTTOM_LEFT;
         §§push(_temp_3);
         §§push(_temp_3);
         if(_loc2_ || Boolean(this))
         {
            §§push(Boolean(§§pop()));
         }
         loop2:
         while(true)
         {
            loop3:
            while(true)
            {
               loop4:
               while(true)
               {
                  if(!§§pop())
                  {
                     while(true)
                     {
                        if(_loc2_)
                        {
                           addr0342:
                           §§pop();
                           if(_loc1_)
                           {
                              break loop4;
                           }
                           §§push(this._logoAlign);
                           if(_loc1_ && Boolean(this))
                           {
                              break loop3;
                           }
                           §§push(§§pop() == StageAlign.BOTTOM);
                           if(!(_loc2_ || _loc1_))
                           {
                              break;
                           }
                        }
                        addr036d:
                        §§push(Boolean(§§pop()));
                        if(_loc2_)
                        {
                           break;
                        }
                        break loop2;
                     }
                  }
                  addr0373:
                  var _temp_8:* = §§pop();
                  §§push(_temp_8);
                  if(!Boolean(_temp_8))
                  {
                     §§pop();
                     if(_loc2_)
                     {
                        §§push(this._logoAlign);
                        break loop3;
                     }
                     break;
                  }
                  break loop2;
               }
               §§goto(addr039c);
            }
            §§push(§§pop() == StageAlign.BOTTOM_RIGHT);
            if(_loc2_ || _loc2_)
            {
               addr0397:
               §§push(Boolean(§§pop()));
            }
            break;
         }
         if(§§pop())
         {
            this.logo.y = Math.round(this._height - this._logoVerticalMargin - this.logo.height);
            addr039c:
         }
         addr03bf:
      }
      
      public function get interactive() : Boolean
      {
         return this._interactive;
      }
      
      public function set interactive(param1:Boolean) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               if(!(_loc3_ && Boolean(_loc3_)))
               {
                  while(true)
                  {
                     §§push(this._interactive);
                     if(_loc2_)
                     {
                        if(§§pop() == param1)
                        {
                           break loop1;
                        }
                        if(_loc3_)
                        {
                           break;
                        }
                        if(stage == null)
                        {
                           break loop0;
                        }
                        if(!_loc2_)
                        {
                           break;
                        }
                        §§push(param1);
                     }
                     if(§§pop())
                     {
                        this.addListeners();
                        break;
                     }
                     this.removeListeners();
                     if(!(_loc3_ && param1))
                     {
                        break loop0;
                     }
                     break loop1;
                  }
               }
               break loop0;
            }
            return;
         }
         this._interactive = param1;
         break loop1;
      }
      
      public function clear() : void
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(!_loc1_)
         {
            this.removeChildren(0);
            if(!_loc1_)
            {
               numDraws = 0;
            }
         }
      }
      
      private function onAddToStage(param1:Event) : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         while(true)
         {
            if(_loc3_ || Boolean(param1))
            {
               if(!this._interactive)
               {
                  break;
               }
               if(_loc2_)
               {
                  break;
               }
            }
            this.addListeners();
            break;
         }
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         while(true)
         {
            if(_loc3_ || _loc2_)
            {
               if(!this._interactive)
               {
                  break;
               }
               if(!_loc3_)
               {
                  break;
               }
            }
            this.removeListeners();
            break;
         }
      }
      
      private function addListeners() : void
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(_loc2_ || Boolean(this))
         {
            stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            stage.addEventListener(MouseEvent.CLICK,this.onClick);
            if(_loc2_ || _loc2_)
            {
               stage.addEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClick);
            }
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            if(_loc2_ || Boolean(this))
            {
               stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
            }
         }
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      private function removeListeners() : void
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         loop0:
         while(true)
         {
            loop1:
            while(true)
            {
               while(true)
               {
                  if(!(_loc2_ && _loc1_))
                  {
                     stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
                     stage.removeEventListener(MouseEvent.CLICK,this.onClick);
                     stage.removeEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClick);
                     if(_loc2_)
                     {
                        break;
                     }
                     stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
                     if(!_loc1_)
                     {
                        break loop1;
                     }
                     stage.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
                     if(!(_loc1_ || _loc1_))
                     {
                        break loop0;
                     }
                  }
                  stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
                  break loop1;
               }
               §§goto(addr00da);
            }
            stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            this.pressedTarget = null;
            if(_loc1_ || Boolean(_loc2_))
            {
               this.clickedTarget = null;
               break;
            }
            break loop2;
         }
         this.overedTarget = null;
         addr00da:
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         this.onMouse(param1);
         if(!_loc3_)
         {
            this.defineTarget();
            loop0:
            while(true)
            {
               if(!(_loc3_ && Boolean(this)))
               {
                  while(true)
                  {
                     if(this.target != null)
                     {
                        if(_loc3_ && _loc2_)
                        {
                           break loop0;
                        }
                        this.propagateEvent(MouseEvent3D.MOUSE_DOWN,this.target,this.branchToVector(this.target,branch));
                        if(_loc3_ && Boolean(this))
                        {
                           break;
                        }
                     }
                     this.pressedTarget = this.target;
                     if(!(_loc3_ && Boolean(param1)))
                     {
                        break;
                     }
                     break loop0;
                  }
               }
               this.target = null;
               break;
            }
         }
      }
      
      private function onMouseWheel(param1:MouseEvent) : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         loop0:
         while(true)
         {
            while(true)
            {
               if(_loc3_ || _loc2_)
               {
                  this.onMouse(param1);
                  if(!_loc3_)
                  {
                     break loop0;
                  }
                  this.defineTarget();
                  if(_loc3_ || Boolean(param1))
                  {
                     if(this.target == null)
                     {
                        break;
                     }
                     if(!(_loc3_ || Boolean(param1)))
                     {
                        break loop0;
                     }
                  }
               }
               this.propagateEvent(MouseEvent3D.MOUSE_WHEEL,this.target,this.branchToVector(this.target,branch));
               if(!(_loc2_ && _loc2_))
               {
                  break;
               }
               break loop0;
            }
            this.target = null;
            break;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         if(_loc3_)
         {
            this.onMouse(param1);
         }
         this.defineTarget();
         while(true)
         {
            if(this.target != null)
            {
               this.propagateEvent(MouseEvent3D.MOUSE_UP,this.target,this.branchToVector(this.target,branch));
               if(this.pressedTarget == this.target)
               {
                  if(_loc2_ && Boolean(this))
                  {
                     break;
                  }
                  this.clickedTarget = this.target;
                  this.propagateEvent(MouseEvent3D.CLICK,this.target,this.branchToVector(this.target,branch));
                  if(!(_loc3_ || _loc2_))
                  {
                     break;
                  }
               }
            }
            this.pressedTarget = null;
            this.target = null;
            break;
         }
      }
      
      private function onDoubleClick(param1:MouseEvent) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         this.onMouse(param1);
         this.defineTarget();
         loop0:
         while(true)
         {
            while(true)
            {
               if(_loc2_)
               {
                  if(this.target == null)
                  {
                     break;
                  }
                  this.propagateEvent(MouseEvent3D.MOUSE_UP,this.target,this.branchToVector(this.target,branch));
                  if(!(_loc2_ || Boolean(param1)))
                  {
                     break loop0;
                  }
               }
               if(this.pressedTarget == this.target)
               {
                  if(!_loc3_)
                  {
                     while(true)
                     {
                        §§push(this);
                        if(!_loc3_)
                        {
                           loop3:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(this.clickedTarget == this.target);
                                 if(_loc2_)
                                 {
                                    §§push(Boolean(§§pop()));
                                    if(_loc2_ || _loc2_)
                                    {
                                       var _temp_3:* = §§pop();
                                       §§push(_temp_3);
                                       §§push(_temp_3);
                                       if(!(_loc3_ && Boolean(_loc3_)))
                                       {
                                          §§push(Boolean(§§pop()));
                                       }
                                       if(!§§pop())
                                       {
                                          break loop3;
                                       }
                                       if(_loc3_)
                                       {
                                          break loop3;
                                       }
                                    }
                                    §§pop();
                                    if(!_loc2_)
                                    {
                                       break;
                                    }
                                    §§push(this.target.doubleClickEnabled);
                                    if(!_loc2_)
                                    {
                                       break loop3;
                                    }
                                 }
                                 §§push(Boolean(§§pop()));
                                 break loop3;
                              }
                           }
                           if(§§pop())
                           {
                              break loop4;
                           }
                           §§push(MouseEvent3D.CLICK);
                           if(_loc2_)
                           {
                              §§push(§§pop());
                           }
                           break;
                        }
                        §§push(MouseEvent3D.DOUBLE_CLICK);
                        if(!(_loc3_ && Boolean(this)))
                        {
                           §§push(§§pop());
                           if(_loc3_)
                           {
                           }
                        }
                        break;
                     }
                     §§pop().propagateEvent(§§pop(),this.target,this.branchToVector(this.target,branch));
                     break;
                  }
                  addr00fe:
                  this.pressedTarget = null;
                  break loop0;
               }
               break;
            }
            this.clickedTarget = null;
            §§goto(addr00fe);
         }
         this.target = null;
      }
      
      alternativa3d function onMouseMove(param1:MouseEvent = null) : void
      {
         §§push(false);
         var _loc8_:Boolean = true;
         var _loc9_:* = §§pop();
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:Object3D = null;
         loop4:
         while(true)
         {
            if(param1 != null)
            {
               this.onMouse(param1);
               if(!_loc8_)
               {
                  break;
               }
            }
            this.defineTarget();
            while(true)
            {
               §§push(param1 == null);
               if(_loc8_)
               {
                  var _temp_1:* = !§§pop();
                  §§push(_temp_1);
                  §§push(_temp_1);
                  if(_loc8_)
                  {
                     §§push(Boolean(§§pop()));
                  }
                  if(!§§pop())
                  {
                     break;
                  }
                  if(_loc8_)
                  {
                     §§pop();
                     §§push(this.target == null);
                  }
               }
               §§push(!§§pop());
               if(_loc8_)
               {
                  §§push(Boolean(§§pop()));
               }
               break;
            }
            loop6:
            while(true)
            {
               if(§§pop())
               {
                  this.propagateEvent(MouseEvent3D.MOUSE_MOVE,this.target,this.branchToVector(this.target,branch));
                  if(_loc9_)
                  {
                     break;
                  }
               }
               loop7:
               while(true)
               {
                  loop8:
                  while(true)
                  {
                     loop9:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(this.overedTarget);
                           if(_loc8_ || Boolean(_loc2_))
                           {
                              if(§§pop() == this.target)
                              {
                                 break;
                              }
                              this.branchToVector(this.target,branch);
                              if(!_loc8_)
                              {
                                 break loop9;
                              }
                              this.branchToVector(this.overedTarget,overedBranch);
                              §§push(int(branch.length));
                              if(!_loc8_)
                              {
                                 break loop8;
                              }
                              _loc2_ = §§pop();
                              if(!(_loc8_ || Boolean(param1)))
                              {
                                 break loop4;
                              }
                              §§push(int(overedBranch.length));
                              if(_loc9_)
                              {
                                 break loop7;
                              }
                              _loc3_ = §§pop();
                              if(!(_loc8_ || Boolean(_loc3_)))
                              {
                                 break loop6;
                              }
                              §§push(this.overedTarget);
                           }
                           loop11:
                           while(true)
                           {
                              loop12:
                              while(true)
                              {
                                 if(§§pop() != null)
                                 {
                                    this.propagateEvent(MouseEvent3D.MOUSE_OUT,this.overedTarget,overedBranch,true,this.target);
                                    break loop6;
                                 }
                                 addr0236:
                                 while(true)
                                 {
                                    if(this.target != null)
                                    {
                                       if(!_loc9_)
                                       {
                                          §§push(0);
                                          if(_loc8_ || Boolean(param1))
                                          {
                                             break loop12;
                                          }
                                          addr031a:
                                          §§push(0);
                                          break loop11;
                                       }
                                       break;
                                    }
                                    §§goto(addr0374);
                                 }
                                 §§goto(addr0384);
                              }
                              addr0255:
                              _loc4_ = §§pop();
                              §§push(0);
                              if(_loc8_ || Boolean(param1))
                              {
                                 _loc5_ = int(§§pop());
                                 while(true)
                                 {
                                 }
                                 addr0318:
                                 §§goto(addr031a);
                                 §§push(_loc4_);
                                 addr0303:
                              }
                              §§push(_loc2_);
                              if(!(_loc8_ || Boolean(param1)))
                              {
                                 break;
                              }
                              if(§§pop() < §§pop())
                              {
                                 _loc7_ = branch[_loc5_];
                                 if(_loc8_)
                                 {
                                    _loc6_ = 0;
                                    loop3:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc6_);
                                          §§push(_loc3_);
                                          if(_loc8_)
                                          {
                                             if(§§pop() >= §§pop())
                                             {
                                                break loop3;
                                             }
                                             if(_loc7_ == overedBranch[_loc6_])
                                             {
                                                break loop3;
                                             }
                                             §§push(int(_loc6_ + 1));
                                             if(_loc9_)
                                             {
                                                break;
                                             }
                                             continue loop3;
                                          }
                                          §§goto(addr02c7);
                                       }
                                       _loc6_ = §§pop();
                                       _loc4_ = §§pop();
                                       §§goto(addr02ef);
                                    }
                                    §§push(_loc6_);
                                    if(!(_loc8_ || Boolean(_loc2_)))
                                    {
                                       break loop15;
                                    }
                                    addr02c7:
                                    if(§§pop() == _loc3_)
                                    {
                                       changedBranch[_loc4_] = _loc7_;
                                       if(_loc8_ || Boolean(this))
                                       {
                                          addr02e3:
                                          §§push(_loc4_);
                                          if(!_loc9_)
                                          {
                                             §§push(int(§§pop() + 1));
                                          }
                                          break loop15;
                                       }
                                    }
                                    addr02ef:
                                    §§push(_loc5_ + 1);
                                    if(_loc8_ || Boolean(_loc2_))
                                    {
                                       §§push(int(§§pop()));
                                    }
                                    _loc5_ = §§pop();
                                    §§goto(addr0303);
                                 }
                                 §§goto(addr02e3);
                              }
                              §§goto(addr0318);
                           }
                           while(true)
                           {
                              if(§§pop() > §§pop())
                              {
                                 changedBranch.length = _loc4_;
                                 if(_loc9_ && Boolean(param1))
                                 {
                                    break;
                                 }
                                 this.propagateEvent(MouseEvent3D.ROLL_OVER,this.target,changedBranch,false,this.overedTarget);
                              }
                              this.propagateEvent(MouseEvent3D.MOUSE_OVER,this.target,branch,true,this.overedTarget);
                              if(_loc8_)
                              {
                                 break;
                              }
                              §§goto(addr0384);
                           }
                           addr0374:
                           this.overedTarget = this.target;
                           if(_loc8_)
                           {
                              break;
                           }
                           §§goto(addr0384);
                        }
                        this.target = null;
                        §§goto(addr0384);
                     }
                     §§goto(addr013a);
                  }
                  _loc5_ = §§pop();
                  break loop4;
               }
               §§push(int(§§pop()));
               if(!(_loc9_ && Boolean(this)))
               {
                  _loc4_ = §§pop();
                  if(_loc9_)
                  {
                     break loop4;
                  }
                  addr013a:
                  §§push(0);
                  if(!_loc8_)
                  {
                     break loop8;
                  }
               }
               §§push(int(§§pop()));
               break loop8;
            }
            §§push(0);
            if(_loc8_)
            {
               break loop7;
            }
            break loop8;
         }
         loop0:
         while(true)
         {
            §§push(_loc5_);
            §§push(_loc3_);
            if(!(_loc8_ || Boolean(_loc2_)))
            {
               break;
            }
            if(§§pop() >= §§pop())
            {
               while(true)
               {
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_loc4_);
                        if(!_loc9_)
                        {
                           §§push(0);
                           if(_loc8_)
                           {
                              break loop0;
                           }
                           break loop11;
                        }
                        §§goto(addr0255);
                     }
                     §§goto(addr0374);
                  }
                  addr0384:
                  return;
               }
               §§goto(addr031a);
            }
            else
            {
               _loc7_ = overedBranch[_loc5_];
               _loc6_ = 0;
               loop1:
               while(true)
               {
                  §§push(_loc6_);
                  §§push(_loc2_);
                  if(_loc8_)
                  {
                     if(§§pop() >= §§pop())
                     {
                        break;
                     }
                     addr01e8:
                     while(true)
                     {
                        if(_loc7_ == branch[_loc6_])
                        {
                           if(!_loc9_)
                           {
                              break loop1;
                           }
                        }
                        else
                        {
                           §§push(int(_loc6_ + 1));
                           if(!(_loc8_ || Boolean(param1)))
                           {
                              continue loop0;
                           }
                           _loc6_ = §§pop();
                           if(_loc8_ || Boolean(_loc2_))
                           {
                              continue loop1;
                           }
                        }
                        addr01d6:
                        addr01d8:
                        §§push(_loc4_ + 1);
                        if(!_loc9_)
                        {
                           §§push(int(§§pop()));
                           if(_loc8_)
                           {
                              _loc4_ = §§pop();
                              break;
                           }
                        }
                        addr01ea:
                        §§push(int(§§pop() + 1));
                        continue loop0;
                     }
                     addr01e8:
                     §§goto(addr01ea);
                  }
                  addr01ba:
                  while(true)
                  {
                     if(§§pop() == §§pop())
                     {
                        changedBranch[_loc4_] = _loc7_;
                        if(!(_loc9_ && Boolean(this)))
                        {
                           §§goto(addr01d6);
                        }
                     }
                     §§goto(addr01e8);
                  }
                  §§goto(addr01ea);
               }
               while(true)
               {
                  §§push(_loc6_);
                  if(_loc8_)
                  {
                     §§goto(addr01ba);
                     §§push(_loc2_);
                  }
                  §§goto(addr01d8);
               }
               §§goto(addr01e8);
            }
         }
         if(§§pop() > §§pop())
         {
            changedBranch.length = _loc4_;
            this.propagateEvent(MouseEvent3D.ROLL_OUT,this.overedTarget,changedBranch,false,this.target);
         }
         §§goto(addr0236);
      }
      
      private function branchToVector(param1:Object3D, param2:Vector.<Object3D>) : Vector.<Object3D>
      {
         var _temp_1:* = true;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = _temp_1;
         §§push(0);
         if(!_loc4_)
         {
            §§push(int(§§pop()));
         }
         var _loc3_:* = §§pop();
         while(true)
         {
            if(param1 == null)
            {
               var _temp_2:* = _loc4_;
               §§push(_temp_2);
               if(!_temp_2)
               {
                  param2.length = _loc3_;
               }
               break;
            }
            param2[_loc3_] = param1;
            if(!_loc4_)
            {
               while(true)
               {
                  §§push(_loc3_);
                  if(_loc5_)
                  {
                     §§push(§§pop() + 1);
                     if(!_loc5_)
                     {
                        break;
                     }
                  }
                  §§push(int(§§pop()));
                  break;
               }
               _loc3_ = §§pop();
               if(!_loc5_)
               {
                  break;
               }
            }
            param1 = param1._parent;
         }
         return param2;
      }
      
      private function propagateEvent(param1:String, param2:Object3D, param3:Vector.<Object3D>, param4:Boolean = true, param5:Object3D = null) : void
      {
         var _temp_1:* = true;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = _temp_1;
         var _loc7_:Object3D = null;
         var _loc8_:Vector.<Function> = null;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:MouseEvent3D = null;
         var _loc6_:int = int(param3.length);
         if(!(_loc13_ && Boolean(param2)))
         {
            §§push(_loc6_);
            if(!(_loc13_ && Boolean(param2)))
            {
               §§push(int(§§pop() - 1));
            }
            _loc10_ = §§pop();
         }
         loop0:
         while(true)
         {
            §§push(_loc10_);
            if(_loc13_ && Boolean(this))
            {
               break loop2;
            }
            §§push(0);
            if(!_loc13_)
            {
               if(§§pop() <= §§pop())
               {
                  if(_loc14_ || Boolean(param3))
                  {
                     §§push(0);
                     if(!_loc14_)
                     {
                        break;
                     }
                     §§push(int(§§pop()));
                     if(_loc13_ && Boolean(param3))
                     {
                        break;
                     }
                     _loc10_ = §§pop();
                     if(_loc14_)
                     {
                        while(true)
                        {
                           §§push(_loc10_);
                           break loop0;
                        }
                        addr0429:
                     }
                  }
                  §§goto(addr0431);
               }
               _loc7_ = param3[_loc10_];
               loop7:
               while(true)
               {
                  if(!(_loc13_ && Boolean(param2)))
                  {
                     if(_loc7_.captureListeners == null)
                     {
                        break;
                     }
                     if(!_loc14_)
                     {
                        continue loop0;
                     }
                  }
                  _loc8_ = _loc7_.captureListeners[param1];
                  loop8:
                  while(true)
                  {
                     if(!_loc13_)
                     {
                        if(_loc8_ == null)
                        {
                           break loop7;
                        }
                        if(_loc12_ == null)
                        {
                           _loc12_ = new MouseEvent3D(param1,param4,param5,this.altKey,this.ctrlKey,this.shiftKey,this.buttonDown,this.delta);
                           while(true)
                           {
                              if(_loc14_ || Boolean(this))
                              {
                                 _loc12_._target = param2;
                                 if(!_loc14_)
                                 {
                                    break;
                                 }
                              }
                              _loc12_.calculateLocalRay(mouseX,mouseY,param2,this.camera);
                              break;
                           }
                        }
                        _loc12_._currentTarget = _loc7_;
                        loop10:
                        while(true)
                        {
                           while(true)
                           {
                              if(_loc14_ || Boolean(param3))
                              {
                                 _loc12_._eventPhase = 1;
                                 _loc9_ = int(_loc8_.length);
                                 if(_loc13_)
                                 {
                                    break;
                                 }
                                 §§push(0);
                                 if(!_loc14_)
                                 {
                                    break loop10;
                                 }
                                 _loc11_ = §§pop();
                                 if(!_loc14_)
                                 {
                                    break loop7;
                                 }
                              }
                              continue loop12;
                           }
                           §§push(0);
                           continue loop16;
                        }
                        addr014f:
                        §§push(§§pop() + 1);
                        if(_loc14_ || Boolean(param1))
                        {
                           _loc11_ = int(§§pop());
                           while(true)
                           {
                              loop12:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(_loc11_);
                                    if(_loc14_)
                                    {
                                       §§push(_loc9_);
                                       if(_loc13_)
                                       {
                                          break;
                                       }
                                       if(§§pop() >= §§pop())
                                       {
                                          if(!(_loc13_ && Boolean(this)))
                                          {
                                             break loop11;
                                          }
                                          break loop8;
                                       }
                                       functions[_loc11_] = _loc8_[_loc11_];
                                       if(_loc13_)
                                       {
                                          break loop7;
                                       }
                                       §§push(_loc11_);
                                       if(!(_loc14_ || Boolean(param2)))
                                       {
                                          break loop12;
                                       }
                                       §§goto(addr014f);
                                    }
                                 }
                                 if(§§pop() < §§pop())
                                 {
                                    (functions[_loc11_] as Function).call(null,_loc12_);
                                    §§push(_loc12_.stopImmediate);
                                    if(!(_loc13_ && Boolean(this)))
                                    {
                                       while(true)
                                       {
                                          if(§§pop())
                                          {
                                             if(_loc14_ || Boolean(this))
                                             {
                                                break;
                                             }
                                          }
                                          addr01ce:
                                          §§push(_loc11_);
                                          break loop12;
                                       }
                                       §§goto(addr01cd);
                                    }
                                    addr01e7:
                                    if(§§pop())
                                    {
                                       break loop8;
                                    }
                                    break loop7;
                                 }
                                 addr01e2:
                                 §§goto(addr01e7);
                              }
                              _loc11_ = int(§§pop());
                              §§push(int(§§pop() + 1));
                              if(_loc14_)
                              {
                                 _loc11_ = §§pop();
                                 while(true)
                                 {
                                    §§push(_loc11_);
                                    _loc11_ = §§pop();
                                 }
                                 break;
                                 addr01da:
                              }
                              while(true)
                              {
                                 §§push(_loc9_);
                                 break loop13;
                              }
                              §§goto(addr01da);
                           }
                           break loop0;
                        }
                        _loc11_ = int(§§pop());
                        while(true)
                        {
                           while(true)
                           {
                              while(true)
                              {
                                 if(!_loc13_)
                                 {
                                    §§goto(addr01da);
                                 }
                                 §§goto(addr01ce);
                              }
                              §§goto(addr01e2);
                           }
                           §§goto(addr01e7);
                        }
                        addr01cd:
                        return;
                     }
                     §§goto(addr01da);
                  }
                  return;
               }
               §§push(_loc10_);
               if(_loc14_)
               {
                  §§push(§§pop() - 1);
                  if(!_loc13_)
                  {
                     §§push(int(§§pop()));
                  }
               }
               _loc10_ = §§pop();
               continue;
            }
            if(§§pop() < §§pop())
            {
               _loc7_ = param3[_loc10_];
               if(!(_loc13_ && Boolean(param1)))
               {
                  loop18:
                  while(true)
                  {
                     while(true)
                     {
                        if(_loc7_.bubbleListeners != null)
                        {
                           if(!_loc14_)
                           {
                              break;
                           }
                           _loc8_ = _loc7_.bubbleListeners[param1];
                           if(_loc8_ != null)
                           {
                              if(_loc12_ == null)
                              {
                                 _loc12_ = new MouseEvent3D(param1,param4,param5,this.altKey,this.ctrlKey,this.shiftKey,this.buttonDown,this.delta);
                                 if(_loc14_ || Boolean(param1))
                                 {
                                    _loc12_._target = param2;
                                    if(!_loc13_)
                                    {
                                       _loc12_.calculateLocalRay(mouseX,mouseY,param2,this.camera);
                                    }
                                 }
                              }
                              _loc12_._currentTarget = _loc7_;
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
                                          if(_loc14_ || Boolean(param2))
                                          {
                                             loop24:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   §§push(_loc12_);
                                                   if(!_loc13_)
                                                   {
                                                      §§push(_loc10_);
                                                      if(!(_loc14_ || Boolean(this)))
                                                      {
                                                         break;
                                                      }
                                                      if(§§pop() != 0)
                                                      {
                                                         §§push(3);
                                                         break loop24;
                                                      }
                                                   }
                                                   §§push(2);
                                                   if(!(_loc13_ && Boolean(param3)))
                                                   {
                                                      break;
                                                   }
                                                   break loop24;
                                                }
                                                §§push(uint(§§pop()));
                                                if(_loc13_)
                                                {
                                                }
                                                §§goto(addr0332);
                                             }
                                             addr0332:
                                             §§pop().alternativa3d::_eventPhase = uint(§§pop());
                                             loop26:
                                             while(true)
                                             {
                                                loop27:
                                                while(true)
                                                {
                                                   loop28:
                                                   while(true)
                                                   {
                                                      §§push(int(_loc8_.length));
                                                      if(_loc14_ || Boolean(this))
                                                      {
                                                         _loc9_ = §§pop();
                                                         if(_loc13_)
                                                         {
                                                            break loop23;
                                                         }
                                                         §§push(0);
                                                         if(_loc14_ || Boolean(this))
                                                         {
                                                            _loc11_ = §§pop();
                                                            if(!_loc13_)
                                                            {
                                                               while(true)
                                                               {
                                                                  §§push(_loc11_);
                                                                  if(!(_loc14_ || Boolean(param3)))
                                                                  {
                                                                     break loop28;
                                                                  }
                                                                  §§push(_loc9_);
                                                                  if(_loc13_)
                                                                  {
                                                                     break loop22;
                                                                  }
                                                                  if(§§pop() >= §§pop())
                                                                  {
                                                                     break loop27;
                                                                  }
                                                                  functions[_loc11_] = _loc8_[_loc11_];
                                                                  _loc11_ = §§pop();
                                                               }
                                                               addr0431:
                                                               return;
                                                               addr0388:
                                                            }
                                                            §§push(_loc11_);
                                                            if(!_loc14_)
                                                            {
                                                               break loop26;
                                                            }
                                                            §§push(int(§§pop() + 1));
                                                         }
                                                      }
                                                      _loc11_ = §§pop();
                                                      §§goto(addr0388);
                                                   }
                                                   _loc11_ = int(§§pop());
                                                   if(_loc13_ && Boolean(param3))
                                                   {
                                                      break loop20;
                                                   }
                                                }
                                                §§push(0);
                                                if(_loc14_ || Boolean(this))
                                                {
                                                   break loop28;
                                                }
                                                break loop21;
                                             }
                                             §§goto(addr03f8);
                                          }
                                          §§goto(addr03fb);
                                       }
                                       return;
                                    }
                                    if(§§pop() >= §§pop())
                                    {
                                       break loop20;
                                    }
                                    (functions[_loc11_] as Function).call(null,_loc12_);
                                    §§push(_loc12_.stopImmediate);
                                    if(!_loc13_)
                                    {
                                       if(§§pop())
                                       {
                                          break loop23;
                                       }
                                       §§push(_loc11_);
                                       break;
                                    }
                                    §§goto(addr0408);
                                 }
                                 §§push(§§pop() + 1);
                                 if(_loc14_)
                                 {
                                    addr03f8:
                                    §§push(int(§§pop()));
                                 }
                                 _loc11_ = §§pop();
                                 while(true)
                                 {
                                    §§push(_loc11_);
                                    §§push(_loc9_);
                                    break loop22;
                                    _loc11_ = §§pop();
                                 }
                                 §§goto(addr0431);
                                 addr03fb:
                              }
                              addr0408:
                              if(_loc12_.stop)
                              {
                                 break loop18;
                              }
                           }
                        }
                        while(true)
                        {
                           §§push(_loc10_);
                           if(_loc14_)
                           {
                              §§push(§§pop() + 1);
                              if(!_loc14_)
                              {
                                 break;
                              }
                           }
                           §§push(int(§§pop()));
                           break;
                        }
                        _loc10_ = §§pop();
                        break;
                     }
                  }
                  return;
               }
               §§goto(addr0429);
            }
            §§goto(addr0431);
         }
         break loop2;
      }
      
      private function defineTarget() : void
      {
         §§push(false);
         var _loc10_:Boolean = true;
         var _loc11_:* = §§pop();
         var _loc1_:Object3D = null;
         var _loc2_:Object3D = null;
         var _loc3_:Array = null;
         var _loc4_:* = 0;
         var _loc5_:Canvas = null;
         var _loc6_:* = false;
         var _loc7_:DisplayObject = null;
         var _loc8_:Object3D = null;
         var _loc9_:Object3D = null;
         while(true)
         {
            §§push(mouseX >= 0);
            if(!_loc11_)
            {
               §§push(Boolean(§§pop()));
               if(!(_loc10_ || Boolean(this)))
               {
                  break;
               }
            }
            var _temp_2:* = §§pop();
            loop5:
            while(true)
            {
               loop6:
               while(true)
               {
                  while(true)
                  {
                     §§push(_temp_2);
                     §§push(_temp_2);
                     if(!(_loc11_ && Boolean(_loc3_)))
                     {
                        §§push(Boolean(§§pop()));
                        if(_loc10_ || Boolean(this))
                        {
                           if(§§pop())
                           {
                              if(!_loc11_)
                              {
                                 §§pop();
                                 §§push(mouseY >= 0);
                              }
                              §§push(Boolean(§§pop()));
                           }
                           var _temp_33:* = §§pop();
                           §§push(_temp_33);
                           §§push(_temp_33);
                           if(_loc11_ && Boolean(this))
                           {
                              break loop5;
                           }
                        }
                        §§push(Boolean(§§pop()));
                        if(_loc10_ || Boolean(this))
                        {
                           if(§§pop())
                           {
                              if(_loc10_ || Boolean(_loc3_))
                              {
                                 §§pop();
                                 if(_loc11_)
                                 {
                                    break;
                                 }
                                 §§push(mouseX <= this._width);
                                 if(!(_loc10_ || Boolean(this)))
                                 {
                                    break loop6;
                                 }
                              }
                           }
                           var _temp_38:* = §§pop();
                           §§push(_temp_38);
                           §§push(_temp_38);
                           if(!(_loc10_ || Boolean(_loc3_)))
                           {
                              break loop5;
                           }
                        }
                     }
                     §§push(Boolean(§§pop()));
                     break loop5;
                  }
                  addr00f7:
                  §§push(mouseY <= this._height);
                  if(!_loc11_)
                  {
                     break;
                  }
                  §§goto(addr0106);
               }
               §§goto(addr0106);
            }
            if(§§pop())
            {
               if(_loc10_ || Boolean(_loc3_))
               {
                  break;
               }
            }
            addr0106:
            if(§§pop())
            {
               if(!_loc11_)
               {
                  mouse.x = stage.mouseX;
                  if(_loc10_ || Boolean(_loc1_))
                  {
                     mouse.y = stage.mouseY;
                  }
               }
               _loc3_ = stage.getObjectsUnderPoint(mouse);
               if(!_loc11_)
               {
                  _loc4_ = int(_loc3_.length - 1);
               }
               loop0:
               while(_loc4_ >= 0)
               {
                  _loc5_ = null;
                  if(!_loc11_)
                  {
                     §§push(false);
                     if(_loc10_)
                     {
                        §§push(Boolean(§§pop()));
                     }
                     _loc6_ = §§pop();
                  }
                  _loc7_ = _loc3_[_loc4_];
                  loop1:
                  while(_loc7_.parent != stage)
                  {
                     §§push(_loc7_ is Canvas);
                     if(_loc11_ && Boolean(_loc2_))
                     {
                        break loop16;
                     }
                     if(!§§pop())
                     {
                        §§push(_loc7_ is DisplayObjectContainer);
                        if(_loc10_ || Boolean(this))
                        {
                           var _temp_21:* = Boolean(§§pop());
                           loop16:
                           while(true)
                           {
                              loop17:
                              while(true)
                              {
                                 loop18:
                                 while(true)
                                 {
                                    §§push(_temp_21);
                                    §§push(_temp_21);
                                    if(!(_loc11_ && Boolean(this)))
                                    {
                                       loop19:
                                       while(true)
                                       {
                                          §§push(Boolean(§§pop()));
                                          if(!_loc11_)
                                          {
                                             while(true)
                                             {
                                                if(§§pop())
                                                {
                                                   §§pop();
                                                   if(_loc11_ && Boolean(this))
                                                   {
                                                      break;
                                                   }
                                                   §§push(!(_loc7_ as DisplayObjectContainer).mouseChildren);
                                                   if(_loc11_ && Boolean(_loc1_))
                                                   {
                                                      break loop16;
                                                   }
                                                   §§push(Boolean(§§pop()));
                                                }
                                                if(§§pop())
                                                {
                                                   if(_loc10_)
                                                   {
                                                      break;
                                                   }
                                                   break loop17;
                                                }
                                                addr0236:
                                                §§push(_loc7_ is InteractiveObject);
                                                if(!(_loc10_ || Boolean(_loc2_)))
                                                {
                                                   break loop16;
                                                }
                                                var _temp_26:* = §§pop();
                                                §§push(_temp_26);
                                                §§push(_temp_26);
                                                if(!(_loc10_ || Boolean(this)))
                                                {
                                                   break loop19;
                                                }
                                             }
                                             §§push(false);
                                             if(_loc11_)
                                             {
                                                break loop18;
                                             }
                                             _loc6_ = §§pop();
                                             if(!(_loc10_ || Boolean(_loc1_)))
                                             {
                                                break loop17;
                                             }
                                             §§goto(addr0236);
                                          }
                                          §§push(Boolean(§§pop()));
                                          break;
                                       }
                                    }
                                    if(§§pop())
                                    {
                                       if(_loc10_ || Boolean(_loc1_))
                                       {
                                          break;
                                       }
                                    }
                                    addr0287:
                                    if(§§pop())
                                    {
                                       break loop17;
                                    }
                                    _loc7_ = _loc7_.parent;
                                    continue loop1;
                                 }
                                 §§pop();
                                 if(_loc11_ && Boolean(_loc3_))
                                 {
                                    break;
                                 }
                                 §§goto(addr0287);
                                 §§push((_loc7_ as InteractiveObject).mouseEnabled);
                              }
                              §§push(true);
                              break;
                           }
                        }
                        break loop16;
                     }
                     _loc5_ = Canvas(_loc7_);
                     loop7:
                     while(true)
                     {
                        if(_loc10_ || Boolean(this))
                        {
                           break loop1;
                        }
                        addr02d8:
                        _loc2_ = _loc5_.object;
                        while(true)
                        {
                           if(!_loc11_)
                           {
                              if(_loc2_ == null)
                              {
                                 break loop7;
                              }
                              if(!(_loc10_ || Boolean(_loc3_)))
                              {
                                 break;
                              }
                           }
                           if(_loc2_ != null)
                           {
                              break;
                           }
                           break loop7;
                        }
                        _loc8_ = null;
                        _loc9_ = _loc2_;
                        loop9:
                        while(true)
                        {
                           if(_loc10_)
                           {
                              loop2:
                              while(true)
                              {
                                 if(_loc9_ == null)
                                 {
                                    if(!(_loc11_ && Boolean(this)))
                                    {
                                       break;
                                    }
                                    break loop9;
                                 }
                                 §§push(_loc9_ is Object3DContainer);
                                 if(!(_loc11_ && Boolean(_loc2_)))
                                 {
                                    §§push(Boolean(§§pop()));
                                 }
                                 var _temp_11:* = §§pop();
                                 §§push(_temp_11);
                                 §§push(_temp_11);
                                 if(!_loc11_)
                                 {
                                    while(true)
                                    {
                                       §§push(Boolean(§§pop()));
                                       if(!_loc11_)
                                       {
                                          while(true)
                                          {
                                             if(§§pop())
                                             {
                                                if(_loc11_)
                                                {
                                                   break;
                                                }
                                                §§pop();
                                                if(!_loc10_)
                                                {
                                                   break loop2;
                                                }
                                                §§push(!Object3DContainer(_loc9_).mouseChildren);
                                                if(!(_loc10_ || Boolean(_loc2_)))
                                                {
                                                   break;
                                                }
                                                §§push(Boolean(§§pop()));
                                             }
                                             if(§§pop())
                                             {
                                                _loc8_ = null;
                                             }
                                             §§push(_loc8_ == null);
                                             if(_loc10_ || Boolean(_loc3_))
                                             {
                                                §§push(Boolean(§§pop()));
                                             }
                                             break;
                                          }
                                          var _temp_14:* = §§pop();
                                          §§push(_temp_14);
                                          §§push(_temp_14);
                                          if(_loc11_)
                                          {
                                             break;
                                          }
                                       }
                                       §§push(Boolean(§§pop()));
                                       break;
                                    }
                                 }
                                 loop12:
                                 while(true)
                                 {
                                    if(§§pop())
                                    {
                                       while(true)
                                       {
                                          if(!(_loc11_ && Boolean(this)))
                                          {
                                             §§pop();
                                             if(!_loc10_)
                                             {
                                                break loop12;
                                             }
                                             §§push(_loc9_.mouseEnabled);
                                             if(!_loc10_)
                                             {
                                                break;
                                             }
                                          }
                                          §§push(Boolean(§§pop()));
                                          break;
                                       }
                                    }
                                    if(§§pop())
                                    {
                                       break;
                                    }
                                    continue loop2;
                                 }
                                 _loc8_ = _loc9_;
                                 _loc9_ = _loc9_._parent;
                              }
                              if(_loc8_ == null)
                              {
                                 break loop7;
                              }
                              if(!(_loc10_ || Boolean(_loc2_)))
                              {
                                 break;
                              }
                           }
                           if(this.target != null)
                           {
                              break;
                           }
                           addr0459:
                           _loc1_ = _loc2_;
                           if(_loc10_)
                           {
                              this.target = _loc8_;
                           }
                           if(_loc1_ == this.target)
                           {
                              addr0461:
                              break loop0;
                           }
                           break loop7;
                        }
                        _loc9_ = _loc8_;
                        loop14:
                        while(true)
                        {
                           if(!_loc11_)
                           {
                              while(_loc9_ != null)
                              {
                                 if(_loc9_ == this.target)
                                 {
                                    if(!_loc11_)
                                    {
                                       _loc1_ = _loc2_;
                                       if(!(_loc11_ && Boolean(_loc2_)))
                                       {
                                          this.target = _loc8_;
                                          if(_loc10_ || Boolean(_loc1_))
                                          {
                                             break;
                                          }
                                       }
                                       break loop14;
                                    }
                                    break;
                                 }
                                 _loc9_ = _loc9_._parent;
                              }
                           }
                           §§goto(addr0459);
                        }
                        §§goto(addr0461);
                     }
                     while(true)
                     {
                        §§push(_loc4_);
                        if(!_loc11_)
                        {
                           §§push(§§pop() - 1);
                           if(_loc11_ && Boolean(_loc2_))
                           {
                              break;
                           }
                        }
                        §§push(int(§§pop()));
                        break;
                     }
                     _loc4_ = §§pop();
                     continue loop0;
                  }
                  if(_loc6_)
                  {
                     if(!_loc11_)
                     {
                        break;
                     }
                     continue;
                  }
                  if(_loc5_ != null)
                  {
                     if(_loc11_ && Boolean(_loc2_))
                     {
                        continue;
                     }
                     §§goto(addr02d8);
                  }
                  §§goto(addr0465);
               }
            }
            return;
         }
         §§pop();
         §§goto(addr00f7);
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         while(true)
         {
            if(!(_loc3_ && _loc2_))
            {
               this.altKey = param1.altKey;
               if(_loc2_ || Boolean(_loc3_))
               {
                  this.ctrlKey = param1.ctrlKey;
                  if(!_loc2_)
                  {
                     break;
                  }
               }
            }
            this.shiftKey = param1.shiftKey;
            if(!_loc3_)
            {
               this.buttonDown = param1.buttonDown;
               if(_loc2_)
               {
                  break;
               }
               §§goto(addr006d);
            }
            break;
         }
         this.delta = param1.delta;
         addr006d:
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         this.altKey = param1.altKey;
         this.ctrlKey = param1.ctrlKey;
         this.shiftKey = param1.shiftKey;
         loop0:
         while(true)
         {
            while(true)
            {
               if(!_loc3_)
               {
                  loop2:
                  while(true)
                  {
                     loop3:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(this.ctrlKey);
                           if(!_loc3_)
                           {
                              §§push(Boolean(§§pop()));
                              if(_loc2_ || Boolean(param1))
                              {
                                 var _temp_10:* = §§pop();
                                 §§push(_temp_10);
                                 §§push(_temp_10);
                                 if(_loc2_)
                                 {
                                    §§push(Boolean(§§pop()));
                                    if(_loc3_)
                                    {
                                       break;
                                    }
                                 }
                                 if(!§§pop())
                                 {
                                    break loop3;
                                 }
                                 if(_loc3_)
                                 {
                                    break loop2;
                                 }
                                 §§pop();
                                 §§push(this.shiftKey);
                              }
                              else
                              {
                                 §§goto(addr00b0);
                              }
                           }
                           §§push(Boolean(§§pop()));
                           if(_loc2_ || Boolean(param1))
                           {
                              break loop3;
                           }
                           break loop5;
                        }
                        §§goto(addr00bf);
                     }
                     var _temp_2:* = §§pop();
                     §§push(_temp_2);
                     §§push(_temp_2);
                     if(!(_loc2_ || _loc2_))
                     {
                        break loop4;
                     }
                     §§push(Boolean(§§pop()));
                     if(!(_loc2_ || Boolean(param1)))
                     {
                        break loop4;
                     }
                     loop5:
                     while(true)
                     {
                        while(true)
                        {
                           if(§§pop())
                           {
                              §§pop();
                              if(_loc3_)
                              {
                                 break;
                              }
                              §§push(param1.keyCode == Keyboard.F1);
                              if(_loc3_ && Boolean(_loc3_))
                              {
                                 break loop5;
                              }
                           }
                           addr00b0:
                           var _temp_6:* = §§pop();
                           §§push(_temp_6);
                           §§push(_temp_6);
                           if(!(_loc3_ && Boolean(_loc3_)))
                           {
                              break loop4;
                           }
                           addr00bf:
                           if(§§pop())
                           {
                              if(!(_loc3_ && Boolean(_loc3_)))
                              {
                                 break loop2;
                              }
                           }
                           break loop5;
                        }
                     }
                     §§goto(addr00e1);
                  }
                  §§pop();
                  if(_loc2_)
                  {
                     addr00e1:
                     §§push(this.bitmap == null);
                     if(!_loc3_)
                     {
                        §§push(Boolean(§§pop()));
                     }
                     if(!§§pop())
                     {
                        break;
                     }
                     if(!(_loc2_ || _loc2_))
                     {
                        break loop0;
                     }
                     this.bitmap = new Bitmap(Logo.image);
                  }
               }
               this.bitmap.x = Math.round((this._width - this.bitmap.width) / 2);
               this.bitmap.y = Math.round((this._height - this.bitmap.height) / 2);
               break loop0;
            }
            return;
         }
         super.addChild(this.bitmap);
         setTimeout(this.removeBitmap,2048);
         break loop1;
      }
      
      private function removeBitmap() : void
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(_loc2_ || Boolean(this))
         {
            if(this.bitmap != null)
            {
               if(_loc2_)
               {
                  super.removeChild(this.bitmap);
                  if(!_loc1_)
                  {
                     this.bitmap = null;
                  }
               }
            }
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         while(true)
         {
            if(!_loc3_)
            {
               this.altKey = param1.altKey;
               if(_loc2_)
               {
                  this.ctrlKey = param1.ctrlKey;
                  if(!(_loc2_ || Boolean(param1)))
                  {
                     break;
                  }
               }
            }
            this.shiftKey = param1.shiftKey;
            break;
         }
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         while(true)
         {
            if(!_loc3_)
            {
               this._width = param1;
               if(_loc3_ && Boolean(this))
               {
                  break;
               }
            }
            this.resizeLogo();
            break;
         }
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(param1:Number) : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         if(_loc3_)
         {
            this._height = param1;
            if(!(_loc2_ && _loc2_))
            {
               this.resizeLogo();
            }
         }
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error("Unsupported operation.");
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error("Unsupported operation.");
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         throw new Error("Unsupported operation.");
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         throw new Error("Unsupported operation.");
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         throw new Error("Unsupported operation.");
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         throw new Error("Unsupported operation.");
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         throw new Error("Unsupported operation.");
      }
      
      override public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         throw new Error("Unsupported operation.");
      }
      
      override public function swapChildrenAt(param1:int, param2:int) : void
      {
         throw new Error("Unsupported operation.");
      }
      
      override public function getChildByName(param1:String) : DisplayObject
      {
         throw new Error("Unsupported operation.");
      }
      
      override public function contains(param1:DisplayObject) : Boolean
      {
         throw new Error("Unsupported operation.");
      }
      
      override alternativa3d function getChildCanvas(param1:Boolean, param2:Boolean, param3:Object3D = null, param4:Number = 1, param5:String = "normal", param6:ColorTransform = null, param7:Array = null) : Canvas
      {
         §§push(false);
         var _loc12_:Boolean = true;
         var _loc13_:* = §§pop();
         var _loc8_:Canvas = null;
         var _loc9_:DisplayObject = null;
         loop0:
         while(true)
         {
            while(true)
            {
               §§push(_numChildren > numDraws);
               if(_loc12_)
               {
                  §§push(Boolean(§§pop()));
                  if(!_loc12_)
                  {
                     break;
                  }
               }
               var _temp_15:* = §§pop();
               §§push(_temp_15);
               §§push(_temp_15);
               if(_loc12_ || param1)
               {
                  §§push(Boolean(§§pop()));
               }
               if(§§pop())
               {
                  break;
               }
               addr00cc:
               if(§§pop())
               {
                  super.removeChild(_loc9_);
                  if(!_loc12_)
                  {
                     while(true)
                     {
                        §§push(this);
                        §§push(_numChildren - 1);
                        if(!(_loc13_ && Boolean(this)))
                        {
                           §§push(§§pop() - numDraws);
                        }
                        while(true)
                        {
                           _loc9_ = §§pop().super.getChildAt(§§pop());
                           §§push(_loc9_ is Canvas);
                           if(!(_loc13_ && param1))
                           {
                              §§push(!§§pop());
                              if(!(_loc12_ || Boolean(this)))
                              {
                                 break;
                              }
                           }
                           §§push(Boolean(§§pop()));
                           break;
                        }
                        §§goto(addr00cc);
                     }
                     break loop0;
                     addr007f:
                  }
                  var _loc10_:* = §§findproperty(alternativa3d::_numChildren);
                  var _loc11_:Number = _loc10_.alternativa3d::_numChildren - 1;
                  if(!_loc13_)
                  {
                     _loc10_.alternativa3d::_numChildren = _loc11_;
                  }
                  if(_loc12_)
                  {
                     continue;
                  }
                  addr01cd:
                  _loc8_ = collector[--collectorLength];
                  addr019b:
                  while(true)
                  {
                     if(!(_loc13_ && param1))
                     {
                        super.addChildAt(_loc8_,0);
                        if(_loc13_ && Boolean(this))
                        {
                           break;
                        }
                     }
                     _loc10_ = §§findproperty(alternativa3d::_numChildren);
                     _loc11_ = _loc10_.alternativa3d::_numChildren + 1;
                     if(_loc12_)
                     {
                        _loc10_.alternativa3d::_numChildren = _loc11_;
                     }
                     break;
                  }
                  addr0211:
                  _loc8_.object = param3;
                  _loc8_.modifiedGraphics = param1;
                  continue loop4;
               }
               loop12:
               while(true)
               {
                  if(!(_loc13_ && Boolean(this)))
                  {
                     while(true)
                     {
                        if(_numChildren > numDraws++)
                        {
                           if(!_loc13_)
                           {
                              addr0101:
                              _loc8_ = _loc9_ as Canvas;
                              loop14:
                              while(true)
                              {
                                 if(!(_loc13_ && Boolean(this)))
                                 {
                                    loop15:
                                    while(true)
                                    {
                                       loop16:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc8_.modifiedGraphics);
                                             if(_loc12_ || param2)
                                             {
                                                if(§§pop())
                                                {
                                                   if(_loc13_)
                                                   {
                                                      break;
                                                   }
                                                   _loc8_.gfx.clear();
                                                }
                                                var _temp_33:* = _loc8_._numChildren > 0;
                                                §§push(_temp_33);
                                                §§push(_temp_33);
                                                if(!(_loc13_ && Boolean(param3)))
                                                {
                                                   §§push(Boolean(§§pop()));
                                                }
                                                if(!§§pop())
                                                {
                                                   break loop16;
                                                }
                                                §§pop();
                                                if(!(_loc12_ || param1))
                                                {
                                                   break loop14;
                                                }
                                                §§push(param2);
                                                if(_loc13_ && Boolean(this))
                                                {
                                                   break loop15;
                                                }
                                             }
                                             §§push(!§§pop());
                                             if(!_loc13_)
                                             {
                                                break loop16;
                                             }
                                             break loop15;
                                          }
                                       }
                                       if(§§pop())
                                       {
                                          _loc8_.removeChildren(0);
                                       }
                                       break loop12;
                                    }
                                    if(§§pop())
                                    {
                                       _loc8_.blendMode = "normal";
                                       continue loop5;
                                    }
                                 }
                                 if(param6 != null)
                                 {
                                    if(!_loc13_)
                                    {
                                       param6.alphaMultiplier = param4;
                                       if(_loc12_)
                                       {
                                          _loc8_.transform.colorTransform = param6;
                                          if(_loc12_ || param2)
                                          {
                                             _loc8_.modifiedColorTransform = true;
                                          }
                                       }
                                       break loop5;
                                    }
                                    break;
                                 }
                                 if(_loc8_.modifiedColorTransform)
                                 {
                                    if(!_loc13_)
                                    {
                                       break loop4;
                                    }
                                    _loc8_.modifiedColorTransform = false;
                                    if(_loc12_)
                                    {
                                       break loop5;
                                    }
                                    _loc8_.filters = param7;
                                    _loc8_.modifiedFilters = true;
                                    if(_loc12_ || param2)
                                    {
                                    }
                                    break;
                                 }
                                 break loop5;
                              }
                              §§push(_loc8_);
                              §§push(this._width);
                              if(_loc12_ || Boolean(param3))
                              {
                                 §§push(§§pop() / 2);
                              }
                              §§pop().x = §§pop();
                              §§push(_loc8_);
                              §§push(this._height);
                              if(!_loc13_)
                              {
                                 §§push(§§pop() / 2);
                              }
                              §§pop().y = §§pop();
                              break loop0;
                           }
                        }
                        else if(collectorLength <= 0)
                        {
                           §§push(new Canvas());
                           break;
                        }
                        §§goto(addr019b);
                     }
                     §§goto(addr01cd);
                  }
                  §§goto(addr0101);
               }
               §§goto(addr0211);
            }
            §§pop();
            if(!_loc13_)
            {
               §§goto(addr007f);
            }
            §§goto(addr0101);
         }
         return _loc8_;
      }
      
      override alternativa3d function removeChildren(param1:int) : void
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         var _loc2_:Canvas = null;
         loop0:
         while(_numChildren > param1)
         {
            _loc2_ = super.removeChildAt(0) as Canvas;
            if(_loc2_ != null)
            {
               _loc2_.object = null;
               _loc2_.x = 0;
               while(true)
               {
                  if(!(_loc6_ && Boolean(param1)))
                  {
                     _loc2_.y = 0;
                     if(_loc2_.modifiedGraphics)
                     {
                        _loc2_.gfx.clear();
                        if(_loc6_)
                        {
                           break;
                        }
                     }
                     if(_loc2_._numChildren > 0)
                     {
                        _loc2_.removeChildren(0);
                     }
                  }
                  collector[collectorLength++] = _loc2_;
                  if(!_loc6_)
                  {
                     break;
                  }
                  continue loop0;
               }
            }
            var _loc3_:* = §§findproperty(alternativa3d::_numChildren);
            var _loc4_:Number = _loc3_.alternativa3d::_numChildren - 1;
            if(_loc7_ || Boolean(param1))
            {
               _loc3_.alternativa3d::_numChildren = _loc4_;
            }
         }
      }
   }
}

import flash.display.BitmapData;
import flash.display.Shape;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.BitmapFilterQuality;
import flash.filters.GlowFilter;
import flash.net.URLRequest;
import flash.net.navigateToURL;

class Logo extends Shape
{
   
   public static const image:BitmapData = createBMP();
   
   private var border:int = 5;
   
   private var over:Boolean = false;
   
   private var press:Boolean;
   
   public function Logo()
   {
      super();
      graphics.beginBitmapFill(image,null,false,true);
      graphics.drawRect(0,0,image.width,image.height);
      addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
      addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
   }
   
   private static function createBMP() : BitmapData
   {
      var _loc1_:BitmapData = new BitmapData(103,22,true,0);
      _loc1_.setVector(_loc1_.rect,Vector.<uint>([0,0,0,0,0,0,0,0,0,0,0,0,0,0,1040187392,2701131776,2499805184,738197504,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2516582400,4278190080,2516582400,0,0,0,0,2516582400,4278190080,2516582400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,771751936,2533359616,4282199055,4288505883,4287716373,4280949511,2298478592,234881024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4278190080,4294892416,4278190080,0,0,0,0,4278190080,4294892416,4278190080,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1728053248,4279504646,4287917866,4294285341,4294478345,4294478346,4293626391,4285810708,4278387201,1291845632,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2516582400,4278190080,4278190080,4278190080,2516582400,0,2516582400,4278190080,4278190080,4278190080,2516582400,2516582400,4278190080,2516582400,2516582400,4278190080,2516582400
      ,2516582400,4278190080,2516582400,2516582400,4278190080,4278190080,4278190080,2516582400,0,0,2516582400,4278190080,2516582400,2516582400,4278190080,4278190080,4278190080,2516582400,0,2516582400,4278190080,4278190080,4278190080,4294892416,4278190080,0,0,0,0,4278190080,4294892416,4278190080,4278190080,4278190080,2516582400,2516582400,4278190080,2516582400,0,2516582400,4278190080,2516582400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2197815296,4280753934,4291530288,4294412558,4294411013,4294411784,4294411784,4294411271,4294411790,4289816858,4279635461,1711276032,0,0,0,0,0,0,0,0,0,0,0,0,0,2516582400,4278190080,4294892416,4294892416,4294892416,4278190080,2516582400,4278190080,4294892416,4294892416,4294892416,4278190080,4278190080,4294892416,4278190080,4278190080,4294892416,4278190080,4278190080,4294892416,4278190080,4278190080,4294892416,4294892416,4294892416,4278190080,2516582400,2516582400,4278190080,4294892416,4278190080,4278190080,4294892416,4294892416,4294892416,4278190080,2516582400,4278190080
      ,4294892416,4294892416,4294892416,4294892416,4278190080,0,0,0,0,4278190080,4294892416,4294892416,4294892416,4294892416,4278190080,4278190080,4294892416,4278190080,0,4278190080,4294892416,4278190080,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2332033024,4283252258,4293301553,4294409478,4294409991,4294410761,4294476552,4294476296,4294410249,4294344200,4294343945,4291392799,4280752908,2030043136,0,0,0,0,0,0,0,0,0,0,0,0,4278190080,4294892416,4278190080,4278190080,4278190080,4294892416,4278190080,4294892416,4278190080,4278190080,4278190080,4294892416,4278190080,4294892416,4278190080,4278190080,4294892416,4278190080,4278190080,4294892416,4278190080,4294892416,4278190080,4278190080,4278190080,4294892416,4278190080,4278190080,4294892416,4278190080,4278190080,4294892416,4278190080,4278190080,4278190080,4294892416,4278190080,4294892416,4278190080,4278190080,4278190080,4278190080,2516582400,0,0,0,0,2516582400,4278190080,4278190080,4278190080,4278190080,4294892416,4278190080,4294892416,4278190080,0,4278190080
      ,4294892416,4278190080,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2281701376,4283186471,4293692972,4294276097,4294343176,4294409225,4294475017,4293554194,4293817874,4294408967,4294342921,4294342664,4294341895,4292640548,4281936662,2197815296,0,0,0,0,0,0,0,0,0,0,0,4278190080,4294892416,4278190080,0,4278190080,4294892416,4278190080,4294892416,4278190080,0,4278190080,4294892416,4278190080,4294892416,4278190080,4278190080,4294892416,4278190080,4278190080,4294892416,4278190080,4294892416,4278190080,4294892416,4294892416,4294892416,4278190080,4294892416,4278190080,2516582400,4278190080,4294892416,4278190080,4294892416,4294892416,4294892416,4278190080,4294892416,4278190080,0,4278190080,4294892416,4278190080,0,0,0,0,4278190080,4294892416,4278190080,0,4278190080,4294892416,4278190080,4294892416,4278190080,0,4278190080,4294892416,4278190080,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2030043136,4282068512,4293561399,4294208769,4294210313,4294407689,4294210313,4290530057,4281734151,4282851341,4291913754,4294275848,4294275591
      ,4294275592,4294208517,4293164329,4282133785,2080374784,0,0,0,0,0,0,0,0,0,0,2516582400,4278190080,4278190080,4278190080,4278190080,4294892416,4278190080,4294892416,4278190080,4278190080,4278190080,4294892416,4278190080,4278190080,4294892416,4278190080,4278190080,4294892416,4278190080,4294892416,4278190080,4294892416,4278190080,4278190080,4278190080,4278190080,4278190080,4294892416,4278190080,0,4278190080,4294892416,4278190080,4278190080,4278190080,4278190080,4278190080,4294892416,4278190080,4278190080,4278190080,4294892416,4278190080,0,0,0,0,4278190080,4294892416,4278190080,4278190080,4278190080,4294892416,4278190080,4294892416,4278190080,4278190080,4278190080,4278190080,2516582400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1627389952,4280293393,4292577349,4294272769,4294208264,4294471177,4293617417,4286918406,4279502337,1912602624,2030043136,4280422919,4289945382,4294009867,4293875462,4293743369,4293610244,4292440624,4280950288,1761607680,0,0,0,0,0,0,0,0,0,4278190080,4294892416,4294892416,4294892416,4294892416
      ,4278190080,2516582400,4278190080,4294892416,4294892416,4294892416,4278190080,2516582400,2516582400,4278190080,4294892416,4278190080,4278190080,4294892416,4294892416,4278190080,4278190080,4294892416,4294892416,4294892416,4278190080,4278190080,4294892416,4278190080,0,2516582400,4278190080,4294892416,4294892416,4294892416,4278190080,2516582400,4278190080,4294892416,4294892416,4294892416,4278190080,2516582400,0,0,0,0,2516582400,4278190080,4294892416,4294892416,4294892416,4278190080,2516582400,4278190080,4294892416,4294892416,4294892416,4294892416,4278190080,0,0,0,0,0,0,0,0,0,0,0,0,0,788529152,4279044359,4291067728,4294075141,4294075143,4294338057,4293352968,4284490243,4278321408,1291845632,0,0,1476395008,4278781187,4288236848,4293610511,4293609221,4293610249,4293609989,4291261239,4279241478,1291845632,0,0,0,0,0,0,0,0,4278190080,4294892416,4278190080,4278190080,4278190080,2516582400,0,2516582400,4278190080,4278190080,4278190080,2516582400,0,0,2516582400,4278190080,2516582400,2516582400,4278190080
      ,4278190080,2516582400,2516582400,4278190080,4278190080,4278190080,2516582400,2516582400,4278190080,2516582400,0,0,2516582400,4278190080,4278190080,4278190080,2516582400,0,2516582400,4278190080,4278190080,4278190080,2516582400,0,0,0,0,0,0,2516582400,4278190080,4278190080,4278190080,2516582400,0,2516582400,4278190080,4278190080,4278190080,4294892416,4278190080,0,0,0,0,0,0,0,0,0,0,0,0,0,2550136832,4287849288,4294009360,4293941509,4294007817,4293679113,4284620803,2852126720,822083584,0,0,0,0,989855744,2751463424,4288172857,4293610511,4293543429,4293543943,4293611019,4289621050,4278649858,620756992,0,0,0,0,0,0,0,4278190080,4294892416,4278190080,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4278190080,4294892416,4294892416,4294892416,4278190080,2516582400,0,0,0,0,0,0,0,0,0,0,0,0,2030043136,4283380775,4294011945,4293873409,4293939977,4293808649,4285867012,4278649344,1090519040,0,0,0,0,0,0,939524096,4278255872,4288764223,4293609227,4293543175
      ,4293542917,4293677843,4287124784,2516582400,0,0,0,0,0,0,0,2516582400,4278190080,2516582400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2516582400,4278190080,4278190080,4278190080,2516582400,0,0,0,0,0,0,0,0,0,0,0,0,805306368,4279569674,4292243009,4293609217,4293676041,4293937929,4288687621,4279305216,1543503872,0,0,0,0,0,0,0,452984832,2214592512,4278781188,4290602054,4293410821,4293477384,4293476868,4293745950,4283773466,2181038080,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2566914048,4287714107,4293543949,4293542919,4293673225,4291834377,4280879106,2080374784,0,0,0,0,0,0,0,1962934272,4279898124,4286467380,4278846980,4280686612,4292961598,4293343745,4293411081,4293476100,4292566822,4280357128,1140850688,0,0,0,0,0,0,0,0,0,0,0,0,0,2516582400,4278190080,2516582400,2516582400,4278190080,2516582400,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      ,0,0,0,0,0,0,0,0,0,2516582400,4278190080,2516582400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2516582400,4278190080,4278190080,4278190080,2516582400,0,0,0,0,2516582400,4278190080,2516582400,0,0,1207959552,4281539862,4293417771,4293343234,4293277193,4292947466,4284880134,2483027968,0,0,0,0,0,0,989855744,2751463424,4282917657,4291648314,4293346067,4288303409,2734686208,4284299053,4293479197,4293343493,4293409801,4293410569,4288759582,2902458368,0,0,0,0,0,0,0,0,0,0,0,0,0,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4278190080,4294967295,4278190080,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4278190080,4293141248,4293141248,4293141248,4278190080,2516582400,0,0,0,4278190080,4293141248,4278190080,0,0,2969567232,4289023795,4293211656,4293144328,4293143305,4290389514,4279108353,536870912,0,0,0,335544320,1543503872,2986344448,4281076999,4287967257,4293213977,4293078532,4293078275,4293412634,4284428061,2986344448,4289023285,4293277192,4293343240,4293277191
      ,4293412372,4282850829,1711276032,0,0,0,0,0,0,0,2516582400,4278190080,2516582400,0,0,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,2516582400,4278190080,4278190080,4278190080,2516582400,0,0,2516582400,4278190080,2516582400,4278190080,4278190080,4278190080,4278190080,2516582400,0,0,0,2516582400,4278190080,2516582400,0,2516582400,4278190080,4294967295,4278190080,4278190080,2516582400,4278190080,2516582400,0,0,0,2516582400,4278190080,2516582400,0,2516582400,4278190080,2516582400,0,0,2516582400,4278190080,4278190080,4278190080,4293141248,4278190080,2516582400,4278190080,4278190080,4278190080,4293141248,4278190080,0,956301312,4281604366,4293149982,4293077253,4293078025,4292684810,4282912516,1979711488,1660944384,1778384896,2130706432,3204448256,4279371011,4283635982,4288752661,4292621844,4293078537,4293078022,4293078537,4293210121,4293144583,4290726433,4278518273,4280422668,4292691489,4293210117,4293276937,4293276680,4290592536,4278649601,134217728,0,0,0,0,0,2516582400,4278190080
      ,4294967295,4278190080,2516582400,0,4278190080,4294967295,4278190080,4294967295,4294967295,4278190080,4278190080,4294967295,4294967295,4294967295,4278190080,2516582400,2516582400,4278190080,4294967295,4278190080,4294967295,4294967295,4294967295,4294967295,4278190080,2516582400,0,2516582400,4278190080,4294967295,4278190080,2516582400,4278190080,4294967295,4294967295,4278190080,4294967295,4278190080,4294967295,4278190080,0,0,0,4278190080,4294967295,4278190080,2516582400,4278190080,4294967295,4278190080,2516582400,0,0,4278190080,4293141248,4293141248,4278190080,2516582400,4278190080,4293141248,4293141248,4293141248,4293141248,4278190080,0,2717908992,4287903514,4293078538,4293078280,4293143817,4290652684,4281666563,4281797635,4283831561,4284292110,4285670934,4289475868,4291769878,4293079566,4293078281,4293078023,4293078280,4293209609,4293275145,4292357130,4287900432,4280290309,1728053248,2432696320,4286854178,4293145355,4293144584,4293144328,4293212431,4283636492,1610612736,0,0,0,0,2516582400
      ,4278190080,4294967295,4278190080,4294967295,4278190080,2516582400,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4294967295,4278190080,4278190080,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4278190080,4278190080,4294967295,4278190080,2516582400,4278190080,4294967295,4278190080,4294967295,4278190080,2516582400,4278190080,4294967295,4278190080,4294967295,4278190080,4294967295,4278190080,2516582400,0,2516582400,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4294967295,4278190080,2516582400,0,2516582400,4278190080,4278190080,4293141248,4278190080,4293141248,4278190080,4278190080,4278190080,4278190080,2516582400,520093696,4280027652,4292426772,4293078279,4293079049,4293144329,4292751115,4292555019,4292948491,4293079819,4293146126,4293211917,4293210888,4293145095,4293210632,4293144841,4293210633,4293275913,4292685578,4288618760,4282584324,2969567232,1207959552,0,671088640,4279896839,4292362526,4293078022
      ,4293078793,4293078536,4290065172,4278780673,167772160,0,0,2516582400,4278190080,4294967295,4278190080,4278190080,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4294967295,4278190080,4294967295,4294967295,4294967295,4278190080,4294967295,4278190080,2516582400,4278190080,4294967295,4278190080,0,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4278190080,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,2516582400,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4278190080,4278190080,4294967295,4278190080,2516582400,0,0,4278190080,4293141248,4278190080,4293141248,4278190080,0,4278190080,4293141248,4278190080,1811939328,4284620297,4293211403,4293210888,4293211145,4293276937,4293277193,4293277961,4293344265,4293410056,4293344776,4293344776,4293345033,4293410569,4293475848,4293344265,4292819211,4289276169,4283437573,4278714880,1828716544
      ,0,0,0,0,2516582400,4287181084,4293078538,4293078025,4293143560,4293211664,4283110665,1409286144,0,0,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4294967295,4278190080,4278190080,4278190080,4278190080,4278190080,4294967295,4278190080,0,4278190080,4294967295,4278190080,0,4278190080,4294967295,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4294967295,4278190080,4294967295,4278190080,2516582400,4278190080,4294967295,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4278190080,4278190080,4278190080,4293141248,4278190080,4293141248,4278190080,4278190080,4278190080,4293141248,4278190080,3087007744,4289148172,4293345035,4293345034,4293411080,4293476870,4293477893,4293544453,4293611013,4293677063,4293677833,4293677833,4293612298,4293218572,4292102669,4287771145
      ,4282651909,4278714880,1912602624,218103808,0,0,0,0,0,771751936,4280880904,4292621585,4293143048,4292685067,4290916111,4284160266,1811939328,0,0,4278190080,4294967295,4294967295,4294967295,4278190080,2516582400,4278190080,4294967295,4278190080,4278190080,4294967295,4278190080,4294967295,4278190080,4278190080,4294967295,4294967295,4294967295,4278190080,4278190080,4294967295,4278190080,0,4278190080,4294967295,4278190080,0,4278190080,4294967295,4278190080,4294967295,4294967295,4294967295,4278190080,2516582400,4278190080,4294967295,4278190080,4294967295,4278190080,4294967295,4278190080,0,2516582400,4278190080,4294967295,4278190080,2516582400,4278190080,4294967295,4294967295,4294967295,4278190080,2516582400,4278190080,4294967295,4278190080,4293141248,4293141248,4293141248,4278190080,2516582400,4278190080,4293141248,4293141248,4293141248,4278190080,2516582400,1325400064,4280618243,4284819723,4287709972,4289877530,4293028892,4293948702,4293883680,4293818144,4292045341,4289484568,4288433169,4286856717
      ,4282916870,4279831042,3036676096,1526726656,184549376,0,0,0,0,0,0,0,0,3305111552,4289014285,4288159495,4283372037,4279370753,2164260864,50331648,0,0,2516582400,4278190080,4278190080,4278190080,2516582400,0,2516582400,4278190080,2516582400,2516582400,4278190080,2516582400,4278190080,2516582400,2516582400,4278190080,4278190080,4278190080,2516582400,2516582400,4278190080,2516582400,0,2516582400,4278190080,2516582400,0,2516582400,4278190080,2516582400,4278190080,4278190080,4278190080,2516582400,0,2516582400,4278190080,2516582400,4278190080,2516582400,4278190080,2516582400,0,0,2516582400,4278190080,2516582400,0,2516582400,4278190080,4278190080,4278190080,2516582400,0,2516582400,4278190080,2516582400,4278190080,4278190080,4278190080,2516582400,0,2516582400,4278190080,4278190080,4278190080,2516582400,0,0,671088640,1828716544,2600468480,3170893824,4026531840,4261412864,4261412864,4261412864,3808428032,3170893824,2969567232,2667577344,1526726656,553648128,0,0,0,0,0,0,0,0,0,0,0,1543503872,3305111552
      ,3120562176,1811939328,385875968,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]));
      return _loc1_;
   }
   
   private function onAddToStage(param1:Event) : void
   {
      stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      stage.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
      stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      stage.addEventListener(Event.MOUSE_LEAVE,this.onMouseLeave);
   }
   
   private function onRemoveFromStage(param1:Event) : void
   {
      stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      stage.removeEventListener(MouseEvent.MOUSE_UP,this.onClick);
      stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      stage.removeEventListener(Event.MOUSE_LEAVE,this.onMouseLeave);
   }
   
   private function onMouseMove(param1:MouseEvent) : void
   {
      if(mouseX >= -this.border && mouseX <= image.width + this.border && mouseY >= -this.border && mouseY <= image.height + this.border)
      {
         if(!this.over)
         {
            filters = [new GlowFilter(16777096,1,1.2,1.2,3,BitmapFilterQuality.HIGH)];
         }
         this.over = true;
      }
      else
      {
         if(this.over)
         {
            filters = null;
         }
         this.over = false;
      }
   }
   
   private function onMouseLeave(param1:Event) : void
   {
      filters = null;
      this.over = false;
   }
   
   private function onMouseDown(param1:MouseEvent) : void
   {
      this.press = this.over;
   }
   
   private function onClick(param1:MouseEvent) : void
   {
      var e:MouseEvent = param1;
      if(Boolean(this.press) && Boolean(this.over))
      {
         try
         {
            navigateToURL(new URLRequest("http://alternativaplatform.com"),"_blank");
         }
         catch(e:Error)
         {
         }
      }
      this.press = false;
   }
}

§§push(false);
true;
§§pop();
if(_loc1_)
{
   View = §§newclass(View,Canvas);
   if(!(_loc2_ && Boolean(this)))
   {
      Logo = §§newclass(Logo,Shape);
   }
}

