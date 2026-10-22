package alternativa.engine3d.materials
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Canvas;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import flash.display.BitmapData;
   import flash.filters.ConvolutionFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   use namespace alternativa3d;
   
   public class TextureMaterial extends Material
   {
      
      private static const matrix:Matrix;
      
      alternativa3d static var drawUVTs:Vector.<Number>;
      
      alternativa3d static var drawIndices:Vector.<int>;
      
      var _temp_1:* = true;
      var _loc1_:Boolean = false;
      var _loc2_:Boolean = _temp_1;
      
      private static const filter:ConvolutionFilter = new ConvolutionFilter(2,2,[1,1,1,1],4,0,false,true);
      
      if(_loc2_)
      {
         matrix = new Matrix(0.5,0,0,0.5);
      }
      
      private static const rect:Rectangle = new Rectangle();
      
      private static const point:Point = new Point();
      
      alternativa3d static var drawVertices:Vector.<Number> = new Vector.<Number>();
      
      if(!_loc1_)
      {
         alternativa3d::drawUVTs = new Vector.<Number>();
         alternativa3d::drawIndices = new Vector.<int>();
      }
      
      public var diffuseMapURL:String;
      
      public var opacityMapURL:String;
      
      public var repeat:Boolean = false;
      
      public var smooth:Boolean = true;
      
      public var resolution:Number = 1;
      
      public var threshold:Number = 0.01;
      
      public var correctUV:Boolean = false;
      
      alternativa3d var _texture:BitmapData;
      
      alternativa3d var _mipMapping:int = 0;
      
      alternativa3d var mipMap:Vector.<BitmapData>;
      
      alternativa3d var numMaps:int = 0;
      
      public function TextureMaterial(param1:BitmapData = null, param2:Boolean = false, param3:Boolean = true, param4:int = 0, param5:Number = 1)
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         super();
         while(true)
         {
            if(_loc7_ || Boolean(this))
            {
               this._texture = param1;
               this.repeat = param2;
               if(!_loc7_)
               {
                  break;
               }
               this.smooth = param3;
               this._mipMapping = param4;
               if(_loc6_ && param3)
               {
                  break;
               }
            }
            loop1:
            while(true)
            {
               §§push(this._texture == null);
               if(!_loc6_)
               {
                  §§push(!§§pop());
                  if(!_loc7_)
                  {
                     break;
                  }
               }
               while(true)
               {
                  §§push(Boolean(§§pop()));
                  if(!(_loc6_ && Boolean(this)))
                  {
                     var _temp_5:* = §§pop();
                     §§push(_temp_5);
                     §§push(_temp_5);
                     if(!(_loc6_ && param2))
                     {
                        §§push(Boolean(§§pop()));
                     }
                     if(!§§pop())
                     {
                        break;
                     }
                     if(_loc7_)
                     {
                        break loop1;
                     }
                  }
                  addr00b3:
                  §§push(Boolean(§§pop()));
                  break;
               }
               §§goto(addr00b4);
            }
            §§pop();
            if(_loc6_)
            {
               break;
            }
            §§push(this._mipMapping > 0);
            if(_loc7_ || Boolean(this))
            {
               §§goto(addr00b3);
            }
            addr00b4:
            if(§§pop())
            {
               break;
            }
            §§goto(addr00bd);
         }
         this.calculateMipMaps();
         addr00bd:
         this.resolution = param5;
      }
      
      public function get texture() : BitmapData
      {
         return this._texture;
      }
      
      public function set texture(param1:BitmapData) : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         while(true)
         {
            if(!_loc2_)
            {
               if(param1 == this._texture)
               {
                  break;
               }
               if(_loc3_ || _loc2_)
               {
                  this._texture = param1;
               }
               this.disposeMipMaps();
               loop1:
               while(true)
               {
                  while(true)
                  {
                     if(!(_loc2_ && Boolean(this)))
                     {
                        §§push(param1 == null);
                        if(!_loc2_)
                        {
                           §§push(!§§pop());
                           if(!_loc3_)
                           {
                              break;
                           }
                        }
                        §§push(Boolean(§§pop()));
                        if(_loc2_)
                        {
                           break;
                        }
                        var _temp_4:* = §§pop();
                        §§push(_temp_4);
                        §§push(_temp_4);
                        if(!(_loc2_ && Boolean(param1)))
                        {
                           §§push(Boolean(§§pop()));
                        }
                        if(!§§pop())
                        {
                           break loop1;
                        }
                        if(!_loc3_)
                        {
                           break loop1;
                        }
                        §§pop();
                     }
                     §§push(this._mipMapping > 0);
                     if(!(_loc2_ && _loc2_))
                     {
                        break;
                     }
                     break loop1;
                  }
                  §§push(Boolean(§§pop()));
                  break;
               }
               if(!§§pop())
               {
                  break;
               }
            }
            this.calculateMipMaps();
            break;
         }
      }
      
      public function get mipMapping() : int
      {
         return this._mipMapping;
      }
      
      public function set mipMapping(param1:int) : void
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
                              loop9:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(param1);
                                    §§push(0);
                                    if(!_loc2_)
                                    {
                                       if(§§pop() < §§pop())
                                       {
                                          if(_loc2_ && Boolean(param1))
                                          {
                                             break loop9;
                                          }
                                          §§push(0);
                                          if(!_loc3_)
                                          {
                                             break;
                                          }
                                          param1 = §§pop();
                                       }
                                       §§push(param1);
                                       §§push(this._mipMapping);
                                       if(!_loc2_)
                                       {
                                          if(§§pop() == §§pop())
                                          {
                                             break loop9;
                                          }
                                          if(this._texture == null)
                                          {
                                             break loop8;
                                          }
                                          if(_loc2_ && Boolean(this))
                                          {
                                             break loop7;
                                          }
                                          §§push(this._mipMapping);
                                          §§push(0);
                                          if(_loc3_)
                                          {
                                             §§push(§§pop() == §§pop());
                                             if(!(_loc3_ || Boolean(param1)))
                                             {
                                                break loop6;
                                             }
                                             var _temp_9:* = Boolean(§§pop());
                                             §§push(_temp_9);
                                             §§push(_temp_9);
                                             if(_loc3_ || _loc2_)
                                             {
                                                §§push(Boolean(§§pop()));
                                                if(!(_loc2_ && _loc3_))
                                                {
                                                   if(§§pop())
                                                   {
                                                      if(_loc3_ || _loc3_)
                                                      {
                                                         §§pop();
                                                         if(!(_loc2_ && Boolean(param1)))
                                                         {
                                                            §§push(param1);
                                                            §§push(0);
                                                            if(_loc3_ || _loc3_)
                                                            {
                                                               addr00c3:
                                                               §§push(§§pop() > §§pop());
                                                               break loop5;
                                                            }
                                                            break loop0;
                                                         }
                                                         break loop1;
                                                      }
                                                      break loop4;
                                                   }
                                                   break loop5;
                                                }
                                                §§goto(addr00fe);
                                             }
                                             §§goto(addr00ff);
                                          }
                                       }
                                    }
                                    §§goto(addr00c3);
                                 }
                                 §§goto(addr0112);
                              }
                              §§goto(addr012d);
                           }
                           §§goto(addr0129);
                        }
                        §§goto(addr00ce);
                     }
                     §§goto(addr0120);
                  }
                  if(§§pop())
                  {
                     break loop1;
                  }
                  §§push(this._mipMapping);
                  if(_loc3_)
                  {
                     §§push(0);
                     if(!_loc2_)
                     {
                        break loop0;
                     }
                  }
                  else
                  {
                     §§goto(addr0112);
                  }
                  §§goto(addr011e);
               }
               §§goto(addr011f);
            }
            this.calculateMipMaps();
            addr00ce:
            §§goto(addr0129);
         }
         loop2:
         while(true)
         {
            while(true)
            {
               §§push(§§pop() > §§pop());
               if(_loc3_ || Boolean(this))
               {
                  var _temp_3:* = §§pop();
                  addr00ff:
                  §§push(_temp_3);
                  §§push(_temp_3);
                  if(!(_loc2_ && Boolean(param1)))
                  {
                     addr00fe:
                     §§push(Boolean(§§pop()));
                  }
                  if(!§§pop())
                  {
                     break;
                  }
                  §§pop();
                  if(!(_loc3_ || Boolean(param1)))
                  {
                     break loop2;
                  }
                  §§push(param1 == 0);
               }
               addr011f:
               §§push(Boolean(§§pop()));
               break;
            }
            addr0120:
            if(§§pop())
            {
               break;
            }
            §§goto(addr0129);
         }
         this.disposeMipMaps();
         addr0129:
         this._mipMapping = param1;
         addr012d:
      }
      
      alternativa3d function disposeMipMaps() : void
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         §§push(1);
         if(_loc3_ || _loc2_)
         {
            §§push(int(§§pop()));
         }
         var _loc1_:* = §§pop();
         loop0:
         do
         {
            §§push(_loc1_);
            while(§§pop() < this.numMaps)
            {
               (this.mipMap[_loc1_] as BitmapData).dispose();
               if(!(_loc3_ || _loc3_))
               {
                  addr008a:
                  this.mipMap = null;
                  if(!(_loc2_ && _loc2_))
                  {
                     this.numMaps = 0;
                  }
                  break loop0;
               }
               §§push(_loc1_);
               if(!_loc2_)
               {
                  §§push(§§pop() + 1);
                  if(!(_loc3_ || Boolean(this)))
                  {
                     continue loop0;
                  }
               }
               §§push(int(§§pop()));
               if(_loc3_ || _loc2_)
               {
                  continue loop0;
               }
            }
            if(_loc2_ && Boolean(_loc1_))
            {
               break;
            }
            §§goto(addr008a);
         }
         while(_loc1_ = §§pop(), _loc3_);
      }
      
      alternativa3d function calculateMipMaps() : void
      {
         var _temp_1:* = true;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = _temp_1;
         this.mipMap = new Vector.<BitmapData>();
         loop2:
         while(true)
         {
            if(_loc6_)
            {
               this.numMaps = 0;
               if(_loc5_)
               {
                  break;
               }
               this.mipMap[this.numMaps] = this._texture;
               var _loc3_:TextureMaterial = this;
               §§push(_loc3_.numMaps);
               if(_loc6_ || Boolean(_loc1_))
               {
                  §§push(§§pop() + 1);
               }
               var _loc4_:* = §§pop();
               if(_loc6_ || Boolean(_loc3_))
               {
                  _loc3_.numMaps = _loc4_;
               }
            }
            loop3:
            while(true)
            {
               loop4:
               while(true)
               {
                  §§push(this._texture.width % 2);
                  if(_loc6_)
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
                              §§push(0);
                              if(_loc6_)
                              {
                                 while(true)
                                 {
                                    §§push(§§pop() > §§pop());
                                    if(_loc6_ || Boolean(this))
                                    {
                                       §§push(Boolean(§§pop()));
                                       if(!(_loc6_ || Boolean(this)))
                                       {
                                          break;
                                       }
                                    }
                                    var _temp_24:* = §§pop();
                                    §§push(_temp_24);
                                    §§push(_temp_24);
                                    if(_loc6_)
                                    {
                                       §§push(Boolean(§§pop()));
                                    }
                                    if(!§§pop())
                                    {
                                       if(!(_loc5_ && Boolean(_loc2_)))
                                       {
                                          break;
                                       }
                                       break loop10;
                                    }
                                    break loop11;
                                 }
                                 §§pop();
                                 §§push(this._texture.height % 2);
                                 if(_loc5_ && Boolean(_loc1_))
                                 {
                                    break loop9;
                                 }
                                 §§push(0);
                                 if(_loc5_ && Boolean(_loc1_))
                                 {
                                    break loop4;
                                 }
                              }
                              §§push(§§pop() > §§pop());
                              if(_loc6_ || Boolean(_loc2_))
                              {
                                 break loop10;
                              }
                              break;
                           }
                           if(§§pop())
                           {
                              break loop2;
                           }
                           matrix.identity();
                           matrix.a = 0.5;
                           matrix.d = 0.5;
                           filter.preserveAlpha = !this._texture.transparent;
                           if(_loc6_ || Boolean(_loc2_))
                           {
                              §§push(this._texture.width * this._texture.height);
                              break loop9;
                           }
                           break loop3;
                        }
                        §§push(Boolean(§§pop()));
                        break loop11;
                     }
                  }
                  break loop9;
               }
               if(§§pop() > §§pop())
               {
                  break;
               }
               §§goto(addr0168);
               §§push(new BitmapData(this._texture.width,this._texture.height,this._texture.transparent));
            }
            addr0168:
            var _loc1_:BitmapData = this._texture.clone();
            var _loc2_:BitmapData = this._texture;
            while(true)
            {
               if(_loc6_)
               {
                  rect.width = this._texture.width;
                  if(_loc5_)
                  {
                     break;
                  }
               }
               rect.height = this._texture.height;
               break;
            }
            loop0:
            while(true)
            {
               loop6:
               while(true)
               {
                  §§push(rect.width % 2);
                  if(_loc6_ || Boolean(_loc1_))
                  {
                     §§push(0);
                     if(!(_loc5_ && Boolean(_loc3_)))
                     {
                        §§push(§§pop() == §§pop());
                        if(!(_loc5_ && Boolean(_loc1_)))
                        {
                           loop7:
                           while(true)
                           {
                              loop8:
                              while(true)
                              {
                                 §§push(Boolean(§§pop()));
                                 if(!_loc5_)
                                 {
                                    var _temp_8:* = §§pop();
                                    §§push(_temp_8);
                                    §§push(_temp_8);
                                    if(!(_loc5_ && Boolean(_loc1_)))
                                    {
                                       §§push(Boolean(§§pop()));
                                    }
                                    if(!§§pop())
                                    {
                                       break;
                                    }
                                    if(_loc5_)
                                    {
                                       break loop7;
                                    }
                                 }
                                 §§pop();
                                 if(!_loc5_)
                                 {
                                    while(true)
                                    {
                                       addr02d6:
                                       §§push(rect.height % 2 == 0);
                                       if(_loc6_ || Boolean(this))
                                       {
                                          break loop7;
                                       }
                                       break loop8;
                                    }
                                    break loop2;
                                    addr02cb:
                                 }
                                 break loop6;
                              }
                              if(!§§pop())
                              {
                                 if(!_loc5_)
                                 {
                                    break loop6;
                                 }
                                 break loop0;
                              }
                              _loc1_.applyFilter(_loc2_,rect,point,filter);
                              if(_loc5_ && Boolean(_loc1_))
                              {
                                 break loop6;
                              }
                              rect.width /= 2;
                              if(!(_loc6_ || Boolean(_loc3_)))
                              {
                                 §§goto(addr02cb);
                              }
                              rect.height /= 2;
                              if(_loc5_ && Boolean(_loc3_))
                              {
                                 break loop6;
                              }
                              _loc2_ = new BitmapData(rect.width,rect.height,this._texture.transparent,0);
                              if(!(_loc5_ && Boolean(_loc2_)))
                              {
                                 _loc2_.draw(_loc1_,matrix,null,null,null,false);
                                 if(!_loc5_)
                                 {
                                    this.mipMap[this.numMaps] = _loc2_;
                                    if(_loc6_)
                                    {
                                       _loc3_ = this;
                                       §§push(_loc3_.numMaps);
                                       if(!_loc5_)
                                       {
                                          §§push(§§pop() + 1);
                                       }
                                       _loc4_ = §§pop();
                                       if(_loc6_ || Boolean(_loc1_))
                                       {
                                          _loc3_.numMaps = _loc4_;
                                       }
                                    }
                                 }
                              }
                              continue loop0;
                           }
                        }
                        break loop7;
                     }
                  }
                  §§goto(addr02d6);
               }
               _loc1_.dispose();
               break;
            }
            return;
         }
      }
      
      override alternativa3d function draw(param1:Camera3D, param2:Canvas, param3:Face, param4:Number) : void
      {
         var _temp_1:* = true;
         var _loc57_:Boolean = false;
         var _loc58_:Boolean = _temp_1;
         var _loc5_:Face = null;
         var _loc6_:Face = null;
         var _loc7_:Face = null;
         var _loc8_:Wrapper = null;
         var _loc9_:Vertex = null;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:* = NaN;
         var _loc14_:* = NaN;
         var _loc15_:* = 0;
         var _loc16_:* = NaN;
         var _loc17_:* = NaN;
         var _loc18_:* = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:BitmapData = null;
         var _loc26_:* = 0;
         var _loc27_:* = 0;
         var _loc28_:* = 0;
         var _loc29_:* = 0;
         var _loc33_:* = 0;
         var _loc34_:* = NaN;
         var _loc35_:* = NaN;
         var _loc36_:* = NaN;
         var _loc37_:* = 0;
         var _loc38_:* = 0;
         var _loc39_:Wrapper = null;
         var _loc40_:int = 0;
         var _loc41_:* = NaN;
         var _loc42_:* = NaN;
         var _loc43_:Wrapper = null;
         var _loc44_:* = NaN;
         var _loc45_:* = NaN;
         var _loc46_:* = NaN;
         var _loc47_:* = false;
         var _loc48_:* = false;
         var _loc49_:* = NaN;
         var _loc50_:Face = null;
         var _loc51_:Wrapper = null;
         var _loc52_:Wrapper = null;
         var _loc53_:Wrapper = null;
         var _loc54_:Vertex = null;
         var _loc55_:Vertex = null;
         var _loc56_:Vertex = null;
         §§push(param1.viewSizeX);
         if(!(_loc57_ && Boolean(param3)))
         {
            §§push(Number(§§pop()));
         }
         var _loc21_:* = §§pop();
         §§push(param1.viewSizeY);
         if(_loc58_)
         {
            §§push(Number(§§pop()));
         }
         var _loc22_:* = §§pop();
         var _loc23_:Vector.<Number> = drawVertices;
         var _loc24_:Vector.<Number> = drawUVTs;
         var _loc25_:Vector.<int> = drawIndices;
         §§push(param1.numDraws);
         if(_loc58_)
         {
            §§push(int(§§pop()));
         }
         var _loc30_:* = §§pop();
         §§push(param1.numPolygons);
         if(!(_loc57_ && Boolean(param1)))
         {
            §§push(int(§§pop()));
         }
         var _loc31_:* = §§pop();
         §§push(param1.numTriangles);
         if(_loc58_)
         {
            §§push(int(§§pop()));
         }
         var _loc32_:* = §§pop();
         loop16:
         while(true)
         {
            if(!_loc57_)
            {
               if(this._texture == null)
               {
                  clearLinks(param3);
                  if(!(_loc57_ && Boolean(param1)))
                  {
                     return;
                  }
                  break;
               }
            }
            while(true)
            {
               if(this._mipMapping >= 2)
               {
                  while(true)
                  {
                     §§push(1e+22);
                     if(!(_loc57_ && Boolean(param1)))
                     {
                        §§push(Number(§§pop()));
                        if(_loc58_ || Boolean(param3))
                        {
                           _loc35_ = §§pop();
                           if(_loc57_ && Boolean(param1))
                           {
                              break;
                           }
                           §§push(-1);
                        }
                     }
                     _loc36_ = §§pop();
                     break;
                  }
                  _loc5_ = param3;
                  for(; _loc5_ != null; _loc5_ = _loc5_.processNext)
                  {
                     _loc8_ = _loc5_.wrapper;
                     if(_loc58_)
                     {
                        loop1:
                        while(_loc8_ != null)
                        {
                           while(true)
                           {
                              §§push(_loc8_.vertex.cameraZ);
                              if(_loc58_)
                              {
                                 _loc34_ = Number(§§pop());
                                 loop62:
                                 while(true)
                                 {
                                    loop63:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc34_);
                                          if(!(_loc57_ && Boolean(param2)))
                                          {
                                             §§push(_loc35_);
                                             if(_loc57_)
                                             {
                                                break;
                                             }
                                             if(§§pop() >= §§pop())
                                             {
                                                break loop63;
                                             }
                                             if(!(_loc58_ || Boolean(this)))
                                             {
                                                break loop62;
                                             }
                                             §§push(Number(_loc34_));
                                          }
                                          _loc35_ = §§pop();
                                          break loop63;
                                       }
                                       if(§§pop() > §§pop())
                                       {
                                          if(!_loc57_)
                                          {
                                             break loop62;
                                          }
                                          break loop16;
                                          break loop1;
                                       }
                                       continue loop1;
                                    }
                                    §§push(_loc34_);
                                    §§push(_loc36_);
                                    break loop64;
                                 }
                                 §§push(_loc34_);
                                 if(_loc57_ && Boolean(param2))
                                 {
                                    break;
                                 }
                              }
                              §§push(Number(§§pop()));
                              break;
                           }
                           _loc36_ = §§pop();
                           _loc8_ = _loc8_.next;
                        }
                     }
                     break loop63;
                  }
                  loop65:
                  while(true)
                  {
                     loop66:
                     while(true)
                     {
                        while(true)
                        {
                           loop140:
                           while(true)
                           {
                              loop146:
                              while(true)
                              {
                                 loop147:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       if(_loc58_)
                                       {
                                          §§push(param1.focalLength);
                                          §§push(this.resolution);
                                          if(_loc57_)
                                          {
                                             break;
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(!_loc58_)
                                          {
                                             break loop147;
                                          }
                                          _loc14_ = Number(§§pop());
                                          §§push(_loc35_);
                                          §§push(_loc14_);
                                          if(_loc57_)
                                          {
                                             break loop146;
                                          }
                                          if(§§pop() < §§pop())
                                          {
                                             §§push(0);
                                             if(_loc58_)
                                             {
                                                §§push(int(§§pop()));
                                                break loop140;
                                             }
                                             §§goto(addr0bb9);
                                          }
                                       }
                                       §§push(1);
                                       §§push(Math.log(_loc35_ / _loc14_) * 1.4426950408889634);
                                       if(_loc57_ && Boolean(param1))
                                       {
                                          break loop65;
                                       }
                                       §§push(§§pop() + §§pop());
                                       if(_loc57_)
                                       {
                                          break loop66;
                                       }
                                       §§push(int(§§pop()));
                                       if(_loc58_ || Boolean(param2))
                                       {
                                          break loop140;
                                       }
                                       continue loop143;
                                    }
                                    §§goto(addr0c16);
                                 }
                                 §§goto(addr0af5);
                              }
                              §§goto(addr0ac5);
                           }
                           §§push(int(§§pop()));
                           continue loop143;
                        }
                        _loc37_ = §§pop();
                        loop141:
                        while(true)
                        {
                           while(true)
                           {
                              while(true)
                              {
                                 while(true)
                                 {
                                    if(_loc58_)
                                    {
                                       §§push(_loc37_);
                                       if(_loc57_)
                                       {
                                          break;
                                       }
                                       §§push(this.numMaps);
                                       if(!(_loc58_ || Boolean(param3)))
                                       {
                                          break loop141;
                                       }
                                       if(§§pop() >= §§pop())
                                       {
                                          §§push(this.numMaps);
                                          if(_loc58_)
                                          {
                                             §§push(1);
                                             if(!_loc58_)
                                             {
                                                break loop141;
                                             }
                                             §§push(int(§§pop() - §§pop()));
                                             if(_loc57_ && Boolean(param2))
                                             {
                                                continue loop68;
                                             }
                                             _loc37_ = §§pop();
                                          }
                                          else
                                          {
                                             §§goto(addr0b34);
                                          }
                                       }
                                       while(true)
                                       {
                                          §§push(_loc36_);
                                          if(_loc58_ || Boolean(this))
                                          {
                                             break loop66;
                                          }
                                          §§goto(addr0b82);
                                       }
                                       §§goto(addr0c18);
                                    }
                                    else
                                    {
                                       §§goto(addr0b31);
                                    }
                                 }
                                 §§goto(addr0bc4);
                              }
                              §§goto(addr0bd9);
                           }
                           §§goto(addr0b4c);
                        }
                        §§goto(addr1a95);
                     }
                     §§push(_loc14_);
                     if(_loc58_ || Boolean(this))
                     {
                        addr0ac5:
                        if(§§pop() >= §§pop())
                        {
                           if(!(_loc57_ && Boolean(this)))
                           {
                              §§push(1);
                              if(!_loc57_)
                              {
                                 §§push(Math.log(_loc36_ / _loc14_) * 1.4426950408889634);
                                 break;
                              }
                              §§goto(addr0bc3);
                           }
                           §§goto(addr0bd9);
                        }
                        else
                        {
                           §§push(0);
                           if(_loc58_ || Boolean(this))
                           {
                              §§goto(addr0b0b);
                           }
                        }
                        §§goto(addr0b4c);
                     }
                     §§goto(addr0bff);
                  }
                  loop67:
                  while(true)
                  {
                     §§push(§§pop() + §§pop());
                     if(!_loc57_)
                     {
                        _loc38_ = int(§§pop());
                        addr0b0b:
                        addr0af5:
                        loop68:
                        while(true)
                        {
                           while(true)
                           {
                              if(_loc58_)
                              {
                                 §§push(_loc38_);
                                 §§push(this.numMaps);
                                 if(_loc57_)
                                 {
                                    break;
                                 }
                                 if(§§pop() < §§pop())
                                 {
                                    break loop68;
                                 }
                                 if(_loc57_ && Boolean(param2))
                                 {
                                    break loop67;
                                 }
                              }
                              addr0b34:
                              addr0b31:
                              §§push(this.numMaps);
                              §§push(1);
                              if(!(_loc58_ || Boolean(param3)))
                              {
                                 break;
                              }
                              §§push(int(§§pop() - §§pop()));
                              if(_loc58_)
                              {
                                 §§goto(addr0b4c);
                              }
                              _loc27_ = §§pop();
                              if(!(_loc57_ && Boolean(param1)))
                              {
                                 _loc28_ = 0;
                              }
                              §§goto(addr0bd9);
                           }
                           addr1a95:
                           if(§§pop() < §§pop())
                           {
                              break loop67;
                           }
                           §§push(_loc30_);
                           if(_loc58_)
                           {
                              §§push(int(§§pop() + 1));
                              if(!(_loc57_ && Boolean(param1)))
                              {
                                 _loc30_ = §§pop();
                                 addr0bb9:
                                 _loc26_ = 0;
                                 §§push(0);
                                 if(!_loc57_)
                                 {
                                    addr0bc3:
                                    §§push(int(§§pop()));
                                 }
                                 §§goto(addr0bc4);
                              }
                              §§goto(addr1a93);
                           }
                           §§goto(addr0bc4);
                        }
                        addr0b4e:
                        §§push(_loc14_);
                        if(!_loc57_)
                        {
                           while(true)
                           {
                              §§push(§§pop() * Math.pow(2,_loc38_ - 1));
                              if(!(_loc57_ && Boolean(this)))
                              {
                                 §§push(Number(§§pop()));
                                 if(_loc57_ && Boolean(param2))
                                 {
                                    break;
                                 }
                              }
                              addr0b82:
                              _loc34_ = §§pop();
                              _loc40_ = _loc38_;
                              if(_loc58_ || Boolean(this))
                              {
                                 while(true)
                                 {
                                    §§push(_loc40_);
                                    addr1a93:
                                    addr0b4c:
                                    while(true)
                                    {
                                       §§push(_loc37_);
                                       break loop69;
                                    }
                                    addr0b4c:
                                    _loc38_ = §§pop();
                                    §§goto(addr0b4e);
                                 }
                                 break loop67;
                                 addr1a91:
                              }
                              addr0bd9:
                              _loc29_ = 0;
                              §§push(_loc34_);
                              if(_loc58_ || Boolean(param1))
                              {
                                 addr0bee:
                                 addr0c16:
                                 §§push(this.threshold);
                                 if(!(_loc57_ && Boolean(param2)))
                                 {
                                    addr0c0f:
                                    addr0bff:
                                    §§push(§§pop() - §§pop());
                                    if(!(_loc57_ && Boolean(param2)))
                                    {
                                       §§push(Number(§§pop()));
                                    }
                                    _loc41_ = §§pop();
                                    §§push(_loc34_);
                                    §§push(this.threshold);
                                 }
                                 §§push(§§pop() + §§pop());
                              }
                              §§push(Number(§§pop()));
                              break;
                           }
                           addr0c18:
                           _loc42_ = §§pop();
                           if(_loc57_ && Boolean(param3))
                           {
                              break;
                           }
                           _loc5_ = param3;
                           param3 = null;
                           _loc7_ = null;
                           if(!_loc57_)
                           {
                              loop7:
                              for(; _loc5_ != null; _loc5_ = _loc6_)
                              {
                                 _loc6_ = _loc5_.processNext;
                                 if(!(_loc57_ && Boolean(param1)))
                                 {
                                    _loc5_.processNext = null;
                                 }
                                 _loc8_ = null;
                                 while(true)
                                 {
                                    if(!(_loc57_ && Boolean(param1)))
                                    {
                                       if(_loc40_ != _loc37_)
                                       {
                                          §§push(_loc5_.wrapper);
                                          break;
                                       }
                                    }
                                    §§push(_loc5_.wrapper);
                                    if(_loc57_ && Boolean(param2))
                                    {
                                       break;
                                    }
                                    _loc8_ = §§pop();
                                    if(_loc58_ || Boolean(this))
                                    {
                                       addr1335:
                                       if(_loc8_ == null)
                                       {
                                          continue loop7;
                                       }
                                    }
                                    _loc9_ = _loc8_.vertex;
                                    loop72:
                                    while(true)
                                    {
                                       loop73:
                                       while(true)
                                       {
                                          loop93:
                                          while(true)
                                          {
                                             loop95:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   if(_loc58_ || Boolean(param3))
                                                   {
                                                      if(_loc9_.drawId == _loc30_)
                                                      {
                                                         §§push(_loc9_.index);
                                                         break;
                                                      }
                                                      §§push(1 / _loc9_.cameraZ);
                                                      if(!_loc57_)
                                                      {
                                                         §§push(Number(§§pop()));
                                                      }
                                                      _loc13_ = §§pop();
                                                      _loc23_[_loc27_] = _loc9_.cameraX * _loc21_ * _loc13_;
                                                      _loc27_++;
                                                      if(_loc58_ || Boolean(this))
                                                      {
                                                         _loc23_[_loc27_] = _loc9_.cameraY * _loc22_ * _loc13_;
                                                         if(!_loc58_)
                                                         {
                                                            break loop95;
                                                         }
                                                         §§push(_loc27_);
                                                         if(_loc58_)
                                                         {
                                                            §§push(§§pop() + 1);
                                                            if(_loc58_ || Boolean(param3))
                                                            {
                                                               §§push(int(§§pop()));
                                                               if(_loc57_ && Boolean(this))
                                                               {
                                                                  break loop93;
                                                               }
                                                               _loc27_ = §§pop();
                                                               _loc24_[_loc28_] = _loc9_.u;
                                                               §§push(_loc28_ + 1);
                                                            }
                                                            _loc28_ = int(§§pop());
                                                            _loc24_[_loc28_] = _loc9_.v;
                                                            if(_loc57_ && Boolean(this))
                                                            {
                                                               break loop73;
                                                            }
                                                            while(true)
                                                            {
                                                               §§push(_loc28_);
                                                               if(_loc58_)
                                                               {
                                                                  §§push(§§pop() + 1);
                                                                  if(_loc57_ && Boolean(param1))
                                                                  {
                                                                     break;
                                                                  }
                                                               }
                                                               §§push(int(§§pop()));
                                                               if(_loc58_ || Boolean(param1))
                                                               {
                                                                  _loc28_ = §§pop();
                                                                  _loc24_[_loc28_] = _loc13_;
                                                                  §§push(_loc28_);
                                                               }
                                                               break;
                                                            }
                                                         }
                                                         _loc28_ = int(§§pop() + 1);
                                                         if(!(_loc58_ || Boolean(param1)))
                                                         {
                                                            break loop72;
                                                         }
                                                      }
                                                   }
                                                   §§push(_loc26_);
                                                   if(_loc58_ || Boolean(param2))
                                                   {
                                                      break loop93;
                                                   }
                                                   break;
                                                }
                                                _loc10_ = §§pop();
                                                §§goto(addr149f);
                                             }
                                             §§goto(addr148e);
                                          }
                                          _loc10_ = int(§§pop());
                                          if(!(_loc57_ && Boolean(param2)))
                                          {
                                             break;
                                          }
                                          break loop95;
                                       }
                                       §§push(_loc9_);
                                       §§push(_loc26_);
                                       if(!(_loc57_ && Boolean(param1)))
                                       {
                                          var _temp_113:* = §§pop();
                                          while(true)
                                          {
                                             §§push(_temp_113);
                                             §§push(_temp_113);
                                             if(_loc58_ || Boolean(param2))
                                             {
                                                §§push(§§pop() + 1);
                                                if(_loc57_)
                                                {
                                                   break;
                                                }
                                             }
                                             §§push(int(§§pop()));
                                             break;
                                          }
                                          _loc26_ = §§pop();
                                       }
                                       §§pop().alternativa3d::index = §§pop();
                                       if(!_loc57_)
                                       {
                                          addr148e:
                                          _loc9_.drawId = _loc30_;
                                       }
                                       break;
                                    }
                                    addr149f:
                                    _loc8_ = _loc8_.next;
                                    _loc9_ = _loc8_.vertex;
                                    while(true)
                                    {
                                       if(_loc9_.drawId != _loc30_)
                                       {
                                          loop75:
                                          while(true)
                                          {
                                             loop76:
                                             while(true)
                                             {
                                                loop78:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      if(!(_loc57_ && Boolean(param1)))
                                                      {
                                                         §§push(1 / _loc9_.cameraZ);
                                                         if(!_loc57_)
                                                         {
                                                            §§push(Number(§§pop()));
                                                         }
                                                         _loc13_ = §§pop();
                                                         if(_loc57_)
                                                         {
                                                            break;
                                                         }
                                                         _loc23_[_loc27_] = _loc9_.cameraX * _loc21_ * _loc13_;
                                                         if(_loc57_ && Boolean(param1))
                                                         {
                                                            break loop78;
                                                         }
                                                         §§push(_loc27_ + 1);
                                                         if(!(_loc58_ || Boolean(param2)))
                                                         {
                                                            break loop76;
                                                         }
                                                         §§push(int(§§pop()));
                                                         if(!_loc58_)
                                                         {
                                                            break loop76;
                                                         }
                                                         _loc27_ = §§pop();
                                                         _loc23_[_loc27_] = _loc9_.cameraY * _loc22_ * _loc13_;
                                                         if(_loc57_)
                                                         {
                                                            break loop75;
                                                         }
                                                      }
                                                      §§push(int(_loc27_ + 1));
                                                      break loop76;
                                                   }
                                                   §§goto(addr156d);
                                                }
                                                _loc28_++;
                                                §§goto(addr154f);
                                             }
                                             _loc27_ = §§pop();
                                             if(!(_loc57_ && Boolean(param1)))
                                             {
                                                _loc24_[_loc28_] = _loc9_.u;
                                                break loop78;
                                             }
                                             addr154f:
                                             _loc24_[_loc28_] = _loc9_.v;
                                             §§push(int(_loc28_ + 1));
                                             if(!_loc57_)
                                             {
                                                _loc28_ = §§pop();
                                                _loc24_[_loc28_] = _loc13_;
                                                addr156d:
                                                §§push(int(_loc28_ + 1));
                                                if(!(_loc57_ && Boolean(param3)))
                                                {
                                                   _loc28_ = §§pop();
                                                   if(!(_loc57_ && Boolean(param1)))
                                                   {
                                                      _loc11_ = int(_loc26_);
                                                      break;
                                                   }
                                                   §§goto(addr15cb);
                                                }
                                             }
                                          }
                                          §§push(_loc9_);
                                          §§push(_loc26_);
                                          if(_loc58_)
                                          {
                                             var _temp_87:* = §§pop();
                                             while(true)
                                             {
                                                §§push(_temp_87);
                                                §§push(_temp_87);
                                                if(_loc58_)
                                                {
                                                   §§push(§§pop() + 1);
                                                   if(!_loc58_)
                                                   {
                                                      break;
                                                   }
                                                }
                                                §§push(int(§§pop()));
                                                break;
                                             }
                                             _loc26_ = §§pop();
                                          }
                                          §§pop().alternativa3d::index = §§pop();
                                          if(!_loc57_)
                                          {
                                             _loc9_.drawId = _loc30_;
                                             if(_loc57_ && Boolean(param1))
                                             {
                                                break;
                                             }
                                          }
                                          addr15cb:
                                          break;
                                       }
                                       §§push(_loc9_.index);
                                       if(!_loc57_)
                                       {
                                          §§push(int(§§pop()));
                                       }
                                       _loc11_ = §§pop();
                                       break;
                                    }
                                    _loc8_ = _loc8_.next;
                                    while(true)
                                    {
                                       if(!(_loc57_ && Boolean(this)))
                                       {
                                          loop14:
                                          for(; _loc8_ != null; _loc32_ = §§pop(),_loc8_ = _loc8_.next)
                                          {
                                             _loc9_ = _loc8_.vertex;
                                             loop81:
                                             while(true)
                                             {
                                                loop82:
                                                while(true)
                                                {
                                                   loop83:
                                                   while(true)
                                                   {
                                                      loop84:
                                                      while(true)
                                                      {
                                                         if(_loc9_.drawId != _loc30_)
                                                         {
                                                            loop85:
                                                            while(true)
                                                            {
                                                               loop86:
                                                               while(true)
                                                               {
                                                                  while(true)
                                                                  {
                                                                     if(_loc58_)
                                                                     {
                                                                        §§push(1 / _loc9_.cameraZ);
                                                                        if(_loc58_ || Boolean(param3))
                                                                        {
                                                                           §§push(Number(§§pop()));
                                                                        }
                                                                        _loc13_ = §§pop();
                                                                        _loc23_[_loc27_] = _loc9_.cameraX * _loc21_ * _loc13_;
                                                                        loop88:
                                                                        while(true)
                                                                        {
                                                                           loop89:
                                                                           while(true)
                                                                           {
                                                                              loop90:
                                                                              while(true)
                                                                              {
                                                                                 while(true)
                                                                                 {
                                                                                    §§push(_loc27_ + 1);
                                                                                    if(!(_loc57_ && Boolean(this)))
                                                                                    {
                                                                                       _loc27_ = int(§§pop());
                                                                                       _loc23_[_loc27_] = _loc9_.cameraY * _loc22_ * _loc13_;
                                                                                       §§push(int(_loc27_ + 1));
                                                                                       if(_loc57_ && Boolean(this))
                                                                                       {
                                                                                          break loop90;
                                                                                       }
                                                                                       _loc27_ = §§pop();
                                                                                       _loc24_[_loc28_] = _loc9_.u;
                                                                                       if(!_loc58_)
                                                                                       {
                                                                                          break;
                                                                                       }
                                                                                       §§push(_loc28_ + 1);
                                                                                       if(!(_loc58_ || Boolean(param3)))
                                                                                       {
                                                                                          break loop90;
                                                                                       }
                                                                                       §§push(int(§§pop()));
                                                                                       if(!_loc58_)
                                                                                       {
                                                                                          break loop89;
                                                                                       }
                                                                                       _loc28_ = §§pop();
                                                                                       if(_loc57_)
                                                                                       {
                                                                                          break loop88;
                                                                                       }
                                                                                       _loc24_[_loc28_] = _loc9_.v;
                                                                                       §§push(_loc28_ + 1);
                                                                                    }
                                                                                    _loc28_ = int(§§pop());
                                                                                    _loc24_[_loc28_] = _loc13_;
                                                                                    §§push(_loc28_);
                                                                                    if(_loc58_ || Boolean(this))
                                                                                    {
                                                                                       §§push(int(§§pop() + 1));
                                                                                       break loop89;
                                                                                    }
                                                                                    continue loop14;
                                                                                 }
                                                                                 §§goto(addr171a);
                                                                              }
                                                                              §§goto(addr172a);
                                                                           }
                                                                           _loc28_ = §§pop();
                                                                           §§push(_loc26_);
                                                                           if(!_loc58_)
                                                                           {
                                                                              break loop85;
                                                                           }
                                                                           _loc12_ = int(§§pop());
                                                                           §§push(_loc9_);
                                                                           §§push(_loc26_);
                                                                           if(_loc58_)
                                                                           {
                                                                              var _temp_103:* = §§pop();
                                                                              §§push(_temp_103);
                                                                              §§push(_temp_103);
                                                                              if(_loc58_)
                                                                              {
                                                                                 §§push(§§pop() + 1);
                                                                                 if(_loc58_)
                                                                                 {
                                                                                    §§push(int(§§pop()));
                                                                                 }
                                                                              }
                                                                              _loc26_ = §§pop();
                                                                           }
                                                                           §§pop().alternativa3d::index = §§pop();
                                                                           if(!_loc57_)
                                                                           {
                                                                              _loc9_.drawId = _loc30_;
                                                                              break;
                                                                           }
                                                                           §§goto(addr171a);
                                                                        }
                                                                        addr1710:
                                                                        drawIndices[_loc29_] = _loc10_;
                                                                        addr171a:
                                                                        §§push(_loc29_);
                                                                        if(_loc57_ && Boolean(param3))
                                                                        {
                                                                           continue loop14;
                                                                        }
                                                                        addr172a:
                                                                        §§push(§§pop() + 1);
                                                                        if(!_loc58_)
                                                                        {
                                                                           continue loop14;
                                                                        }
                                                                        §§push(int(§§pop()));
                                                                        if(!_loc58_)
                                                                        {
                                                                           break;
                                                                        }
                                                                        _loc29_ = §§pop();
                                                                        if(_loc57_ && Boolean(this))
                                                                        {
                                                                           break loop86;
                                                                        }
                                                                        drawIndices[_loc29_] = _loc11_;
                                                                        §§push(_loc29_ + 1);
                                                                        if(_loc57_)
                                                                        {
                                                                           break loop84;
                                                                        }
                                                                        §§push(int(§§pop()));
                                                                        if(!_loc58_)
                                                                        {
                                                                           break loop85;
                                                                        }
                                                                        _loc29_ = §§pop();
                                                                        drawIndices[_loc29_] = _loc12_;
                                                                        if(!(_loc58_ || Boolean(param3)))
                                                                        {
                                                                           break loop81;
                                                                        }
                                                                     }
                                                                     §§push(_loc29_);
                                                                     if(!_loc57_)
                                                                     {
                                                                        break loop85;
                                                                     }
                                                                     break loop83;
                                                                  }
                                                                  §§goto(addr1794);
                                                               }
                                                            }
                                                            §§push(§§pop() + 1);
                                                            if(!(_loc57_ && Boolean(param3)))
                                                            {
                                                               addr1794:
                                                               _loc29_ = int(§§pop());
                                                               if(_loc58_ || Boolean(param2))
                                                               {
                                                                  break loop86;
                                                               }
                                                               break loop81;
                                                            }
                                                            break loop82;
                                                         }
                                                         _loc12_ = _loc9_.index;
                                                         if(_loc57_)
                                                         {
                                                            break loop86;
                                                         }
                                                         §§goto(addr1710);
                                                         break loop86;
                                                      }
                                                      §§goto(addr17ab);
                                                   }
                                                   §§push(int(§§pop()));
                                                   break;
                                                }
                                                _loc11_ = §§pop();
                                                break;
                                             }
                                             addr17ab:
                                             §§push(_loc32_ + 1);
                                             if(_loc58_ || Boolean(param3))
                                             {
                                                §§push(int(§§pop()));
                                             }
                                          }
                                          if(_loc57_ && Boolean(param1))
                                          {
                                             break;
                                          }
                                       }
                                       §§push(_loc31_);
                                       if(!(_loc57_ && Boolean(param1)))
                                       {
                                          §§push(§§pop() + 1);
                                          if(!_loc57_)
                                          {
                                             §§push(int(§§pop()));
                                          }
                                       }
                                       _loc31_ = §§pop();
                                       if(_loc58_ || Boolean(param3))
                                       {
                                          break;
                                       }
                                       addr1809:
                                       _loc8_ = _loc39_;
                                       if(_loc58_ || Boolean(this))
                                       {
                                          for(; _loc8_ != null; _loc8_ = _loc8_.next)
                                          {
                                             _loc8_.vertex = null;
                                             if(_loc58_)
                                             {
                                                continue;
                                             }
                                             addr1842:
                                             param1.lastWrapper.next = _loc39_;
                                             if(!(_loc57_ && Boolean(this)))
                                             {
                                                addr1857:
                                                param1.lastWrapper = _loc52_;
                                             }
                                          }
                                          while(true)
                                          {
                                             if(_loc58_)
                                             {
                                                §§goto(addr1842);
                                             }
                                             §§goto(addr1857);
                                          }
                                       }
                                       _loc39_ = null;
                                       continue loop7;
                                    }
                                    if(_loc39_ == null)
                                    {
                                       continue loop7;
                                    }
                                    §§goto(addr1809);
                                 }
                                 _loc43_ = §§pop();
                                 if(!_loc57_)
                                 {
                                    §§push(_loc43_.vertex.cameraZ);
                                    if(!_loc57_)
                                    {
                                       §§push(Number(§§pop()));
                                    }
                                    _loc44_ = §§pop();
                                 }
                                 _loc43_ = _loc43_.next;
                                 if(!_loc57_)
                                 {
                                    §§push(_loc43_.vertex.cameraZ);
                                    if(!_loc57_)
                                    {
                                       §§push(Number(§§pop()));
                                    }
                                    _loc45_ = §§pop();
                                 }
                                 _loc43_ = _loc43_.next;
                                 if(_loc58_)
                                 {
                                    §§push(_loc43_.vertex.cameraZ);
                                    if(!(_loc57_ && Boolean(param3)))
                                    {
                                       §§push(Number(§§pop()));
                                    }
                                    _loc46_ = §§pop();
                                 }
                                 _loc43_ = _loc43_.next;
                                 var _temp_125:* = _loc44_ < _loc41_;
                                 loop98:
                                 while(true)
                                 {
                                    loop99:
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
                                                §§push(_temp_125);
                                                §§push(_temp_125);
                                                if(!(_loc57_ && Boolean(this)))
                                                {
                                                   loop133:
                                                   while(true)
                                                   {
                                                      while(true)
                                                      {
                                                         if(!Boolean(§§pop()))
                                                         {
                                                            §§pop();
                                                            if(!_loc58_)
                                                            {
                                                               break loop130;
                                                            }
                                                            §§push(_loc45_);
                                                            if(!_loc58_)
                                                            {
                                                               break;
                                                            }
                                                            §§push(§§pop() < _loc41_);
                                                            if(_loc57_ && Boolean(param3))
                                                            {
                                                               break loop133;
                                                            }
                                                         }
                                                         var _temp_168:* = §§pop();
                                                         while(true)
                                                         {
                                                            §§push(_temp_168);
                                                            §§push(Boolean(_temp_168));
                                                            if(_loc58_ || Boolean(this))
                                                            {
                                                               if(!§§pop())
                                                               {
                                                                  §§pop();
                                                                  §§push(_loc46_ < _loc41_);
                                                               }
                                                               break loop133;
                                                            }
                                                            addr0d8a:
                                                            if(!Boolean(§§pop()))
                                                            {
                                                               if(_loc57_ && Boolean(param2))
                                                               {
                                                                  break loop132;
                                                               }
                                                               §§pop();
                                                               §§push(_loc45_);
                                                               if(!(_loc58_ || Boolean(param3)))
                                                               {
                                                                  break loop99;
                                                               }
                                                               §§push(§§pop() > _loc42_);
                                                               if(_loc58_ || Boolean(param1))
                                                               {
                                                                  §§push(Boolean(§§pop()));
                                                                  if(_loc57_)
                                                                  {
                                                                     break loop131;
                                                                  }
                                                               }
                                                            }
                                                            var _temp_173:* = §§pop();
                                                            §§push(_temp_173);
                                                            §§push(_temp_173);
                                                            if(!_loc57_)
                                                            {
                                                               break;
                                                            }
                                                         }
                                                         addr0dcd:
                                                      }
                                                      §§push(§§pop() > _loc42_);
                                                      if(_loc57_)
                                                      {
                                                         break loop98;
                                                      }
                                                      var _temp_174:* = §§pop();
                                                      while(true)
                                                      {
                                                         §§push(_temp_174);
                                                         §§push(_temp_174);
                                                         if(!_loc57_)
                                                         {
                                                            §§goto(addr0d8a);
                                                         }
                                                         §§goto(addr0dcd);
                                                      }
                                                   }
                                                   _loc47_ = Boolean(§§pop());
                                                   §§push(_loc44_);
                                                   if(!(_loc57_ && Boolean(param3)))
                                                   {
                                                      break loop134;
                                                   }
                                                   break loop99;
                                                }
                                                if(!§§pop())
                                                {
                                                   §§pop();
                                                   §§push(_loc46_);
                                                   break loop99;
                                                }
                                                §§goto(addr0ddf);
                                             }
                                             §§goto(addr0e38);
                                          }
                                          §§goto(addr0dde);
                                       }
                                       §§goto(addr0e72);
                                    }
                                    §§push(_loc42_);
                                    if(!_loc57_)
                                    {
                                       addr0dde:
                                       addr0ddf:
                                       §§push(§§pop() > §§pop());
                                       if(!(_loc57_ && Boolean(param1)))
                                       {
                                          break;
                                       }
                                       §§goto(addr0e81);
                                    }
                                    else
                                    {
                                       §§goto(addr0e16);
                                    }
                                 }
                                 _loc48_ = §§pop();
                                 loop10:
                                 while(true)
                                 {
                                    loop100:
                                    while(true)
                                    {
                                       if(_loc43_ != null)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc43_.vertex.cameraZ);
                                             if(_loc58_)
                                             {
                                                addr0e16:
                                                §§push(Number(§§pop()));
                                                if(_loc58_ || Boolean(param1))
                                                {
                                                   _loc49_ = §§pop();
                                                   §§push(_loc49_);
                                                }
                                                if(§§pop() < _loc41_)
                                                {
                                                   §§push(true);
                                                   if(!_loc58_)
                                                   {
                                                      break;
                                                   }
                                                   _loc47_ = §§pop();
                                                   if(_loc58_)
                                                   {
                                                      continue loop10;
                                                   }
                                                   §§goto(addr0e72);
                                                }
                                                else
                                                {
                                                   §§push(_loc49_);
                                                }
                                             }
                                             if(§§pop() > _loc42_)
                                             {
                                                §§push(true);
                                                break;
                                             }
                                             continue loop10;
                                          }
                                          addr0e38:
                                          _loc48_ = Boolean(§§pop());
                                          continue loop10;
                                       }
                                       if(!(_loc57_ && Boolean(this)))
                                       {
                                          while(true)
                                          {
                                             §§push(!_loc47_);
                                             if(!(_loc57_ && Boolean(param3)))
                                             {
                                                if(§§pop())
                                                {
                                                   if(!_loc57_)
                                                   {
                                                      addr0e72:
                                                      _loc8_ = _loc5_.wrapper;
                                                      break loop100;
                                                   }
                                                   break;
                                                }
                                                §§push(_loc48_);
                                             }
                                             addr0e81:
                                             if(!§§pop())
                                             {
                                                break;
                                             }
                                             _loc50_ = _loc5_.create();
                                             if(_loc58_)
                                             {
                                                param1.lastFace.next = _loc50_;
                                                if(!(_loc57_ && Boolean(param1)))
                                                {
                                                   param1.lastFace = _loc50_;
                                                }
                                             }
                                             _loc51_ = null;
                                             _loc52_ = null;
                                             §§push(_loc5_.wrapper.next);
                                             if(_loc58_)
                                             {
                                                §§push(§§pop().alternativa3d::next);
                                             }
                                             _loc43_ = §§pop();
                                             if(_loc58_)
                                             {
                                                loop11:
                                                while(true)
                                                {
                                                   §§push(_loc43_.next);
                                                   do
                                                   {
                                                      if(§§pop() == null)
                                                      {
                                                         break loop11;
                                                      }
                                                      §§push(_loc43_.next);
                                                   }
                                                   while(_loc57_);
                                                   _loc43_ = §§pop();
                                                }
                                             }
                                             _loc54_ = _loc43_.vertex;
                                             if(!(_loc57_ && Boolean(param2)))
                                             {
                                                §§push(_loc54_.cameraZ);
                                                if(!_loc57_)
                                                {
                                                   §§push(Number(§§pop()));
                                                }
                                                _loc44_ = §§pop();
                                             }
                                             _loc43_ = _loc5_.wrapper;
                                             loop102:
                                             while(true)
                                             {
                                                if(_loc58_ || Boolean(param1))
                                                {
                                                   loop13:
                                                   while(_loc43_ != null)
                                                   {
                                                      _loc55_ = _loc43_.vertex;
                                                      loop103:
                                                      while(true)
                                                      {
                                                         loop104:
                                                         while(true)
                                                         {
                                                            loop105:
                                                            while(true)
                                                            {
                                                               if(_loc58_)
                                                               {
                                                                  _loc45_ = _loc55_.cameraZ;
                                                                  var _temp_136:* = _loc44_ < _loc41_;
                                                                  loop107:
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        loop121:
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
                                                                                    §§push(_temp_136);
                                                                                    §§push(_temp_136);
                                                                                    if(_loc58_ || Boolean(param2))
                                                                                    {
                                                                                       while(true)
                                                                                       {
                                                                                          §§push(Boolean(§§pop()));
                                                                                          if(!(_loc57_ && Boolean(this)))
                                                                                          {
                                                                                             if(§§pop())
                                                                                             {
                                                                                                §§pop();
                                                                                                §§push(_loc45_ > _loc42_);
                                                                                                if(_loc57_)
                                                                                                {
                                                                                                   continue loop122;
                                                                                                }
                                                                                                §§push(Boolean(§§pop()));
                                                                                                if(_loc57_)
                                                                                                {
                                                                                                   break loop126;
                                                                                                }
                                                                                             }
                                                                                             var _temp_157:* = §§pop();
                                                                                             §§push(_temp_157);
                                                                                             §§push(_temp_157);
                                                                                             if(!_loc57_)
                                                                                             {
                                                                                                §§push(Boolean(§§pop()));
                                                                                                if(!(_loc58_ || Boolean(param3)))
                                                                                                {
                                                                                                   break;
                                                                                                }
                                                                                             }
                                                                                          }
                                                                                          if(!§§pop())
                                                                                          {
                                                                                             if(!(_loc58_ || Boolean(param1)))
                                                                                             {
                                                                                                break loop125;
                                                                                             }
                                                                                             §§pop();
                                                                                             §§push(_loc44_);
                                                                                             if(_loc57_)
                                                                                             {
                                                                                                break loop124;
                                                                                             }
                                                                                             §§push(_loc42_);
                                                                                             if(_loc57_ && Boolean(this))
                                                                                             {
                                                                                                break loop121;
                                                                                             }
                                                                                             §§push(§§pop() > §§pop());
                                                                                             if(!_loc57_)
                                                                                             {
                                                                                                var _temp_161:* = Boolean(§§pop());
                                                                                                §§push(_temp_161);
                                                                                                §§push(_temp_161);
                                                                                                if(!(_loc57_ && Boolean(this)))
                                                                                                {
                                                                                                   break;
                                                                                                }
                                                                                                break loop107;
                                                                                             }
                                                                                          }
                                                                                          continue loop122;
                                                                                       }
                                                                                    }
                                                                                    §§push(Boolean(§§pop()));
                                                                                    break loop107;
                                                                                 }
                                                                                 §§goto(addr0ff6);
                                                                              }
                                                                              §§goto(addr1008);
                                                                           }
                                                                           §§goto(addr101e);
                                                                        }
                                                                        §§goto(addr1007);
                                                                     }
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           if(§§pop())
                                                                           {
                                                                              §§push(_loc34_);
                                                                              if(!_loc57_)
                                                                              {
                                                                                 §§goto(addr1015);
                                                                              }
                                                                              §§goto(addr1036);
                                                                           }
                                                                           §§goto(addr1214);
                                                                        }
                                                                        §§goto(addr1216);
                                                                     }
                                                                     §§goto(addr121e);
                                                                  }
                                                                  if(!§§pop())
                                                                  {
                                                                     break loop108;
                                                                  }
                                                                  addr0ff6:
                                                                  §§pop();
                                                                  while(true)
                                                                  {
                                                                     §§push(_loc45_);
                                                                     if(_loc58_)
                                                                     {
                                                                        addr1017:
                                                                        §§push(_loc41_);
                                                                        if(!_loc57_)
                                                                        {
                                                                           addr1007:
                                                                           addr1008:
                                                                           §§push(§§pop() < §§pop());
                                                                           break loop108;
                                                                        }
                                                                        §§push(§§pop() - §§pop());
                                                                        if(_loc58_)
                                                                        {
                                                                           addr101e:
                                                                           §§push(_loc45_);
                                                                           if(!_loc57_)
                                                                           {
                                                                              §§push(§§pop() - _loc44_);
                                                                              if(!_loc57_)
                                                                              {
                                                                                 §§push(§§pop() / §§pop());
                                                                                 if(!_loc57_)
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 break loop105;
                                                                              }
                                                                           }
                                                                           addr121e:
                                                                           if(§§pop() > §§pop())
                                                                           {
                                                                              break loop103;
                                                                           }
                                                                           §§push(_loc43_.create());
                                                                           if(!(_loc57_ && Boolean(param1)))
                                                                           {
                                                                              _loc53_ = §§pop();
                                                                              while(true)
                                                                              {
                                                                                 if(_loc58_)
                                                                                 {
                                                                                    _loc53_.vertex = _loc55_;
                                                                                    if(!(_loc58_ || Boolean(param3)))
                                                                                    {
                                                                                       break;
                                                                                    }
                                                                                 }
                                                                                 if(_loc51_ != null)
                                                                                 {
                                                                                    if(_loc57_)
                                                                                    {
                                                                                       break;
                                                                                    }
                                                                                    _loc51_.next = _loc53_;
                                                                                    if(!(_loc57_ && Boolean(param2)))
                                                                                    {
                                                                                       break;
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    _loc50_.wrapper = _loc53_;
                                                                                 }
                                                                                 addr127e:
                                                                                 _loc51_ = _loc53_;
                                                                                 break loop103;
                                                                              }
                                                                              §§goto(addr127e);
                                                                           }
                                                                           §§goto(addr1291);
                                                                        }
                                                                        addr1216:
                                                                        §§push(_loc42_);
                                                                        if(!_loc58_)
                                                                        {
                                                                           break loop104;
                                                                        }
                                                                        §§goto(addr121e);
                                                                     }
                                                                     addr1015:
                                                                     §§goto(addr1017);
                                                                  }
                                                                  addr1036:
                                                                  _loc13_ = Number(§§pop());
                                                                  _loc56_ = _loc55_.create();
                                                                  param1.lastVertex.next = _loc56_;
                                                                  if(_loc58_)
                                                                  {
                                                                     param1.lastVertex = _loc56_;
                                                                  }
                                                                  §§push(_loc56_);
                                                                  §§push(_loc54_.cameraX);
                                                                  if(_loc58_ || Boolean(param2))
                                                                  {
                                                                     loop111:
                                                                     while(true)
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc55_.cameraX);
                                                                           if(!(_loc57_ && Boolean(this)))
                                                                           {
                                                                              §§push(_loc54_.cameraX);
                                                                              if(_loc57_ && Boolean(param2))
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(§§pop() - §§pop());
                                                                              if(_loc57_)
                                                                              {
                                                                                 break loop111;
                                                                              }
                                                                           }
                                                                           §§push(_loc13_);
                                                                           break;
                                                                        }
                                                                        §§push(§§pop() * §§pop());
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§pop().alternativa3d::cameraX = §§pop();
                                                                  §§push(_loc56_);
                                                                  §§push(_loc54_.cameraY);
                                                                  if(_loc58_ || Boolean(param3))
                                                                  {
                                                                     §§push(_loc55_.cameraY);
                                                                     if(_loc58_ || Boolean(param1))
                                                                     {
                                                                        while(true)
                                                                        {
                                                                           §§push(_loc54_.cameraY);
                                                                           if(!(_loc57_ && Boolean(param2)))
                                                                           {
                                                                              §§push(§§pop() - §§pop());
                                                                              if(!(_loc58_ || Boolean(param3)))
                                                                              {
                                                                                 break;
                                                                              }
                                                                              §§push(_loc13_);
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
                                                                     if(_loc58_ || Boolean(param3))
                                                                     {
                                                                        _loc56_.cameraZ = _loc34_;
                                                                        §§push(_loc56_);
                                                                        §§push(_loc54_.u);
                                                                        if(_loc58_ || Boolean(param1))
                                                                        {
                                                                           loop115:
                                                                           while(true)
                                                                           {
                                                                              while(true)
                                                                              {
                                                                                 §§push(_loc55_.u);
                                                                                 if(_loc58_)
                                                                                 {
                                                                                    §§push(_loc54_.u);
                                                                                    if(!(_loc58_ || Boolean(this)))
                                                                                    {
                                                                                       break;
                                                                                    }
                                                                                    §§push(§§pop() - §§pop());
                                                                                    if(!(_loc58_ || Boolean(param1)))
                                                                                    {
                                                                                       break loop115;
                                                                                    }
                                                                                 }
                                                                                 §§push(_loc13_);
                                                                                 break;
                                                                              }
                                                                              §§push(§§pop() * §§pop());
                                                                              break;
                                                                           }
                                                                        }
                                                                        §§pop().u = §§pop();
                                                                        if(_loc57_)
                                                                        {
                                                                           break;
                                                                        }
                                                                     }
                                                                     §§push(_loc56_);
                                                                     §§push(_loc54_.v);
                                                                     if(_loc58_ || Boolean(param1))
                                                                     {
                                                                        §§push(_loc55_.v);
                                                                        if(!(_loc57_ && Boolean(param3)))
                                                                        {
                                                                           while(true)
                                                                           {
                                                                              §§push(_loc54_.v);
                                                                              if(!_loc57_)
                                                                              {
                                                                                 §§push(§§pop() - §§pop());
                                                                                 if(_loc57_)
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(_loc13_);
                                                                              }
                                                                              §§push(§§pop() * §§pop());
                                                                              break;
                                                                           }
                                                                        }
                                                                        §§push(§§pop() + §§pop());
                                                                     }
                                                                     §§pop().v = §§pop();
                                                                     break;
                                                                  }
                                                                  _loc53_ = _loc43_.create();
                                                                  while(true)
                                                                  {
                                                                     if(_loc58_ || Boolean(this))
                                                                     {
                                                                        _loc53_.vertex = _loc56_;
                                                                        if(_loc57_)
                                                                        {
                                                                           break;
                                                                        }
                                                                     }
                                                                     if(_loc51_ != null)
                                                                     {
                                                                        if(!(_loc57_ && Boolean(param1)))
                                                                        {
                                                                           break;
                                                                        }
                                                                        addr11c6:
                                                                     }
                                                                     else
                                                                     {
                                                                        _loc50_.wrapper = _loc53_;
                                                                     }
                                                                     addr11d0:
                                                                     _loc51_ = _loc53_;
                                                                     _loc53_ = _loc43_.create();
                                                                     loop119:
                                                                     while(true)
                                                                     {
                                                                        if(_loc58_)
                                                                        {
                                                                           _loc53_.vertex = _loc56_;
                                                                           while(true)
                                                                           {
                                                                              if(_loc58_)
                                                                              {
                                                                                 if(_loc52_ == null)
                                                                                 {
                                                                                    _loc8_ = _loc53_;
                                                                                    break loop119;
                                                                                 }
                                                                                 if(_loc57_)
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                              }
                                                                              _loc52_.next = _loc53_;
                                                                              break;
                                                                           }
                                                                        }
                                                                        break;
                                                                     }
                                                                     _loc52_ = _loc53_;
                                                                     addr1214:
                                                                     §§goto(addr1216);
                                                                  }
                                                                  _loc51_.next = _loc53_;
                                                                  if(_loc58_)
                                                                  {
                                                                     §§goto(addr11c6);
                                                                  }
                                                                  §§goto(addr11d0);
                                                                  §§push(_loc44_);
                                                               }
                                                               §§goto(addr1222);
                                                            }
                                                            §§goto(addr1286);
                                                         }
                                                         if(§§pop() >= §§pop())
                                                         {
                                                            addr1291:
                                                            _loc53_ = _loc43_.create();
                                                            while(true)
                                                            {
                                                               if(_loc58_)
                                                               {
                                                                  _loc53_.vertex = _loc55_;
                                                                  if(_loc58_)
                                                                  {
                                                                     if(_loc52_ == null)
                                                                     {
                                                                        _loc8_ = _loc53_;
                                                                        addr12c4:
                                                                        _loc52_ = _loc53_;
                                                                        addr12ca:
                                                                        _loc54_ = _loc55_;
                                                                        if(_loc58_ || Boolean(param2))
                                                                        {
                                                                           §§push(_loc45_);
                                                                           if(!(_loc57_ && Boolean(this)))
                                                                           {
                                                                              §§push(Number(§§pop()));
                                                                           }
                                                                           _loc44_ = §§pop();
                                                                        }
                                                                        _loc43_ = _loc43_.next;
                                                                        continue loop13;
                                                                     }
                                                                     if(_loc57_)
                                                                     {
                                                                        break;
                                                                     }
                                                                  }
                                                               }
                                                               _loc52_.next = _loc53_;
                                                               break;
                                                            }
                                                            §§goto(addr12c4);
                                                         }
                                                         §§goto(addr12ca);
                                                      }
                                                      addr1286:
                                                      §§push(_loc45_);
                                                      §§push(_loc41_);
                                                      break loop104;
                                                   }
                                                   while(true)
                                                   {
                                                      if(!_loc57_)
                                                      {
                                                         if(param3 == null)
                                                         {
                                                            param3 = _loc50_;
                                                            break loop102;
                                                         }
                                                         if(!(_loc58_ || Boolean(param1)))
                                                         {
                                                            break;
                                                         }
                                                      }
                                                      _loc7_.processNext = _loc50_;
                                                      break;
                                                   }
                                                }
                                                break;
                                             }
                                             _loc7_ = _loc50_;
                                             _loc39_ = _loc8_;
                                             break loop100;
                                          }
                                          if(param3 != null)
                                          {
                                             _loc7_.processNext = _loc5_;
                                          }
                                          else
                                          {
                                             param3 = _loc5_;
                                          }
                                          _loc7_ = _loc5_;
                                          break;
                                       }
                                       §§goto(addr0e72);
                                    }
                                    _loc43_ = _loc43_.next;
                                    §§goto(addr1335);
                                 }
                                 break loop67;
                              }
                              if(_loc58_ || Boolean(param2))
                              {
                                 §§push(_loc34_);
                                 if(_loc58_)
                                 {
                                    §§push(§§pop() * 0.5);
                                    if(_loc58_)
                                    {
                                       §§push(Number(§§pop()));
                                    }
                                 }
                                 _loc34_ = §§pop();
                                 if(_loc58_)
                                 {
                                    _loc23_.length = _loc27_;
                                    if(_loc58_ || Boolean(param3))
                                    {
                                       addr18aa:
                                       _loc24_.length = _loc28_;
                                       if(!(_loc57_ && Boolean(param1)))
                                       {
                                          _loc25_.length = _loc29_;
                                       }
                                    }
                                 }
                                 addr18c4:
                                 _loc20_ = this.mipMap[_loc40_];
                                 if(_loc58_ || Boolean(param2))
                                 {
                                    if(this.correctUV)
                                    {
                                       if(_loc58_)
                                       {
                                          §§push(-0.5);
                                          if(_loc58_ || Boolean(param2))
                                          {
                                             §§push(_loc20_.width - 1);
                                             if(_loc58_)
                                             {
                                                §§push(§§pop() / §§pop());
                                                if(_loc58_ || Boolean(param2))
                                                {
                                                   _loc18_ = §§pop();
                                                   if(_loc58_ || Boolean(this))
                                                   {
                                                      addr1927:
                                                      §§push(-0.5);
                                                      §§push(_loc20_.height - 1);
                                                      if(!(_loc57_ && Boolean(param2)))
                                                      {
                                                         _loc19_ = §§pop() / §§pop();
                                                         if(_loc58_ || Boolean(param1))
                                                         {
                                                            §§push(1);
                                                            §§push(_loc18_);
                                                            if(!(_loc57_ && Boolean(this)))
                                                            {
                                                               §§push(§§pop() - §§pop());
                                                               if(_loc58_ || Boolean(param1))
                                                               {
                                                                  §§push(_loc18_);
                                                                  if(!_loc57_)
                                                                  {
                                                                     addr1979:
                                                                     §§push(§§pop() - §§pop());
                                                                     if(!(_loc57_ && Boolean(param1)))
                                                                     {
                                                                        addr1988:
                                                                        §§push(Number(§§pop()));
                                                                        if(_loc58_)
                                                                        {
                                                                           addr198f:
                                                                           _loc16_ = §§pop();
                                                                           if(!_loc57_)
                                                                           {
                                                                              §§push(1);
                                                                              if(_loc58_)
                                                                              {
                                                                                 addr19a1:
                                                                                 addr19b3:
                                                                                 §§push(§§pop() - _loc19_);
                                                                                 if(!(_loc57_ && Boolean(this)))
                                                                                 {
                                                                                    addr19b0:
                                                                                    addr19b2:
                                                                                    §§push(§§pop() - _loc19_);
                                                                                 }
                                                                                 _loc17_ = Number(§§pop());
                                                                                 _loc15_ = 0;
                                                                                 if(!_loc57_)
                                                                                 {
                                                                                    addr19c1:
                                                                                    while(true)
                                                                                    {
                                                                                       loop137:
                                                                                       while(true)
                                                                                       {
                                                                                          while(true)
                                                                                          {
                                                                                             if(_loc15_ < _loc28_)
                                                                                             {
                                                                                                _loc24_[_loc15_] = _loc24_[_loc15_] * _loc16_ + _loc18_;
                                                                                                if(_loc57_ && Boolean(param3))
                                                                                                {
                                                                                                   continue;
                                                                                                }
                                                                                                _loc15_++;
                                                                                                if(!_loc57_)
                                                                                                {
                                                                                                   _loc24_[_loc15_] = _loc24_[_loc15_] * _loc17_ + _loc19_;
                                                                                                   §§push(_loc15_ + 1);
                                                                                                   if(!(_loc57_ && Boolean(param1)))
                                                                                                   {
                                                                                                      §§push(int(§§pop()));
                                                                                                      if(!(_loc58_ || Boolean(this)))
                                                                                                      {
                                                                                                         break loop137;
                                                                                                      }
                                                                                                   }
                                                                                                   _loc15_ = §§pop();
                                                                                                   §§push(_loc15_);
                                                                                                   break loop137;
                                                                                                }
                                                                                             }
                                                                                          }
                                                                                          §§goto(addr19c1);
                                                                                       }
                                                                                       §§push(§§pop() + 1);
                                                                                       if(!(_loc57_ && Boolean(param3)))
                                                                                       {
                                                                                          §§push(int(§§pop()));
                                                                                       }
                                                                                       _loc15_ = §§pop();
                                                                                       continue loop138;
                                                                                    }
                                                                                    break;
                                                                                 }
                                                                                 addr1a42:
                                                                                 param2.gfx.beginBitmapFill(_loc20_,null,this.repeat,this.smooth);
                                                                                 if(!(_loc57_ && Boolean(param1)))
                                                                                 {
                                                                                    param2.gfx.drawTriangles(_loc23_,_loc25_,_loc24_,"none");
                                                                                    if(!(_loc57_ && Boolean(this)))
                                                                                    {
                                                                                       addr1a7d:
                                                                                       §§push(_loc40_);
                                                                                       if(_loc58_ || Boolean(param1))
                                                                                       {
                                                                                          §§push(§§pop() - 1);
                                                                                       }
                                                                                       _loc40_ = §§pop();
                                                                                    }
                                                                                 }
                                                                                 §§goto(addr1a91);
                                                                              }
                                                                              break loop137;
                                                                           }
                                                                           §§goto(addr1a42);
                                                                        }
                                                                        §§goto(addr19b0);
                                                                     }
                                                                     §§goto(addr198f);
                                                                  }
                                                                  §§goto(addr19b2);
                                                               }
                                                               §§goto(addr1988);
                                                            }
                                                            §§goto(addr19a1);
                                                         }
                                                         §§goto(addr1a7d);
                                                      }
                                                      §§goto(addr19b2);
                                                   }
                                                   continue loop137;
                                                }
                                                §§goto(addr19b3);
                                             }
                                             §§goto(addr1979);
                                          }
                                          §§goto(addr19b3);
                                       }
                                       §§goto(addr1927);
                                    }
                                    §§goto(addr1a42);
                                 }
                                 continue loop137;
                              }
                              §§goto(addr18aa);
                           }
                           §§goto(addr18c4);
                        }
                        §§goto(addr0c0f);
                     }
                     §§goto(addr0bee);
                  }
                  break loop10;
               }
               if(_loc58_ || Boolean(this))
               {
                  §§push(_loc30_ + 1);
                  if(_loc58_ || Boolean(param2))
                  {
                     _loc30_ = int(§§pop());
                     break loop16;
                  }
                  addr01a8:
                  _loc29_ = §§pop();
                  _loc5_ = param3;
                  loop2:
                  for(; _loc5_ != null; _loc5_ = _loc6_)
                  {
                     _loc6_ = _loc5_.processNext;
                     if(!_loc57_)
                     {
                        _loc5_.processNext = null;
                     }
                     _loc8_ = _loc5_.wrapper;
                     _loc9_ = _loc8_.vertex;
                     loop18:
                     while(true)
                     {
                        while(true)
                        {
                           while(true)
                           {
                              §§push(_loc9_.drawId);
                              if(_loc58_ || Boolean(param2))
                              {
                                 if(§§pop() == _loc30_)
                                 {
                                    §§push(_loc9_.index);
                                    if(_loc58_)
                                    {
                                       §§push(int(§§pop()));
                                    }
                                    break;
                                 }
                                 if(!_loc58_)
                                 {
                                    break loop18;
                                 }
                                 §§push(1 / _loc9_.cameraZ);
                                 if(_loc58_ || Boolean(param1))
                                 {
                                    §§push(Number(§§pop()));
                                 }
                                 _loc13_ = §§pop();
                                 _loc23_[_loc27_] = _loc9_.cameraX * _loc21_ * _loc13_;
                                 §§push(_loc27_ + 1);
                              }
                              _loc27_ = int(§§pop());
                              _loc23_[_loc27_] = _loc9_.cameraY * _loc22_ * _loc13_;
                              loop44:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(int(_loc27_ + 1));
                                    if(!_loc57_)
                                    {
                                       _loc27_ = §§pop();
                                       _loc24_[_loc28_] = _loc9_.u;
                                       §§push(_loc28_);
                                       if(!_loc58_)
                                       {
                                          break;
                                       }
                                       §§push(§§pop() + 1);
                                       if(_loc57_ && Boolean(param1))
                                       {
                                          break loop44;
                                       }
                                    }
                                    _loc28_ = int(§§pop());
                                    break loop18;
                                 }
                                 §§goto(addr029a);
                              }
                              §§goto(addr026f);
                           }
                           §§goto(addr02ee);
                        }
                        _loc8_ = _loc8_.next;
                        _loc9_ = _loc8_.vertex;
                        loop24:
                        while(true)
                        {
                           if(_loc9_.drawId != _loc30_)
                           {
                              loop25:
                              while(true)
                              {
                                 loop26:
                                 while(true)
                                 {
                                    loop40:
                                    while(true)
                                    {
                                       §§push(1);
                                       if(!_loc57_)
                                       {
                                          §§push(§§pop() / _loc9_.cameraZ);
                                          if(!(_loc57_ && Boolean(param2)))
                                          {
                                             §§push(Number(§§pop()));
                                          }
                                          _loc13_ = §§pop();
                                          loop41:
                                          while(true)
                                          {
                                             loop42:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   if(_loc58_)
                                                   {
                                                      _loc23_[_loc27_] = _loc9_.cameraX * _loc21_ * _loc13_;
                                                      if(!(_loc58_ || Boolean(this)))
                                                      {
                                                         break;
                                                      }
                                                      §§push(_loc27_ + 1);
                                                      if(_loc57_ && Boolean(param3))
                                                      {
                                                         break loop42;
                                                      }
                                                      _loc27_ = int(§§pop());
                                                      _loc23_[_loc27_] = _loc9_.cameraY * _loc22_ * _loc13_;
                                                      if(_loc58_ || Boolean(param3))
                                                      {
                                                         §§push(_loc27_);
                                                         if(_loc57_)
                                                         {
                                                            break loop41;
                                                         }
                                                         §§push(§§pop() + 1);
                                                         if(!(_loc58_ || Boolean(param2)))
                                                         {
                                                            break loop40;
                                                         }
                                                         _loc27_ = int(§§pop());
                                                      }
                                                      _loc24_[_loc28_] = _loc9_.u;
                                                   }
                                                   §§push(_loc28_ + 1);
                                                   if(!(_loc57_ && Boolean(param2)))
                                                   {
                                                      break loop42;
                                                   }
                                                   addr0474:
                                                   §§push(int(§§pop()));
                                                   break loop24;
                                                }
                                                §§goto(addr03f0);
                                             }
                                             §§push(int(§§pop()));
                                             if(_loc58_ || Boolean(param2))
                                             {
                                                break;
                                             }
                                             break loop26;
                                          }
                                          _loc28_ = §§pop();
                                          _loc24_[_loc28_] = _loc9_.v;
                                          §§push(_loc28_ + 1);
                                          if(!_loc58_)
                                          {
                                             break loop25;
                                          }
                                          §§push(int(§§pop()));
                                          if(_loc57_ && Boolean(param2))
                                          {
                                             break loop25;
                                          }
                                          _loc28_ = §§pop();
                                          _loc24_[_loc28_] = _loc13_;
                                          addr03f0:
                                          §§push(_loc28_);
                                          if(_loc58_ || Boolean(param1))
                                          {
                                             §§push(§§pop() + 1);
                                          }
                                       }
                                       §§push(int(§§pop()));
                                       if(!(_loc57_ && Boolean(param1)))
                                       {
                                          break loop25;
                                       }
                                       break loop26;
                                    }
                                    _loc11_ = §§pop();
                                    §§goto(addr042b);
                                 }
                                 §§push(int(§§pop()));
                                 break loop40;
                              }
                              _loc28_ = §§pop();
                              if(_loc58_ || Boolean(param1))
                              {
                                 §§push(_loc26_);
                                 if(!_loc57_)
                                 {
                                    break loop26;
                                 }
                                 break;
                              }
                              addr042b:
                              §§push(_loc9_);
                              §§push(_loc26_);
                              if(_loc58_ || Boolean(param3))
                              {
                                 var _temp_14:* = §§pop();
                                 §§push(_temp_14);
                                 §§push(_temp_14);
                                 if(_loc58_ || Boolean(param2))
                                 {
                                    §§push(§§pop() + 1);
                                    if(!(_loc57_ && Boolean(param3)))
                                    {
                                       §§push(int(§§pop()));
                                    }
                                 }
                                 _loc26_ = §§pop();
                              }
                              §§pop().alternativa3d::index = §§pop();
                              _loc9_.drawId = _loc30_;
                              if(_loc57_)
                              {
                              }
                              addr0477:
                              _loc8_ = _loc8_.next;
                              if(!_loc57_)
                              {
                                 loop8:
                                 for(; _loc8_ != null; _loc8_ = _loc8_.next)
                                 {
                                    _loc9_ = _loc8_.vertex;
                                    loop27:
                                    while(true)
                                    {
                                       loop28:
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
                                                   loop34:
                                                   while(true)
                                                   {
                                                      loop35:
                                                      while(true)
                                                      {
                                                         if(!(_loc57_ && Boolean(param2)))
                                                         {
                                                            loop36:
                                                            while(true)
                                                            {
                                                               loop37:
                                                               while(true)
                                                               {
                                                                  while(true)
                                                                  {
                                                                     §§push(_loc9_.drawId);
                                                                     if(_loc58_)
                                                                     {
                                                                        if(§§pop() == _loc30_)
                                                                        {
                                                                           §§push(_loc9_.index);
                                                                           if(!_loc57_)
                                                                           {
                                                                              §§push(int(§§pop()));
                                                                              if(_loc58_ || Boolean(param1))
                                                                              {
                                                                                 _loc12_ = §§pop();
                                                                                 break;
                                                                              }
                                                                              break loop34;
                                                                           }
                                                                           break loop35;
                                                                        }
                                                                        if(!_loc58_)
                                                                        {
                                                                           break loop31;
                                                                        }
                                                                        §§push(1 / _loc9_.cameraZ);
                                                                        if(_loc58_ || Boolean(param2))
                                                                        {
                                                                           §§push(Number(§§pop()));
                                                                        }
                                                                        _loc13_ = §§pop();
                                                                        _loc23_[_loc27_] = _loc9_.cameraX * _loc21_ * _loc13_;
                                                                        if(_loc57_)
                                                                        {
                                                                           break loop37;
                                                                        }
                                                                        §§push(_loc27_);
                                                                        if(!(_loc58_ || Boolean(param3)))
                                                                        {
                                                                           break loop36;
                                                                        }
                                                                        §§push(§§pop() + 1);
                                                                     }
                                                                     §§push(int(§§pop()));
                                                                     if(!(_loc57_ && Boolean(param3)))
                                                                     {
                                                                        _loc27_ = §§pop();
                                                                        _loc23_[_loc27_] = _loc9_.cameraY * _loc22_ * _loc13_;
                                                                        _loc27_++;
                                                                        _loc24_[_loc28_] = _loc9_.u;
                                                                        if(_loc58_ || Boolean(param1))
                                                                        {
                                                                           break loop37;
                                                                        }
                                                                        §§goto(addr0550);
                                                                     }
                                                                     §§goto(addr0575);
                                                                  }
                                                                  §§goto(addr05d5);
                                                               }
                                                               §§push(_loc28_ + 1);
                                                               if(_loc58_)
                                                               {
                                                                  §§push(int(§§pop()));
                                                                  if(_loc58_)
                                                                  {
                                                                     _loc28_ = §§pop();
                                                                     _loc24_[_loc28_] = _loc9_.v;
                                                                     addr0550:
                                                                     _loc28_++;
                                                                     _loc24_[_loc28_] = _loc13_;
                                                                     if(!(_loc57_ && Boolean(param1)))
                                                                     {
                                                                        §§push(_loc28_);
                                                                        break;
                                                                     }
                                                                     break loop39;
                                                                  }
                                                                  break loop27;
                                                               }
                                                               break loop28;
                                                            }
                                                            _loc28_ = int(§§pop() + 1);
                                                            addr0575:
                                                            _loc12_ = int(_loc26_);
                                                            if(!_loc58_)
                                                            {
                                                               break loop33;
                                                            }
                                                            §§push(_loc9_);
                                                            §§push(_loc26_);
                                                            if(_loc58_)
                                                            {
                                                               var _temp_19:* = §§pop();
                                                               while(true)
                                                               {
                                                                  §§push(_temp_19);
                                                                  §§push(_temp_19);
                                                                  if(_loc58_ || Boolean(param1))
                                                                  {
                                                                     §§push(§§pop() + 1);
                                                                     if(!(_loc58_ || Boolean(param1)))
                                                                     {
                                                                        break;
                                                                     }
                                                                  }
                                                                  §§push(int(§§pop()));
                                                                  break;
                                                               }
                                                               _loc26_ = §§pop();
                                                            }
                                                            §§pop().alternativa3d::index = §§pop();
                                                            _loc9_.drawId = _loc30_;
                                                            if(_loc57_)
                                                            {
                                                               break loop32;
                                                            }
                                                            addr05d5:
                                                            drawIndices[_loc29_] = _loc10_;
                                                         }
                                                         §§push(_loc29_);
                                                         break loop34;
                                                      }
                                                      §§goto(addr0614);
                                                   }
                                                   §§push(§§pop() + 1);
                                                   break loop27;
                                                }
                                                §§goto(addr0611);
                                             }
                                             §§goto(addr0607);
                                          }
                                          §§goto(addr061d);
                                       }
                                       _loc29_ = §§pop();
                                       if(!_loc57_)
                                       {
                                          break loop31;
                                       }
                                       continue loop8;
                                    }
                                    _loc29_ = int(§§pop());
                                    if(_loc58_)
                                    {
                                       drawIndices[_loc29_] = _loc11_;
                                       if(!_loc57_)
                                       {
                                          while(true)
                                          {
                                             addr0639:
                                             §§push(_loc29_ + 1);
                                             if(!_loc57_)
                                             {
                                                _loc29_ = int(§§pop());
                                                addr0607:
                                                drawIndices[_loc29_] = _loc12_;
                                                addr0611:
                                                addr0614:
                                                §§push(int(_loc29_ + 1));
                                                break loop28;
                                             }
                                             §§push(int(§§pop()));
                                             break;
                                          }
                                          addr063a:
                                          _loc32_ = §§pop();
                                          continue;
                                       }
                                       addr0622:
                                       while(true)
                                       {
                                          §§push(_loc32_);
                                          if(_loc58_)
                                          {
                                             §§push(§§pop() + 1);
                                             if(_loc57_ && Boolean(param1))
                                             {
                                                break;
                                             }
                                          }
                                          §§goto(addr0639);
                                       }
                                       §§goto(addr063a);
                                    }
                                    addr061d:
                                    _loc11_ = int(_loc12_);
                                    §§goto(addr0622);
                                 }
                                 if(_loc58_ || Boolean(param3))
                                 {
                                    §§push(_loc31_);
                                    if(_loc58_ || Boolean(param2))
                                    {
                                       §§push(§§pop() + 1);
                                       if(_loc58_)
                                       {
                                          §§push(int(§§pop()));
                                       }
                                    }
                                    _loc31_ = §§pop();
                                 }
                              }
                              continue loop2;
                           }
                           §§push(_loc9_.index);
                           §§goto(addr0474);
                        }
                        _loc11_ = §§pop();
                        §§goto(addr0477);
                     }
                     _loc24_[_loc28_] = _loc9_.v;
                     addr026f:
                     loop20:
                     while(true)
                     {
                        §§push(int(_loc28_ + 1));
                        if(!(_loc57_ && Boolean(param2)))
                        {
                           _loc28_ = §§pop();
                           _loc24_[_loc28_] = _loc13_;
                           §§push(_loc28_);
                           if(!(_loc58_ || Boolean(param2)))
                           {
                              break;
                           }
                           §§push(§§pop() + 1);
                        }
                        addr029a:
                        _loc28_ = int(§§pop());
                        while(true)
                        {
                           addr02d9:
                           if(_loc58_)
                           {
                              §§push(_loc26_);
                              break loop20;
                           }
                           _loc9_.drawId = _loc30_;
                           break;
                        }
                        addr02df:
                        break loop19;
                     }
                     §§push(int(§§pop()));
                     if(_loc57_)
                     {
                        addr02ee:
                        _loc10_ = §§pop();
                        break loop19;
                     }
                     _loc10_ = §§pop();
                     §§push(_loc9_);
                     §§push(_loc26_);
                     if(!_loc57_)
                     {
                        var _temp_10:* = §§pop();
                        while(true)
                        {
                           §§push(_temp_10);
                           §§push(_temp_10);
                           if(!_loc57_)
                           {
                              §§push(§§pop() + 1);
                              if(!_loc58_)
                              {
                                 break;
                              }
                           }
                           §§push(int(§§pop()));
                           break;
                        }
                        _loc26_ = §§pop();
                     }
                     §§pop().alternativa3d::index = §§pop();
                     if(!(_loc57_ && Boolean(param1)))
                     {
                        §§goto(addr02d9);
                     }
                     §§goto(addr02df);
                  }
                  loop46:
                  while(true)
                  {
                     loop47:
                     while(true)
                     {
                        while(true)
                        {
                           loop56:
                           while(true)
                           {
                              while(true)
                              {
                                 if(!(_loc57_ && Boolean(param2)))
                                 {
                                    _loc23_.length = _loc27_;
                                    _loc24_.length = _loc28_;
                                    if(!_loc58_)
                                    {
                                       break;
                                    }
                                    _loc25_.length = _loc29_;
                                    if(!(_loc57_ && Boolean(param3)))
                                    {
                                       §§push(this._mipMapping);
                                       §§push(0);
                                       if(!(_loc58_ || Boolean(param3)))
                                       {
                                          break loop56;
                                       }
                                       if(§§pop() == §§pop())
                                       {
                                          _loc20_ = this._texture;
                                          if(!(_loc57_ && Boolean(param2)))
                                          {
                                             §§goto(addr07b4);
                                          }
                                          §§goto(addr07bb);
                                       }
                                       else
                                       {
                                          §§push(param1.focalLength);
                                          if(_loc57_)
                                          {
                                             continue loop57;
                                          }
                                          §§push(this.resolution);
                                          if(_loc57_)
                                          {
                                             break loop47;
                                          }
                                          §§push(§§pop() * §§pop());
                                          if(_loc58_ || Boolean(param3))
                                          {
                                             §§push(Number(§§pop()));
                                             if(!(_loc58_ || Boolean(param3)))
                                             {
                                                break loop46;
                                             }
                                          }
                                          _loc14_ = §§pop();
                                       }
                                    }
                                 }
                                 §§push(param4);
                                 if(!_loc57_)
                                 {
                                    §§push(_loc14_);
                                    break loop47;
                                 }
                                 continue loop57;
                              }
                              §§goto(addr077d);
                           }
                           §§goto(addr07a5);
                        }
                        while(true)
                        {
                           while(true)
                           {
                              §§push(int(§§pop()));
                              if(_loc58_)
                              {
                                 §§goto(addr0766);
                              }
                              §§goto(addr078d);
                           }
                           §§goto(addr07a9);
                        }
                        §§goto(addr07a7);
                     }
                     if(§§pop() >= §§pop())
                     {
                        if(_loc58_ || Boolean(param1))
                        {
                           §§push(1 + Math.log(param4 / _loc14_) * 1.4426950408889634);
                           if(_loc58_ || Boolean(param2))
                           {
                              break loop54;
                           }
                           break;
                        }
                     }
                     else
                     {
                        addr0766:
                        §§push(0);
                        if(_loc58_)
                        {
                           §§push(int(§§pop()));
                        }
                        while(true)
                        {
                           §§push(int(§§pop()));
                           if(!(_loc57_ && Boolean(param2)))
                           {
                              _loc33_ = §§pop();
                              if(!_loc58_)
                              {
                                 break;
                              }
                              §§push(_loc33_);
                              if(_loc58_ || Boolean(param3))
                              {
                                 addr078d:
                                 §§push(this.numMaps);
                                 if(_loc58_)
                                 {
                                    if(§§pop() < §§pop())
                                    {
                                       break;
                                    }
                                    if(!_loc58_)
                                    {
                                       break;
                                    }
                                    §§push(this.numMaps);
                                    §§push(1);
                                 }
                                 addr07a5:
                                 §§push(§§pop() - §§pop());
                                 break loop46;
                              }
                           }
                           §§goto(addr07a7);
                        }
                     }
                     §§goto(addr07a9);
                  }
                  addr07a7:
                  _loc33_ = int(§§pop());
                  addr07a9:
                  _loc20_ = this.mipMap[_loc33_];
                  addr07b4:
                  if(this.correctUV)
                  {
                     addr07bb:
                     loop48:
                     while(true)
                     {
                        loop49:
                        while(true)
                        {
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(-0.5);
                                 §§push(_loc20_.width - 1);
                                 if(!(_loc57_ && Boolean(param1)))
                                 {
                                    §§push(§§pop() / §§pop());
                                    if(_loc58_ || Boolean(param3))
                                    {
                                       §§push(Number(§§pop()));
                                       if(!(_loc58_ || Boolean(param1)))
                                       {
                                          break loop49;
                                       }
                                       _loc18_ = §§pop();
                                       §§push(-0.5);
                                       §§push(_loc20_.height - 1);
                                       if(_loc57_ && Boolean(param2))
                                       {
                                          break loop48;
                                       }
                                    }
                                    else
                                    {
                                       §§goto(addr085a);
                                    }
                                 }
                                 _loc19_ = §§pop() / §§pop();
                                 if(_loc58_)
                                 {
                                    §§push(1);
                                    if(_loc58_)
                                    {
                                       §§push(_loc18_);
                                       if(!(_loc58_ || Boolean(param1)))
                                       {
                                          break;
                                       }
                                       §§push(§§pop() - §§pop());
                                       if(!(_loc57_ && Boolean(param1)))
                                       {
                                          break loop49;
                                       }
                                       §§goto(addr084b);
                                    }
                                    §§goto(addr08ef);
                                 }
                                 §§goto(addr088c);
                              }
                              §§goto(addr086e);
                           }
                        }
                        §§push(_loc18_);
                        if(!(_loc57_ && Boolean(this)))
                        {
                           break;
                        }
                        §§goto(addr0877);
                     }
                     addr084b:
                     loop50:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(§§pop() - §§pop());
                           if(_loc58_ || Boolean(param1))
                           {
                              addr085a:
                              _loc16_ = §§pop();
                              if(!(_loc58_ || Boolean(param2)))
                              {
                                 break;
                              }
                              §§push(1 - _loc19_);
                              if(!_loc58_)
                              {
                                 break loop50;
                              }
                              §§push(§§pop() - _loc19_);
                              if(!_loc58_)
                              {
                                 break loop50;
                              }
                           }
                           §§push(Number(§§pop()));
                           break loop50;
                        }
                     }
                     _loc17_ = §§pop();
                     §§push(0);
                     if(!_loc57_)
                     {
                        _loc15_ = §§pop();
                        addr088c:
                        while(true)
                        {
                           §§push(_loc15_);
                           addr08f3:
                           while(true)
                           {
                              if(§§pop() >= _loc28_)
                              {
                                 break loop51;
                              }
                              _loc24_[_loc15_] = _loc24_[_loc15_] * _loc16_ + _loc18_;
                              if(!(_loc58_ || Boolean(param3)))
                              {
                                 break loop51;
                              }
                              §§push(int(_loc15_ + 1));
                           }
                        }
                        §§goto(addr088c);
                        addr08f1:
                     }
                     _loc15_ = §§pop();
                     if(_loc58_ || Boolean(param1))
                     {
                        _loc24_[_loc15_] = _loc24_[_loc15_] * _loc17_ + _loc19_;
                        _loc15_++;
                        §§push(int(_loc15_ + 1));
                        if(_loc58_ || Boolean(this))
                        {
                           addr08ef:
                           _loc15_ = §§pop();
                           §§goto(addr08f1);
                        }
                        §§goto(addr08f3);
                     }
                     §§goto(addr08f1);
                  }
                  break loop52;
               }
               §§push(0);
               if(!(_loc57_ && Boolean(this)))
               {
                  _loc28_ = int(§§pop());
                  §§push(0);
               }
               §§goto(addr01a8);
               §§push(int(§§pop()));
               break loop10;
            }
            param1.numTriangles = _loc32_;
            return;
         }
         §§push(0);
         if(_loc58_)
         {
            _loc26_ = §§pop();
            §§push(0);
         }
         _loc27_ = int(§§pop());
         §§goto(addr0192);
      }
      
      override alternativa3d function drawViewAligned(param1:Camera3D, param2:Canvas, param3:Face, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number) : void
      {
         §§push(false);
         var _loc25_:Boolean = true;
         var _loc26_:* = §§pop();
         var _loc13_:Face = null;
         var _loc14_:Face = null;
         var _loc15_:BitmapData = null;
         var _loc18_:* = NaN;
         var _loc19_:* = 0;
         var _loc20_:Wrapper = null;
         var _loc21_:Vertex = null;
         var _loc22_:* = 0;
         §§push(param1.viewSizeX);
         if(!_loc26_)
         {
            §§push(Number(§§pop()));
         }
         var _loc11_:* = §§pop();
         §§push(param1.viewSizeY);
         if(!_loc26_)
         {
            §§push(Number(§§pop()));
         }
         var _loc12_:* = §§pop();
         if(this._texture != null)
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
                     §§push(this._mipMapping);
                     §§push(0);
                     if(_loc25_ || Boolean(this))
                     {
                        if(§§pop() == §§pop())
                        {
                           if(_loc26_ && Boolean(this))
                           {
                              break loop3;
                           }
                           §§goto(addr0091);
                        }
                        else
                        {
                           §§push(param1.focalLength);
                           if(!_loc25_)
                           {
                              break;
                           }
                           loop5:
                           while(true)
                           {
                              while(true)
                              {
                                 §§push(this.resolution);
                                 if(_loc25_ || Boolean(param2))
                                 {
                                    §§push(§§pop() * §§pop());
                                    if(_loc26_)
                                    {
                                       break loop5;
                                    }
                                    §§push(Number(§§pop()));
                                    if(_loc25_ || Boolean(this))
                                    {
                                       _loc18_ = §§pop();
                                       if(_loc26_ && Boolean(param3))
                                       {
                                          break;
                                       }
                                       §§push(param4);
                                       if(_loc26_ && Boolean(param3))
                                       {
                                          break loop5;
                                       }
                                    }
                                    §§push(_loc18_);
                                 }
                                 if(§§pop() >= §§pop())
                                 {
                                    break;
                                 }
                                 §§push(0);
                                 if(_loc26_ && Boolean(param2))
                                 {
                                    break loop2;
                                 }
                                 §§goto(addr0126);
                              }
                              §§push(1);
                              if(!_loc26_)
                              {
                                 §§push(§§pop() + Math.log(param4 / _loc18_) * 1.4426950408889634);
                                 if(_loc25_)
                                 {
                                    break;
                                 }
                                 break loop4;
                              }
                              §§goto(addr0111);
                           }
                           addr0126:
                           _loc19_ = int(§§pop());
                           addr0111:
                           §§push(_loc19_);
                           §§push(this.numMaps);
                           if(!_loc26_)
                           {
                              if(§§pop() < §§pop())
                              {
                                 break loop3;
                              }
                              §§push(this.numMaps);
                              if(!(_loc25_ || Boolean(param1)))
                              {
                                 break loop2;
                              }
                              §§push(1);
                           }
                        }
                     }
                     §§push(§§pop() - §§pop());
                     break;
                  }
                  §§push(int(§§pop()));
                  break loop2;
               }
               _loc15_ = this.mipMap[_loc19_];
            }
            _loc19_ = §§pop();
            break loop3;
         }
         clearLinks(param3);
         if(_loc25_ || Boolean(param1))
         {
            return;
         }
         addr0091:
         _loc15_ = this._texture;
         var _loc16_:Number = _loc15_.width;
         var _loc17_:Number = _loc15_.height;
         matrix.a = param5 / _loc16_;
         matrix.b = param6 / _loc16_;
         if(_loc25_ || Boolean(this))
         {
            matrix.c = param7 / _loc17_;
            matrix.d = param8 / _loc17_;
            matrix.tx = param9;
            matrix.ty = param10;
            param2.gfx.beginBitmapFill(_loc15_,matrix,this.repeat,this.smooth);
         }
         _loc13_ = param3;
         for(; _loc13_ != null; _loc13_ = _loc14_)
         {
            _loc14_ = _loc13_.processNext;
            if(!_loc26_)
            {
               _loc13_.processNext = null;
            }
            _loc20_ = _loc13_.wrapper;
            _loc21_ = _loc20_.vertex;
            while(true)
            {
               if(_loc25_)
               {
                  param2.gfx.moveTo(_loc21_.cameraX * _loc11_ / param4,_loc21_.cameraY * _loc12_ / param4);
                  if(!(_loc25_ || Boolean(this)))
                  {
                     break;
                  }
               }
               §§push(-1);
               if(!(_loc26_ && Boolean(param2)))
               {
                  §§push(int(§§pop()));
               }
               _loc22_ = §§pop();
               break;
            }
            _loc20_ = _loc20_.next;
            if(!_loc26_)
            {
               for(; _loc20_ != null; _loc20_ = _loc20_.next)
               {
                  _loc21_ = _loc20_.vertex;
                  if(!(_loc26_ && Boolean(this)))
                  {
                     param2.gfx.lineTo(_loc21_.cameraX * _loc11_ / param4,_loc21_.cameraY * _loc12_ / param4);
                     if(!(_loc25_ || Boolean(this)))
                     {
                        continue;
                     }
                  }
                  §§push(_loc22_);
                  if(_loc25_ || Boolean(param3))
                  {
                     §§push(§§pop() + 1);
                     if(_loc25_ || Boolean(param1))
                     {
                        §§push(int(§§pop()));
                     }
                  }
                  _loc22_ = §§pop();
               }
               if(!_loc26_)
               {
                  param1.numTriangles += _loc22_;
                  if(_loc26_ && Boolean(param3))
                  {
                     continue;
                  }
               }
            }
            var _loc23_:Camera3D = param1;
            §§push(_loc23_.numPolygons);
            if(!(_loc26_ && Boolean(this)))
            {
               §§push(§§pop() + 1);
            }
            var _loc24_:* = §§pop();
            if(_loc25_)
            {
               _loc23_.numPolygons = _loc24_;
            }
         }
         if(!(_loc26_ && Boolean(param2)))
         {
            _loc23_ = param1;
            §§push(_loc23_.numDraws);
            if(_loc25_ || Boolean(param3))
            {
               §§push(§§pop() + 1);
            }
            _loc24_ = §§pop();
            if(_loc25_)
            {
               _loc23_.numDraws = _loc24_;
            }
         }
      }
   }
}

§§push(false);
true;
§§pop();
if(_loc1_ || _loc1_)
{
   TextureMaterial = §§newclass(TextureMaterial,Material);
}

