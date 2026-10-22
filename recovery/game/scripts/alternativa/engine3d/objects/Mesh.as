package alternativa.engine3d.objects
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Canvas;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Geometry;
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
   
   public class Mesh extends Object3D
   {
      
      public var clipping:int = 2;
      
      public var sorting:int = 1;
      
      public var threshold:Number = 0.01;
      
      alternativa3d var vertexList:Vertex;
      
      alternativa3d var faceList:Face;
      
      public function Mesh()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(!(_loc2_ && Boolean(this)))
         {
            super();
         }
      }
      
      public function get vertices() : Vector.<Vertex>
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         var _loc1_:Vector.<Vertex> = new Vector.<Vertex>();
         §§push(0);
         if(_loc4_)
         {
            §§push(int(§§pop()));
         }
         var _loc2_:* = §§pop();
         var _loc3_:Vertex = this.vertexList;
         while(_loc3_ != null)
         {
            _loc1_[_loc2_] = _loc3_;
            if(_loc5_)
            {
               break;
            }
            §§push(_loc2_);
            if(_loc4_)
            {
               §§push(§§pop() + 1);
               if(_loc4_ || Boolean(_loc2_))
               {
                  §§push(int(§§pop()));
               }
            }
            _loc2_ = §§pop();
            if(!_loc4_)
            {
               break;
            }
            _loc3_ = _loc3_.next;
         }
         return _loc1_;
      }
      
      public function get faces() : Vector.<Face>
      {
         var _temp_1:* = true;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = _temp_1;
         var _loc1_:Vector.<Face> = new Vector.<Face>();
         §§push(0);
         if(_loc5_ || Boolean(_loc1_))
         {
            §§push(int(§§pop()));
         }
         var _loc2_:* = §§pop();
         var _loc3_:Face = this.faceList;
         while(_loc3_ != null)
         {
            _loc1_[_loc2_] = _loc3_;
            if(!(_loc5_ || Boolean(this)))
            {
               break;
            }
            §§push(_loc2_);
            if(!_loc4_)
            {
               §§push(§§pop() + 1);
               if(_loc5_ || Boolean(_loc2_))
               {
                  §§push(int(§§pop()));
               }
            }
            _loc2_ = §§pop();
            if(_loc4_)
            {
               break;
            }
            _loc3_ = _loc3_.next;
         }
         return _loc1_;
      }
      
      public function get geometry() : Geometry
      {
         var _temp_1:* = true;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = _temp_1;
         var _loc2_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Face = null;
         var _loc6_:Wrapper = null;
         var _loc7_:Wrapper = null;
         var _loc8_:Wrapper = null;
         var _loc1_:Geometry = new Geometry();
         _loc2_ = this.vertexList;
         while(_loc2_ != null)
         {
            _loc4_ = new Vertex();
            while(true)
            {
               if(!_loc11_)
               {
                  _loc4_.x = _loc2_.x;
                  if(_loc11_ && Boolean(_loc3_))
                  {
                     break;
                  }
                  _loc4_.y = _loc2_.y;
                  _loc4_.z = _loc2_.z;
                  _loc4_.u = _loc2_.u;
                  _loc4_.v = _loc2_.v;
               }
               _loc2_.value = _loc4_;
               break;
            }
            _loc1_._vertices[_loc1_.vertexIdCounter] = _loc4_;
            if(!_loc11_)
            {
               var _loc9_:Geometry = _loc1_;
               var _loc10_:Number = _loc9_.vertexIdCounter + 1;
               if(_loc12_ || Boolean(_loc1_))
               {
                  _loc9_.vertexIdCounter = _loc10_;
               }
            }
            _loc2_ = _loc2_.next;
         }
         var _loc3_:Face = this.faceList;
         if(!(_loc11_ && Boolean(_loc1_)))
         {
            for(; _loc3_ != null; _loc3_ = _loc3_.next)
            {
               _loc5_ = new Face();
               if(!(_loc11_ && Boolean(this)))
               {
                  _loc5_.material = _loc3_.material;
               }
               _loc6_ = null;
               _loc7_ = _loc3_.wrapper;
               if(!_loc11_)
               {
                  while(_loc7_ != null)
                  {
                     _loc8_ = new Wrapper();
                     while(true)
                     {
                        if(_loc12_)
                        {
                           _loc8_.vertex = _loc7_.vertex.value;
                           if(_loc11_ && Boolean(_loc2_))
                           {
                              break;
                           }
                           if(_loc6_ == null)
                           {
                              _loc5_.wrapper = _loc8_;
                              break;
                           }
                           if(!_loc12_)
                           {
                              break;
                           }
                        }
                        _loc6_.next = _loc8_;
                        if(!_loc11_)
                        {
                           break;
                        }
                        break;
                     }
                     _loc6_ = _loc8_;
                     _loc7_ = _loc7_.next;
                  }
                  if(!_loc12_)
                  {
                     continue;
                  }
               }
               _loc1_._faces[_loc1_.faceIdCounter] = _loc5_;
               if(!(_loc11_ && Boolean(_loc2_)))
               {
                  _loc9_ = _loc1_;
                  _loc10_ = _loc9_.faceIdCounter + 1;
                  if(_loc12_)
                  {
                     _loc9_.faceIdCounter = _loc10_;
                  }
               }
            }
         }
         _loc2_ = this.vertexList;
         loop6:
         while(true)
         {
            if(_loc12_ || Boolean(_loc3_))
            {
               while(true)
               {
                  if(_loc2_ == null)
                  {
                     break loop6;
                  }
                  _loc2_.value = null;
                  if(_loc11_)
                  {
                     break loop6;
                  }
               }
               break;
               addr01f2:
            }
            _loc2_ = _loc2_.next;
            §§goto(addr01f2);
         }
         return _loc1_;
      }
      
      public function set geometry(param1:Geometry) : void
      {
         var _temp_1:* = true;
         var _loc16_:Boolean = false;
         var _loc17_:Boolean = _temp_1;
         var _loc2_:* = 0;
         var _loc3_:Vertex = null;
         var _loc4_:Vector.<Vertex> = null;
         var _loc5_:int = 0;
         var _loc6_:Vector.<Face> = null;
         var _loc7_:* = 0;
         var _loc8_:Vertex = null;
         var _loc9_:Face = null;
         var _loc10_:Vertex = null;
         var _loc11_:Face = null;
         var _loc12_:Face = null;
         var _loc13_:Wrapper = null;
         var _loc14_:Wrapper = null;
         var _loc15_:Wrapper = null;
         loop4:
         while(true)
         {
            if(!_loc16_)
            {
               this.vertexList = null;
               while(true)
               {
                  if(_loc17_)
                  {
                     this.faceList = null;
                     if(_loc16_)
                     {
                        break;
                     }
                  }
                  if(param1 != null)
                  {
                     break;
                  }
                  break loop4;
               }
            }
            _loc4_ = param1.orderedVertices;
            if(_loc17_ || Boolean(param1))
            {
               _loc5_ = int(_loc4_.length);
            }
            _loc6_ = param1.orderedFaces;
            if(_loc17_)
            {
               loop6:
               while(true)
               {
                  while(true)
                  {
                     §§push(int(_loc6_.length));
                     if(_loc17_)
                     {
                        _loc7_ = §§pop();
                        if(_loc16_)
                        {
                           break;
                        }
                        §§push(0);
                        if(!(_loc17_ || Boolean(_loc3_)))
                        {
                           break loop6;
                        }
                     }
                     §§push(int(§§pop()));
                     break loop6;
                  }
               }
               _loc2_ = §§pop();
               break loop7;
            }
            loop0:
            while(true)
            {
               §§push(_loc2_);
               if(!_loc17_)
               {
                  break;
               }
               §§push(_loc5_);
               if(!(_loc17_ || Boolean(param1)))
               {
                  if(§§pop() < §§pop())
                  {
                     _loc11_ = _loc6_[_loc2_];
                     _loc12_ = new Face();
                     if(_loc17_)
                     {
                        _loc12_.material = _loc11_.material;
                     }
                     _loc13_ = null;
                     _loc14_ = _loc11_.wrapper;
                     if(!(_loc16_ && Boolean(_loc3_)))
                     {
                        addr01e7:
                        for(; _loc14_ != null; _loc13_ = _loc15_,_loc14_ = _loc14_.next)
                        {
                           _loc15_ = new Wrapper();
                           if(!(_loc16_ && Boolean(_loc3_)))
                           {
                              _loc15_.vertex = _loc14_.vertex.value;
                              if(!(_loc16_ && Boolean(_loc2_)))
                              {
                                 if(_loc13_ == null)
                                 {
                                    _loc12_.wrapper = _loc15_;
                                    continue;
                                 }
                                 if(!_loc17_)
                                 {
                                    continue;
                                 }
                              }
                              _loc13_.next = _loc15_;
                              if(!_loc17_)
                              {
                                 continue;
                              }
                           }
                        }
                        while(true)
                        {
                           while(true)
                           {
                              if(!_loc16_)
                              {
                                 if(_loc9_ != null)
                                 {
                                    if(!(_loc16_ && Boolean(_loc2_)))
                                    {
                                       addr026e:
                                       _loc9_.next = _loc12_;
                                       if(_loc17_)
                                       {
                                          addr027a:
                                       }
                                       addr0283:
                                       _loc9_ = _loc12_;
                                       if(_loc17_)
                                       {
                                          §§push(_loc2_);
                                          if(_loc17_ || Boolean(this))
                                          {
                                             §§push(§§pop() + 1);
                                             if(_loc17_)
                                             {
                                                addr02a5:
                                                §§push(int(§§pop()));
                                             }
                                             _loc2_ = §§pop();
                                             §§goto(addr02a7);
                                          }
                                          §§goto(addr02a5);
                                       }
                                       §§goto(addr02a7);
                                    }
                                    §§goto(addr027a);
                                 }
                                 else
                                 {
                                    this.faceList = _loc12_;
                                 }
                                 §§goto(addr0283);
                              }
                              §§goto(addr027a);
                           }
                           §§goto(addr01e7);
                        }
                        §§goto(addr02b4);
                     }
                     §§goto(addr026e);
                  }
                  break loop13;
               }
               if(§§pop() >= §§pop())
               {
                  loop8:
                  while(true)
                  {
                     while(true)
                     {
                        if(!_loc16_)
                        {
                           §§push(0);
                           if(!(_loc17_ || Boolean(_loc2_)))
                           {
                              break;
                           }
                           _loc2_ = §§pop();
                           if(_loc16_ && Boolean(_loc2_))
                           {
                              break loop8;
                           }
                        }
                        while(true)
                        {
                           §§push(_loc2_);
                           break loop0;
                        }
                        addr02b4:
                        if(!(_loc16_ && Boolean(_loc3_)))
                        {
                           this.calculateNormals(true);
                           if(!_loc16_)
                           {
                              §§push(0);
                              if(!(_loc16_ && Boolean(param1)))
                              {
                                 §§push(int(§§pop()));
                              }
                              break;
                           }
                           break loop4;
                        }
                        break loop8;
                        addr02a7:
                     }
                     _loc2_ = §§pop();
                     if(!_loc16_)
                     {
                        break;
                     }
                     break loop4;
                  }
                  while(true)
                  {
                     addr0328:
                     if(_loc2_ >= _loc5_)
                     {
                        break loop4;
                     }
                     _loc3_ = _loc4_[_loc2_];
                     if(!(_loc16_ && Boolean(_loc2_)))
                     {
                        _loc3_.value = null;
                        if(!_loc17_)
                        {
                           continue;
                        }
                     }
                     while(true)
                     {
                        §§push(_loc2_);
                        if(!_loc16_)
                        {
                           §§push(§§pop() + 1);
                           if(!_loc17_)
                           {
                              break;
                           }
                        }
                        §§push(int(§§pop()));
                        break;
                     }
                     _loc2_ = §§pop();
                  }
                  break loop9;
               }
               _loc3_ = _loc4_[_loc2_];
               _loc10_ = new Vertex();
               _loc10_.x = _loc3_.x;
               _loc10_.y = _loc3_.y;
               if(!_loc16_)
               {
                  _loc10_.z = _loc3_.z;
                  _loc10_.u = _loc3_.u;
               }
               _loc10_.v = _loc3_.v;
               _loc3_.value = _loc10_;
               if(_loc8_ != null)
               {
                  while(true)
                  {
                     if(_loc17_ || Boolean(_loc3_))
                     {
                        _loc8_.next = _loc10_;
                        if(!_loc17_)
                        {
                           break;
                        }
                     }
                     break;
                  }
               }
               else
               {
                  this.vertexList = _loc10_;
               }
               _loc8_ = _loc10_;
               if(_loc17_ || Boolean(this))
               {
                  while(true)
                  {
                     §§push(_loc2_);
                     if(_loc17_)
                     {
                        §§push(§§pop() + 1);
                        if(_loc16_ && Boolean(this))
                        {
                           break;
                        }
                     }
                     §§push(int(§§pop()));
                     break;
                  }
                  _loc2_ = §§pop();
               }
            }
            §§push(_loc7_);
            if(!_loc16_)
            {
               §§goto(addr02b0);
            }
            §§goto(addr0328);
         }
      }
      
      public function removeGeometry() : Geometry
      {
         var _temp_1:* = true;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = _temp_1;
         var _loc4_:Vertex = null;
         var _loc5_:Face = null;
         var _loc1_:Geometry = new Geometry();
         var _loc2_:Vertex = this.vertexList;
         while(_loc2_ != null)
         {
            _loc4_ = _loc2_.next;
            if(_loc9_)
            {
               _loc2_.next = null;
               if(!_loc8_)
               {
                  _loc1_._vertices[_loc1_.vertexIdCounter] = _loc2_;
                  if(_loc9_)
                  {
                     var _loc6_:Geometry = _loc1_;
                     var _loc7_:Number = _loc6_.vertexIdCounter + 1;
                     if(_loc9_)
                     {
                        _loc6_.vertexIdCounter = _loc7_;
                     }
                  }
               }
            }
            _loc2_ = _loc4_;
         }
         if(!_loc8_)
         {
            this.vertexList = null;
         }
         var _loc3_:Face = this.faceList;
         if(!(_loc8_ && Boolean(this)))
         {
            for(; _loc3_ != null; _loc3_ = _loc5_)
            {
               _loc5_ = _loc3_.next;
               if(!_loc8_)
               {
                  _loc3_.next = null;
                  if(!(_loc9_ || Boolean(_loc3_)))
                  {
                     continue;
                  }
               }
               _loc1_._faces[_loc1_.faceIdCounter] = _loc3_;
               if(!_loc8_)
               {
                  _loc6_ = _loc1_;
                  _loc7_ = _loc6_.faceIdCounter + 1;
                  if(!(_loc8_ && Boolean(_loc2_)))
                  {
                     _loc6_.faceIdCounter = _loc7_;
                  }
               }
            }
            if(!_loc8_)
            {
               this.faceList = null;
            }
         }
         return _loc1_;
      }
      
      public function takeGeometryFrom(param1:Geometry) : void
      {
         §§push(false);
         var _loc11_:Boolean = true;
         var _loc12_:* = §§pop();
         var _loc2_:* = 0;
         var _loc7_:Vertex = null;
         var _loc8_:Face = null;
         var _loc9_:Vertex = null;
         var _loc10_:Face = null;
         while(true)
         {
            if(_loc11_)
            {
               this.vertexList = null;
               if(_loc12_ && Boolean(param1))
               {
                  break;
               }
            }
            this.faceList = null;
            break;
         }
         var _loc3_:Vector.<Vertex> = param1.orderedVertices;
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:Vector.<Face> = param1.orderedFaces;
         var _loc6_:int = int(_loc5_.length);
         loop3:
         while(true)
         {
            if(!(_loc12_ && Boolean(param1)))
            {
               param1._vertices = new Dictionary();
               while(true)
               {
                  if(_loc11_ || Boolean(param1))
                  {
                     param1._faces = new Dictionary();
                     if(_loc12_)
                     {
                        break;
                     }
                     param1.vertexIdCounter = 0;
                     if(_loc12_ && Boolean(_loc2_))
                     {
                        break loop3;
                     }
                  }
                  param1.faceIdCounter = 0;
                  if(!(_loc12_ && Boolean(_loc3_)))
                  {
                     break;
                  }
                  break loop3;
               }
            }
            §§push(0);
            if(!_loc12_)
            {
               §§push(int(§§pop()));
            }
            _loc2_ = §§pop();
            break;
         }
         loop0:
         while(true)
         {
            §§push(_loc2_);
            if(_loc12_ && Boolean(param1))
            {
               break;
            }
            while(true)
            {
               §§push(_loc4_);
               if(_loc11_)
               {
                  if(§§pop() < §§pop())
                  {
                     _loc9_ = _loc3_[_loc2_];
                     if(_loc11_)
                     {
                        _loc9_.transformId = 0;
                        while(true)
                        {
                           if(_loc11_ || Boolean(this))
                           {
                              if(_loc7_ == null)
                              {
                                 this.vertexList = _loc9_;
                                 break;
                              }
                              if(!(_loc12_ && Boolean(_loc2_)))
                              {
                                 _loc7_.next = _loc9_;
                                 if(!_loc11_)
                                 {
                                    break;
                                 }
                              }
                           }
                           break;
                        }
                     }
                     _loc7_ = _loc9_;
                     if(!(_loc12_ && Boolean(this)))
                     {
                        while(true)
                        {
                           §§push(_loc2_);
                           if(_loc11_ || Boolean(_loc3_))
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
                        _loc2_ = §§pop();
                     }
                     continue loop0;
                  }
                  if(!_loc12_)
                  {
                     §§push(0);
                     if(_loc12_)
                     {
                        break loop0;
                     }
                     §§push(int(§§pop()));
                     if(_loc11_ || Boolean(_loc2_))
                     {
                        break loop0;
                     }
                     addr0202:
                     if(§§pop() < _loc6_)
                     {
                        _loc10_ = _loc5_[_loc2_];
                        if(!(_loc12_ && Boolean(this)))
                        {
                           if(_loc8_ != null)
                           {
                              if(!(_loc12_ && Boolean(_loc3_)))
                              {
                                 _loc8_.next = _loc10_;
                                 while(true)
                                 {
                                    if(!_loc12_)
                                    {
                                       addr01cc:
                                    }
                                    addr01d5:
                                    _loc8_ = _loc10_;
                                    if(!(_loc12_ && Boolean(_loc3_)))
                                    {
                                       §§push(_loc2_);
                                       if(!(_loc12_ && Boolean(param1)))
                                       {
                                          §§push(§§pop() + 1);
                                          if(_loc11_)
                                          {
                                             §§push(int(§§pop()));
                                          }
                                       }
                                       _loc2_ = §§pop();
                                    }
                                    while(true)
                                    {
                                       §§goto(addr0202);
                                    }
                                    break loop0;
                                    addr0201:
                                 }
                                 §§goto(addr0208);
                              }
                              §§goto(addr01cc);
                           }
                           this.faceList = _loc10_;
                        }
                        §§goto(addr01d5);
                     }
                     addr0208:
                     if(_loc11_ || Boolean(this))
                     {
                        break;
                     }
                     addr0226:
                     return;
                     addr0204:
                  }
                  §§goto(addr0201);
               }
               §§goto(addr0204);
            }
            this.calculateNormals(true);
            §§goto(addr0226);
         }
         _loc2_ = §§pop();
         while(true)
         {
            if(!(_loc12_ && Boolean(this)))
            {
               §§goto(addr018f);
            }
            §§goto(addr0220);
         }
         §§goto(addr0226);
      }
      
      public function weldVerticesAndFaces(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Boolean = false) : void
      {
         var _temp_1:* = true;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = _temp_1;
         var _loc6_:Geometry = this.removeGeometry();
         while(true)
         {
            if(!_loc7_)
            {
               _loc6_.weldVertices(param1,param2);
               if(!(_loc8_ || Boolean(param2)))
               {
                  break;
               }
            }
            _loc6_.weldFaces(param3,param2,param4,param5);
            if(_loc8_ || Boolean(param1))
            {
               this.takeGeometryFrom(_loc6_);
            }
            break;
         }
      }
      
      public function setMaterialToAllFaces(param1:Material) : void
      {
         var _temp_1:* = true;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = _temp_1;
         var _loc2_:Face = this.faceList;
         while(_loc2_ != null)
         {
            _loc2_.material = param1;
            if(!(_loc4_ || Boolean(_loc2_)))
            {
               break;
            }
            _loc2_ = _loc2_.next;
         }
      }
      
      public function calculateNormals(param1:Boolean = true) : void
      {
         var _temp_1:* = true;
         var _loc17_:Boolean = false;
         var _loc18_:Boolean = _temp_1;
         var _loc3_:Wrapper = null;
         var _loc4_:Vertex = null;
         var _loc5_:Vertex = null;
         var _loc6_:Vertex = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:* = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:* = NaN;
         var _loc13_:* = NaN;
         var _loc14_:* = NaN;
         var _loc15_:* = NaN;
         var _loc16_:* = NaN;
         var _loc2_:Face = this.faceList;
         loop0:
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.wrapper;
            _loc4_ = _loc3_.vertex;
            _loc3_ = _loc3_.next;
            _loc5_ = _loc3_.vertex;
            _loc3_ = _loc3_.next;
            _loc6_ = _loc3_.vertex;
            loop1:
            while(true)
            {
               loop2:
               while(true)
               {
                  loop3:
                  while(true)
                  {
                     loop7:
                     while(true)
                     {
                        loop9:
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
                                             loop18:
                                             while(true)
                                             {
                                                loop19:
                                                while(true)
                                                {
                                                   loop20:
                                                   while(true)
                                                   {
                                                      if(_loc18_)
                                                      {
                                                         §§push(_loc5_.x);
                                                         §§push(_loc4_.x);
                                                         if(_loc17_)
                                                         {
                                                            break loop16;
                                                         }
                                                         while(true)
                                                         {
                                                            §§push(§§pop() - §§pop());
                                                            if(!(_loc17_ && Boolean(_loc2_)))
                                                            {
                                                               _loc7_ = §§pop();
                                                               if(_loc18_ || Boolean(_loc3_))
                                                               {
                                                                  loop22:
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc5_.y);
                                                                        if(_loc18_ || Boolean(this))
                                                                        {
                                                                           _loc8_ = §§pop() - _loc4_.y;
                                                                           §§push(_loc5_.z);
                                                                           if(!(_loc18_ || Boolean(this)))
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(§§pop() - _loc4_.z);
                                                                           if(_loc17_)
                                                                           {
                                                                              break loop22;
                                                                           }
                                                                        }
                                                                        §§push(Number(§§pop()));
                                                                        if(_loc18_ || Boolean(_loc2_))
                                                                        {
                                                                           _loc9_ = §§pop();
                                                                           §§push(_loc6_.x);
                                                                           if(_loc17_)
                                                                           {
                                                                              break loop20;
                                                                           }
                                                                           §§push(_loc4_.x);
                                                                           if(_loc18_)
                                                                           {
                                                                              while(true)
                                                                              {
                                                                                 §§push(§§pop() - §§pop());
                                                                                 if(_loc18_)
                                                                                 {
                                                                                    _loc10_ = §§pop();
                                                                                    if(!_loc18_)
                                                                                    {
                                                                                       break;
                                                                                    }
                                                                                    §§push(_loc6_.y);
                                                                                    §§push(_loc4_.y);
                                                                                    if(_loc17_)
                                                                                    {
                                                                                       break loop19;
                                                                                    }
                                                                                    _loc11_ = §§pop() - §§pop();
                                                                                    §§push(_loc6_.z);
                                                                                 }
                                                                                 §§push(§§pop() - _loc4_.z);
                                                                                 if(!(_loc17_ && Boolean(_loc3_)))
                                                                                 {
                                                                                    §§push(Number(§§pop()));
                                                                                    if(_loc18_)
                                                                                    {
                                                                                       _loc12_ = §§pop();
                                                                                       break;
                                                                                    }
                                                                                    break loop18;
                                                                                 }
                                                                                 §§goto(addr01cc);
                                                                              }
                                                                              §§push(_loc12_);
                                                                              break loop22;
                                                                           }
                                                                        }
                                                                        else
                                                                        {
                                                                           §§goto(addr0180);
                                                                        }
                                                                        §§goto(addr0182);
                                                                     }
                                                                  }
                                                                  loop24:
                                                                  while(true)
                                                                  {
                                                                     while(true)
                                                                     {
                                                                        §§push(§§pop() * _loc8_);
                                                                        if(_loc18_ || Boolean(_loc3_))
                                                                        {
                                                                           §§push(_loc11_);
                                                                           §§push(_loc9_);
                                                                           if(_loc17_)
                                                                           {
                                                                              break;
                                                                           }
                                                                           §§push(§§pop() * §§pop());
                                                                           if(_loc17_ && param1)
                                                                           {
                                                                              break loop17;
                                                                           }
                                                                           §§push(§§pop() - §§pop());
                                                                           if(_loc17_)
                                                                           {
                                                                              break loop24;
                                                                           }
                                                                        }
                                                                        _loc13_ = §§pop();
                                                                        addr0180:
                                                                        addr0182:
                                                                        §§push(_loc10_ * _loc9_);
                                                                        break loop24;
                                                                     }
                                                                     §§push(§§pop() - §§pop() * §§pop());
                                                                     if(_loc18_ || Boolean(this))
                                                                     {
                                                                        §§push(Number(§§pop()));
                                                                        if(_loc18_ || Boolean(_loc2_))
                                                                        {
                                                                           addr01cc:
                                                                           _loc14_ = §§pop();
                                                                           §§push(_loc11_);
                                                                           break loop23;
                                                                        }
                                                                        break loop13;
                                                                     }
                                                                     break loop14;
                                                                  }
                                                                  §§push(_loc12_);
                                                                  if(_loc18_ || Boolean(_loc2_))
                                                                  {
                                                                     §§push(_loc7_);
                                                                     if(!(_loc17_ && Boolean(_loc2_)))
                                                                     {
                                                                        break loop25;
                                                                     }
                                                                     break loop15;
                                                                  }
                                                                  break loop16;
                                                               }
                                                               break;
                                                            }
                                                            §§push(_loc7_);
                                                            if(!_loc17_)
                                                            {
                                                               §§push(§§pop() * §§pop());
                                                               if(_loc18_)
                                                               {
                                                                  §§push(_loc10_);
                                                                  if(_loc18_)
                                                                  {
                                                                     §§push(_loc8_);
                                                                     if(!_loc18_)
                                                                     {
                                                                        break loop7;
                                                                     }
                                                                     §§push(§§pop() * §§pop());
                                                                     if(_loc17_ && Boolean(_loc3_))
                                                                     {
                                                                        break loop3;
                                                                     }
                                                                  }
                                                                  _loc15_ = §§pop() - §§pop();
                                                                  if(param1)
                                                                  {
                                                                     if(!_loc17_)
                                                                     {
                                                                        break;
                                                                     }
                                                                     break loop1;
                                                                  }
                                                                  break loop2;
                                                               }
                                                               break loop9;
                                                            }
                                                            break loop12;
                                                         }
                                                      }
                                                      §§push(_loc13_);
                                                      if(_loc18_)
                                                      {
                                                         §§push(_loc13_);
                                                         if(!_loc17_)
                                                         {
                                                            break loop19;
                                                         }
                                                         break loop3;
                                                      }
                                                      break;
                                                   }
                                                   §§goto(addr028b);
                                                }
                                                §§push(§§pop() * §§pop());
                                                if(_loc18_ || Boolean(this))
                                                {
                                                   break;
                                                }
                                                break loop10;
                                             }
                                             §§push(_loc14_);
                                             §§push(_loc14_);
                                             if(!(_loc17_ && Boolean(this)))
                                             {
                                                break loop7;
                                             }
                                             break loop15;
                                          }
                                          §§goto(addr0275);
                                       }
                                       §§goto(addr02a8);
                                    }
                                    §§goto(addr0252);
                                 }
                                 §§goto(addr02a2);
                              }
                              §§goto(addr0293);
                           }
                           §§goto(addr02b0);
                        }
                        §§push(_loc15_);
                        break loop3;
                     }
                     while(true)
                     {
                        while(true)
                        {
                           §§push(§§pop() * §§pop());
                           if(_loc18_ || Boolean(this))
                           {
                              §§push(§§pop() + §§pop());
                              break loop9;
                           }
                           §§goto(addr0292);
                        }
                        §§goto(addr0293);
                     }
                     §§goto(addr02b7);
                  }
                  addr0252:
                  while(true)
                  {
                     §§push(§§pop() + §§pop() * _loc15_);
                     if(!(_loc17_ && param1))
                     {
                        _loc16_ = §§pop();
                        if(!_loc18_)
                        {
                           break loop1;
                        }
                        §§push(_loc16_);
                        if(!_loc18_)
                        {
                           break;
                        }
                        if(§§pop() <= 0.001)
                        {
                           break loop2;
                        }
                        if(_loc17_)
                        {
                           break loop1;
                        }
                        _loc16_ = 1 / Math.sqrt(_loc16_);
                        §§push(_loc13_ * _loc16_);
                     }
                     addr0293:
                     §§push(Number(§§pop()));
                     if(_loc18_ || Boolean(_loc2_))
                     {
                        addr02a2:
                        _loc13_ = §§pop();
                        addr02a8:
                        _loc14_ *= _loc16_;
                        break loop1;
                     }
                     §§goto(addr02b8);
                  }
                  §§goto(addr02b7);
               }
               _loc2_.normalX = _loc13_;
               if(!_loc17_)
               {
                  _loc2_.normalY = _loc14_;
                  _loc2_.normalZ = _loc15_;
                  loop4:
                  while(true)
                  {
                     loop5:
                     while(true)
                     {
                        §§push(_loc2_);
                        §§push(_loc4_.x);
                        if(_loc18_ || param1)
                        {
                           §§push(_loc13_);
                           if(!_loc18_)
                           {
                              break;
                           }
                           §§push(§§pop() * §§pop());
                           if(_loc17_ && param1)
                           {
                              break loop4;
                           }
                        }
                        while(true)
                        {
                           §§push(_loc4_.y);
                           if(_loc18_)
                           {
                              §§push(_loc14_);
                              if(!_loc18_)
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(_loc17_)
                              {
                                 break loop5;
                              }
                           }
                           §§push(§§pop() + §§pop());
                           if(_loc18_ || Boolean(this))
                           {
                              §§push(_loc4_.z);
                              if(!_loc17_)
                              {
                                 §§push(_loc15_);
                                 break;
                              }
                              break loop5;
                           }
                           break loop4;
                        }
                        §§push(§§pop() * §§pop());
                        break;
                     }
                     §§push(§§pop() + §§pop());
                     break;
                  }
                  §§pop().alternativa3d::offset = §§pop();
               }
               _loc2_ = _loc2_.next;
               continue loop0;
            }
            addr02b8:
            addr02b0:
            §§push(_loc15_ * _loc16_);
            if(!_loc17_)
            {
               addr02b7:
               §§push(Number(§§pop()));
            }
            _loc15_ = §§pop();
            break loop2;
         }
      }
      
      public function optimizeForDynamicBSP(param1:int = 1) : void
      {
         §§push(false);
         var _loc26_:Boolean = true;
         var _loc27_:* = §§pop();
         var _loc3_:Face = null;
         var _loc5_:Face = null;
         var _loc6_:Face = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:* = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:* = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:* = 0;
         var _loc14_:Face = null;
         var _loc15_:Wrapper = null;
         var _loc16_:Vertex = null;
         var _loc17_:Vertex = null;
         var _loc18_:Vertex = null;
         var _loc19_:* = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:* = false;
         var _loc23_:* = false;
         var _loc24_:Vertex = null;
         var _loc25_:* = NaN;
         var _loc2_:Face = this.faceList;
         §§push(0);
         if(!_loc27_)
         {
            §§push(int(§§pop()));
         }
         var _loc4_:* = §§pop();
         loop0:
         while(true)
         {
            loop4:
            while(true)
            {
               if(_loc4_ < param1)
               {
                  _loc5_ = null;
                  _loc6_ = _loc2_;
                  if(!(_loc27_ && Boolean(_loc2_)))
                  {
                     loop1:
                     while(true)
                     {
                        while(true)
                        {
                           loop6:
                           while(true)
                           {
                              loop7:
                              while(true)
                              {
                                 if(_loc6_ != null)
                                 {
                                    _loc7_ = _loc6_.normalX;
                                    _loc8_ = _loc6_.normalY;
                                    if(_loc27_ && Boolean(param1))
                                    {
                                       continue loop4;
                                    }
                                    loop8:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc6_.normalZ);
                                          if(_loc26_ || Boolean(param1))
                                          {
                                             §§push(Number(§§pop()));
                                             if(!(_loc26_ || Boolean(_loc2_)))
                                             {
                                                break;
                                             }
                                             _loc9_ = §§pop();
                                             if(_loc27_)
                                             {
                                                break loop0;
                                             }
                                             _loc10_ = _loc6_.offset;
                                             §§push(_loc10_);
                                             if(!_loc26_)
                                             {
                                                break;
                                             }
                                             §§push(this.threshold);
                                             if(!_loc26_)
                                             {
                                                break loop8;
                                             }
                                             §§push(§§pop() - §§pop());
                                          }
                                          §§push(Number(§§pop()));
                                          break;
                                       }
                                       _loc11_ = §§pop();
                                       if(!_loc27_)
                                       {
                                          §§push(_loc10_);
                                          if(_loc26_ || Boolean(_loc2_))
                                          {
                                             §§push(this.threshold);
                                             break;
                                          }
                                          §§goto(addr0114);
                                       }
                                       §§goto(addr0125);
                                    }
                                    addr0114:
                                    _loc12_ = §§pop() + §§pop();
                                    if(!(_loc27_ && Boolean(this)))
                                    {
                                       addr0125:
                                       §§push(0);
                                       if(_loc27_ && Boolean(_loc3_))
                                       {
                                          break loop6;
                                       }
                                       §§push(int(§§pop()));
                                       if(!(_loc27_ && Boolean(this)))
                                       {
                                          _loc13_ = §§pop();
                                          _loc14_ = _loc2_;
                                          loop10:
                                          while(true)
                                          {
                                             if(_loc26_)
                                             {
                                                while(true)
                                                {
                                                   if(_loc14_ == null)
                                                   {
                                                      break loop10;
                                                   }
                                                   if(_loc14_ == _loc6_)
                                                   {
                                                      continue;
                                                   }
                                                   if(_loc27_)
                                                   {
                                                      break loop10;
                                                   }
                                                   _loc14_ = _loc14_.next;
                                                }
                                                break loop7;
                                                addr04d3:
                                             }
                                             _loc15_ = _loc14_.wrapper;
                                             _loc16_ = _loc15_.vertex;
                                             _loc15_ = _loc15_.next;
                                             _loc17_ = _loc15_.vertex;
                                             _loc15_ = _loc15_.next;
                                             _loc18_ = _loc15_.vertex;
                                             _loc15_ = _loc15_.next;
                                             if(_loc26_ || Boolean(param1))
                                             {
                                                §§push(_loc16_.x);
                                                if(!(_loc27_ && Boolean(_loc3_)))
                                                {
                                                   §§push(§§pop() * _loc7_);
                                                   if(!_loc27_)
                                                   {
                                                      §§push(_loc16_.y);
                                                      §§push(_loc8_);
                                                      if(_loc26_)
                                                      {
                                                         §§push(§§pop() + §§pop() * §§pop());
                                                         §§push(_loc16_.z);
                                                         §§push(_loc9_);
                                                         if(_loc26_)
                                                         {
                                                            §§push(§§pop() * §§pop());
                                                            if(!_loc27_)
                                                            {
                                                               §§push(§§pop() + §§pop());
                                                               if(!_loc27_)
                                                               {
                                                                  _loc19_ = §§pop();
                                                                  if(_loc26_ || Boolean(_loc2_))
                                                                  {
                                                                     §§push(_loc17_.x);
                                                                     if(_loc26_)
                                                                     {
                                                                        §§push(_loc7_);
                                                                        if(_loc26_)
                                                                        {
                                                                           §§push(§§pop() * §§pop());
                                                                           §§push(_loc17_.y);
                                                                           §§push(_loc8_);
                                                                           if(!_loc27_)
                                                                           {
                                                                              addr021d:
                                                                              §§push(§§pop() + §§pop() * §§pop());
                                                                              §§push(_loc17_.z);
                                                                              §§push(_loc9_);
                                                                              if(!(_loc27_ && Boolean(_loc3_)))
                                                                              {
                                                                                 addr0233:
                                                                                 §§push(§§pop() * §§pop());
                                                                                 if(_loc26_)
                                                                                 {
                                                                                    §§push(§§pop() + §§pop());
                                                                                    if(!(_loc27_ && Boolean(_loc3_)))
                                                                                    {
                                                                                       addr0249:
                                                                                       _loc20_ = §§pop();
                                                                                       if(_loc26_)
                                                                                       {
                                                                                          addr0252:
                                                                                          §§push(_loc18_.x);
                                                                                          if(_loc26_ || Boolean(this))
                                                                                          {
                                                                                             §§push(_loc7_);
                                                                                             if(_loc26_ || Boolean(param1))
                                                                                             {
                                                                                                §§push(§§pop() * §§pop());
                                                                                                §§push(_loc18_.y);
                                                                                                if(_loc26_ || Boolean(param1))
                                                                                                {
                                                                                                   §§push(_loc8_);
                                                                                                   if(!(_loc27_ && Boolean(param1)))
                                                                                                   {
                                                                                                      addr0298:
                                                                                                      addr0297:
                                                                                                      addr02a7:
                                                                                                      §§push(§§pop() + §§pop() * §§pop());
                                                                                                      §§push(_loc18_.z);
                                                                                                      §§push(_loc9_);
                                                                                                   }
                                                                                                   §§push(§§pop() * §§pop());
                                                                                                   if(_loc26_ || Boolean(param1))
                                                                                                   {
                                                                                                      addr02b8:
                                                                                                      §§push(§§pop() + §§pop());
                                                                                                      if(!_loc27_)
                                                                                                      {
                                                                                                         addr02bf:
                                                                                                         _loc21_ = §§pop();
                                                                                                         addr02c6:
                                                                                                         §§push(_loc19_ < _loc11_);
                                                                                                         if(_loc26_)
                                                                                                         {
                                                                                                            var _temp_18:* = Boolean(§§pop());
                                                                                                            §§push(_temp_18);
                                                                                                            §§push(_temp_18);
                                                                                                            if(!_loc27_)
                                                                                                            {
                                                                                                               if(!Boolean(§§pop()))
                                                                                                               {
                                                                                                                  addr02da:
                                                                                                                  §§pop();
                                                                                                                  if(!_loc27_)
                                                                                                                  {
                                                                                                                     addr02e7:
                                                                                                                     var _temp_19:* = _loc20_ < _loc11_;
                                                                                                                     addr02e3:
                                                                                                                     addr02e1:
                                                                                                                     §§push(_temp_19);
                                                                                                                     §§push(_temp_19);
                                                                                                                     if(_loc26_)
                                                                                                                     {
                                                                                                                        §§push(Boolean(§§pop()));
                                                                                                                        if(_loc26_)
                                                                                                                        {
                                                                                                                           addr02f5:
                                                                                                                           if(!§§pop())
                                                                                                                           {
                                                                                                                              §§pop();
                                                                                                                              addr02fa:
                                                                                                                              §§push(_loc21_);
                                                                                                                              if(!_loc27_)
                                                                                                                              {
                                                                                                                                 addr0302:
                                                                                                                                 §§push(§§pop() < _loc11_);
                                                                                                                                 if(!(_loc27_ && Boolean(_loc2_)))
                                                                                                                                 {
                                                                                                                                    addr0314:
                                                                                                                                    §§push(Boolean(§§pop()));
                                                                                                                                    if(!(_loc27_ && Boolean(_loc3_)))
                                                                                                                                    {
                                                                                                                                       _loc22_ = §§pop();
                                                                                                                                       if(_loc26_)
                                                                                                                                       {
                                                                                                                                          addr032d:
                                                                                                                                          §§push(_loc19_ > _loc12_);
                                                                                                                                          if(_loc26_)
                                                                                                                                          {
                                                                                                                                             addr0337:
                                                                                                                                             var _temp_22:* = §§pop();
                                                                                                                                             §§push(_temp_22);
                                                                                                                                             §§push(Boolean(_temp_22));
                                                                                                                                             if(!(_loc27_ && Boolean(param1)))
                                                                                                                                             {
                                                                                                                                                addr0347:
                                                                                                                                                if(!§§pop())
                                                                                                                                                {
                                                                                                                                                   if(_loc26_)
                                                                                                                                                   {
                                                                                                                                                      §§pop();
                                                                                                                                                      loop11:
                                                                                                                                                      while(true)
                                                                                                                                                      {
                                                                                                                                                         if(_loc26_)
                                                                                                                                                         {
                                                                                                                                                            addr035a:
                                                                                                                                                            addr035c:
                                                                                                                                                            §§push(_loc20_ > _loc12_);
                                                                                                                                                            if(_loc26_ || Boolean(param1))
                                                                                                                                                            {
                                                                                                                                                               addr036c:
                                                                                                                                                               var _temp_25:* = Boolean(§§pop());
                                                                                                                                                               addr036b:
                                                                                                                                                               §§push(_temp_25);
                                                                                                                                                               §§push(_temp_25);
                                                                                                                                                               if(!_loc27_)
                                                                                                                                                               {
                                                                                                                                                                  addr0373:
                                                                                                                                                                  §§push(Boolean(§§pop()));
                                                                                                                                                               }
                                                                                                                                                               if(!§§pop())
                                                                                                                                                               {
                                                                                                                                                                  addr0378:
                                                                                                                                                                  §§pop();
                                                                                                                                                                  addr0379:
                                                                                                                                                                  §§push(_loc21_ > _loc12_);
                                                                                                                                                               }
                                                                                                                                                               _loc23_ = Boolean(§§pop());
                                                                                                                                                               addr0382:
                                                                                                                                                               loop3:
                                                                                                                                                               for(; _loc15_ != null; _loc15_ = _loc15_.next)
                                                                                                                                                               {
                                                                                                                                                                  _loc24_ = _loc15_.vertex;
                                                                                                                                                                  loop12:
                                                                                                                                                                  while(true)
                                                                                                                                                                  {
                                                                                                                                                                     while(true)
                                                                                                                                                                     {
                                                                                                                                                                        §§push(_loc24_.x);
                                                                                                                                                                        §§push(_loc7_);
                                                                                                                                                                        if(!_loc27_)
                                                                                                                                                                        {
                                                                                                                                                                           §§push(§§pop() * §§pop());
                                                                                                                                                                           if(_loc27_)
                                                                                                                                                                           {
                                                                                                                                                                              break;
                                                                                                                                                                           }
                                                                                                                                                                           §§push(_loc24_.y);
                                                                                                                                                                           §§push(_loc8_);
                                                                                                                                                                           if(!_loc26_)
                                                                                                                                                                           {
                                                                                                                                                                              break loop12;
                                                                                                                                                                           }
                                                                                                                                                                           §§push(§§pop() * §§pop());
                                                                                                                                                                        }
                                                                                                                                                                        §§push(§§pop() + §§pop());
                                                                                                                                                                        §§push(_loc24_.z);
                                                                                                                                                                        if(!(_loc27_ && Boolean(_loc3_)))
                                                                                                                                                                        {
                                                                                                                                                                           §§push(_loc9_);
                                                                                                                                                                           break loop12;
                                                                                                                                                                        }
                                                                                                                                                                        addr046e:
                                                                                                                                                                        addr046f:
                                                                                                                                                                        addr03e7:
                                                                                                                                                                        while(true)
                                                                                                                                                                        {
                                                                                                                                                                           if(§§pop() < §§pop())
                                                                                                                                                                           {
                                                                                                                                                                              if(_loc27_ && Boolean(this))
                                                                                                                                                                              {
                                                                                                                                                                                 break loop11;
                                                                                                                                                                              }
                                                                                                                                                                              §§push(true);
                                                                                                                                                                              if(_loc27_)
                                                                                                                                                                              {
                                                                                                                                                                                 break;
                                                                                                                                                                              }
                                                                                                                                                                              §§push(Boolean(§§pop()));
                                                                                                                                                                              if(_loc26_ || Boolean(this))
                                                                                                                                                                              {
                                                                                                                                                                                 _loc22_ = §§pop();
                                                                                                                                                                                 if(!_loc26_)
                                                                                                                                                                                 {
                                                                                                                                                                                    break loop11;
                                                                                                                                                                                 }
                                                                                                                                                                                 if(_loc23_)
                                                                                                                                                                                 {
                                                                                                                                                                                    break loop3;
                                                                                                                                                                                 }
                                                                                                                                                                                 continue loop3;
                                                                                                                                                                              }
                                                                                                                                                                           }
                                                                                                                                                                           else
                                                                                                                                                                           {
                                                                                                                                                                              §§goto(addr0427);
                                                                                                                                                                              §§push(_loc25_);
                                                                                                                                                                           }
                                                                                                                                                                           §§goto(addr043c);
                                                                                                                                                                        }
                                                                                                                                                                        var _temp_33:* = Boolean(§§pop());
                                                                                                                                                                        §§push(_temp_33);
                                                                                                                                                                        §§push(_temp_33);
                                                                                                                                                                        if(!(_loc27_ && Boolean(param1)))
                                                                                                                                                                        {
                                                                                                                                                                           §§push(Boolean(§§pop()));
                                                                                                                                                                        }
                                                                                                                                                                        if(§§pop())
                                                                                                                                                                        {
                                                                                                                                                                           break loop14;
                                                                                                                                                                        }
                                                                                                                                                                        §§goto(addr048d);
                                                                                                                                                                     }
                                                                                                                                                                     while(true)
                                                                                                                                                                     {
                                                                                                                                                                        §§push(Number(§§pop()));
                                                                                                                                                                        if(_loc26_)
                                                                                                                                                                        {
                                                                                                                                                                           _loc25_ = §§pop();
                                                                                                                                                                           §§push(_loc25_);
                                                                                                                                                                           if(_loc27_)
                                                                                                                                                                           {
                                                                                                                                                                              break;
                                                                                                                                                                           }
                                                                                                                                                                        }
                                                                                                                                                                        §§goto(addr03e7);
                                                                                                                                                                     }
                                                                                                                                                                     §§goto(addr0427);
                                                                                                                                                                  }
                                                                                                                                                                  loop14:
                                                                                                                                                                  while(true)
                                                                                                                                                                  {
                                                                                                                                                                     while(true)
                                                                                                                                                                     {
                                                                                                                                                                        §§push(§§pop() + §§pop() * §§pop());
                                                                                                                                                                        if(_loc26_ || Boolean(_loc3_))
                                                                                                                                                                        {
                                                                                                                                                                           break loop13;
                                                                                                                                                                        }
                                                                                                                                                                        addr0427:
                                                                                                                                                                        if(§§pop() > _loc12_)
                                                                                                                                                                        {
                                                                                                                                                                           §§push(true);
                                                                                                                                                                           if(_loc26_ || Boolean(_loc3_))
                                                                                                                                                                           {
                                                                                                                                                                              break;
                                                                                                                                                                           }
                                                                                                                                                                           break loop14;
                                                                                                                                                                        }
                                                                                                                                                                        continue loop3;
                                                                                                                                                                     }
                                                                                                                                                                     addr043c:
                                                                                                                                                                     §§push(Boolean(§§pop()));
                                                                                                                                                                     if(_loc26_)
                                                                                                                                                                     {
                                                                                                                                                                        _loc23_ = §§pop();
                                                                                                                                                                        if(_loc22_)
                                                                                                                                                                        {
                                                                                                                                                                           break loop3;
                                                                                                                                                                        }
                                                                                                                                                                        continue loop3;
                                                                                                                                                                     }
                                                                                                                                                                     §§goto(addr048d);
                                                                                                                                                                  }
                                                                                                                                                                  §§pop();
                                                                                                                                                                  loop16:
                                                                                                                                                                  while(true)
                                                                                                                                                                  {
                                                                                                                                                                     if(!_loc27_)
                                                                                                                                                                     {
                                                                                                                                                                        addr048d:
                                                                                                                                                                        if(!Boolean(_loc22_))
                                                                                                                                                                        {
                                                                                                                                                                           break;
                                                                                                                                                                        }
                                                                                                                                                                     }
                                                                                                                                                                     while(true)
                                                                                                                                                                     {
                                                                                                                                                                        §§push(_loc13_);
                                                                                                                                                                        if(!_loc27_)
                                                                                                                                                                        {
                                                                                                                                                                           §§push(§§pop() + 1);
                                                                                                                                                                           if(_loc27_ && Boolean(param1))
                                                                                                                                                                           {
                                                                                                                                                                              break;
                                                                                                                                                                           }
                                                                                                                                                                        }
                                                                                                                                                                        §§push(int(§§pop()));
                                                                                                                                                                        if(_loc26_ || Boolean(param1))
                                                                                                                                                                        {
                                                                                                                                                                           break;
                                                                                                                                                                        }
                                                                                                                                                                        addr04c1:
                                                                                                                                                                        if(§§pop() > _loc4_)
                                                                                                                                                                        {
                                                                                                                                                                           addr04c7:
                                                                                                                                                                           break loop10;
                                                                                                                                                                        }
                                                                                                                                                                        break loop16;
                                                                                                                                                                     }
                                                                                                                                                                     _loc13_ = §§pop();
                                                                                                                                                                     if(_loc26_)
                                                                                                                                                                     {
                                                                                                                                                                        §§goto(addr04c1);
                                                                                                                                                                        §§push(_loc13_);
                                                                                                                                                                     }
                                                                                                                                                                     §§goto(addr04c7);
                                                                                                                                                                  }
                                                                                                                                                                  _loc14_ = _loc14_.next;
                                                                                                                                                                  §§goto(addr04d3);
                                                                                                                                                               }
                                                                                                                                                               addr045e:
                                                                                                                                                               §§push(_loc23_);
                                                                                                                                                               if(_loc26_ || Boolean(_loc3_))
                                                                                                                                                               {
                                                                                                                                                                  §§goto(addr046e);
                                                                                                                                                               }
                                                                                                                                                               §§goto(addr046f);
                                                                                                                                                            }
                                                                                                                                                            §§goto(addr0378);
                                                                                                                                                         }
                                                                                                                                                         §§goto(addr045e);
                                                                                                                                                      }
                                                                                                                                                      addr051d:
                                                                                                                                                      _loc3_ = _loc6_;
                                                                                                                                                      continue loop1;
                                                                                                                                                   }
                                                                                                                                                   §§goto(addr036b);
                                                                                                                                                }
                                                                                                                                                §§goto(addr036c);
                                                                                                                                             }
                                                                                                                                             §§goto(addr0373);
                                                                                                                                          }
                                                                                                                                          §§goto(addr036b);
                                                                                                                                       }
                                                                                                                                       §§goto(addr0379);
                                                                                                                                    }
                                                                                                                                 }
                                                                                                                                 §§goto(addr0337);
                                                                                                                              }
                                                                                                                              §§goto(addr035a);
                                                                                                                           }
                                                                                                                           §§goto(addr0314);
                                                                                                                        }
                                                                                                                        §§goto(addr0373);
                                                                                                                     }
                                                                                                                     §§goto(addr02f5);
                                                                                                                  }
                                                                                                                  §§goto(addr02fa);
                                                                                                               }
                                                                                                               §§goto(addr02e7);
                                                                                                            }
                                                                                                            §§goto(addr0347);
                                                                                                         }
                                                                                                         §§goto(addr02da);
                                                                                                      }
                                                                                                      §§goto(addr032d);
                                                                                                   }
                                                                                                   §§goto(addr02c6);
                                                                                                }
                                                                                                §§goto(addr0298);
                                                                                             }
                                                                                             §§goto(addr035c);
                                                                                          }
                                                                                          §§goto(addr02e3);
                                                                                       }
                                                                                       §§goto(addr0382);
                                                                                    }
                                                                                    §§goto(addr0302);
                                                                                 }
                                                                                 §§goto(addr035c);
                                                                              }
                                                                              §§goto(addr0297);
                                                                           }
                                                                           §§goto(addr0233);
                                                                        }
                                                                        §§goto(addr02b8);
                                                                     }
                                                                     §§goto(addr035a);
                                                                  }
                                                                  §§goto(addr02e1);
                                                               }
                                                               §§goto(addr0302);
                                                            }
                                                            §§goto(addr02a7);
                                                         }
                                                      }
                                                      §§goto(addr021d);
                                                   }
                                                   §§goto(addr0249);
                                                }
                                                §§goto(addr02bf);
                                             }
                                             §§goto(addr0252);
                                          }
                                          if(_loc14_ != null)
                                          {
                                             _loc5_ = _loc6_;
                                             continue loop1;
                                          }
                                          if(_loc5_ != null)
                                          {
                                             _loc5_.next = _loc6_.next;
                                          }
                                          else
                                          {
                                             _loc2_ = _loc6_.next;
                                          }
                                          if(_loc3_ != null)
                                          {
                                             if(!(_loc27_ && Boolean(_loc2_)))
                                             {
                                                _loc3_.next = _loc6_;
                                             }
                                          }
                                          else
                                          {
                                             this.faceList = _loc6_;
                                          }
                                          §§goto(addr051d);
                                       }
                                       else
                                       {
                                          §§goto(addr056a);
                                       }
                                    }
                                 }
                              }
                              addr0584:
                              if(_loc3_ != null)
                              {
                                 break loop4;
                              }
                              break loop0;
                           }
                           §§push(§§pop() + 1);
                           if(_loc26_ || Boolean(_loc2_))
                           {
                              addr056a:
                              §§push(int(§§pop()));
                           }
                           break;
                        }
                        _loc6_ = _loc6_.next;
                        _loc4_ = §§pop();
                        if(_loc27_)
                        {
                           break loop4;
                        }
                        continue loop4;
                     }
                     continue;
                  }
                  if(_loc2_ != null)
                  {
                     §§push(_loc4_);
                     if(!(_loc27_ && Boolean(_loc2_)))
                     {
                        break loop6;
                     }
                     break loop5;
                  }
                  if(_loc27_)
                  {
                     break;
                  }
               }
               §§goto(addr0584);
            }
            _loc3_.next = _loc2_;
            break;
         }
      }
      
      override public function calculateResolution(param1:int, param2:int, param3:int = 1, param4:Matrix3D = null) : Number
      {
         §§push(false);
         var _loc22_:Boolean = true;
         var _loc23_:* = §§pop();
         var _loc5_:Object3D = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Vertex = null;
         var _loc13_:Vertex = null;
         var _loc14_:Number = NaN;
         var _loc15_:* = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = NaN;
         var _loc21_:* = NaN;
         while(true)
         {
            if(_loc22_ || Boolean(param3))
            {
               if(param4 == null)
               {
                  break;
               }
            }
            _loc5_ = new Object3D();
            if(_loc22_ || Boolean(this))
            {
               _loc5_.matrix = param4;
               if(!(_loc23_ && Boolean(param2)))
               {
                  _loc5_.composeMatrix();
               }
            }
            break;
         }
         §§push(1e+22);
         if(_loc22_)
         {
            §§push(Number(§§pop()));
         }
         var _loc6_:* = §§pop();
         var _loc7_:* = 0;
         var _loc8_:Number = 0;
         §§push(0);
         if(!(_loc23_ && Boolean(param3)))
         {
            §§push(int(§§pop()));
         }
         var _loc9_:* = §§pop();
         var _loc10_:Face = this.faceList;
         while(_loc10_ != null)
         {
            _loc11_ = _loc10_.wrapper;
            if(_loc22_ || Boolean(this))
            {
               loop1:
               while(true)
               {
                  if(_loc11_ == null)
                  {
                     break;
                  }
                  _loc12_ = _loc11_.vertex;
                  loop3:
                  while(true)
                  {
                     while(true)
                     {
                        if(!_loc23_)
                        {
                           §§push(_loc11_.next);
                           if(!_loc22_)
                           {
                              break;
                           }
                           §§push(§§pop() == null);
                           if(!(_loc23_ && Boolean(this)))
                           {
                              §§push(!§§pop());
                           }
                           if(!§§pop())
                           {
                              §§push(_loc10_.wrapper.vertex);
                              break loop3;
                           }
                        }
                        §§push(_loc11_.next);
                        break;
                     }
                     §§push(§§pop().alternativa3d::vertex);
                     if(!(_loc22_ || Boolean(param2)))
                     {
                        break;
                     }
                     §§push(§§pop());
                     continue loop6;
                  }
                  _loc13_ = §§pop();
                  loop5:
                  while(true)
                  {
                     loop6:
                     while(true)
                     {
                        loop8:
                        while(true)
                        {
                           if(_loc5_ != null)
                           {
                              loop9:
                              while(true)
                              {
                                 loop10:
                                 while(true)
                                 {
                                    loop13:
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
                                                            loop22:
                                                            while(true)
                                                            {
                                                               loop23:
                                                               while(true)
                                                               {
                                                                  §§push(_loc5_.ma * (_loc13_.x - _loc12_.x));
                                                                  §§push(_loc5_.mb);
                                                                  §§push(_loc13_.y);
                                                                  if(_loc22_)
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
                                                                                       §§push(_loc12_.y);
                                                                                       if(!(_loc23_ && Boolean(param3)))
                                                                                       {
                                                                                          §§push(§§pop() * (§§pop() - §§pop()));
                                                                                          if(!_loc22_)
                                                                                          {
                                                                                             break loop15;
                                                                                          }
                                                                                          §§push(§§pop() + §§pop());
                                                                                          §§push(_loc5_.mc);
                                                                                          if(_loc23_)
                                                                                          {
                                                                                             break loop15;
                                                                                          }
                                                                                          loop30:
                                                                                          while(true)
                                                                                          {
                                                                                             loop31:
                                                                                             while(true)
                                                                                             {
                                                                                                while(true)
                                                                                                {
                                                                                                   §§push(_loc13_.z);
                                                                                                   §§push(_loc12_.z);
                                                                                                   if(!_loc23_)
                                                                                                   {
                                                                                                      §§push(§§pop() - §§pop());
                                                                                                      if(!(_loc22_ || Boolean(this)))
                                                                                                      {
                                                                                                         break loop9;
                                                                                                      }
                                                                                                      _loc14_ = §§pop() + §§pop() * §§pop();
                                                                                                      if(!_loc22_)
                                                                                                      {
                                                                                                         break loop27;
                                                                                                      }
                                                                                                      if(_loc5_ == null)
                                                                                                      {
                                                                                                         §§push(_loc13_.y);
                                                                                                         §§push(_loc12_.y);
                                                                                                         if(!(_loc23_ && Boolean(param2)))
                                                                                                         {
                                                                                                            §§push(§§pop() - §§pop());
                                                                                                            if(!(_loc23_ && Boolean(param2)))
                                                                                                            {
                                                                                                               §§push(Number(§§pop()));
                                                                                                               break;
                                                                                                            }
                                                                                                            break loop16;
                                                                                                         }
                                                                                                         break loop17;
                                                                                                      }
                                                                                                      §§push(_loc5_.me);
                                                                                                      §§push(_loc13_.x - _loc12_.x);
                                                                                                      if(_loc23_)
                                                                                                      {
                                                                                                         break loop13;
                                                                                                      }
                                                                                                      §§push(§§pop() * §§pop());
                                                                                                      §§push(_loc5_.mf);
                                                                                                      §§push(_loc13_.y);
                                                                                                      §§push(_loc12_.y);
                                                                                                      if(_loc23_)
                                                                                                      {
                                                                                                         break loop30;
                                                                                                      }
                                                                                                   }
                                                                                                   §§push(§§pop() + §§pop() * (§§pop() - §§pop()));
                                                                                                   §§push(_loc5_.mg);
                                                                                                   §§push(_loc13_.z);
                                                                                                   §§push(_loc12_.z);
                                                                                                   if(_loc22_ || Boolean(this))
                                                                                                   {
                                                                                                      §§push(§§pop() - §§pop());
                                                                                                      if(!_loc23_)
                                                                                                      {
                                                                                                         §§push(§§pop() * §§pop());
                                                                                                         if(!(_loc23_ && Boolean(param1)))
                                                                                                         {
                                                                                                            §§push(§§pop() + §§pop());
                                                                                                            if(_loc22_)
                                                                                                            {
                                                                                                               §§push(Number(§§pop()));
                                                                                                               if(!(_loc23_ && Boolean(param2)))
                                                                                                               {
                                                                                                                  break;
                                                                                                               }
                                                                                                               break loop31;
                                                                                                            }
                                                                                                            break loop26;
                                                                                                         }
                                                                                                         break loop13;
                                                                                                      }
                                                                                                      break loop25;
                                                                                                   }
                                                                                                   break loop30;
                                                                                                }
                                                                                                §§push(Number(§§pop()));
                                                                                                if(_loc23_ && Boolean(param2))
                                                                                                {
                                                                                                   break loop29;
                                                                                                }
                                                                                                _loc15_ = §§pop();
                                                                                                if(_loc5_ != null)
                                                                                                {
                                                                                                   §§push(_loc5_.mi * (_loc13_.x - _loc12_.x));
                                                                                                   if(_loc22_ || Boolean(this))
                                                                                                   {
                                                                                                      break;
                                                                                                   }
                                                                                                   break loop10;
                                                                                                }
                                                                                                §§push(_loc13_.z);
                                                                                                if(_loc22_ || Boolean(param2))
                                                                                                {
                                                                                                   break loop28;
                                                                                                }
                                                                                                §§goto(addr0328);
                                                                                             }
                                                                                             §§push(_loc5_.mj);
                                                                                             §§push(_loc13_.y);
                                                                                             if(_loc22_)
                                                                                             {
                                                                                                §§push(_loc12_.y);
                                                                                                if(_loc22_)
                                                                                                {
                                                                                                   break;
                                                                                                }
                                                                                                break loop24;
                                                                                             }
                                                                                             break loop25;
                                                                                          }
                                                                                       }
                                                                                       break loop30;
                                                                                    }
                                                                                    §§push(_loc5_.mk);
                                                                                    if(_loc22_ || Boolean(this))
                                                                                    {
                                                                                       §§push(_loc13_.z);
                                                                                       §§push(_loc12_.z);
                                                                                       break loop24;
                                                                                    }
                                                                                    break loop23;
                                                                                 }
                                                                                 §§push(§§pop() - _loc12_.z);
                                                                                 if(!(_loc23_ && Boolean(param3)))
                                                                                 {
                                                                                    §§push(Number(§§pop()));
                                                                                    if(!_loc22_)
                                                                                    {
                                                                                       break loop20;
                                                                                    }
                                                                                    §§goto(addr0321);
                                                                                 }
                                                                                 §§goto(addr035e);
                                                                              }
                                                                              §§goto(addr0324);
                                                                           }
                                                                           §§goto(addr02f1);
                                                                        }
                                                                     }
                                                                     §§push(§§pop() - §§pop());
                                                                     if(_loc23_ && Boolean(param2))
                                                                     {
                                                                        break loop22;
                                                                     }
                                                                     §§push(§§pop() * §§pop());
                                                                     if(_loc23_)
                                                                     {
                                                                        break loop13;
                                                                     }
                                                                     §§push(§§pop() + §§pop());
                                                                     if(!_loc22_)
                                                                     {
                                                                        break loop21;
                                                                     }
                                                                     addr0321:
                                                                     _loc16_ = §§pop();
                                                                     addr0324:
                                                                     addr0328:
                                                                     §§push(_loc13_.u - _loc12_.u);
                                                                     §§push(param1);
                                                                     if(_loc22_ || Boolean(param3))
                                                                     {
                                                                        _loc17_ = §§pop() * §§pop();
                                                                        if(_loc23_)
                                                                        {
                                                                           break loop1;
                                                                        }
                                                                        §§push(_loc13_.v);
                                                                        if(_loc23_)
                                                                        {
                                                                           break loop10;
                                                                        }
                                                                        §§push(§§pop() - _loc12_.v);
                                                                        if(_loc23_)
                                                                        {
                                                                           break loop19;
                                                                        }
                                                                        §§push(param2);
                                                                     }
                                                                     addr035e:
                                                                     _loc18_ = §§pop() * §§pop();
                                                                     §§push(_loc14_ * _loc14_);
                                                                     if(_loc22_ || Boolean(param2))
                                                                     {
                                                                        §§push(_loc15_);
                                                                        §§push(_loc15_);
                                                                        if(!_loc23_)
                                                                        {
                                                                           break loop25;
                                                                        }
                                                                        break loop9;
                                                                     }
                                                                     break loop18;
                                                                     addr02f1:
                                                                  }
                                                                  break loop25;
                                                               }
                                                               §§push(§§pop() + §§pop());
                                                               break loop19;
                                                            }
                                                            §§goto(addr03cf);
                                                         }
                                                         §§goto(addr03e6);
                                                      }
                                                      §§goto(addr0461);
                                                   }
                                                   §§push(_loc16_);
                                                   if(_loc22_ || Boolean(param2))
                                                   {
                                                      §§push(_loc16_);
                                                      break loop9;
                                                   }
                                                   break loop8;
                                                }
                                                §§goto(addr0458);
                                             }
                                             §§goto(addr03b6);
                                          }
                                          §§goto(addr041d);
                                       }
                                       §§goto(addr03de);
                                    }
                                    §§goto(addr03a0);
                                 }
                                 while(true)
                                 {
                                    §§push(0.001);
                                    if(_loc22_ || Boolean(this))
                                    {
                                       §§push(§§pop() > §§pop());
                                       if(!_loc22_)
                                       {
                                          break;
                                       }
                                       §§push(Boolean(§§pop()));
                                       if(!_loc23_)
                                       {
                                          var _temp_15:* = §§pop();
                                          §§push(_temp_15);
                                          §§push(_temp_15);
                                          if(!_loc23_)
                                          {
                                             §§push(Boolean(§§pop()));
                                          }
                                          if(!§§pop())
                                          {
                                             break;
                                          }
                                          if(!_loc22_)
                                          {
                                             break;
                                          }
                                       }
                                       §§pop();
                                       §§push(_loc20_);
                                       §§push(0.001);
                                    }
                                    §§goto(addr041f);
                                 }
                                 §§goto(addr042f);
                              }
                              while(true)
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc23_ && Boolean(param3)))
                                 {
                                    addr03a0:
                                    _loc19_ = §§pop() + §§pop();
                                    if(_loc23_ && Boolean(param1))
                                    {
                                       break loop6;
                                    }
                                    while(true)
                                    {
                                       addr044e:
                                       §§push(_loc17_ * _loc17_);
                                       if(_loc22_ || Boolean(this))
                                       {
                                          §§push(_loc18_);
                                          if(_loc22_)
                                          {
                                             addr03cf:
                                             §§push(§§pop() * _loc18_);
                                             if(_loc22_ || Boolean(this))
                                             {
                                                addr03de:
                                                addr03e6:
                                                §§push(§§pop() + §§pop());
                                                if(!_loc23_)
                                                {
                                                   §§push(Number(§§pop()));
                                                }
                                                _loc20_ = §§pop();
                                                §§push(_loc19_);
                                                break loop10;
                                             }
                                             break loop8;
                                          }
                                          addr045a:
                                          if(§§pop() < §§pop())
                                          {
                                             addr0461:
                                             _loc6_ = Number(_loc21_);
                                             if(_loc23_ && Boolean(param3))
                                             {
                                                break loop5;
                                             }
                                          }
                                          addr0473:
                                          §§push(_loc21_);
                                          §§push(_loc7_);
                                          break loop8;
                                       }
                                       _loc21_ = §§pop();
                                       if(_loc22_)
                                       {
                                          break;
                                       }
                                       break loop1;
                                    }
                                    §§goto(addr045a);
                                 }
                                 addr041f:
                                 §§push(§§pop() > §§pop());
                                 if(_loc22_ || Boolean(param2))
                                 {
                                    §§push(Boolean(§§pop()));
                                 }
                                 break;
                              }
                              addr042f:
                              if(!§§pop())
                              {
                                 continue loop1;
                              }
                              if(!(_loc23_ && Boolean(param2)))
                              {
                                 §§goto(addr044e);
                                 §§push(Math.sqrt(_loc19_ / _loc20_));
                              }
                              §§goto(addr0456);
                           }
                           else
                           {
                              §§push(_loc13_.x);
                              if(!_loc23_)
                              {
                                 §§goto(addr01a3);
                                 §§push(§§pop() - _loc12_.x);
                              }
                           }
                           §§goto(addr0473);
                        }
                        if(§§pop() <= §§pop())
                        {
                           break loop5;
                        }
                        §§push(Number(_loc21_));
                        if(!_loc23_)
                        {
                           _loc7_ = §§pop();
                           if(!(_loc23_ && Boolean(param3)))
                           {
                              break loop5;
                           }
                           break;
                        }
                        §§goto(addr04a5);
                     }
                     §§goto(addr04c7);
                  }
                  addr04a5:
                  §§push(_loc8_);
                  if(!(_loc23_ && Boolean(param1)))
                  {
                     §§push(§§pop() + _loc21_);
                  }
                  _loc8_ = §§pop();
                  §§push(_loc9_);
                  if(!_loc23_)
                  {
                     while(true)
                     {
                        §§push(§§pop() + 1);
                        if(_loc22_)
                        {
                           §§push(int(§§pop()));
                           if(_loc23_)
                           {
                              break;
                           }
                        }
                        _loc9_ = §§pop();
                        if(!_loc23_)
                        {
                           break loop6;
                        }
                        break loop1;
                     }
                  }
                  addr04c7:
                  if(§§pop() == 0)
                  {
                     break;
                  }
                  _loc11_ = _loc11_.next;
               }
            }
            _loc10_ = _loc10_.next;
         }
         loop33:
         while(true)
         {
            loop34:
            while(true)
            {
               loop35:
               while(true)
               {
                  while(true)
                  {
                     if(!_loc23_)
                     {
                        §§push(_loc9_);
                        if(_loc22_ || Boolean(param2))
                        {
                           §§push(0);
                           if(_loc22_)
                           {
                              if(§§pop() == §§pop())
                              {
                                 if(_loc22_ || Boolean(param3))
                                 {
                                    addr051f:
                                    §§push(1);
                                    if(_loc22_ || Boolean(param1))
                                    {
                                       break;
                                    }
                                    break loop34;
                                 }
                              }
                              else
                              {
                                 §§push(param3);
                                 if(_loc23_)
                                 {
                                    break loop34;
                                 }
                                 §§push(2);
                                 if(!(_loc22_ || Boolean(param1)))
                                 {
                                    break loop35;
                                 }
                                 if(§§pop() >= §§pop())
                                 {
                                    §§push(param3);
                                    break loop34;
                                 }
                                 if(!_loc22_)
                                 {
                                    §§goto(addr0570);
                                 }
                              }
                              §§push(_loc8_ / _loc9_);
                              break loop33;
                           }
                           break loop35;
                        }
                        break;
                     }
                     §§goto(addr051f);
                  }
                  return §§pop();
               }
               if(§§pop() == §§pop())
               {
                  addr0570:
                  §§push(Number(_loc6_));
                  if(_loc23_ && Boolean(param1))
                  {
                  }
                  break loop33;
               }
               §§push(Number(_loc7_));
               break loop33;
            }
            return 2;
         }
         return §§pop();
      }
      
      override public function intersectRay(param1:Vector3D, param2:Vector3D, param3:Dictionary = null, param4:Camera3D = null) : RayIntersectionData
      {
         §§push(false);
         var _loc34_:Boolean = true;
         var _loc35_:* = §§pop();
         var _loc11_:Vector3D = null;
         var _loc12_:Face = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:* = NaN;
         var _loc18_:* = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:* = NaN;
         var _loc22_:* = NaN;
         var _loc23_:* = NaN;
         var _loc24_:Wrapper = null;
         var _loc25_:Vertex = null;
         var _loc26_:Vertex = null;
         var _loc27_:* = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:RayIntersectionData = null;
         if(_loc34_)
         {
            loop2:
            while(true)
            {
               §§push(param3 == null);
               if(!_loc35_)
               {
                  §§push(!§§pop());
                  if(!(_loc34_ || Boolean(param1)))
                  {
                     break;
                  }
                  §§push(Boolean(§§pop()));
                  if(_loc35_)
                  {
                     break;
                  }
                  var _temp_2:* = §§pop();
                  §§push(_temp_2);
                  §§push(_temp_2);
                  if(!(_loc35_ && Boolean(param1)))
                  {
                     §§push(Boolean(§§pop()));
                  }
                  if(!§§pop())
                  {
                     break;
                  }
                  if(!_loc34_)
                  {
                     break;
                  }
               }
               §§pop();
               while(true)
               {
                  if(!(_loc35_ && Boolean(param2)))
                  {
                     §§push(Boolean(param3[this]));
                     if(_loc34_ || Boolean(param2))
                     {
                        break loop2;
                     }
                     §§goto(addr0106);
                  }
                  addr00d0:
                  §§push(null);
                  if(!_loc35_)
                  {
                     return §§pop();
                  }
                  break;
               }
               §§goto(addr0111);
            }
            while(true)
            {
               if(§§pop())
               {
                  if(!(_loc35_ && Boolean(param2)))
                  {
                     §§goto(addr00d0);
                  }
               }
               addr0106:
               §§goto(addr0112);
            }
            addr0111:
            return §§pop();
         }
         addr0112:
         if(§§pop())
         {
            if(!_loc35_)
            {
               §§push(null);
               break loop3;
            }
         }
         var _loc5_:Number = param1.x;
         var _loc6_:Number = param1.y;
         var _loc7_:Number = param1.z;
         var _loc8_:Number = param2.x;
         var _loc9_:Number = param2.y;
         var _loc10_:Number = param2.z;
         §§push(1e+22);
         if(_loc34_)
         {
            §§push(Number(§§pop()));
         }
         var _loc13_:* = §§pop();
         var _loc14_:Face = this.faceList;
         loop0:
         for(; _loc14_ != null; _loc14_ = _loc14_.next)
         {
            loop4:
            while(true)
            {
               loop5:
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
                              §§push(_loc14_.normalX);
                              if(_loc34_ || Boolean(param3))
                              {
                                 _loc15_ = §§pop();
                                 _loc16_ = _loc14_.normalY;
                                 if(_loc35_)
                                 {
                                    break loop0;
                                 }
                                 loop28:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc14_.normalZ);
                                       if(_loc34_ || Boolean(param3))
                                       {
                                          _loc17_ = §§pop();
                                          §§push(_loc8_);
                                          if(!_loc34_)
                                          {
                                             break;
                                          }
                                          §§push(_loc15_);
                                          if(_loc35_ && Boolean(param2))
                                          {
                                             break loop28;
                                          }
                                          §§push(§§pop() * §§pop());
                                       }
                                       §§push(_loc9_ * _loc16_);
                                       if(_loc35_)
                                       {
                                          break loop5;
                                       }
                                       §§push(§§pop() + §§pop());
                                       if(_loc34_)
                                       {
                                          §§push(_loc10_);
                                          §§push(_loc17_);
                                          if(_loc34_ || Boolean(this))
                                          {
                                             §§push(§§pop() * §§pop());
                                             break loop28;
                                          }
                                          §§goto(addr01fd);
                                       }
                                    }
                                    §§push(0);
                                    if(!_loc35_)
                                    {
                                       if(§§pop() >= §§pop())
                                       {
                                          continue loop0;
                                       }
                                       §§push(_loc5_);
                                       §§push(_loc15_);
                                       if(!_loc34_)
                                       {
                                          break loop27;
                                       }
                                       §§goto(addr01f3);
                                       §§push(§§pop() * §§pop());
                                    }
                                    §§goto(addr0227);
                                 }
                                 §§push(§§pop() + §§pop());
                                 if(_loc34_ || Boolean(param2))
                                 {
                                    _loc18_ = §§pop();
                                    addr024e:
                                    if(_loc34_)
                                    {
                                       §§push(_loc18_);
                                       break loop29;
                                    }
                                    §§push(_loc11_ == null);
                                    if(_loc35_ && Boolean(param1))
                                    {
                                       break loop4;
                                    }
                                    §§push(Boolean(§§pop()));
                                    if(_loc34_ || Boolean(param2))
                                    {
                                       var _temp_31:* = §§pop();
                                       §§push(_temp_31);
                                       §§push(_temp_31);
                                       if(!_loc35_)
                                       {
                                          §§push(Boolean(§§pop()));
                                       }
                                       if(§§pop())
                                       {
                                          break loop4;
                                       }
                                       if(!_loc34_)
                                       {
                                          break loop4;
                                       }
                                    }
                                    §§pop();
                                    addr0284:
                                    while(true)
                                    {
                                       §§push(_loc20_);
                                       §§push(_loc13_);
                                       if(!_loc35_)
                                       {
                                          break loop26;
                                       }
                                       §§goto(addr02e3);
                                    }
                                    §§goto(addr02f5);
                                 }
                                 addr01fd:
                                 addr01f3:
                                 §§push(§§pop() + _loc6_ * _loc16_);
                                 §§push(_loc7_ * _loc17_);
                                 if(!(_loc34_ || Boolean(param2)))
                                 {
                                    break loop26;
                                 }
                                 _loc19_ = §§pop() + §§pop() - _loc14_.offset;
                                 §§push(_loc19_);
                                 if(!(_loc34_ || Boolean(param2)))
                                 {
                                    break loop25;
                                 }
                                 addr0227:
                                 if(§§pop() <= 0)
                                 {
                                    continue loop0;
                                 }
                                 if(!_loc34_)
                                 {
                                    break loop0;
                                 }
                                 §§push(-_loc19_);
                                 if(_loc35_ && Boolean(param2))
                                 {
                                    break loop24;
                                 }
                                 §§push(_loc18_);
                                 if(_loc35_)
                                 {
                                    break loop5;
                                 }
                                 _loc20_ = §§pop() / §§pop();
                                 §§goto(addr024e);
                              }
                              §§goto(addr0284);
                           }
                           §§goto(addr02b2);
                        }
                        §§push(§§pop() < §§pop());
                        if(!(_loc35_ && Boolean(param3)))
                        {
                           §§push(Boolean(§§pop()));
                        }
                        break loop4;
                     }
                     §§goto(addr02a2);
                  }
                  §§goto(addr02c0);
               }
               §§push(§§pop() + §§pop());
               if(_loc34_)
               {
                  §§push(Number(§§pop()));
               }
               §§goto(addr0321);
            }
            if(§§pop())
            {
               addr02c0:
               addr02a2:
               §§push(_loc5_);
               §§push(_loc8_);
               if(!(_loc35_ && Boolean(param1)))
               {
                  addr02b2:
                  §§push(§§pop() * _loc20_);
               }
               loop6:
               while(true)
               {
                  §§push(§§pop() + §§pop());
                  if(!(_loc35_ && Boolean(param1)))
                  {
                     _loc21_ = §§pop();
                     if(!(_loc34_ || Boolean(param3)))
                     {
                        break loop0;
                     }
                     §§push(_loc6_);
                     §§push(_loc9_ * _loc20_);
                     if(_loc35_ && Boolean(param2))
                     {
                        break;
                     }
                     §§push(§§pop() + §§pop());
                  }
                  addr02f5:
                  while(true)
                  {
                     §§push(Number(§§pop()));
                     if(!_loc35_)
                     {
                        _loc22_ = §§pop();
                        if(!_loc34_)
                        {
                           break loop0;
                        }
                        §§push(_loc7_);
                        if(_loc35_ && Boolean(param3))
                        {
                           break;
                        }
                     }
                     §§push(_loc10_);
                     break loop6;
                  }
                  addr0321:
                  _loc23_ = §§pop();
                  _loc24_ = _loc14_.wrapper;
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
                              if(_loc34_ || Boolean(this))
                              {
                                 loop1:
                                 while(true)
                                 {
                                    if(_loc24_ != null)
                                    {
                                       _loc25_ = _loc24_.vertex;
                                       loop12:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             if(!(_loc35_ && Boolean(param1)))
                                             {
                                                §§push(_loc24_.next);
                                                if(!_loc34_)
                                                {
                                                   break;
                                                }
                                                if(§§pop() == null)
                                                {
                                                   §§push(_loc14_.wrapper.vertex);
                                                   break loop12;
                                                }
                                             }
                                             §§push(_loc24_.next);
                                             break;
                                          }
                                          §§push(§§pop().alternativa3d::vertex);
                                          if(!_loc34_)
                                          {
                                             break;
                                          }
                                          §§goto(addr037d);
                                          §§push(§§pop());
                                       }
                                       addr037d:
                                       _loc26_ = §§pop();
                                       if(_loc35_)
                                       {
                                          break loop10;
                                       }
                                       loop14:
                                       while(true)
                                       {
                                          loop15:
                                          while(true)
                                          {
                                             §§push(_loc26_.x);
                                             if(!_loc35_)
                                             {
                                                §§push(§§pop() - _loc25_.x);
                                                if(!_loc34_)
                                                {
                                                   break loop14;
                                                }
                                                while(true)
                                                {
                                                   §§push(Number(§§pop()));
                                                   if(_loc34_)
                                                   {
                                                      _loc27_ = §§pop();
                                                      if(!(_loc34_ || Boolean(this)))
                                                      {
                                                         break;
                                                      }
                                                      _loc28_ = _loc26_.y - _loc25_.y;
                                                      §§push(_loc26_.z);
                                                      §§push(_loc25_.z);
                                                      if(!(_loc34_ || Boolean(param3)))
                                                      {
                                                         break loop15;
                                                      }
                                                      §§push(§§pop() - §§pop());
                                                   }
                                                   _loc29_ = §§pop();
                                                   break;
                                                }
                                             }
                                             §§push(§§pop() - _loc25_.x);
                                             if(!_loc35_)
                                             {
                                                break loop14;
                                             }
                                             break loop11;
                                          }
                                          _loc31_ = §§pop() - §§pop();
                                          §§push(_loc23_);
                                          if(!_loc34_)
                                          {
                                             break loop9;
                                          }
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(§§pop() - _loc25_.z);
                                                if(_loc34_ || Boolean(param1))
                                                {
                                                   _loc32_ = §§pop();
                                                   if(_loc35_ && Boolean(param3))
                                                   {
                                                      break loop1;
                                                   }
                                                   §§push(_loc32_);
                                                   if(!_loc34_)
                                                   {
                                                      break loop9;
                                                   }
                                                   §§push(§§pop() * _loc28_);
                                                   §§push(_loc31_);
                                                   §§push(_loc29_);
                                                   if(_loc35_ && Boolean(param2))
                                                   {
                                                      break loop18;
                                                   }
                                                   §§push(§§pop() * §§pop());
                                                   if(!_loc34_)
                                                   {
                                                      break loop17;
                                                   }
                                                   §§push(§§pop() - §§pop());
                                                   if(!_loc34_)
                                                   {
                                                      break loop16;
                                                   }
                                                   §§goto(addr045e);
                                                }
                                                §§goto(addr0490);
                                             }
                                             §§goto(addr04ac);
                                          }
                                          §§goto(addr04ab);
                                       }
                                       _loc30_ = §§pop();
                                       if(_loc35_)
                                       {
                                          break;
                                       }
                                       while(true)
                                       {
                                          loop17:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   addr045e:
                                                   §§push(_loc22_);
                                                   if(_loc34_ || Boolean(param1))
                                                   {
                                                      §§push(_loc25_.y);
                                                      break loop15;
                                                   }
                                                   §§push(§§pop() * _loc15_);
                                                   if(_loc34_)
                                                   {
                                                      §§push(_loc30_ * _loc29_);
                                                      break loop17;
                                                   }
                                                   break loop11;
                                                }
                                                §§goto(addr0490);
                                             }
                                             §§goto(addr04a7);
                                          }
                                          addr04a7:
                                          §§push(_loc32_);
                                          §§push(_loc27_);
                                          if(_loc34_)
                                          {
                                             addr04ac:
                                             §§push(§§pop() - §§pop() * §§pop());
                                             if(_loc34_)
                                             {
                                                addr04ab:
                                                §§push(_loc16_);
                                                if(!(_loc35_ && Boolean(param1)))
                                                {
                                                   addr0490:
                                                   §§push(§§pop() + §§pop() * §§pop());
                                                   §§push(_loc31_);
                                                   if(_loc34_ || Boolean(this))
                                                   {
                                                      §§push(§§pop() * _loc27_);
                                                   }
                                                   §§push(_loc30_);
                                                   break loop18;
                                                }
                                                §§push(§§pop() * §§pop());
                                             }
                                             §§push(§§pop() + §§pop());
                                             break;
                                          }
                                          §§goto(addr04ab);
                                       }
                                       if(§§pop() < 0)
                                       {
                                          if(!(_loc35_ && Boolean(param3)))
                                          {
                                             break;
                                          }
                                          break loop8;
                                       }
                                       continue;
                                    }
                                    _loc24_ = _loc24_.next;
                                 }
                              }
                              if(_loc24_ != null)
                              {
                                 continue loop0;
                              }
                              if(_loc20_ >= _loc13_)
                              {
                                 continue loop0;
                              }
                              while(true)
                              {
                                 if(!(_loc35_ && Boolean(this)))
                                 {
                                    §§push(_loc20_);
                                    break loop9;
                                 }
                                 §§goto(addr050b);
                              }
                              §§goto(addr0514);
                           }
                           §§goto(addr04f4);
                        }
                        _loc11_.y = _loc22_;
                        if(_loc34_)
                        {
                           break loop8;
                        }
                        §§goto(addr053a);
                     }
                     addr04f4:
                     _loc13_ = Number(§§pop());
                     if(_loc34_ || Boolean(this))
                     {
                        if(_loc11_ == null)
                        {
                           addr050b:
                           _loc11_ = new Vector3D();
                        }
                        addr0514:
                        _loc11_.x = _loc21_;
                        if(!(_loc35_ && Boolean(this)))
                        {
                           break loop10;
                        }
                        break;
                     }
                     break loop10;
                  }
                  _loc11_.z = _loc23_;
                  addr053a:
                  _loc12_ = _loc14_;
                  continue loop0;
               }
               §§push(§§pop() * _loc20_);
               break loop5;
            }
         }
         if(_loc11_ != null)
         {
            _loc33_ = new RayIntersectionData();
            while(true)
            {
               if(_loc34_ || Boolean(param3))
               {
                  _loc33_.object = this;
                  if(_loc34_ || Boolean(this))
                  {
                     _loc33_.face = _loc12_;
                     if(!(_loc34_ || Boolean(this)))
                     {
                        break;
                     }
                  }
               }
               _loc33_.point = _loc11_;
               if(_loc34_)
               {
                  break;
               }
            }
            _loc33_.time = _loc13_;
            if(_loc34_)
            {
               return _loc33_;
            }
         }
         return null;
      }
      
      override public function clone() : Object3D
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         var _loc1_:Mesh = new Mesh();
         if(!_loc2_)
         {
            _loc1_.clonePropertiesFrom(this);
         }
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         var _temp_1:* = true;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = _temp_1;
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Face = null;
         var _loc7_:Vertex = null;
         var _loc8_:Face = null;
         var _loc9_:Wrapper = null;
         var _loc10_:Wrapper = null;
         var _loc11_:Wrapper = null;
         if(!_loc12_)
         {
            super.clonePropertiesFrom(param1);
         }
         var _loc2_:Mesh = param1 as Mesh;
         while(true)
         {
            if(_loc13_)
            {
               this.clipping = _loc2_.clipping;
               if(!_loc12_)
               {
                  this.sorting = _loc2_.sorting;
                  if(_loc12_)
                  {
                     break;
                  }
               }
            }
            this.threshold = _loc2_.threshold;
            break;
         }
         _loc3_ = _loc2_.vertexList;
         loop0:
         for(; _loc3_ != null; _loc4_ = _loc7_,_loc3_ = _loc3_.next)
         {
            _loc7_ = new Vertex();
            while(true)
            {
               if(!(_loc12_ && Boolean(_loc2_)))
               {
                  _loc7_.x = _loc3_.x;
                  if(_loc12_ && Boolean(_loc3_))
                  {
                     break;
                  }
               }
               _loc7_.y = _loc3_.y;
               break;
            }
            _loc7_.z = _loc3_.z;
            while(true)
            {
               if(!_loc12_)
               {
                  _loc7_.u = _loc3_.u;
                  _loc7_.v = _loc3_.v;
                  if(!_loc13_)
                  {
                     continue loop0;
                  }
                  _loc3_.value = _loc7_;
                  if(!(_loc13_ || Boolean(param1)))
                  {
                     break;
                  }
               }
               if(_loc4_ != null)
               {
                  break;
               }
               this.vertexList = _loc7_;
               continue loop0;
            }
            _loc4_.next = _loc7_;
         }
         var _loc6_:Face = _loc2_.faceList;
         if(!(_loc12_ && Boolean(_loc2_)))
         {
            loop1:
            for(; _loc6_ != null; _loc5_ = _loc8_,_loc6_ = _loc6_.next)
            {
               _loc8_ = new Face();
               loop7:
               while(true)
               {
                  while(true)
                  {
                     if(!_loc12_)
                     {
                        _loc8_.material = _loc6_.material;
                        if(!_loc13_)
                        {
                           break;
                        }
                        _loc8_.normalX = _loc6_.normalX;
                        if(!_loc13_)
                        {
                           break;
                        }
                        _loc8_.normalY = _loc6_.normalY;
                        if(!(_loc13_ || Boolean(_loc2_)))
                        {
                           break loop7;
                        }
                     }
                     _loc8_.normalZ = _loc6_.normalZ;
                     if(_loc13_)
                     {
                        break;
                     }
                     break loop7;
                  }
                  _loc8_.offset = _loc6_.offset;
                  break;
               }
               _loc9_ = null;
               _loc10_ = _loc6_.wrapper;
               while(true)
               {
                  if(_loc13_ || Boolean(_loc3_))
                  {
                     for(; _loc10_ != null; _loc9_ = _loc11_,_loc10_ = _loc10_.next)
                     {
                        _loc11_ = new Wrapper();
                        if(_loc13_)
                        {
                           _loc11_.vertex = _loc10_.vertex.value;
                           if(!_loc13_)
                           {
                              continue;
                           }
                           if(_loc9_ == null)
                           {
                              _loc8_.wrapper = _loc11_;
                              continue;
                           }
                           if(_loc12_)
                           {
                              continue;
                           }
                           _loc9_.next = _loc11_;
                           if(!_loc13_)
                           {
                              continue;
                           }
                        }
                     }
                     if(_loc12_)
                     {
                        break;
                     }
                  }
                  if(_loc5_ != null)
                  {
                     if(!_loc12_)
                     {
                        break;
                     }
                     addr021f:
                  }
                  else
                  {
                     this.faceList = _loc8_;
                  }
                  continue loop1;
               }
               _loc5_.next = _loc8_;
               if(!_loc13_)
               {
                  continue;
               }
               §§goto(addr021f);
            }
         }
         _loc3_ = _loc2_.vertexList;
         if(!(_loc12_ && Boolean(this)))
         {
            while(_loc3_ != null)
            {
               _loc3_.value = null;
               if(_loc12_)
               {
                  break;
               }
               _loc3_ = _loc3_.next;
            }
         }
      }
      
      override alternativa3d function draw(param1:Camera3D, param2:Canvas) : void
      {
         §§push(false);
         var _loc8_:Boolean = true;
         var _loc9_:* = §§pop();
         var _loc4_:Vertex = null;
         var _loc5_:* = 0;
         if(this.faceList == null)
         {
            return;
         }
         while(true)
         {
            §§push(this.clipping);
            if(!(_loc9_ && Boolean(param2)))
            {
               if(§§pop() != 0)
               {
                  break;
               }
               §§push(culling & 1);
            }
            if(Boolean(§§pop()))
            {
               return;
            }
            addr0078:
            addr00a7:
            culling = 0;
            if(!(_loc9_ && Boolean(param1)))
            {
               break;
            }
            _loc4_ = this.vertexList;
            while(_loc4_ != null)
            {
               _loc4_.transformId = 0;
               if(!(_loc8_ || Boolean(_loc3_)))
               {
                  break;
               }
               _loc4_ = _loc4_.next;
            }
            var _loc6_:* = §§findproperty(alternativa3d::transformId);
            var _loc7_:Number = _loc6_.alternativa3d::transformId + 1;
            if(_loc8_)
            {
               _loc6_.alternativa3d::transformId = _loc7_;
            }
            if(_loc8_ || Boolean(param1))
            {
               calculateInverseMatrix();
            }
            var _loc3_:Face = this.prepareFaces(param1);
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
                        if(_loc8_ || Boolean(_loc3_))
                        {
                           if(_loc3_ == null)
                           {
                              return;
                           }
                           loop6:
                           while(true)
                           {
                              while(true)
                              {
                                 if(culling > 0)
                                 {
                                    §§push(this.clipping);
                                    if(!(_loc9_ && Boolean(_loc3_)))
                                    {
                                       §§push(1);
                                       if(!_loc9_)
                                       {
                                          while(true)
                                          {
                                             if(§§pop() == §§pop())
                                             {
                                                _loc3_ = param1.cull(_loc3_,culling);
                                                if(!(_loc8_ || Boolean(param2)))
                                                {
                                                   break;
                                                }
                                             }
                                             else
                                             {
                                                _loc3_ = param1.clip(_loc3_,culling);
                                             }
                                             if(_loc3_ == null)
                                             {
                                                if(_loc8_ || Boolean(param2))
                                                {
                                                   break;
                                                }
                                             }
                                          }
                                          return;
                                       }
                                       break loop6;
                                    }
                                    break;
                                 }
                                 if(_loc3_.processNext != null)
                                 {
                                    §§push(this.sorting);
                                    if(_loc9_)
                                    {
                                       break loop3;
                                    }
                                    §§push(1);
                                    if(_loc9_ && Boolean(this))
                                    {
                                       break loop6;
                                    }
                                    if(§§pop() != §§pop())
                                    {
                                       §§push(this.sorting);
                                       if(_loc8_ || Boolean(param1))
                                       {
                                          break;
                                       }
                                       break loop5;
                                    }
                                    if(_loc8_)
                                    {
                                       _loc3_ = param1.sortByAverageZ(_loc3_);
                                    }
                                    else
                                    {
                                       §§goto(addr01bf);
                                    }
                                 }
                                 §§goto(addr01cb);
                              }
                              §§push(2);
                              if(_loc8_ || Boolean(param1))
                              {
                                 break;
                              }
                              break loop4;
                           }
                           if(§§pop() == §§pop())
                           {
                              addr01bf:
                              _loc3_ = param1.sortByDynamicBSP(_loc3_,this.threshold);
                           }
                           addr01cb:
                           if(!param1.debug)
                           {
                              break loop2;
                           }
                        }
                        §§push(param1.checkInDebug(this));
                        if(!(_loc9_ && Boolean(_loc3_)))
                        {
                           break loop3;
                        }
                        break;
                     }
                     §§goto(addr01f8);
                  }
                  if(§§pop() <= §§pop())
                  {
                     break loop2;
                  }
                  if(_loc8_ || Boolean(param1))
                  {
                     this.drawDebug(param1,param2.getChildCanvas(true,false),_loc3_,_loc5_);
                     if(!(_loc9_ && Boolean(param1)))
                     {
                        break loop2;
                     }
                  }
                  §§goto(addr0251);
               }
               addr01f8:
               §§push(int(§§pop()));
               if(!(_loc9_ && Boolean(param2)))
               {
                  _loc5_ = §§pop();
                  §§push(_loc5_);
               }
               §§push(0);
               break loop4;
            }
            this.drawFaces(param1,param2.getChildCanvas(true,false,this,alpha,blendMode,colorTransform,filters),_loc3_);
            addr0251:
            return;
         }
         if(transformId > 500000000)
         {
            if(!_loc9_)
            {
               transformId = 0;
            }
            §§goto(addr0078);
         }
         §§goto(addr00a7);
      }
      
      override alternativa3d function getVG(param1:Camera3D) : VG
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         var _loc3_:Vertex = null;
         loop1:
         while(true)
         {
            if(_loc7_ || Boolean(this))
            {
               if(this.faceList == null)
               {
                  if(!_loc6_)
                  {
                     return null;
                  }
               }
               if(transformId <= 500000000)
               {
                  break;
               }
               if(_loc7_)
               {
                  transformId = 0;
               }
            }
            _loc3_ = this.vertexList;
            while(true)
            {
               if(_loc3_ == null)
               {
                  break loop1;
               }
               _loc3_.transformId = 0;
               if(!(_loc7_ || Boolean(this)))
               {
                  break loop1;
               }
               _loc3_ = _loc3_.next;
            }
            break;
         }
         var _loc4_:* = §§findproperty(alternativa3d::transformId);
         var _loc5_:Number = _loc4_.alternativa3d::transformId + 1;
         if(_loc7_ || Boolean(_loc2_))
         {
            _loc4_.alternativa3d::transformId = _loc5_;
         }
         while(true)
         {
            if(_loc7_)
            {
               loop3:
               while(true)
               {
                  while(true)
                  {
                     §§push(this.clipping);
                     if(!(_loc6_ && Boolean(param1)))
                     {
                        if(§§pop() != 0)
                        {
                           break;
                        }
                        if(!_loc7_)
                        {
                           break loop3;
                        }
                        §§push(culling & 1);
                     }
                     if(Boolean(§§pop()))
                     {
                        if(!_loc6_)
                        {
                           return null;
                        }
                     }
                     break loop3;
                  }
               }
               culling = 0;
               if(!_loc6_)
               {
                  break loop4;
               }
               break;
            }
            calculateInverseMatrix();
            break;
         }
         var _loc2_:Face = this.prepareFaces(param1);
         loop5:
         while(true)
         {
            while(true)
            {
               if(!(_loc6_ && Boolean(_loc2_)))
               {
                  if(_loc2_ == null)
                  {
                     if(!(_loc6_ && Boolean(_loc2_)))
                     {
                        return null;
                     }
                     break;
                  }
               }
               if(culling > 0)
               {
                  if(!_loc6_)
                  {
                     if(this.clipping == 1)
                     {
                        break;
                     }
                     addr0173:
                     _loc2_ = param1.clip(_loc2_,culling);
                     if(_loc2_ == null)
                     {
                        if(_loc7_ || Boolean(param1))
                        {
                           return null;
                        }
                     }
                     break loop5;
                  }
                  break;
               }
               break loop5;
            }
            _loc2_ = param1.cull(_loc2_,culling);
            if(!(_loc7_ || Boolean(_loc3_)))
            {
               break;
            }
            §§goto(addr0173);
         }
         loop7:
         while(true)
         {
            while(true)
            {
               §§push(VG);
               §§push(this);
               §§push(_loc2_);
               §§push(this.sorting);
               if(_loc7_ || Boolean(_loc3_))
               {
                  if(!param1.debug)
                  {
                     §§push(0);
                     if(_loc7_)
                     {
                        break;
                     }
                     break loop7;
                  }
               }
               §§push(param1.checkInDebug(this));
               if(_loc7_)
               {
                  §§push(int(§§pop()));
                  if(_loc7_)
                  {
                     break loop7;
                  }
                  break;
               }
               break loop7;
            }
            §§push(int(§§pop()));
            break;
         }
         return §§pop().alternativa3d::create(§§pop(),§§pop(),§§pop(),§§pop(),false);
      }
      
      alternativa3d function prepareFaces(param1:Camera3D) : Face
      {
         var _temp_1:* = true;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = _temp_1;
         var _loc2_:Face = null;
         var _loc3_:Face = null;
         var _loc5_:Wrapper = null;
         var _loc6_:Vertex = null;
         var _loc7_:* = NaN;
         var _loc8_:* = NaN;
         var _loc9_:* = NaN;
         var _loc4_:Face = this.faceList;
         loop0:
         while(true)
         {
            if(_loc4_ == null)
            {
               if(_loc11_)
               {
                  if(_loc3_ != null)
                  {
                     if(!(_loc10_ && Boolean(param1)))
                     {
                        _loc3_.processNext = null;
                     }
                  }
               }
               break;
            }
            loop2:
            while(true)
            {
               §§push(_loc4_.normalX);
               if(!_loc10_)
               {
                  §§push(§§pop() * imd);
                  if(_loc10_ && Boolean(param1))
                  {
                     break;
                  }
               }
               while(true)
               {
                  §§push(_loc4_.normalY);
                  if(_loc11_ || Boolean(_loc2_))
                  {
                     §§push(§§pop() * imh);
                     if(_loc11_ || Boolean(_loc2_))
                     {
                        §§push(§§pop() + §§pop());
                        if(!_loc10_)
                        {
                           break loop2;
                        }
                        addr00a1:
                        §§push(_loc4_.offset);
                     }
                     break;
                  }
                  addr00a0:
                  §§goto(addr00a1);
               }
               addr00a5:
               if(§§pop() > §§pop())
               {
                  if(_loc10_)
                  {
                     break loop0;
                  }
                  _loc5_ = _loc4_.wrapper;
                  while(true)
                  {
                     if(!_loc10_)
                     {
                        loop1:
                        for(; _loc5_ != null; _loc5_ = _loc5_.next)
                        {
                           _loc6_ = _loc5_.vertex;
                           if(_loc11_)
                           {
                              if(_loc6_.transformId != transformId)
                              {
                                 if(!(_loc10_ && Boolean(_loc3_)))
                                 {
                                    loop5:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc6_.x);
                                          if(_loc11_ || Boolean(_loc3_))
                                          {
                                             §§push(Number(§§pop()));
                                             if(_loc10_ && Boolean(_loc3_))
                                             {
                                                break loop5;
                                             }
                                             _loc7_ = §§pop();
                                             if(_loc10_ && Boolean(_loc3_))
                                             {
                                                continue loop1;
                                             }
                                             §§push(_loc6_.y);
                                             if(!_loc11_)
                                             {
                                                break;
                                             }
                                             §§push(Number(§§pop()));
                                             if(!_loc11_)
                                             {
                                                break loop5;
                                             }
                                          }
                                          _loc8_ = §§pop();
                                          §§push(_loc6_.z);
                                          if(!_loc10_)
                                          {
                                             break loop5;
                                          }
                                          break;
                                       }
                                       _loc9_ = §§pop();
                                       §§push(_loc6_);
                                       §§push(ma * _loc7_);
                                       if(!(_loc10_ && Boolean(this)))
                                       {
                                          while(true)
                                          {
                                             §§push(mb * _loc8_);
                                             if(_loc11_ || Boolean(_loc2_))
                                             {
                                                §§push(§§pop() + §§pop());
                                                if(_loc10_ && Boolean(this))
                                                {
                                                   break;
                                                }
                                                §§push(mc * _loc9_);
                                             }
                                             §§push(§§pop() + §§pop());
                                             break;
                                          }
                                       }
                                       §§pop().alternativa3d::cameraX = §§pop() + md;
                                       loop8:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc6_);
                                             §§push(me * _loc7_);
                                             if(!(_loc10_ && Boolean(_loc2_)))
                                             {
                                                §§push(mf * _loc8_);
                                                if(!(_loc11_ || Boolean(_loc3_)))
                                                {
                                                   break;
                                                }
                                                §§push(§§pop() + §§pop());
                                                if(_loc10_ && Boolean(_loc3_))
                                                {
                                                   break loop8;
                                                }
                                             }
                                             §§push(mg * _loc9_);
                                             break;
                                          }
                                          §§push(§§pop() + §§pop());
                                          break;
                                       }
                                       §§pop().alternativa3d::cameraY = §§pop() + mh;
                                       if(_loc11_ || Boolean(_loc2_))
                                       {
                                          loop10:
                                          while(true)
                                          {
                                             while(true)
                                             {
                                                §§push(_loc6_);
                                                §§push(mi * _loc7_);
                                                if(!_loc10_)
                                                {
                                                   §§push(mj * _loc8_);
                                                   if(_loc10_ && Boolean(_loc3_))
                                                   {
                                                      break;
                                                   }
                                                   §§push(§§pop() + §§pop());
                                                   if(!(_loc11_ || Boolean(param1)))
                                                   {
                                                      break loop10;
                                                   }
                                                }
                                                §§push(mk * _loc9_);
                                                break;
                                             }
                                             §§push(§§pop() + §§pop());
                                             break;
                                          }
                                          §§pop().alternativa3d::cameraZ = §§pop() + ml;
                                          _loc6_.transformId = transformId;
                                       }
                                    }
                                    §§push(Number(§§pop()));
                                    break loop6;
                                 }
                                 _loc6_.drawId = 0;
                              }
                           }
                        }
                        if(_loc11_ || Boolean(_loc2_))
                        {
                           if(_loc2_ == null)
                           {
                              _loc2_ = _loc4_;
                              break;
                           }
                           if(_loc11_ || Boolean(this))
                           {
                              _loc3_.processNext = _loc4_;
                           }
                        }
                     }
                     break;
                  }
                  _loc3_ = _loc4_;
               }
               continue loop0;
            }
            while(true)
            {
               §§push(_loc4_.normalZ);
               if(_loc11_)
               {
                  §§push(§§pop() * iml);
                  if(_loc10_ && Boolean(_loc3_))
                  {
                     break;
                  }
               }
               §§goto(addr00a0);
            }
            §§goto(addr00a5);
            §§push(§§pop() + §§pop());
            _loc4_ = _loc4_.next;
         }
         return _loc2_;
      }
      
      alternativa3d function drawDebug(param1:Camera3D, param2:Canvas, param3:Face, param4:int) : void
      {
         §§push(false);
         var _loc5_:Boolean = true;
         var _loc6_:* = §§pop();
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
                     while(true)
                     {
                        if(_loc5_)
                        {
                           §§push(param4);
                           if(!_loc5_)
                           {
                              break;
                           }
                           §§push(Debug.EDGES);
                           if(!(_loc5_ || Boolean(this)))
                           {
                              break loop3;
                           }
                           §§push(§§pop() & §§pop());
                           if(!_loc5_)
                           {
                              break loop2;
                           }
                           §§push(Boolean(§§pop()));
                           if(!_loc5_)
                           {
                              break loop1;
                           }
                           if(§§pop())
                           {
                              if(_loc5_)
                              {
                                 Debug.drawEdges(param1,param2,param3,16777215);
                                 if(!(_loc5_ || Boolean(param2)))
                                 {
                                    break loop0;
                                 }
                              }
                           }
                        }
                        §§push(param4);
                        if(!_loc6_)
                        {
                           break loop2;
                        }
                        break;
                     }
                     §§push(Boolean(§§pop()));
                     break loop1;
                  }
                  §§push(§§pop() & §§pop());
                  break loop4;
               }
               §§push(Debug.BOUNDS);
               break loop3;
            }
            if(§§pop())
            {
               if(_loc5_)
               {
                  break;
               }
            }
            §§goto(addr00b8);
         }
         Debug.drawBounds(param1,param2,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
         addr00b8:
      }
      
      alternativa3d function drawFaces(param1:Camera3D, param2:Canvas, param3:Face) : void
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         var _loc5_:Face = null;
         var _loc4_:Face = param3;
         while(_loc4_ != null)
         {
            _loc5_ = _loc4_.processNext;
            loop2:
            while(true)
            {
               loop3:
               while(true)
               {
                  while(true)
                  {
                     §§push(_loc5_ == null);
                     if(!(_loc6_ && Boolean(param3)))
                     {
                        §§push(Boolean(§§pop()));
                        if(_loc6_)
                        {
                           break;
                        }
                        var _temp_6:* = §§pop();
                        §§push(_temp_6);
                        §§push(_temp_6);
                        if(!_loc6_)
                        {
                           §§push(Boolean(§§pop()));
                        }
                        if(§§pop())
                        {
                           break;
                        }
                        if(_loc6_ && Boolean(param3))
                        {
                           break;
                        }
                        §§pop();
                        §§push(_loc5_.material);
                        if(!_loc7_)
                        {
                           break loop3;
                        }
                        §§push(§§pop() == param3.material);
                        if(_loc6_ && Boolean(param3))
                        {
                           break loop2;
                        }
                     }
                     §§push(!§§pop());
                     if(_loc7_ || Boolean(param1))
                     {
                        break loop2;
                     }
                     break;
                  }
                  §§goto(addr0094);
               }
               if(§§pop() != null)
               {
                  if(!(_loc6_ && Boolean(param1)))
                  {
                     §§goto(addr00ca);
                     §§push(param3.material);
                  }
                  §§goto(addr00d5);
               }
               else
               {
                  while(param3 != null)
                  {
                     _loc4_ = param3.processNext;
                     if(_loc7_ || Boolean(param2))
                     {
                        param3.processNext = null;
                     }
                     param3 = _loc4_;
                  }
               }
               §§goto(addr010c);
            }
            addr0094:
            if(Boolean(§§pop()))
            {
               _loc4_.processNext = null;
               if(!(_loc6_ && Boolean(this)))
               {
                  while(true)
                  {
                     §§push(param3.material);
                     if(!_loc6_)
                     {
                        break loop3;
                     }
                     addr00ca:
                     §§pop().alternativa3d::draw(param1,param2,param3,ml);
                     break;
                  }
                  addr00d5:
               }
               addr010c:
               param3 = _loc5_;
            }
            _loc4_ = _loc5_;
         }
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         var _loc3_:Vertex = this.vertexList;
         loop0:
         for(; _loc3_ != null; _loc3_ = _loc3_.next)
         {
            while(true)
            {
               loop2:
               while(true)
               {
                  while(true)
                  {
                     if(param2 != null)
                     {
                        loop8:
                        while(true)
                        {
                           loop9:
                           while(true)
                           {
                              loop19:
                              while(true)
                              {
                                 §§push(_loc3_);
                                 §§push(param2.ma);
                                 if(_loc4_)
                                 {
                                    loop20:
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc3_.x);
                                          if(!(_loc5_ && Boolean(param1)))
                                          {
                                             §§push(§§pop() * §§pop());
                                             if(_loc5_ && Boolean(param2))
                                             {
                                                break;
                                             }
                                             §§push(param2.mb);
                                             if(!(_loc4_ || Boolean(_loc3_)))
                                             {
                                                break loop20;
                                             }
                                          }
                                          §§push(_loc3_.y);
                                          if(!(_loc5_ && Boolean(this)))
                                          {
                                             §§push(§§pop() * §§pop());
                                             if(_loc4_)
                                             {
                                                break loop20;
                                             }
                                             break loop9;
                                          }
                                          break loop19;
                                       }
                                    }
                                    §§push(§§pop() + §§pop());
                                    if(_loc4_ || Boolean(param2))
                                    {
                                       break loop21;
                                    }
                                    break loop8;
                                 }
                                 §§push(param2.mc);
                                 if(!_loc5_)
                                 {
                                    break loop9;
                                 }
                                 addr0098:
                                 §§push(§§pop() + §§pop());
                                 if(!_loc5_)
                                 {
                                    addr00a2:
                                    §§push(§§pop() + param2.md);
                                 }
                                 break loop8;
                              }
                              §§push(§§pop() * §§pop());
                              if(_loc4_)
                              {
                                 §§goto(addr0098);
                              }
                              §§goto(addr00a2);
                           }
                           §§push(_loc3_.z);
                           break loop19;
                        }
                        §§pop().alternativa3d::cameraX = §§pop();
                        loop10:
                        while(true)
                        {
                           loop11:
                           while(true)
                           {
                              §§push(_loc3_);
                              §§push(param2.me);
                              if(!(_loc5_ && Boolean(param1)))
                              {
                                 §§push(_loc3_.x);
                                 if(_loc5_)
                                 {
                                    break;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(!_loc4_)
                                 {
                                    break loop10;
                                 }
                              }
                              loop17:
                              while(true)
                              {
                                 §§push(param2.mf);
                                 if(_loc4_)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc3_.y);
                                       if(!_loc5_)
                                       {
                                          §§push(§§pop() * §§pop());
                                          if(!(_loc4_ || Boolean(_loc3_)))
                                          {
                                             break;
                                          }
                                          §§push(§§pop() + §§pop());
                                          if(!_loc4_)
                                          {
                                             break loop17;
                                          }
                                          §§push(param2.mg);
                                          if(!(_loc4_ || Boolean(param1)))
                                          {
                                             break loop11;
                                          }
                                          §§push(_loc3_.z);
                                       }
                                       §§push(§§pop() * §§pop());
                                       if(_loc4_)
                                       {
                                          break loop11;
                                       }
                                       break;
                                    }
                                 }
                                 §§goto(addr0114);
                              }
                              §§goto(addr0115);
                           }
                           §§push(§§pop() + §§pop());
                           if(_loc4_)
                           {
                              break;
                           }
                           §§goto(addr0115);
                        }
                        addr0115:
                        §§pop().alternativa3d::cameraY = §§pop() + param2.mh;
                        addr0114:
                        if(!(_loc5_ && Boolean(param2)))
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
                                       while(true)
                                       {
                                          §§push(_loc3_);
                                          §§push(param2.mi);
                                          if(_loc4_)
                                          {
                                             §§push(_loc3_.x);
                                             if(_loc4_ || Boolean(param2))
                                             {
                                                §§push(§§pop() * §§pop());
                                                if(_loc5_)
                                                {
                                                   break;
                                                }
                                                §§push(param2.mj);
                                                if(!_loc4_)
                                                {
                                                   break loop15;
                                                }
                                                §§push(_loc3_.y);
                                                if(_loc5_ && Boolean(param1))
                                                {
                                                   break loop14;
                                                }
                                                §§push(§§pop() * §§pop());
                                                if(_loc5_)
                                                {
                                                   break loop13;
                                                }
                                             }
                                             §§push(§§pop() + §§pop());
                                             if(_loc5_ && Boolean(this))
                                             {
                                                break loop12;
                                             }
                                          }
                                          §§push(param2.mk);
                                          if(_loc4_)
                                          {
                                             break loop15;
                                          }
                                          §§goto(addr01a6);
                                       }
                                       §§goto(addr01a3);
                                    }
                                    §§push(_loc3_.z);
                                    break;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(_loc4_)
                                 {
                                    break;
                                 }
                                 §§goto(addr01a6);
                              }
                              §§push(§§pop() + §§pop());
                              if(!(_loc5_ && Boolean(param1)))
                              {
                                 addr01a6:
                                 addr01a3:
                                 §§push(§§pop() + param2.ml);
                              }
                              break;
                           }
                           §§pop().alternativa3d::cameraZ = §§pop();
                        }
                        else
                        {
                           addr01bf:
                           _loc3_.cameraZ = _loc3_.z;
                        }
                        §§push(_loc3_.cameraX);
                        if(_loc4_ || Boolean(this))
                        {
                           §§push(param1.boundMinX);
                           if(!(_loc4_ || Boolean(this)))
                           {
                              break loop4;
                           }
                           if(§§pop() >= §§pop())
                           {
                              break loop2;
                           }
                           if(!_loc4_)
                           {
                              continue loop5;
                           }
                        }
                        else
                        {
                           §§goto(addr024e);
                        }
                     }
                     else
                     {
                        _loc3_.cameraX = _loc3_.x;
                        if(_loc4_)
                        {
                           _loc3_.cameraY = _loc3_.y;
                           §§goto(addr01bf);
                        }
                     }
                     param1.boundMinX = _loc3_.cameraX;
                     if(!_loc5_)
                     {
                        break loop2;
                     }
                     break;
                  }
                  §§goto(addr0269);
               }
               §§push(_loc3_.cameraX);
               if(_loc5_)
               {
                  break loop3;
               }
               §§push(param1.boundMaxX);
               if(!(_loc4_ || Boolean(param1)))
               {
                  break loop5;
               }
               if(§§pop() > §§pop())
               {
                  param1.boundMaxX = _loc3_.cameraX;
               }
               continue loop5;
            }
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
                        §§push(_loc3_.cameraY);
                        if(!_loc5_)
                        {
                           §§push(param1.boundMinY);
                           if(!_loc4_)
                           {
                              break loop5;
                           }
                           if(§§pop() < §§pop())
                           {
                              param1.boundMinY = _loc3_.cameraY;
                           }
                           §§push(_loc3_.cameraY);
                           if(!(_loc4_ || Boolean(param2)))
                           {
                              break loop3;
                           }
                           §§push(param1.boundMaxY);
                           if(_loc5_ && Boolean(this))
                           {
                              break loop4;
                           }
                           if(§§pop() > §§pop())
                           {
                              if(_loc5_)
                              {
                                 break;
                              }
                              param1.boundMaxY = _loc3_.cameraY;
                           }
                           §§push(_loc3_.cameraZ);
                           if(_loc5_ && Boolean(param1))
                           {
                              break loop3;
                           }
                        }
                        §§push(param1.boundMinZ);
                        if(_loc4_ || Boolean(this))
                        {
                           break loop5;
                        }
                        break loop4;
                     }
                     §§goto(addr02b9);
                  }
                  if(§§pop() < §§pop())
                  {
                     param1.boundMinZ = _loc3_.cameraZ;
                     if(_loc5_)
                     {
                        continue loop0;
                     }
                  }
                  §§push(_loc3_.cameraZ);
                  break loop3;
               }
               if(§§pop() > §§pop())
               {
                  if(!(_loc5_ && Boolean(param2)))
                  {
                     addr02b9:
                     param1.boundMaxZ = _loc3_.cameraZ;
                     if(!_loc4_)
                     {
                        break loop0;
                     }
                  }
               }
               continue loop0;
            }
            §§push(param1.boundMaxZ);
            break loop4;
         }
      }
      
      override alternativa3d function split(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Number) : Vector.<Object3D>
      {
         §§push(false);
         var _loc33_:Boolean = true;
         var _loc34_:* = §§pop();
         var _loc9_:Vertex = null;
         var _loc10_:Vertex = null;
         var _loc14_:Face = null;
         var _loc15_:Face = null;
         var _loc17_:Face = null;
         var _loc18_:Wrapper = null;
         var _loc19_:Vertex = null;
         var _loc20_:Vertex = null;
         var _loc21_:Vertex = null;
         var _loc22_:* = false;
         var _loc23_:* = false;
         var _loc24_:Face = null;
         var _loc25_:Face = null;
         var _loc26_:Wrapper = null;
         var _loc27_:Wrapper = null;
         var _loc28_:Wrapper = null;
         var _loc29_:* = NaN;
         var _loc30_:Vertex = null;
         var _loc5_:Vector.<Object3D> = new Vector.<Object3D>(2);
         var _loc6_:Vector3D = calculatePlane(param1,param2,param3);
         §§push(_loc6_.w - param4);
         if(_loc33_)
         {
            §§push(Number(§§pop()));
         }
         var _loc7_:* = §§pop();
         var _loc8_:Number = _loc6_.w + param4;
         _loc9_ = this.vertexList;
         loop0:
         for(; _loc9_ != null; _loc9_ = _loc10_)
         {
            _loc10_ = _loc9_.next;
            _loc9_.next = null;
            loop7:
            while(true)
            {
               §§push(_loc9_);
               §§push(_loc9_.x);
               if(_loc33_)
               {
                  §§push(§§pop() * _loc6_.x);
                  if(!_loc33_)
                  {
                     break;
                  }
               }
               while(true)
               {
                  §§push(_loc9_.y);
                  if(_loc33_ || Boolean(param2))
                  {
                     §§push(§§pop() * _loc6_.y);
                     if(!(_loc33_ || Boolean(param3)))
                     {
                        break;
                     }
                  }
                  §§push(§§pop() + §§pop());
                  if(_loc33_)
                  {
                     break loop7;
                  }
                  addr010a:
                  §§pop().alternativa3d::offset = §§pop();
                  loop9:
                  while(true)
                  {
                     loop10:
                     while(true)
                     {
                        loop11:
                        while(true)
                        {
                           if(!(_loc34_ && Boolean(param2)))
                           {
                              loop12:
                              while(true)
                              {
                                 loop13:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc9_.offset);
                                       if(!_loc34_)
                                       {
                                          §§push(_loc7_);
                                          if(_loc34_)
                                          {
                                             break;
                                          }
                                          §§push(§§pop() >= §§pop());
                                          if(!_loc34_)
                                          {
                                             §§push(Boolean(§§pop()));
                                             if(!(_loc33_ || Boolean(param3)))
                                             {
                                                break loop13;
                                             }
                                          }
                                          var _temp_8:* = §§pop();
                                          §§push(_temp_8);
                                          §§push(_temp_8);
                                          if(_loc33_ || Boolean(param2))
                                          {
                                             §§push(Boolean(§§pop()));
                                          }
                                          if(!§§pop())
                                          {
                                             break loop13;
                                          }
                                          if(_loc34_)
                                          {
                                             break loop12;
                                          }
                                          §§pop();
                                          §§push(_loc9_.offset);
                                       }
                                       §§push(_loc8_);
                                       break;
                                    }
                                    §§push(§§pop() <= §§pop());
                                    if(!(_loc34_ && Boolean(this)))
                                    {
                                       break loop12;
                                    }
                                    break;
                                 }
                                 if(!§§pop())
                                 {
                                    break loop11;
                                 }
                                 _loc9_.value = new Vertex();
                                 if(_loc33_ || Boolean(param2))
                                 {
                                    while(true)
                                    {
                                       §§push(_loc9_.value);
                                       if(!_loc34_)
                                       {
                                          §§push(_loc9_.x);
                                          if(_loc34_)
                                          {
                                             break;
                                          }
                                          §§pop().x = §§pop();
                                          §§push(_loc9_.value);
                                          if(!_loc33_)
                                          {
                                             break loop10;
                                          }
                                       }
                                       §§push(_loc9_.y);
                                       if(!(_loc34_ && Boolean(this)))
                                       {
                                          break;
                                       }
                                       addr01dc:
                                       §§pop().z = §§pop();
                                    }
                                    §§pop().y = §§pop();
                                    if(_loc34_)
                                    {
                                       break loop11;
                                    }
                                    §§push(_loc9_.value);
                                    if(_loc34_)
                                    {
                                       break loop10;
                                    }
                                    §§push(_loc9_.z);
                                    if(_loc34_)
                                    {
                                       break loop9;
                                    }
                                    §§goto(addr01dc);
                                 }
                              }
                              §§push(Boolean(§§pop()));
                              break loop13;
                           }
                           §§push(_loc9_.value);
                           if(_loc34_ && Boolean(this))
                           {
                              break loop10;
                           }
                           §§push(_loc9_.u);
                           if(_loc33_ || Boolean(param2))
                           {
                              break loop9;
                           }
                           §§goto(addr020c);
                        }
                        _loc9_.transformId = 0;
                        continue loop0;
                     }
                     addr020c:
                     §§pop().v = _loc9_.v;
                     if(_loc33_ || Boolean(this))
                     {
                        break loop11;
                     }
                     continue loop0;
                  }
                  §§pop().u = §§pop();
                  §§push(_loc9_.value);
                  break loop10;
               }
               addr0104:
               addr0109:
               §§goto(addr010a);
            }
            §§push(_loc9_.z);
            if(!_loc34_)
            {
               §§goto(addr0104);
            }
            §§goto(addr0109);
         }
         if(_loc33_ || Boolean(param1))
         {
            this.vertexList = null;
         }
         var _loc11_:Face = this.faceList;
         if(_loc33_)
         {
            this.faceList = null;
         }
         var _loc12_:Mesh = this.clone() as Mesh;
         var _loc13_:Mesh = this.clone() as Mesh;
         var _loc16_:Face = _loc11_;
         loop1:
         for(; _loc16_ != null; _loc16_ = _loc17_)
         {
            _loc17_ = _loc16_.next;
            _loc18_ = _loc16_.wrapper;
            _loc19_ = _loc18_.vertex;
            _loc18_ = _loc18_.next;
            _loc20_ = _loc18_.vertex;
            _loc18_ = _loc18_.next;
            _loc21_ = _loc18_.vertex;
            loop16:
            while(true)
            {
               while(true)
               {
                  loop58:
                  while(true)
                  {
                     loop62:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc19_.offset);
                           if(!(_loc34_ && Boolean(param1)))
                           {
                              §§push(_loc7_);
                              if(!(_loc34_ && Boolean(param3)))
                              {
                                 §§push(§§pop() < §§pop());
                                 if(!(_loc33_ || Boolean(param2)))
                                 {
                                    break loop58;
                                 }
                                 var _temp_87:* = §§pop();
                                 §§push(_temp_87);
                                 if(Boolean(_temp_87))
                                 {
                                    continue loop59;
                                 }
                                 §§pop();
                                 §§push(_loc20_.offset);
                                 if(!(_loc33_ || Boolean(this)))
                                 {
                                    break loop16;
                                 }
                              }
                              else
                              {
                                 §§goto(addr0339);
                              }
                           }
                           §§push(_loc7_);
                           if(_loc34_)
                           {
                              break loop62;
                           }
                           §§push(§§pop() < §§pop());
                           if(_loc34_ && Boolean(param2))
                           {
                              break;
                           }
                           §§push(Boolean(§§pop()));
                           continue loop59;
                        }
                        §§goto(addr037b);
                     }
                     §§goto(addr03b9);
                  }
                  §§goto(addr03e1);
               }
               var _temp_77:* = §§pop();
               loop59:
               while(true)
               {
                  loop60:
                  while(true)
                  {
                     §§push(_temp_77);
                     if(!Boolean(_temp_77))
                     {
                        if(!(_loc33_ || Boolean(param3)))
                        {
                           break loop58;
                        }
                        §§pop();
                        §§push(_loc21_.offset);
                        if(_loc34_)
                        {
                           break;
                        }
                        §§push(_loc7_);
                        if(!_loc33_)
                        {
                           break loop59;
                        }
                        §§push(§§pop() < §§pop());
                     }
                     §§push(Boolean(§§pop()));
                     if(!_loc34_)
                     {
                        _loc22_ = §§pop();
                        if(_loc34_ && Boolean(param3))
                        {
                           break loop18;
                        }
                        §§push(_loc19_.offset);
                        if(_loc34_)
                        {
                           break;
                        }
                        while(true)
                        {
                           §§push(_loc8_);
                           if(!(_loc34_ && Boolean(this)))
                           {
                              §§push(§§pop() > §§pop());
                              if(!(_loc34_ && Boolean(param2)))
                              {
                                 addr037b:
                                 §§push(Boolean(§§pop()));
                                 if(!_loc34_)
                                 {
                                    var _temp_82:* = §§pop();
                                    §§push(_temp_82);
                                    if(Boolean(_temp_82))
                                    {
                                       §§goto(addr03c7);
                                    }
                                 }
                                 addr0388:
                                 §§pop();
                                 if(!(_loc34_ && Boolean(this)))
                                 {
                                    §§push(_loc20_.offset);
                                    if(!(_loc34_ && Boolean(param2)))
                                    {
                                       break loop16;
                                    }
                                    break loop60;
                                 }
                                 break loop18;
                              }
                           }
                           else
                           {
                              §§goto(addr03b9);
                           }
                           §§goto(addr03c7);
                        }
                        §§goto(addr03fd);
                     }
                     §§goto(addr0388);
                  }
                  §§goto(addr03ec);
               }
               §§goto(addr03ee);
            }
            loop18:
            while(true)
            {
               loop19:
               while(true)
               {
                  loop56:
                  while(true)
                  {
                     while(true)
                     {
                        §§push(_loc8_);
                        if(_loc33_ || Boolean(this))
                        {
                           addr03b9:
                           §§push(§§pop() > §§pop());
                           if(_loc34_)
                           {
                              break;
                           }
                           §§push(Boolean(§§pop()));
                           if(!_loc33_)
                           {
                              break;
                           }
                           var _temp_74:* = §§pop();
                           §§push(_temp_74);
                           §§push(_temp_74);
                           if(_loc33_)
                           {
                              §§push(Boolean(§§pop()));
                           }
                           if(§§pop())
                           {
                              break loop56;
                           }
                           if(_loc34_ && Boolean(this))
                           {
                              break loop19;
                           }
                           §§pop();
                           if(!_loc33_)
                           {
                              break loop18;
                           }
                           §§push(_loc21_.offset);
                           §§push(_loc8_);
                        }
                        addr03ee:
                        §§push(§§pop() > §§pop());
                        if(_loc33_ || Boolean(param1))
                        {
                           break;
                        }
                        break loop19;
                     }
                     addr03fd:
                     §§push(Boolean(§§pop()));
                     if(!_loc34_)
                     {
                        break;
                     }
                     break loop19;
                  }
                  §§push(Boolean(§§pop()));
                  break;
               }
               _loc23_ = §§pop();
               break;
            }
            _loc18_ = _loc18_.next;
            loop2:
            for(; _loc18_ != null; _loc18_ = _loc18_.next)
            {
               _loc9_ = _loc18_.vertex;
               if(!(_loc34_ && Boolean(param1)))
               {
                  loop20:
                  while(true)
                  {
                     loop21:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc9_.offset);
                           if(_loc33_ || Boolean(param1))
                           {
                              §§push(_loc7_);
                              if(_loc34_)
                              {
                                 break;
                              }
                              if(§§pop() < §§pop())
                              {
                                 if(!_loc34_)
                                 {
                                    §§push(true);
                                    if(!(_loc33_ || Boolean(param2)))
                                    {
                                       break loop21;
                                    }
                                    §§push(Boolean(§§pop()));
                                    if(!_loc33_)
                                    {
                                       break loop20;
                                    }
                                    _loc22_ = §§pop();
                                    if(_loc34_ && Boolean(this))
                                    {
                                       continue loop2;
                                    }
                                 }
                                 continue loop2;
                              }
                              §§push(_loc9_.offset);
                           }
                           §§push(_loc8_);
                           break;
                        }
                        if(§§pop() > §§pop())
                        {
                           if(!_loc34_)
                           {
                              §§push(true);
                              if(!_loc34_)
                              {
                                 break;
                              }
                              break loop20;
                           }
                        }
                        continue loop2;
                     }
                     §§push(Boolean(§§pop()));
                     break;
                  }
                  _loc23_ = §§pop();
               }
            }
            loop23:
            while(true)
            {
               if(_loc33_)
               {
                  while(true)
                  {
                     §§push(_loc22_);
                     if(!(_loc34_ && Boolean(param3)))
                     {
                        §§push(!§§pop());
                        if(!(_loc33_ || Boolean(this)))
                        {
                           break;
                        }
                     }
                     if(§§pop())
                     {
                        if(_loc33_ || Boolean(param1))
                        {
                           if(_loc15_ != null)
                           {
                              _loc15_.next = _loc16_;
                              if(!(_loc34_ && Boolean(this)))
                              {
                                 addr04f3:
                              }
                              break loop23;
                           }
                           _loc13_.faceList = _loc16_;
                           if(!(_loc34_ && Boolean(param3)))
                           {
                              break loop23;
                           }
                           addr052f:
                        }
                     }
                     else
                     {
                        §§push(_loc23_);
                        if(!_loc34_)
                        {
                           break;
                        }
                        addr051e:
                        if(§§pop())
                        {
                           if(_loc14_ != null)
                           {
                              _loc14_.next = _loc16_;
                              §§goto(addr052f);
                           }
                           else
                           {
                              _loc12_.faceList = _loc16_;
                           }
                        }
                        else
                        {
                           _loc24_ = new Face();
                           _loc25_ = new Face();
                           _loc26_ = null;
                           _loc27_ = null;
                           §§push(_loc16_.wrapper.next);
                           if(!(_loc34_ && Boolean(param2)))
                           {
                              §§push(§§pop().alternativa3d::next);
                           }
                           _loc18_ = §§pop();
                           if(!(_loc34_ && Boolean(param1)))
                           {
                              loop4:
                              while(true)
                              {
                                 §§push(_loc18_.next);
                                 do
                                 {
                                    if(§§pop() == null)
                                    {
                                       break loop4;
                                    }
                                    §§push(_loc18_.next);
                                 }
                                 while(!(_loc33_ || Boolean(this)));
                                 _loc18_ = §§pop();
                              }
                           }
                           _loc19_ = _loc18_.vertex;
                           _loc18_ = _loc16_.wrapper;
                           loop6:
                           for(; _loc18_ != null; _loc19_ = _loc20_,_loc18_ = _loc18_.next)
                           {
                              _loc20_ = _loc18_.vertex;
                              loop25:
                              while(true)
                              {
                                 loop26:
                                 while(true)
                                 {
                                    §§push(_loc19_.offset);
                                    if(_loc33_)
                                    {
                                       loop33:
                                       while(true)
                                       {
                                          §§push(§§pop() < _loc7_);
                                          if(_loc33_ || Boolean(param3))
                                          {
                                             §§push(Boolean(§§pop()));
                                             if(!(_loc33_ || Boolean(this)))
                                             {
                                                break;
                                             }
                                          }
                                          var _temp_40:* = §§pop();
                                          loop34:
                                          while(true)
                                          {
                                             loop35:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   §§push(_temp_40);
                                                   §§push(_temp_40);
                                                   if(_loc33_)
                                                   {
                                                      §§push(Boolean(§§pop()));
                                                      if(_loc34_)
                                                      {
                                                         break;
                                                      }
                                                      if(§§pop())
                                                      {
                                                         §§pop();
                                                         §§push(_loc20_.offset);
                                                         §§push(_loc8_);
                                                         if(!(_loc33_ || Boolean(param3)))
                                                         {
                                                            break loop35;
                                                         }
                                                         §§push(§§pop() > §§pop());
                                                         if(!(_loc34_ && Boolean(this)))
                                                         {
                                                            §§push(Boolean(§§pop()));
                                                         }
                                                      }
                                                      var _temp_44:* = §§pop();
                                                      §§push(_temp_44);
                                                      §§push(_temp_44);
                                                      if(!(_loc33_ || Boolean(param3)))
                                                      {
                                                         break loop34;
                                                      }
                                                   }
                                                   §§push(Boolean(§§pop()));
                                                   if(_loc33_ || Boolean(param2))
                                                   {
                                                      break;
                                                   }
                                                   break loop34;
                                                }
                                                while(true)
                                                {
                                                   if(!§§pop())
                                                   {
                                                      §§pop();
                                                      if(_loc34_ && Boolean(param1))
                                                      {
                                                         break;
                                                      }
                                                      §§push(_loc19_.offset);
                                                      §§push(_loc8_);
                                                      if(_loc34_)
                                                      {
                                                         break loop35;
                                                      }
                                                      §§push(§§pop() > §§pop());
                                                      if(_loc34_ && Boolean(this))
                                                      {
                                                         break loop33;
                                                      }
                                                      §§push(Boolean(§§pop()));
                                                      if(_loc33_)
                                                      {
                                                         var _temp_49:* = §§pop();
                                                         §§push(_temp_49);
                                                         §§push(_temp_49);
                                                         if(_loc33_)
                                                         {
                                                            break loop34;
                                                         }
                                                         §§goto(addr06e1);
                                                      }
                                                   }
                                                   §§goto(addr06f4);
                                                }
                                                §§goto(addr06f8);
                                             }
                                             §§push(§§pop() / (§§pop() - _loc19_.offset));
                                             if(!_loc34_)
                                             {
                                                §§push(Number(§§pop()));
                                                if(!(_loc33_ || Boolean(param2)))
                                                {
                                                   break loop25;
                                                }
                                             }
                                          }
                                          addr06e1:
                                          if(Boolean(§§pop()))
                                          {
                                             if(_loc33_)
                                             {
                                                break;
                                             }
                                          }
                                          addr06f4:
                                          if(§§pop())
                                          {
                                             addr06f8:
                                             §§push(_loc6_.w - _loc19_.offset);
                                             §§push(_loc20_.offset);
                                             break loop35;
                                          }
                                          break loop26;
                                       }
                                       §§pop();
                                       §§goto(addr06f4);
                                    }
                                    _loc29_ = §§pop();
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          if(!(_loc34_ && Boolean(param3)))
                                          {
                                             _loc9_ = new Vertex();
                                             while(true)
                                             {
                                                if(!_loc34_)
                                                {
                                                   §§push(_loc9_);
                                                   §§push(_loc19_.x);
                                                   if(_loc33_ || Boolean(param2))
                                                   {
                                                      §§push(_loc20_.x);
                                                      if(_loc33_)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc19_.x);
                                                            if(_loc33_ || Boolean(this))
                                                            {
                                                               §§push(§§pop() - §§pop());
                                                               if(!_loc33_)
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
                                                   §§pop().x = §§pop();
                                                   if(!(_loc33_ || Boolean(param3)))
                                                   {
                                                      break;
                                                   }
                                                }
                                                §§push(_loc9_);
                                                §§push(_loc19_.y);
                                                if(!(_loc34_ && Boolean(param2)))
                                                {
                                                   §§push(_loc20_.y);
                                                   if(_loc33_)
                                                   {
                                                      while(true)
                                                      {
                                                         §§push(_loc19_.y);
                                                         if(_loc33_)
                                                         {
                                                            §§push(§§pop() - §§pop());
                                                            if(_loc34_)
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
                                                if(!(_loc34_ && Boolean(this)))
                                                {
                                                   §§push(_loc9_);
                                                   §§push(_loc19_.z);
                                                   if(_loc33_)
                                                   {
                                                      loop43:
                                                      while(true)
                                                      {
                                                         while(true)
                                                         {
                                                            §§push(_loc20_.z);
                                                            if(!(_loc34_ && Boolean(param3)))
                                                            {
                                                               §§push(_loc19_.z);
                                                               if(_loc34_)
                                                               {
                                                                  break;
                                                               }
                                                               §§push(§§pop() - §§pop());
                                                               if(_loc34_)
                                                               {
                                                                  break loop43;
                                                               }
                                                            }
                                                            §§push(_loc29_);
                                                            break;
                                                         }
                                                         §§push(§§pop() * §§pop());
                                                         break;
                                                      }
                                                   }
                                                   §§pop().z = §§pop();
                                                   if(!_loc34_)
                                                   {
                                                      §§push(_loc9_);
                                                      §§push(_loc19_.u);
                                                      if(!(_loc34_ && Boolean(this)))
                                                      {
                                                         loop45:
                                                         while(true)
                                                         {
                                                            while(true)
                                                            {
                                                               §§push(_loc20_.u);
                                                               if(_loc33_)
                                                               {
                                                                  §§push(_loc19_.u);
                                                                  if(_loc34_)
                                                                  {
                                                                     break;
                                                                  }
                                                                  §§push(§§pop() - §§pop());
                                                                  if(!(_loc33_ || Boolean(param3)))
                                                                  {
                                                                     break loop45;
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
                                                      if(_loc33_ || Boolean(param3))
                                                      {
                                                         §§push(_loc9_);
                                                         §§push(_loc19_.v);
                                                         if(!_loc34_)
                                                         {
                                                            loop47:
                                                            while(true)
                                                            {
                                                               while(true)
                                                               {
                                                                  §§push(_loc20_.v);
                                                                  if(!_loc34_)
                                                                  {
                                                                     §§push(_loc19_.v);
                                                                     if(!_loc33_)
                                                                     {
                                                                        break;
                                                                     }
                                                                     §§push(§§pop() - §§pop());
                                                                     if(_loc34_ && Boolean(param1))
                                                                     {
                                                                        break loop47;
                                                                     }
                                                                  }
                                                                  §§push(_loc29_);
                                                                  break;
                                                               }
                                                               §§push(§§pop() * §§pop());
                                                               break;
                                                            }
                                                         }
                                                         §§pop().v = §§pop();
                                                      }
                                                   }
                                                }
                                                break;
                                             }
                                             _loc28_ = new Wrapper();
                                             while(true)
                                             {
                                                if(!_loc34_)
                                                {
                                                   _loc28_.vertex = _loc9_;
                                                   if(_loc34_ && Boolean(param3))
                                                   {
                                                      break;
                                                   }
                                                   if(_loc26_ == null)
                                                   {
                                                      _loc24_.wrapper = _loc28_;
                                                      break;
                                                   }
                                                   if(_loc33_ || Boolean(param3))
                                                   {
                                                      _loc26_.next = _loc28_;
                                                      if(!(_loc33_ || Boolean(param3)))
                                                      {
                                                         break;
                                                      }
                                                   }
                                                }
                                                break;
                                             }
                                             _loc26_ = _loc28_;
                                             _loc30_ = new Vertex();
                                             loop50:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   if(_loc33_ || Boolean(this))
                                                   {
                                                      _loc30_.x = _loc9_.x;
                                                      if(!_loc33_)
                                                      {
                                                         break;
                                                      }
                                                      _loc30_.y = _loc9_.y;
                                                      if(_loc34_ && Boolean(param1))
                                                      {
                                                         break loop50;
                                                      }
                                                      _loc30_.z = _loc9_.z;
                                                      if(!_loc33_)
                                                      {
                                                         break loop50;
                                                      }
                                                   }
                                                   _loc30_.u = _loc9_.u;
                                                   if(!_loc34_)
                                                   {
                                                      break;
                                                   }
                                                   break loop50;
                                                }
                                                _loc30_.v = _loc9_.v;
                                                break;
                                             }
                                             _loc28_ = new Wrapper();
                                             while(true)
                                             {
                                                if(_loc33_)
                                                {
                                                   _loc28_.vertex = _loc30_;
                                                   if(!_loc34_)
                                                   {
                                                      if(_loc27_ == null)
                                                      {
                                                         _loc25_.wrapper = _loc28_;
                                                         break;
                                                      }
                                                      if(!(_loc34_ && Boolean(param2)))
                                                      {
                                                         _loc27_.next = _loc28_;
                                                         if(!_loc33_)
                                                         {
                                                            break;
                                                         }
                                                      }
                                                   }
                                                }
                                                break;
                                             }
                                             _loc27_ = _loc28_;
                                             break loop26;
                                          }
                                          §§goto(addr0a17);
                                       }
                                       §§goto(addr0a22);
                                    }
                                    §§goto(addr0a7a);
                                 }
                                 §§push(_loc20_.offset);
                                 break;
                              }
                              while(true)
                              {
                                 §§push(_loc7_);
                                 if(_loc33_)
                                 {
                                    if(§§pop() < §§pop())
                                    {
                                       §§push(_loc18_.create());
                                       if(_loc34_ && Boolean(param3))
                                       {
                                          break;
                                       }
                                       _loc28_ = §§pop();
                                       while(true)
                                       {
                                          if(_loc33_ || Boolean(param2))
                                          {
                                             _loc28_.vertex = _loc20_;
                                             if(_loc34_ && Boolean(this))
                                             {
                                                break;
                                             }
                                          }
                                          if(_loc26_ != null)
                                          {
                                             if(!_loc33_)
                                             {
                                                break;
                                             }
                                             _loc26_.next = _loc28_;
                                             if(_loc33_ || Boolean(this))
                                             {
                                                break;
                                             }
                                          }
                                          else
                                          {
                                             _loc24_.wrapper = _loc28_;
                                          }
                                          addr0a03:
                                          _loc26_ = _loc28_;
                                          continue loop6;
                                       }
                                       §§goto(addr0a03);
                                    }
                                    else
                                    {
                                       §§push(_loc20_.offset);
                                       §§push(_loc8_);
                                    }
                                 }
                                 if(§§pop() > §§pop())
                                 {
                                    addr0a17:
                                    §§push(_loc18_.create());
                                    if(!_loc34_)
                                    {
                                       break;
                                    }
                                 }
                                 else
                                 {
                                    §§push(_loc18_.create());
                                 }
                                 addr0a7a:
                                 _loc28_ = §§pop();
                                 loop29:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       if(_loc33_ || Boolean(param2))
                                       {
                                          _loc28_.vertex = _loc20_.value;
                                          if(!(_loc33_ || Boolean(param3)))
                                          {
                                             break loop29;
                                          }
                                          if(_loc26_ == null)
                                          {
                                             _loc24_.wrapper = _loc28_;
                                             break;
                                          }
                                          if(_loc34_)
                                          {
                                             break loop29;
                                          }
                                       }
                                       _loc26_.next = _loc28_;
                                       if(_loc33_)
                                       {
                                          break loop29;
                                       }
                                       break;
                                    }
                                    _loc26_ = _loc28_;
                                    _loc28_ = _loc18_.create();
                                    if(_loc33_)
                                    {
                                       _loc28_.vertex = _loc20_;
                                       while(true)
                                       {
                                          if(!_loc34_)
                                          {
                                             if(_loc27_ == null)
                                             {
                                                _loc25_.wrapper = _loc28_;
                                                break;
                                             }
                                             if(_loc34_ && Boolean(this))
                                             {
                                                break;
                                             }
                                          }
                                          _loc27_.next = _loc28_;
                                          if(_loc33_ || Boolean(this))
                                          {
                                          }
                                          break;
                                       }
                                    }
                                    _loc27_ = _loc28_;
                                    continue loop6;
                                 }
                                 break loop30;
                              }
                              addr0a22:
                              _loc28_ = §§pop();
                              while(true)
                              {
                                 if(!(_loc34_ && Boolean(param3)))
                                 {
                                    _loc28_.vertex = _loc20_;
                                    if(_loc34_ && Boolean(param3))
                                    {
                                       break;
                                    }
                                    if(_loc27_ == null)
                                    {
                                       _loc25_.wrapper = _loc28_;
                                       break;
                                    }
                                    if(!_loc33_)
                                    {
                                       break;
                                    }
                                    _loc27_.next = _loc28_;
                                    if(!_loc33_)
                                    {
                                       break;
                                    }
                                 }
                                 break;
                              }
                              _loc27_ = _loc28_;
                           }
                           while(true)
                           {
                              if(!(_loc34_ && Boolean(this)))
                              {
                                 _loc24_.material = _loc16_.material;
                                 if(!(_loc33_ || Boolean(param2)))
                                 {
                                    break;
                                 }
                              }
                              _loc24_.calculateBestSequenceAndNormal();
                              if(_loc14_ != null)
                              {
                                 _loc14_.next = _loc24_;
                                 break;
                              }
                              addr0b75:
                              _loc12_.faceList = _loc24_;
                              _loc14_ = _loc24_;
                              while(true)
                              {
                                 if(!_loc34_)
                                 {
                                    _loc25_.material = _loc16_.material;
                                    if(!(_loc33_ || Boolean(param2)))
                                    {
                                       break;
                                    }
                                 }
                                 _loc25_.calculateBestSequenceAndNormal();
                                 if(!(_loc34_ && Boolean(param3)))
                                 {
                                    if(_loc15_ == null)
                                    {
                                       _loc13_.faceList = _loc25_;
                                       break;
                                    }
                                    if(!_loc33_)
                                    {
                                       break;
                                    }
                                    _loc15_.next = _loc25_;
                                    if(!(_loc33_ || Boolean(this)))
                                    {
                                       break;
                                    }
                                 }
                                 break;
                              }
                              _loc15_ = _loc25_;
                              continue loop1;
                           }
                           §§goto(addr0b75);
                        }
                     }
                     _loc14_ = _loc16_;
                     _loc18_ = _loc16_.wrapper;
                     loop55:
                     while(true)
                     {
                        if(!_loc34_)
                        {
                           while(true)
                           {
                              if(_loc18_ == null)
                              {
                                 break loop55;
                              }
                              if(_loc18_.vertex.value == null)
                              {
                                 continue;
                              }
                              if(_loc34_ && Boolean(this))
                              {
                                 continue;
                              }
                              _loc18_ = _loc18_.next;
                           }
                           break loop1;
                           addr058b:
                        }
                        _loc18_.vertex = _loc18_.vertex.value;
                        if(_loc34_ && Boolean(this))
                        {
                           break;
                        }
                        _loc18_ = _loc18_.next;
                        §§goto(addr058b);
                     }
                     continue loop1;
                  }
                  §§goto(addr051e);
               }
               §§goto(addr04f3);
            }
            _loc15_ = _loc16_;
         }
         loop64:
         while(true)
         {
            if(_loc14_ != null)
            {
               if(_loc33_ || Boolean(param3))
               {
                  _loc14_.next = null;
                  var _loc31_:Mesh = _loc12_;
                  var _loc32_:Number = _loc31_.transformId + 1;
                  if(!(_loc34_ && Boolean(param1)))
                  {
                     _loc31_.transformId = _loc32_;
                  }
                  if(_loc34_)
                  {
                     break;
                  }
                  _loc12_.collectVertices();
                  _loc12_.calculateBounds();
                  _loc5_[0] = _loc12_;
               }
            }
            if(_loc15_ != null)
            {
               while(true)
               {
                  if(!(_loc34_ && Boolean(param2)))
                  {
                     break loop64;
                  }
                  addr0c87:
                  _loc13_.calculateBounds();
                  if(_loc33_ || Boolean(param3))
                  {
                     _loc5_[1] = _loc13_;
                  }
                  break;
               }
            }
            §§goto(addr0cad);
         }
         _loc15_.next = null;
         _loc31_ = _loc13_;
         _loc32_ = _loc31_.transformId + 1;
         if(!(_loc34_ && Boolean(this)))
         {
            _loc31_.transformId = _loc32_;
         }
         _loc13_.collectVertices();
         if(!_loc34_)
         {
            §§goto(addr0c87);
         }
         addr0cad:
         return _loc5_;
      }
      
      private function collectVertices() : void
      {
         §§push(false);
         var _loc4_:Boolean = true;
         var _loc5_:* = §§pop();
         var _loc2_:Wrapper = null;
         var _loc3_:Vertex = null;
         var _loc1_:Face = this.faceList;
         while(_loc1_ != null)
         {
            _loc2_ = _loc1_.wrapper;
            if(!_loc5_)
            {
               loop1:
               for(; _loc2_ != null; _loc2_ = _loc2_.next)
               {
                  _loc3_ = _loc2_.vertex;
                  while(true)
                  {
                     if(_loc4_)
                     {
                        if(_loc3_.transformId == transformId)
                        {
                           continue loop1;
                        }
                        if(_loc4_ || Boolean(_loc1_))
                        {
                           _loc3_.next = this.vertexList;
                           if(_loc5_)
                           {
                              break;
                           }
                        }
                        this.vertexList = _loc3_;
                        if(_loc5_ && Boolean(_loc1_))
                        {
                           break;
                        }
                     }
                     _loc3_.transformId = transformId;
                     if(_loc4_ || Boolean(_loc1_))
                     {
                        break;
                     }
                     continue loop1;
                  }
                  _loc3_.value = null;
               }
            }
            _loc1_ = _loc1_.next;
         }
      }
   }
}

§§push(false);
true;
§§pop();
if(_loc1_ || Boolean(_loc2_))
{
   Mesh = §§newclass(Mesh,Object3D);
}

