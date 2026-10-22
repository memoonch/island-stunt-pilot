package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   
   use namespace alternativa3d;
   
   public class Canvas extends Sprite
   {
      
      alternativa3d static const defaultColorTransform:ColorTransform;
      
      alternativa3d static const collector:Vector.<Canvas>;
      
      alternativa3d static var collectorLength:int = 0;
      
      §§push(false);
      var _loc1_:Boolean = true;
      var _loc2_:* = §§pop();
      if(!_loc2_)
      {
         alternativa3d::defaultColorTransform = new ColorTransform();
         if(_loc1_)
         {
            alternativa3d::collector = new Vector.<Canvas>();
            if(_loc1_ || Boolean(_loc2_))
            {
               alternativa3d::collectorLength = 0;
            }
         }
      }
      
      alternativa3d var gfx:Graphics;
      
      alternativa3d var modifiedGraphics:Boolean;
      
      alternativa3d var modifiedAlpha:Boolean;
      
      alternativa3d var modifiedBlendMode:Boolean;
      
      alternativa3d var modifiedColorTransform:Boolean;
      
      alternativa3d var modifiedFilters:Boolean;
      
      alternativa3d var _numChildren:int = 0;
      
      alternativa3d var numDraws:int = 0;
      
      alternativa3d var object:Object3D;
      
      public function Canvas()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(_loc1_ || Boolean(_loc2_))
         {
            this.gfx = graphics;
            if(_loc1_)
            {
               super();
            }
         }
      }
      
      alternativa3d function getChildCanvas(param1:Boolean, param2:Boolean, param3:Object3D = null, param4:Number = 1, param5:String = "normal", param6:ColorTransform = null, param7:Array = null) : Canvas
      {
         §§push(false);
         var _loc12_:Boolean = true;
         var _loc13_:* = §§pop();
         var _loc8_:Canvas = null;
         var _loc9_:DisplayObject = null;
         loop0:
         while(true)
         {
            loop7:
            while(true)
            {
               loop8:
               while(true)
               {
                  loop13:
                  while(true)
                  {
                     loop14:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(this._numChildren);
                           if(_loc12_)
                           {
                              §§push(this.numDraws);
                              if(!_loc12_)
                              {
                                 break;
                              }
                              while(true)
                              {
                                 §§push(§§pop() > §§pop());
                                 if(_loc12_ || Boolean(param3))
                                 {
                                    §§push(Boolean(§§pop()));
                                    if(!(_loc13_ && param2))
                                    {
                                       var _temp_35:* = §§pop();
                                       §§push(_temp_35);
                                       §§push(_temp_35);
                                       if(_loc12_)
                                       {
                                          §§push(Boolean(§§pop()));
                                       }
                                       if(!§§pop())
                                       {
                                          break;
                                       }
                                    }
                                 }
                                 §§pop();
                                 if(_loc12_ || param2)
                                 {
                                    _loc9_ = getChildAt(this._numChildren - 1 - this.numDraws);
                                    §§push(_loc9_ is Canvas);
                                    if(!_loc13_)
                                    {
                                       §§push(!§§pop());
                                       if(_loc13_ && param2)
                                       {
                                          break;
                                       }
                                    }
                                    §§push(Boolean(§§pop()));
                                    break;
                                 }
                                 break loop14;
                              }
                              if(§§pop())
                              {
                                 removeChild(_loc9_);
                                 if(_loc13_)
                                 {
                                    break loop14;
                                 }
                                 var _loc10_:Canvas = this;
                                 §§push(_loc10_._numChildren);
                                 if(_loc12_ || Boolean(this))
                                 {
                                    §§push(§§pop() - 1);
                                 }
                                 var _loc11_:* = §§pop();
                                 if(_loc12_)
                                 {
                                    _loc10_._numChildren = _loc11_;
                                 }
                                 if(_loc13_)
                                 {
                                    break loop8;
                                 }
                                 continue;
                              }
                              if(_loc13_ && param1)
                              {
                                 break loop8;
                              }
                              §§push(this._numChildren);
                              if(_loc13_ && param2)
                              {
                                 break loop7;
                              }
                           }
                           _loc10_ = this;
                           §§push(_loc10_.numDraws);
                           if(!(_loc13_ && Boolean(param3)))
                           {
                              var _temp_45:* = §§pop();
                              §§push(_temp_45);
                              §§push(_temp_45);
                              if(!_loc13_)
                              {
                                 §§push(§§pop() + 1);
                              }
                              _loc11_ = §§pop();
                              if(_loc12_ || Boolean(param3))
                              {
                                 _loc10_.numDraws = _loc11_;
                              }
                           }
                           if(_loc12_)
                           {
                              if(§§pop() > §§pop())
                              {
                                 if(_loc12_ || param2)
                                 {
                                    break loop14;
                                 }
                                 break loop8;
                              }
                              §§push(collectorLength);
                              break loop7;
                           }
                           break;
                        }
                        §§goto(addr0200);
                     }
                     _loc8_ = _loc9_ as Canvas;
                     while(true)
                     {
                        while(true)
                        {
                           while(true)
                           {
                              while(true)
                              {
                                 if(_loc12_ || param2)
                                 {
                                    if(_loc8_.modifiedGraphics)
                                    {
                                       _loc8_.gfx.clear();
                                    }
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc8_._numChildren > 0);
                                          if(_loc12_ || Boolean(param3))
                                          {
                                             var _temp_30:* = Boolean(§§pop());
                                             §§push(_temp_30);
                                             §§push(_temp_30);
                                             if(!_loc13_)
                                             {
                                                §§push(Boolean(§§pop()));
                                             }
                                             if(!§§pop())
                                             {
                                                continue loop22;
                                             }
                                             if(!(_loc13_ && Boolean(param3)))
                                             {
                                                §§pop();
                                                if(!(_loc12_ || param1))
                                                {
                                                   break;
                                                }
                                                §§push(param2);
                                                if(_loc13_)
                                                {
                                                   continue loop22;
                                                }
                                             }
                                             §§push(!§§pop());
                                             if(!_loc12_)
                                             {
                                                continue loop22;
                                             }
                                          }
                                          §§push(Boolean(§§pop()));
                                          continue loop22;
                                       }
                                       §§goto(addr03ca);
                                    }
                                    loop22:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          if(§§pop())
                                          {
                                             if(!(_loc12_ || Boolean(this)))
                                             {
                                                break;
                                             }
                                             _loc8_.removeChildren(0);
                                             if(_loc13_ && param1)
                                             {
                                                break loop22;
                                             }
                                          }
                                          break loop13;
                                       }
                                       §§goto(addr0346);
                                    }
                                    §§goto(addr035a);
                                 }
                                 §§goto(addr02f5);
                              }
                              §§goto(addr03a9);
                           }
                           §§goto(addr0395);
                        }
                        §§goto(addr0331);
                     }
                     §§goto(addr038e);
                  }
                  §§goto(addr027d);
               }
               §§goto(addr022c);
            }
            addr0200:
            if(§§pop() > 0)
            {
               break loop8;
            }
            addr022c:
            _loc8_ = new Canvas();
            while(true)
            {
               if(_loc12_)
               {
                  addChildAt(_loc8_,0);
                  if(_loc13_ && Boolean(this))
                  {
                     break;
                  }
               }
               _loc10_ = this;
               §§push(_loc10_._numChildren);
               if(!(_loc13_ && param2))
               {
                  §§push(§§pop() + 1);
               }
               _loc11_ = §§pop();
               if(!(_loc13_ && Boolean(param3)))
               {
                  _loc10_._numChildren = _loc11_;
               }
               break;
            }
            addr027d:
            _loc8_.object = param3;
            _loc8_.modifiedGraphics = param1;
            loop10:
            while(true)
            {
               if(_loc12_ || param2)
               {
                  loop11:
                  while(true)
                  {
                     if(param4 != 1)
                     {
                        if(!(_loc12_ || param1))
                        {
                           break;
                        }
                        _loc8_.alpha = param4;
                        _loc8_.modifiedAlpha = true;
                        if(_loc13_)
                        {
                           break loop0;
                        }
                     }
                     else if(_loc8_.modifiedAlpha)
                     {
                        _loc8_.alpha = 1;
                        _loc8_.modifiedAlpha = false;
                     }
                     if(param5 != "normal")
                     {
                        if(!(_loc13_ && param1))
                        {
                           _loc8_.blendMode = param5;
                           if(!_loc13_)
                           {
                              addr02f5:
                              _loc8_.modifiedBlendMode = true;
                              if(_loc13_)
                              {
                                 break;
                              }
                           }
                           else
                           {
                              _loc8_.blendMode = "normal";
                              _loc8_.modifiedBlendMode = false;
                              if(!_loc12_)
                              {
                                 break loop5;
                              }
                           }
                           addr0331:
                           if(param6 != null)
                           {
                              if(_loc12_ || param1)
                              {
                                 addr0346:
                                 param6.alphaMultiplier = param4;
                                 _loc8_.transform.colorTransform = param6;
                                 if(_loc12_)
                                 {
                                    addr035a:
                                    _loc8_.modifiedColorTransform = true;
                                    while(true)
                                    {
                                       if(_loc12_)
                                       {
                                          break loop11;
                                       }
                                       addr03ca:
                                       _loc8_.filters = null;
                                       break;
                                    }
                                    addr03cf:
                                    _loc8_.modifiedFilters = false;
                                    break loop0;
                                 }
                                 break loop5;
                              }
                              break;
                           }
                           if(_loc8_.modifiedColorTransform)
                           {
                              defaultColorTransform.alphaMultiplier = param4;
                              _loc8_.transform.colorTransform = defaultColorTransform;
                              break loop5;
                           }
                           break;
                        }
                        addr0395:
                        _loc8_.filters = param7;
                        if(_loc12_ || param1)
                        {
                           addr03a9:
                           _loc8_.modifiedFilters = true;
                        }
                        break loop10;
                     }
                     §§push(_loc8_.modifiedBlendMode);
                     if(!_loc13_)
                     {
                        continue loop5;
                     }
                     addr03b6:
                     if(!§§pop())
                     {
                        break loop0;
                     }
                     if(_loc12_)
                     {
                        §§goto(addr03ca);
                     }
                     §§goto(addr03cf);
                  }
                  addr038e:
                  if(param7 != null)
                  {
                     §§goto(addr0395);
                  }
                  else
                  {
                     §§goto(addr03b6);
                     §§push(_loc8_.modifiedFilters);
                  }
               }
               §§goto(addr03a9);
            }
            break;
         }
         return _loc8_;
      }
      
      alternativa3d function removeChildren(param1:int) : void
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         var _loc2_:Canvas = null;
         loop0:
         while(this._numChildren > param1)
         {
            _loc2_ = removeChildAt(0) as Canvas;
            if(_loc2_ != null)
            {
               while(true)
               {
                  if(_loc7_ || Boolean(_loc2_))
                  {
                     _loc2_.object = null;
                     if(!_loc2_.modifiedGraphics)
                     {
                        break;
                     }
                     if(_loc6_)
                     {
                        continue loop0;
                     }
                  }
                  _loc2_.gfx.clear();
                  if(!_loc6_)
                  {
                     break;
                  }
                  addr0089:
                  collector[collectorLength++] = _loc2_;
               }
               if(_loc2_._numChildren > 0)
               {
                  if(_loc6_ && Boolean(this))
                  {
                     continue;
                  }
                  _loc2_.removeChildren(0);
               }
               §§goto(addr0089);
            }
            var _loc3_:Canvas = this;
            §§push(_loc3_._numChildren);
            if(_loc7_)
            {
               §§push(§§pop() - 1);
            }
            var _loc4_:* = §§pop();
            if(!_loc6_)
            {
               _loc3_._numChildren = _loc4_;
            }
         }
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(!(_loc1_ && _loc1_))
{
   Canvas = §§newclass(Canvas,Sprite);
}

