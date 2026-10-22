package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.materials.Material;
   import flash.geom.Matrix3D;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class Geometry
   {
      
      alternativa3d var vertexIdCounter:uint = 0;
      
      alternativa3d var faceIdCounter:uint = 0;
      
      alternativa3d var _vertices:Dictionary;
      
      alternativa3d var _faces:Dictionary;
      
      public function Geometry()
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(_loc1_ || _loc1_)
         {
            this._vertices = new Dictionary();
            if(!(_loc2_ && Boolean(this)))
            {
               this._faces = new Dictionary();
               if(!(_loc2_ && Boolean(this)))
               {
                  super();
               }
            }
         }
      }
      
      public function addVertex(param1:Number, param2:Number, param3:Number, param4:Number = 0, param5:Number = 0, param6:Object = null) : Vertex
      {
         var _temp_1:* = true;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = _temp_1;
         loop1:
         while(true)
         {
            while(true)
            {
               if(_loc11_)
               {
                  if(param6 != null)
                  {
                     if(_loc11_ || Boolean(this))
                     {
                        §§push(Boolean(this._vertices[param6]));
                        if(_loc10_)
                        {
                           break;
                        }
                        if(!§§pop())
                        {
                           §§goto(addr00c0);
                        }
                        if(_loc10_)
                        {
                           break loop1;
                        }
                     }
                     addr0046:
                     §§push(this._vertices[param6] is Vertex);
                     break;
                  }
                  while(Boolean(this._vertices[this.vertexIdCounter]))
                  {
                     var _loc8_:Geometry = this;
                     var _loc9_:Number = _loc8_.vertexIdCounter + 1;
                     if(!_loc10_)
                     {
                        _loc8_.vertexIdCounter = _loc9_;
                     }
                     if(!(_loc11_ || Boolean(param1)))
                     {
                        break;
                     }
                  }
                  param6 = this.vertexIdCounter;
                  addr00c0:
                  var _loc7_:Vertex = new Vertex();
                  _loc7_.x = param1;
                  _loc7_.y = param2;
                  _loc7_.z = param3;
                  _loc7_.u = param4;
                  _loc7_.v = param5;
                  this._vertices[param6] = _loc7_;
                  return _loc7_;
               }
               §§goto(addr0046);
            }
            if(§§pop())
            {
               break;
            }
            throw new ArgumentError("Identifier " + param6 + " is reserved and cannot be used.");
         }
         throw new ArgumentError("Identifier " + param6 + " already exists.");
      }
      
      public function removeVertex(param1:Vertex) : Vertex
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         var _loc2_:* = undefined;
         var _loc3_:Wrapper = null;
         if(_loc7_ || Boolean(_loc3_))
         {
            if(param1 != null)
            {
               if(!this.hasVertex(param1))
               {
                  throw new ArgumentError("Vertex not found.");
               }
               delete this._vertices[this.getVertexId(param1)];
               loop0:
               for(_loc2_ in this._faces)
               {
                  _loc3_ = Face(this._faces[_loc2_]).wrapper;
                  if(_loc7_)
                  {
                     while(_loc3_ != null)
                     {
                        if(_loc3_.vertex == param1)
                        {
                           if(!_loc6_)
                           {
                              delete this._faces[_loc2_];
                              if(!(_loc7_ || Boolean(this)))
                              {
                                 continue loop0;
                              }
                           }
                           break;
                        }
                        _loc3_ = _loc3_.next;
                     }
                  }
               }
               return param1;
            }
         }
         throw new TypeError("Parameter vertex must be non-null.");
      }
      
      public function removeVertexById(param1:Object) : Vertex
      {
         §§push(false);
         var _loc7_:Boolean = true;
         var _loc8_:* = §§pop();
         var _loc3_:* = undefined;
         var _loc4_:Wrapper = null;
         if(!_loc8_)
         {
            if(param1 != null)
            {
               if(!(this._vertices[param1] is Vertex))
               {
                  throw new ArgumentError("Vertex not found.");
               }
               var _loc2_:Vertex = this._vertices[param1];
               delete this._vertices[param1];
               loop0:
               for(_loc3_ in this._faces)
               {
                  _loc4_ = Face(this._faces[_loc3_]).wrapper;
                  if(!(_loc8_ && Boolean(_loc3_)))
                  {
                     while(_loc4_ != null)
                     {
                        if(_loc4_.vertex == _loc2_)
                        {
                           if(_loc7_)
                           {
                              delete this._faces[_loc3_];
                              if(!(_loc7_ || Boolean(_loc3_)))
                              {
                                 continue loop0;
                              }
                           }
                           break;
                        }
                        _loc4_ = _loc4_.next;
                     }
                  }
               }
               return _loc2_;
            }
         }
         throw new TypeError("Parameter id must be non-null.");
      }
      
      public function hasVertex(param1:Vertex) : Boolean
      {
         var _temp_1:* = true;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = _temp_1;
         var _loc2_:* = undefined;
         if(_loc6_)
         {
            if(param1 != null)
            {
               for(_loc2_ in this._vertices)
               {
                  if(!_loc5_)
                  {
                     if(this._vertices[_loc2_] == param1)
                     {
                        if(_loc6_ || Boolean(this))
                        {
                           return true;
                        }
                     }
                  }
               }
               return false;
            }
         }
         throw new TypeError("Parameter vertex must be non-null.");
      }
      
      public function hasVertexById(param1:Object) : Boolean
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         if(_loc3_ || Boolean(this))
         {
            if(param1 != null)
            {
               if(this._vertices[param1] is Vertex)
               {
                  return true;
               }
               return false;
            }
         }
         throw new TypeError("Parameter id must be non-null.");
      }
      
      public function getVertexId(param1:Vertex) : Object
      {
         var _temp_1:* = true;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = _temp_1;
         var _loc2_:* = undefined;
         if(!_loc6_)
         {
            if(param1 != null)
            {
               var _loc3_:* = false;
               loop0:
               for(_loc2_ in this._vertices)
               {
                  while(true)
                  {
                     if(_loc7_ || Boolean(_loc3_))
                     {
                        if(this._vertices[_loc2_] != param1)
                        {
                           continue loop0;
                        }
                        if(_loc6_)
                        {
                           break;
                        }
                     }
                     §§push(true);
                     if(!(_loc6_ && Boolean(this)))
                     {
                        §§push(Boolean(§§pop()));
                     }
                     _loc3_ = §§pop();
                     break;
                  }
                  break;
               }
               if(!_loc3_)
               {
                  throw new ArgumentError("Vertex not found.");
               }
               return _loc2_;
            }
         }
         throw new TypeError("Parameter vertex must be non-null.");
      }
      
      public function getVertexById(param1:Object) : Vertex
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         if(!_loc2_)
         {
            if(param1 != null)
            {
               if(!(this._vertices[param1] is Vertex))
               {
                  throw new ArgumentError("Vertex not found.");
               }
               return this._vertices[param1];
            }
         }
         throw new TypeError("Parameter id must be non-null.");
      }
      
      public function addFace(param1:Vector.<Vertex>, param2:Material = null, param3:Object = null) : Face
      {
         var _temp_1:* = true;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = _temp_1;
         var _loc8_:Wrapper = null;
         var _loc9_:Vertex = null;
         loop2:
         while(true)
         {
            while(true)
            {
               if(_loc13_ || Boolean(param3))
               {
                  if(param3 != null)
                  {
                     if(_loc12_ && Boolean(this))
                     {
                        break loop2;
                     }
                     §§push(Boolean(this._faces[param3]));
                     if(_loc12_)
                     {
                        break;
                     }
                     if(§§pop())
                     {
                        if(_loc13_)
                        {
                           addr0056:
                           §§push(this._faces[param3] is Face);
                           break;
                        }
                        break loop2;
                     }
                  }
                  else
                  {
                     while(Boolean(this._faces[this.faceIdCounter]))
                     {
                        var _loc10_:Geometry = this;
                        var _loc11_:Number = _loc10_.faceIdCounter + 1;
                        if(_loc13_ || Boolean(param3))
                        {
                           _loc10_.faceIdCounter = _loc11_;
                        }
                        if(!_loc13_)
                        {
                           break;
                        }
                     }
                     param3 = this.faceIdCounter;
                  }
                  if(param1 == null)
                  {
                     throw new TypeError("Parameter vertices must be non-null.");
                  }
                  var _loc4_:int = int(param1.length);
                  if(_loc4_ < 3)
                  {
                     throw new ArgumentError(_loc4_ + " vertices not enough.");
                  }
                  var _loc5_:Face = new Face();
                  _loc5_.material = param2;
                  var _loc6_:Wrapper = null;
                  var _loc7_:int = 0;
                  while(true)
                  {
                     if(_loc7_ >= _loc4_)
                     {
                        this._faces[param3] = _loc5_;
                        return _loc5_;
                     }
                     _loc8_ = new Wrapper();
                     _loc9_ = param1[_loc7_];
                     if(!_loc13_)
                     {
                        break;
                     }
                     if(_loc9_ == null)
                     {
                        break;
                     }
                     if(!this.hasVertex(_loc9_))
                     {
                        throw new ArgumentError("Vertex not found.");
                     }
                     _loc8_.vertex = _loc9_;
                     if(_loc6_ != null)
                     {
                        _loc6_.next = _loc8_;
                     }
                     else
                     {
                        _loc5_.wrapper = _loc8_;
                     }
                     _loc6_ = _loc8_;
                     _loc7_++;
                  }
                  throw new ArgumentError("Null vertex in vector.");
               }
               §§goto(addr0056);
            }
            if(§§pop())
            {
               break;
            }
            throw new ArgumentError("Identifier " + param3 + " is reserved and cannot be used.");
         }
         throw new ArgumentError("Identifier " + param3 + " already exists.");
      }
      
      public function addFaceByIds(param1:Array, param2:Material = null, param3:Object = null) : Face
      {
         §§push(false);
         var _loc12_:Boolean = true;
         var _loc13_:* = §§pop();
         var _loc8_:Wrapper = null;
         var _loc9_:Object = null;
         loop2:
         while(true)
         {
            while(true)
            {
               if(_loc12_)
               {
                  if(param3 != null)
                  {
                     if(_loc12_)
                     {
                        §§push(Boolean(this._faces[param3]));
                        if(_loc13_)
                        {
                           break;
                        }
                        if(!§§pop())
                        {
                           §§goto(addr00bb);
                        }
                        if(!(_loc12_ || Boolean(param3)))
                        {
                           break loop2;
                        }
                     }
                     addr004d:
                     §§push(this._faces[param3] is Face);
                     break;
                  }
                  while(Boolean(this._faces[this.faceIdCounter]))
                  {
                     var _loc10_:Geometry = this;
                     var _loc11_:Number = _loc10_.faceIdCounter + 1;
                     if(!_loc13_)
                     {
                        _loc10_.faceIdCounter = _loc11_;
                     }
                     if(!_loc12_)
                     {
                        break;
                     }
                  }
                  param3 = this.faceIdCounter;
                  addr00bb:
                  if(param1 == null)
                  {
                     throw new TypeError("Parameter vertices must be non-null.");
                  }
                  var _loc4_:int = int(param1.length);
                  if(_loc4_ < 3)
                  {
                     throw new ArgumentError(_loc4_ + " vertices not enough.");
                  }
                  var _loc5_:Face = new Face();
                  _loc5_.material = param2;
                  var _loc6_:Wrapper = null;
                  var _loc7_:int = 0;
                  while(true)
                  {
                     if(_loc7_ >= _loc4_)
                     {
                        this._faces[param3] = _loc5_;
                        return _loc5_;
                     }
                     _loc8_ = new Wrapper();
                     _loc9_ = param1[_loc7_];
                     if(!_loc12_)
                     {
                        break;
                     }
                     if(_loc9_ == null)
                     {
                        break;
                     }
                     if(!this.hasVertexById(_loc9_))
                     {
                        throw new ArgumentError("Vertex not found.");
                     }
                     _loc8_.vertex = this._vertices[_loc9_];
                     if(_loc6_ != null)
                     {
                        _loc6_.next = _loc8_;
                     }
                     else
                     {
                        _loc5_.wrapper = _loc8_;
                     }
                     _loc6_ = _loc8_;
                     _loc7_++;
                  }
                  throw new ArgumentError("Null id in array.");
               }
               §§goto(addr004d);
            }
            if(§§pop())
            {
               break;
            }
            throw new ArgumentError("Identifier " + param3 + " is reserved and cannot be used.");
         }
         throw new ArgumentError("Identifier " + param3 + " already exists.");
      }
      
      public function addTriFace(param1:Vertex, param2:Vertex, param3:Vertex, param4:Material = null, param5:Object = null) : Face
      {
         §§push(false);
         var _loc9_:Boolean = true;
         var _loc10_:* = §§pop();
         loop1:
         while(true)
         {
            while(true)
            {
               if(!_loc10_)
               {
                  if(param5 == null)
                  {
                     while(Boolean(this._faces[this.faceIdCounter]))
                     {
                        var _loc7_:Geometry = this;
                        var _loc8_:Number = _loc7_.faceIdCounter + 1;
                        if(!_loc10_)
                        {
                           _loc7_.faceIdCounter = _loc8_;
                        }
                        if(!(_loc9_ || Boolean(param1)))
                        {
                           break;
                        }
                     }
                     param5 = this.faceIdCounter;
                     break;
                  }
                  if(_loc10_)
                  {
                     break loop1;
                  }
               }
               §§push(Boolean(this._faces[param5]));
               if(!(_loc10_ && Boolean(param3)))
               {
                  if(!§§pop())
                  {
                     break;
                  }
                  if(!_loc9_)
                  {
                     break loop1;
                  }
                  §§push(this._faces[param5] is Face);
               }
               if(§§pop())
               {
                  break loop1;
               }
               throw new ArgumentError("Identifier " + param5 + " is reserved and cannot be used.");
            }
            if(param1 == null)
            {
               throw new TypeError("Parameter v1 must be non-null.");
            }
            if(param2 == null)
            {
               throw new TypeError("Parameter v2 must be non-null.");
            }
            if(param3 == null)
            {
               throw new TypeError("Parameter v3 must be non-null.");
            }
            if(!this.hasVertex(param1))
            {
               throw new ArgumentError("Vertex not found.");
            }
            if(!this.hasVertex(param2))
            {
               throw new ArgumentError("Vertex not found.");
            }
            if(!this.hasVertex(param3))
            {
               throw new ArgumentError("Vertex not found.");
            }
            var _loc6_:Face = new Face();
            _loc6_.material = param4;
            _loc6_.wrapper = new Wrapper();
            _loc6_.wrapper.vertex = param1;
            _loc6_.wrapper.next = new Wrapper();
            _loc6_.wrapper.next.vertex = param2;
            _loc6_.wrapper.next.next = new Wrapper();
            _loc6_.wrapper.next.next.vertex = param3;
            this._faces[param5] = _loc6_;
            return _loc6_;
         }
         throw new ArgumentError("Identifier " + param5 + " already exists.");
      }
      
      public function addQuadFace(param1:Vertex, param2:Vertex, param3:Vertex, param4:Vertex, param5:Material = null, param6:Object = null) : Face
      {
         var _temp_1:* = true;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = _temp_1;
         loop1:
         while(true)
         {
            while(true)
            {
               if(_loc11_)
               {
                  if(param6 != null)
                  {
                     if(!(_loc10_ && Boolean(param2)))
                     {
                        §§push(Boolean(this._faces[param6]));
                        if(!(_loc11_ || Boolean(param3)))
                        {
                           break;
                        }
                        if(!§§pop())
                        {
                           §§goto(addr00ce);
                        }
                        if(_loc10_ && Boolean(param1))
                        {
                           break loop1;
                        }
                     }
                     addr0056:
                     §§push(this._faces[param6] is Face);
                     break;
                  }
                  while(Boolean(this._faces[this.faceIdCounter]))
                  {
                     var _loc8_:Geometry = this;
                     var _loc9_:Number = _loc8_.faceIdCounter + 1;
                     if(_loc11_ || Boolean(param3))
                     {
                        _loc8_.faceIdCounter = _loc9_;
                     }
                     if(_loc10_ && Boolean(param3))
                     {
                        break;
                     }
                  }
                  param6 = this.faceIdCounter;
                  addr00ce:
                  if(param1 == null)
                  {
                     throw new TypeError("Parameter v1 must be non-null.");
                  }
                  if(param2 == null)
                  {
                     throw new TypeError("Parameter v2 must be non-null.");
                  }
                  if(param3 == null)
                  {
                     throw new TypeError("Parameter v3 must be non-null.");
                  }
                  if(param4 == null)
                  {
                     throw new TypeError("Parameter v4 must be non-null.");
                  }
                  if(!this.hasVertex(param1))
                  {
                     throw new ArgumentError("Vertex not found.");
                  }
                  if(!this.hasVertex(param2))
                  {
                     throw new ArgumentError("Vertex not found.");
                  }
                  if(!this.hasVertex(param3))
                  {
                     throw new ArgumentError("Vertex not found.");
                  }
                  if(!this.hasVertex(param4))
                  {
                     throw new ArgumentError("Vertex not found.");
                  }
                  var _loc7_:Face = new Face();
                  _loc7_.material = param5;
                  _loc7_.wrapper = new Wrapper();
                  _loc7_.wrapper.vertex = param1;
                  _loc7_.wrapper.next = new Wrapper();
                  _loc7_.wrapper.next.vertex = param2;
                  _loc7_.wrapper.next.next = new Wrapper();
                  _loc7_.wrapper.next.next.vertex = param3;
                  _loc7_.wrapper.next.next.next = new Wrapper();
                  _loc7_.wrapper.next.next.next.vertex = param4;
                  this._faces[param6] = _loc7_;
                  return _loc7_;
               }
               §§goto(addr0056);
            }
            if(§§pop())
            {
               break;
            }
            throw new ArgumentError("Identifier " + param6 + " is reserved and cannot be used.");
         }
         throw new ArgumentError("Identifier " + param6 + " already exists.");
      }
      
      public function removeFace(param1:Face) : Face
      {
         var _temp_1:* = true;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = _temp_1;
         if(_loc3_)
         {
            if(param1 != null)
            {
               if(!this.hasFace(param1))
               {
                  throw new ArgumentError("Face not found.");
               }
               delete this._faces[this.getFaceId(param1)];
               return param1;
            }
         }
         throw new TypeError("Parameter face must be non-null.");
      }
      
      public function removeFaceById(param1:Object) : Face
      {
         §§push(false);
         var _loc3_:Boolean = true;
         var _loc4_:* = §§pop();
         if(!(_loc4_ && Boolean(param1)))
         {
            if(param1 != null)
            {
               if(!(this._faces[param1] is Face))
               {
                  throw new ArgumentError("Face not found.");
               }
               var _loc2_:Face = this._faces[param1];
               delete this._faces[param1];
               return _loc2_;
            }
         }
         throw new TypeError("Parameter id must be non-null.");
      }
      
      public function hasFace(param1:Face) : Boolean
      {
         §§push(false);
         var _loc5_:Boolean = true;
         var _loc6_:* = §§pop();
         var _loc2_:* = undefined;
         if(_loc5_)
         {
            if(param1 != null)
            {
               var _loc3_:int = 0;
               var _loc4_:* = this._faces;
               while(true)
               {
                  for(_loc2_ in _loc4_)
                  {
                     if(!_loc5_)
                     {
                        break;
                     }
                     if(this._faces[_loc2_] == param1)
                     {
                        if(!_loc6_)
                        {
                           break;
                        }
                     }
                  }
                  return false;
               }
               return true;
            }
         }
         throw new TypeError("Parameter face must be non-null.");
      }
      
      public function hasFaceById(param1:Object) : Boolean
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         if(!_loc3_)
         {
            if(param1 != null)
            {
               if(this._faces[param1] is Face)
               {
                  return true;
               }
               return false;
            }
         }
         throw new TypeError("Parameter id must be non-null.");
      }
      
      public function getFaceId(param1:Face) : Object
      {
         §§push(false);
         var _loc6_:Boolean = true;
         var _loc7_:* = §§pop();
         var _loc2_:* = undefined;
         if(_loc6_ || Boolean(_loc3_))
         {
            if(param1 != null)
            {
               var _loc3_:* = false;
               loop0:
               for(_loc2_ in this._faces)
               {
                  while(true)
                  {
                     if(!_loc7_)
                     {
                        if(this._faces[_loc2_] != param1)
                        {
                           continue loop0;
                        }
                        if(_loc7_ && Boolean(_loc3_))
                        {
                           break;
                        }
                     }
                     §§push(true);
                     if(_loc6_)
                     {
                        §§push(Boolean(§§pop()));
                     }
                     _loc3_ = §§pop();
                     break;
                  }
                  break;
               }
               if(!_loc3_)
               {
                  throw new ArgumentError("Face not found.");
               }
               return _loc2_;
            }
         }
         throw new TypeError("Parameter face must be non-null.");
      }
      
      public function getFaceById(param1:Object) : Face
      {
         §§push(false);
         var _loc2_:Boolean = true;
         var _loc3_:* = §§pop();
         if(!_loc3_)
         {
            if(param1 != null)
            {
               if(!(this._faces[param1] is Face))
               {
                  throw new ArgumentError("Face not found.");
               }
               return this._faces[param1];
            }
         }
         throw new TypeError("Parameter id must be non-null.");
      }
      
      public function addVerticesAndFaces(param1:Vector.<Number>, param2:Vector.<Number>, param3:Vector.<int>, param4:Boolean = false, param5:Material = null) : void
      {
         §§push(false);
         var _loc20_:Boolean = true;
         var _loc21_:* = §§pop();
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc12_:Face = null;
         var _loc13_:Wrapper = null;
         var _loc14_:int = 0;
         var _loc15_:* = 0;
         var _loc16_:Vertex = null;
         var _loc17_:Wrapper = null;
         if(!(_loc21_ && Boolean(param3)))
         {
            if(param1 != null)
            {
               if(param2 == null)
               {
                  throw new TypeError("Parameter uvs must be non-null.");
               }
               if(param3 == null)
               {
                  throw new TypeError("Parameter indices must be non-null.");
               }
               var _loc9_:int = param1.length / 3;
               if(_loc9_ != param2.length / 2)
               {
                  throw new ArgumentError("Vertices count and uvs count doesn\'t match.");
               }
               var _loc10_:int = int(param3.length);
               if(!param4 && Boolean(_loc10_ % 3))
               {
                  throw new ArgumentError("Incorrect indices.");
               }
               _loc6_ = 0;
               _loc8_ = 0;
               loop0:
               while(true)
               {
                  if(_loc6_ >= _loc10_)
                  {
                     var _loc11_:Vector.<Vertex> = new Vector.<Vertex>(_loc9_);
                     _loc6_ = 0;
                     _loc7_ = 0;
                     _loc8_ = 0;
                     loop1:
                     while(_loc6_ < _loc9_)
                     {
                        _loc16_ = new Vertex();
                        if(_loc20_)
                        {
                           _loc16_.x = param1[_loc7_];
                           loop5:
                           while(true)
                           {
                              loop6:
                              while(true)
                              {
                                 if(!(_loc21_ && Boolean(param2)))
                                 {
                                    §§push(int(_loc7_ + 1));
                                    if(_loc21_)
                                    {
                                       break;
                                    }
                                    _loc7_ = §§pop();
                                    if(_loc21_)
                                    {
                                       break loop5;
                                    }
                                 }
                                 _loc16_.y = param1[_loc7_];
                                 loop9:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc7_);
                                          if(_loc20_)
                                          {
                                             §§push(§§pop() + 1);
                                             if(!_loc20_)
                                             {
                                                break loop6;
                                             }
                                             _loc7_ = int(§§pop());
                                             _loc16_.z = param1[_loc7_];
                                             if(_loc21_)
                                             {
                                                break loop9;
                                             }
                                             §§push(_loc7_);
                                             if(_loc20_)
                                             {
                                                §§push(§§pop() + 1);
                                             }
                                             _loc7_ = int(§§pop());
                                             if(_loc21_)
                                             {
                                                break loop9;
                                             }
                                             if(param2 != null)
                                             {
                                                break loop5;
                                             }
                                          }
                                          else
                                          {
                                             §§goto(addr0271);
                                          }
                                          §§goto(addr029c);
                                       }
                                       §§goto(addr02ef);
                                    }
                                    §§goto(addr02f7);
                                 }
                                 §§goto(addr02a4);
                              }
                              _loc6_ = §§pop();
                              continue loop1;
                           }
                           _loc16_.u = param2[_loc8_];
                           §§push(_loc8_);
                           if(_loc20_)
                           {
                              loop7:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(§§pop() + 1);
                                    if(!_loc21_)
                                    {
                                       addr0271:
                                       _loc8_ = int(§§pop());
                                       if(_loc21_ && Boolean(param3))
                                       {
                                          break;
                                       }
                                       _loc16_.v = param2[_loc8_];
                                       if(!_loc20_)
                                       {
                                          break loop7;
                                       }
                                       §§push(_loc8_);
                                    }
                                    §§push(int(§§pop() + 1));
                                    if(!_loc21_)
                                    {
                                       _loc8_ = §§pop();
                                       addr029c:
                                       _loc11_[_loc6_] = _loc16_;
                                       addr02a4:
                                       break loop7;
                                    }
                                    addr02f7:
                                    §§push(int(§§pop() + 1));
                                    break loop6;
                                 }
                                 addr02ef:
                                 §§push(_loc6_);
                                 if(_loc21_)
                                 {
                                    break loop6;
                                 }
                                 §§goto(addr02f7);
                              }
                              while(Boolean(this._vertices[this.vertexIdCounter]))
                              {
                                 var _loc18_:Geometry = this;
                                 var _loc19_:Number = _loc18_.vertexIdCounter + 1;
                                 if(_loc20_ || Boolean(param2))
                                 {
                                    _loc18_.vertexIdCounter = _loc19_;
                                 }
                              }
                              if(!(_loc21_ && Boolean(param2)))
                              {
                                 this._vertices[this.vertexIdCounter] = _loc16_;
                              }
                              break loop8;
                           }
                           break loop6;
                        }
                     }
                     _loc6_ = 0;
                     _loc8_ = 0;
                     loop2:
                     while(_loc6_ < _loc10_)
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
                                 loop16:
                                 while(true)
                                 {
                                    §§push(_loc6_);
                                    if(_loc20_)
                                    {
                                       §§push(_loc8_);
                                       if(_loc21_)
                                       {
                                          break;
                                       }
                                       if(§§pop() != §§pop())
                                       {
                                          break loop14;
                                       }
                                       while(true)
                                       {
                                          if(!(_loc21_ && Boolean(param3)))
                                          {
                                             if(!param4)
                                             {
                                                §§push(_loc6_);
                                                if(_loc20_ || Boolean(param2))
                                                {
                                                   addr0370:
                                                   §§push(3);
                                                   break loop16;
                                                }
                                                break loop12;
                                             }
                                             if(_loc21_)
                                             {
                                                break;
                                             }
                                          }
                                          §§push(int(param3[_loc6_] + ++_loc6_));
                                          if(_loc20_ || Boolean(param2))
                                          {
                                             break loop12;
                                          }
                                          break loop13;
                                       }
                                       §§goto(addr037d);
                                    }
                                    §§goto(addr0370);
                                 }
                                 §§push(int(§§pop() + §§pop()));
                                 if(_loc20_)
                                 {
                                    break loop12;
                                 }
                                 break loop13;
                              }
                              _loc17_ = new Wrapper();
                              while(true)
                              {
                                 if(_loc20_)
                                 {
                                    _loc17_.vertex = _loc11_[param3[_loc6_]];
                                    if(!(_loc21_ && Boolean(this)))
                                    {
                                       if(_loc13_ == null)
                                       {
                                          _loc12_.wrapper = _loc17_;
                                          break;
                                       }
                                       if(_loc21_ && Boolean(param2))
                                       {
                                          break;
                                       }
                                    }
                                 }
                                 _loc13_.next = _loc17_;
                                 if(_loc21_)
                                 {
                                 }
                                 break;
                              }
                              _loc13_ = _loc17_;
                              if(_loc20_)
                              {
                                 while(true)
                                 {
                                    §§push(_loc6_);
                                    if(_loc20_)
                                    {
                                       §§push(§§pop() + 1);
                                       if(_loc21_ && Boolean(param1))
                                       {
                                          break;
                                       }
                                    }
                                    §§push(int(§§pop()));
                                    break;
                                 }
                                 _loc6_ = §§pop();
                              }
                              continue loop2;
                           }
                           _loc8_ = §§pop();
                           addr037d:
                           _loc13_ = null;
                           _loc12_ = new Face();
                           loop15:
                           while(true)
                           {
                              if(_loc20_ || Boolean(this))
                              {
                                 _loc12_.material = param5;
                                 if(_loc21_)
                                 {
                                    break;
                                 }
                              }
                              while(true)
                              {
                                 if(!Boolean(this._faces[this.faceIdCounter]))
                                 {
                                    if(_loc20_ || Boolean(param3))
                                    {
                                       break loop15;
                                    }
                                    break loop14;
                                 }
                                 _loc18_ = this;
                                 _loc19_ = _loc18_.faceIdCounter + 1;
                                 if(_loc20_)
                                 {
                                    _loc18_.faceIdCounter = _loc19_;
                                 }
                                 if(_loc21_)
                                 {
                                    break loop14;
                                 }
                              }
                              break loop14;
                           }
                           this._faces[this.faceIdCounter] = _loc12_;
                           break loop14;
                        }
                        §§push(int(§§pop()));
                        break loop13;
                     }
                     return;
                  }
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
                                 while(true)
                                 {
                                    §§push(_loc6_);
                                    if(!(_loc21_ && Boolean(this)))
                                    {
                                       §§push(_loc8_);
                                       if(!_loc20_)
                                       {
                                          break;
                                       }
                                       if(§§pop() != §§pop())
                                       {
                                          break loop24;
                                       }
                                       if(!_loc20_)
                                       {
                                          break loop23;
                                       }
                                       if(param4)
                                       {
                                          if(!(_loc20_ || Boolean(this)))
                                          {
                                             break loop23;
                                          }
                                          §§push(param3[_loc6_]);
                                          if(_loc20_)
                                          {
                                             break loop22;
                                          }
                                       }
                                       else
                                       {
                                          §§push(3);
                                          if(!_loc20_)
                                          {
                                             break loop20;
                                          }
                                       }
                                    }
                                    §§push(int(§§pop()));
                                    if(_loc20_ || Boolean(param1))
                                    {
                                       break loop22;
                                    }
                                    break loop21;
                                 }
                                 §§goto(addr013b);
                              }
                              §§goto(addr0178);
                           }
                           §§goto(addr0137);
                        }
                        §§push(int(§§pop()));
                        if(_loc20_)
                        {
                           break loop20;
                        }
                        break;
                     }
                     addr013b:
                     if(§§pop() < 3)
                     {
                        break loop0;
                     }
                     _loc8_ = param4 ? int(_loc15_ + ++_loc6_) : int(_loc6_ + _loc15_);
                     if(_loc8_ > _loc10_)
                     {
                        throw new ArgumentError("Incorrect indices.");
                     }
                     addr0178:
                     _loc14_ = param3[_loc6_];
                     if(_loc14_ < 0 || _loc14_ >= _loc9_)
                     {
                        throw new RangeError("Index is out of bounds.");
                     }
                     continue loop0;
                  }
                  _loc15_ = §§pop();
                  if(!(_loc21_ && Boolean(param2)))
                  {
                     addr0137:
                     §§push(_loc15_);
                     break loop21;
                  }
                  break;
                  _loc6_++;
               }
               throw new ArgumentError(_loc15_ + " vertices not enough.");
            }
         }
         throw new TypeError("Parameter vertices must be non-null.");
      }
      
      public function get vertices() : Dictionary
      {
         §§push(false);
         var _loc5_:Boolean = true;
         var _loc6_:* = §§pop();
         var _loc2_:* = undefined;
         var _loc1_:Dictionary = new Dictionary();
         for(_loc2_ in this._vertices)
         {
            if(!(_loc6_ && Boolean(_loc1_)))
            {
               _loc1_[_loc2_] = this._vertices[_loc2_];
            }
         }
         return _loc1_;
      }
      
      public function get faces() : Dictionary
      {
         var _temp_1:* = true;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = _temp_1;
         var _loc2_:* = undefined;
         var _loc1_:Dictionary = new Dictionary();
         var _loc3_:int = 0;
         for(_loc2_ in this._faces)
         {
            if(!(_loc5_ && Boolean(_loc3_)))
            {
               _loc1_[_loc2_] = this._faces[_loc2_];
            }
         }
         return _loc1_;
      }
      
      public function get orderedVertices() : Vector.<Vertex>
      {
         var _temp_1:* = true;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = _temp_1;
         var _loc5_:* = undefined;
         var _loc8_:* = 0;
         var _loc1_:Vector.<int> = new Vector.<int>();
         §§push(0);
         if(!_loc11_)
         {
            §§push(int(§§pop()));
         }
         var _loc2_:* = §§pop();
         var _loc3_:Vector.<Vertex> = new Vector.<Vertex>();
         §§push(0);
         if(!_loc11_)
         {
            §§push(int(§§pop()));
         }
         var _loc4_:* = §§pop();
         loop0:
         for(_loc5_ in this._vertices)
         {
            if(!_loc11_)
            {
               loop4:
               while(true)
               {
                  while(true)
                  {
                     if(_loc5_ is uint)
                     {
                        if(_loc12_)
                        {
                           _loc1_[_loc2_] = _loc5_;
                           if(_loc12_ || Boolean(_loc1_))
                           {
                              §§push(_loc2_);
                              if(_loc11_)
                              {
                                 break;
                              }
                              §§push(§§pop() + 1);
                              if(_loc12_ || Boolean(_loc1_))
                              {
                                 §§push(int(§§pop()));
                                 if(_loc11_ && Boolean(this))
                                 {
                                    break loop4;
                                 }
                              }
                              _loc2_ = §§pop();
                              if(_loc12_ || Boolean(_loc1_))
                              {
                                 addr00c4:
                                 continue loop0;
                              }
                           }
                           addr00da:
                           §§push(_loc4_);
                           if(!_loc11_)
                           {
                              §§push(§§pop() + 1);
                              if(!(_loc11_ && Boolean(this)))
                              {
                                 break;
                              }
                           }
                           break loop4;
                        }
                        §§goto(addr00c4);
                     }
                     else
                     {
                        _loc3_[_loc4_] = this._vertices[_loc5_];
                        if(!_loc12_)
                        {
                           continue loop0;
                        }
                     }
                     §§goto(addr00da);
                  }
                  §§push(int(§§pop()));
                  break;
               }
               _loc4_ = §§pop();
               continue;
            }
            §§goto(addr00c4);
         }
         while(true)
         {
            if(_loc12_ || Boolean(_loc3_))
            {
               if(_loc2_ <= 1)
               {
                  break;
               }
               if(_loc11_)
               {
                  break;
               }
            }
            this.sort(_loc1_,_loc2_);
            break;
         }
         var _loc6_:Vector.<Vertex> = new Vector.<Vertex>();
         §§push(0);
         if(!_loc11_)
         {
            §§push(int(§§pop()));
         }
         var _loc7_:* = §§pop();
         loop7:
         while(true)
         {
            loop8:
            while(true)
            {
               while(true)
               {
                  if(!(_loc11_ && Boolean(this)))
                  {
                     §§push(_loc2_);
                     §§push(1);
                     if(!_loc12_)
                     {
                        break;
                     }
                     §§push(int(§§pop() - §§pop()));
                     if(_loc11_ && Boolean(_loc1_))
                     {
                        break loop8;
                     }
                     _loc8_ = §§pop();
                     if(!(_loc12_ || Boolean(_loc2_)))
                     {
                        break loop7;
                     }
                  }
                  §§goto(addr017d);
               }
               §§goto(addr0279);
            }
            _loc8_ = int(§§pop() - 1);
            if(!_loc12_)
            {
               break;
            }
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
                        §§push(_loc8_);
                        if(!(_loc11_ && Boolean(_loc3_)))
                        {
                           §§push(0);
                           if(!(_loc12_ || Boolean(_loc2_)))
                           {
                              break loop9;
                           }
                           if(§§pop() < §§pop())
                           {
                              if(!(_loc12_ || Boolean(this)))
                              {
                                 break loop11;
                              }
                              §§push(0);
                              if(!(_loc12_ || Boolean(_loc3_)))
                              {
                                 break loop10;
                              }
                           }
                           else
                           {
                              _loc6_[_loc7_] = this._vertices[_loc1_[_loc8_]];
                              if(!(_loc11_ && Boolean(_loc2_)))
                              {
                                 §§push(_loc7_ + 1);
                                 if(_loc11_)
                                 {
                                    break loop10;
                                 }
                                 §§push(int(§§pop()));
                                 if(!_loc11_)
                                 {
                                    _loc7_ = §§pop();
                                    §§push(_loc8_);
                                    if(_loc11_ && Boolean(_loc2_))
                                    {
                                       break;
                                    }
                                    §§goto(addr01c2);
                                 }
                                 §§goto(addr0232);
                              }
                              §§goto(addr027d);
                           }
                        }
                        §§goto(addr020e);
                     }
                     §§goto(addr020f);
                  }
                  §§goto(addr0211);
               }
               §§goto(addr0259);
               addr01c2:
            }
            addr01cc:
            §§goto(addr01cc);
            addr017d:
         }
         loop2:
         while(true)
         {
            §§push(_loc8_);
            while(true)
            {
               addr0279:
               if(§§pop() < _loc4_)
               {
                  _loc6_[_loc7_] = _loc3_[_loc8_];
                  §§push(_loc7_);
                  if(_loc11_ && Boolean(_loc3_))
                  {
                     continue loop2;
                  }
                  §§push(int(§§pop() + 1));
                  if(!_loc12_)
                  {
                     continue;
                  }
                  _loc7_ = §§pop();
                  if(!(_loc11_ && Boolean(_loc3_)))
                  {
                     §§push(_loc8_);
                     if(!(_loc11_ && Boolean(this)))
                     {
                        addr0259:
                        §§push(§§pop() + 1);
                        if(_loc12_ || Boolean(_loc3_))
                        {
                           §§push(int(§§pop()));
                        }
                     }
                     continue loop2;
                  }
               }
               addr027d:
               return _loc6_;
            }
            _loc8_ = §§pop();
         }
         addr020f:
         _loc8_ = int(§§pop());
         addr0275:
         §§goto(addr0275);
         addr0211:
         addr020e:
      }
      
      public function get orderedFaces() : Vector.<Face>
      {
         §§push(false);
         var _loc11_:Boolean = true;
         var _loc12_:* = §§pop();
         var _loc5_:* = undefined;
         var _loc8_:* = 0;
         var _loc1_:Vector.<int> = new Vector.<int>();
         §§push(0);
         if(!(_loc12_ && Boolean(_loc3_)))
         {
            §§push(int(§§pop()));
         }
         var _loc2_:* = §§pop();
         var _loc3_:Vector.<Face> = new Vector.<Face>();
         §§push(0);
         if(_loc11_ || Boolean(_loc1_))
         {
            §§push(int(§§pop()));
         }
         var _loc4_:* = §§pop();
         loop0:
         for(_loc5_ in this._faces)
         {
            loop3:
            while(true)
            {
               while(true)
               {
                  if(!(_loc12_ && Boolean(this)))
                  {
                     if(!(_loc5_ is uint))
                     {
                        _loc3_[_loc4_] = this._faces[_loc5_];
                        if(!(_loc12_ && Boolean(this)))
                        {
                           §§push(_loc4_);
                           if(!_loc12_)
                           {
                              §§push(§§pop() + 1);
                              if(_loc11_ || Boolean(_loc3_))
                              {
                                 break;
                              }
                           }
                           break loop3;
                        }
                        continue loop0;
                     }
                     if(!(_loc11_ || Boolean(_loc3_)))
                     {
                        continue loop0;
                     }
                     _loc1_[_loc2_] = _loc5_;
                     if(_loc12_ && Boolean(_loc3_))
                     {
                        continue loop0;
                     }
                  }
                  §§push(_loc2_);
                  if(_loc12_ && Boolean(this))
                  {
                     break loop3;
                  }
                  §§push(§§pop() + 1);
                  if(!(_loc11_ || Boolean(this)))
                  {
                     break loop3;
                  }
                  §§push(int(§§pop()));
                  if(!_loc11_)
                  {
                     break;
                  }
                  _loc2_ = §§pop();
                  if(_loc11_)
                  {
                  }
                  continue loop0;
               }
               §§push(int(§§pop()));
               break;
            }
            _loc4_ = §§pop();
         }
         if(!_loc12_)
         {
            if(_loc2_ > 1)
            {
               if(!_loc12_)
               {
                  this.sort(_loc1_,_loc2_);
               }
            }
         }
         var _loc6_:Vector.<Face> = new Vector.<Face>();
         §§push(0);
         if(!(_loc12_ && Boolean(_loc1_)))
         {
            §§push(int(§§pop()));
         }
         var _loc7_:* = §§pop();
         §§push(_loc2_);
         §§push(1);
         if(_loc11_ || Boolean(_loc1_))
         {
            _loc8_ = int(§§pop() - §§pop());
            loop5:
            while(true)
            {
               if(!_loc12_)
               {
                  loop1:
                  while(true)
                  {
                     §§push(_loc8_);
                     §§push(0);
                     if(!_loc12_)
                     {
                        loop6:
                        while(true)
                        {
                           while(true)
                           {
                              if(§§pop() < §§pop())
                              {
                                 addr01d7:
                                 §§push(0);
                              }
                              else
                              {
                                 _loc6_[_loc7_] = this._faces[_loc1_[_loc8_]];
                                 §§push(_loc7_);
                                 if(!(_loc12_ && Boolean(_loc1_)))
                                 {
                                    §§push(§§pop() + 1);
                                    if(_loc12_ && Boolean(_loc1_))
                                    {
                                       break;
                                    }
                                    §§push(int(§§pop()));
                                    if(!_loc11_)
                                    {
                                       break loop6;
                                    }
                                    _loc7_ = §§pop();
                                    §§push(_loc8_ - 1);
                                    if(!_loc12_)
                                    {
                                       continue loop1;
                                    }
                                 }
                              }
                              _loc8_ = §§pop();
                              §§goto(addr0238);
                           }
                           §§push(_loc4_);
                           break loop5;
                        }
                        §§goto(addr020a);
                     }
                     break loop5;
                     _loc8_ = int(§§pop());
                  }
                  break;
               }
               §§goto(addr01d7);
            }
         }
         if(§§pop() < §§pop())
         {
            _loc6_[_loc7_] = _loc3_[_loc8_];
            if(_loc11_)
            {
               §§push(_loc7_);
               if(!(_loc11_ || Boolean(_loc1_)))
               {
                  break loop6;
               }
               §§push(§§pop() + 1);
               if(_loc11_)
               {
                  break loop6;
               }
               addr020a:
               _loc7_ = int(§§pop());
               §§push(_loc8_);
               if(_loc11_ || Boolean(_loc1_))
               {
                  §§push(int(§§pop() + 1));
               }
               _loc8_ = §§pop();
               if(_loc11_ || Boolean(_loc3_))
               {
                  do
                  {
                     §§push(_loc8_);
                     break loop7;
                     §§push(_loc8_);
                     if(_loc11_ || Boolean(_loc1_))
                     {
                        §§push(int(§§pop() + 1));
                     }
                     _loc8_ = §§pop();
                  }
                  while(_loc11_ || Boolean(_loc3_));
                  addr0238:
               }
               §§goto(addr0240);
            }
            §§goto(addr020c);
         }
         addr0240:
         return _loc6_;
      }
      
      public function weldVertices(param1:Number = 0, param2:Number = 0) : void
      {
         var _temp_1:* = true;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = _temp_1;
         var _loc3_:Vertex = null;
         var _loc6_:Face = null;
         var _loc7_:* = 0;
         var _loc8_:Wrapper = null;
         var _loc4_:Vector.<Vertex> = new Vector.<Vertex>();
         §§push(0);
         if(!_loc11_)
         {
            §§push(int(§§pop()));
         }
         var _loc5_:* = §§pop();
         var _loc9_:* = 0;
         var _loc10_:* = this._vertices;
         loop0:
         while(true)
         {
            §§push(§§hasnext(_loc10_,_loc9_));
            if(_loc11_ && Boolean(_loc3_))
            {
               break;
            }
            if(!§§pop())
            {
               if(_loc12_ || Boolean(param1))
               {
                  loop4:
                  while(true)
                  {
                     while(true)
                     {
                        if(_loc12_)
                        {
                           if(!_loc11_)
                           {
                              this.group(_loc4_,0,_loc5_,0,param1,param2,new Vector.<int>());
                           }
                           §§push(0);
                           if(_loc11_)
                           {
                              break;
                           }
                           _loc9_ = §§pop();
                           if(!(_loc12_ || Boolean(param2)))
                           {
                              break loop4;
                           }
                        }
                        _loc10_ = this._faces;
                        while(true)
                        {
                           §§push(§§hasnext(_loc10_,_loc9_));
                           break loop0;
                        }
                        addr0163:
                     }
                     _loc7_ = §§pop();
                     §§goto(addr01b6);
                  }
                  while(true)
                  {
                     if(_loc12_ || Boolean(_loc3_))
                     {
                        this._vertices = new Dictionary();
                        if(_loc12_)
                        {
                           this.vertexIdCounter = 0;
                           if(_loc11_ && Boolean(_loc3_))
                           {
                              break;
                           }
                        }
                     }
                     §§push(0);
                     if(_loc11_ && Boolean(param1))
                     {
                        break loop5;
                     }
                     §§push(int(§§pop()));
                     if(_loc12_)
                     {
                        break loop5;
                     }
                     addr022c:
                     if(§§pop() < _loc5_)
                     {
                        _loc3_ = _loc4_[_loc7_];
                        if(!_loc11_)
                        {
                           while(true)
                           {
                              if(_loc3_.value == null)
                              {
                                 if(!_loc11_)
                                 {
                                    addr01d8:
                                    this._vertices[this.vertexIdCounter] = _loc3_;
                                    if(_loc12_)
                                    {
                                       _loc9_ = this;
                                       _loc10_ = _loc9_.alternativa3d::vertexIdCounter + 1;
                                       if(!_loc11_)
                                       {
                                          _loc9_.alternativa3d::vertexIdCounter = _loc10_;
                                       }
                                       if(_loc12_)
                                       {
                                          addr0206:
                                          §§push(_loc7_);
                                          if(!_loc11_)
                                          {
                                             §§push(§§pop() + 1);
                                             if(_loc12_ || Boolean(param1))
                                             {
                                                §§push(int(§§pop()));
                                             }
                                          }
                                          _loc7_ = §§pop();
                                       }
                                    }
                                 }
                                 while(true)
                                 {
                                    §§goto(addr022c);
                                 }
                                 break loop5;
                                 addr022a:
                              }
                              §§goto(addr0206);
                           }
                           §§goto(addr0232);
                        }
                        §§goto(addr01d8);
                     }
                     addr0232:
                     return;
                  }
                  addr01b6:
                  §§goto(addr022a);
               }
               addr016a:
               break loop4;
            }
            _loc3_ = §§nextvalue(_loc9_,_loc10_);
            if(_loc12_)
            {
               _loc4_[_loc5_] = _loc3_;
               if(_loc12_)
               {
                  while(true)
                  {
                     §§push(_loc5_);
                     if(!(_loc11_ && Boolean(param1)))
                     {
                        §§push(§§pop() + 1);
                        if(!_loc12_)
                        {
                           break;
                        }
                     }
                     §§push(int(§§pop()));
                     break;
                  }
                  _loc5_ = §§pop();
               }
            }
         }
         if(§§pop())
         {
            _loc6_ = §§nextvalue(_loc9_,_loc10_);
            _loc8_ = _loc6_.wrapper;
            if(_loc12_ || Boolean(_loc3_))
            {
               while(_loc8_ != null)
               {
                  if(_loc8_.vertex.value != null)
                  {
                     if(!(_loc11_ && Boolean(this)))
                     {
                        _loc8_.vertex = _loc8_.vertex.value;
                        if(_loc11_ && Boolean(param2))
                        {
                           break;
                        }
                     }
                  }
                  _loc8_ = _loc8_.next;
               }
            }
            §§goto(addr0163);
         }
         §§goto(addr016a);
      }
      
      public function weldFaces(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Boolean = false) : void
      {
         §§push(false);
         var _loc67_:Boolean = true;
         var _loc68_:* = §§pop();
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = undefined;
         var _loc8_:Face = null;
         var _loc9_:Face = null;
         var _loc10_:Wrapper = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Wrapper = null;
         var _loc13_:Wrapper = null;
         var _loc14_:Wrapper = null;
         var _loc15_:Wrapper = null;
         var _loc16_:Wrapper = null;
         var _loc17_:Wrapper = null;
         var _loc18_:Vertex = null;
         var _loc19_:Vertex = null;
         var _loc20_:Vertex = null;
         var _loc21_:Vertex = null;
         var _loc22_:* = NaN;
         var _loc23_:* = NaN;
         var _loc24_:* = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:* = NaN;
         var _loc28_:* = NaN;
         var _loc29_:* = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:* = NaN;
         var _loc32_:* = NaN;
         var _loc33_:* = NaN;
         var _loc34_:* = NaN;
         var _loc35_:* = NaN;
         var _loc36_:Dictionary = null;
         var _loc40_:Vector.<Face> = null;
         var _loc41_:Dictionary = null;
         var _loc42_:Dictionary = null;
         var _loc43_:* = 0;
         var _loc44_:Number = NaN;
         var _loc45_:* = NaN;
         var _loc46_:* = NaN;
         var _loc47_:* = NaN;
         var _loc48_:Number = NaN;
         var _loc49_:Number = NaN;
         var _loc50_:Number = NaN;
         var _loc51_:Number = NaN;
         var _loc52_:* = NaN;
         var _loc53_:* = NaN;
         var _loc54_:* = NaN;
         var _loc55_:* = NaN;
         var _loc56_:Number = NaN;
         var _loc57_:* = NaN;
         var _loc58_:* = NaN;
         var _loc59_:* = NaN;
         var _loc60_:Number = NaN;
         var _loc61_:Number = NaN;
         var _loc62_:* = NaN;
         var _loc63_:* = false;
         var _loc64_:Face = null;
         §§push(0.001);
         if(!_loc68_)
         {
            §§push(Number(§§pop()));
         }
         var _loc37_:* = §§pop();
         if(_loc67_ || Boolean(param2))
         {
            loop26:
            while(true)
            {
               loop27:
               while(true)
               {
                  while(true)
                  {
                     §§push(Math.cos(param1) - _loc37_);
                     if(_loc67_)
                     {
                        param1 = §§pop();
                        if(_loc68_ && Boolean(param2))
                        {
                           break;
                        }
                        §§push(param2);
                        if(_loc68_ && Boolean(param1))
                        {
                           break loop27;
                        }
                        §§push(§§pop() + _loc37_);
                        if(!_loc67_)
                        {
                           break loop26;
                        }
                        §§push(Number(§§pop()));
                     }
                     param2 = §§pop();
                     if(!(_loc68_ && Boolean(param3)))
                     {
                        break;
                     }
                  }
                  §§push(Math.cos(Math.PI - param3) - _loc37_);
                  break;
               }
               §§push(Number(§§pop()));
               break;
            }
            param3 = §§pop();
         }
         var _loc38_:Dictionary = new Dictionary();
         var _loc39_:Dictionary = new Dictionary();
         loop0:
         for each(_loc9_ in this._faces)
         {
            _loc19_ = _loc9_.wrapper.vertex;
            _loc20_ = _loc9_.wrapper.next.vertex;
            §§push(_loc9_.wrapper.next);
            if(_loc67_)
            {
               §§push(§§pop().alternativa3d::next);
            }
            _loc21_ = §§pop().alternativa3d::vertex;
            _loc22_ = _loc20_.x - _loc19_.x;
            loop29:
            while(true)
            {
               loop30:
               while(true)
               {
                  loop35:
                  while(true)
                  {
                     while(true)
                     {
                        loop44:
                        while(true)
                        {
                           loop48:
                           while(true)
                           {
                              while(true)
                              {
                                 if(!_loc68_)
                                 {
                                    §§push(_loc20_.y);
                                    if(!(_loc68_ && Boolean(param3)))
                                    {
                                       §§push(_loc19_.y);
                                       if(_loc68_)
                                       {
                                          break;
                                       }
                                       _loc23_ = §§pop() - §§pop();
                                       §§push(_loc20_.z);
                                       §§push(_loc19_.z);
                                       if(_loc68_ && Boolean(this))
                                       {
                                          break loop48;
                                       }
                                       §§push(§§pop() - §§pop());
                                       if(_loc68_)
                                       {
                                          break loop44;
                                       }
                                       _loc24_ = Number(§§pop());
                                       §§push(_loc21_.x);
                                       §§push(_loc19_.x);
                                       if(!_loc67_)
                                       {
                                          continue loop46;
                                       }
                                       _loc27_ = §§pop() - §§pop();
                                       §§push(_loc21_.y);
                                       if(!(_loc67_ || Boolean(this)))
                                       {
                                          break loop35;
                                       }
                                       §§push(§§pop() - _loc19_.y);
                                       if(!(_loc67_ || Boolean(param3)))
                                       {
                                          break loop30;
                                       }
                                       _loc28_ = §§pop();
                                       if(!(_loc67_ || Boolean(param2)))
                                       {
                                          break loop29;
                                       }
                                    }
                                    else
                                    {
                                       §§goto(addr02c5);
                                    }
                                 }
                                 §§push(_loc21_.z - _loc19_.z);
                                 if(!_loc68_)
                                 {
                                    _loc29_ = Number(§§pop());
                                    §§push(_loc29_);
                                    §§push(_loc23_);
                                    if(!_loc68_)
                                    {
                                       continue loop46;
                                    }
                                    §§goto(addr0303);
                                 }
                                 else
                                 {
                                    §§goto(addr028a);
                                 }
                              }
                              §§goto(addr028c);
                           }
                           §§goto(addr02f4);
                        }
                        §§goto(addr02f2);
                     }
                     loop45:
                     while(true)
                     {
                        loop46:
                        while(true)
                        {
                           while(true)
                           {
                              §§push(§§pop() * §§pop());
                              §§push(_loc28_);
                              §§push(_loc24_);
                              if(!_loc68_)
                              {
                                 §§push(§§pop() - §§pop() * §§pop());
                                 if(_loc68_ && Boolean(param1))
                                 {
                                    break;
                                 }
                                 _loc32_ = §§pop();
                                 §§push(_loc27_ * _loc24_);
                                 §§push(_loc29_);
                                 §§push(_loc22_);
                                 if(!(_loc67_ || Boolean(param2)))
                                 {
                                    break loop46;
                                 }
                                 §§push(§§pop() * §§pop());
                                 if(_loc68_)
                                 {
                                    break loop45;
                                 }
                                 §§push(§§pop() - §§pop());
                                 if(!(_loc68_ && Boolean(param2)))
                                 {
                                    break loop35;
                                 }
                              }
                              else
                              {
                                 §§goto(addr02e8);
                              }
                              §§goto(addr02ea);
                           }
                           §§goto(addr02ef);
                        }
                        §§goto(addr02fc);
                     }
                     §§goto(addr031d);
                  }
                  loop37:
                  while(true)
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
                              §§push(Number(§§pop()));
                              if(_loc67_ || Boolean(this))
                              {
                                 _loc33_ = §§pop();
                                 addr02c5:
                                 loop41:
                                 while(true)
                                 {
                                    loop42:
                                    while(true)
                                    {
                                       §§push(_loc28_ * _loc22_);
                                       §§push(_loc27_);
                                       if(_loc67_ || Boolean(param2))
                                       {
                                          while(true)
                                          {
                                             §§push(_loc23_);
                                             if(_loc67_ || Boolean(this))
                                             {
                                                addr02ea:
                                                _loc34_ = §§pop() - §§pop() * §§pop();
                                                addr02e8:
                                                addr02ef:
                                                addr02f2:
                                                addr02f4:
                                                §§push(_loc32_ * _loc32_);
                                                §§push(_loc33_);
                                                §§push(_loc33_);
                                                if(_loc68_)
                                                {
                                                   break;
                                                }
                                             }
                                             addr02fc:
                                             §§push(§§pop() * §§pop());
                                             if(_loc67_)
                                             {
                                                addr0303:
                                                §§push(§§pop() + §§pop());
                                                if(_loc67_)
                                                {
                                                   §§push(_loc34_);
                                                   if(!(_loc68_ && Boolean(this)))
                                                   {
                                                      §§push(_loc34_);
                                                      break;
                                                   }
                                                   break loop39;
                                                }
                                                break loop40;
                                             }
                                             addr031d:
                                             _loc35_ = §§pop() + §§pop();
                                             if(!(_loc67_ || Boolean(param1)))
                                             {
                                                break loop42;
                                             }
                                             §§push(_loc35_);
                                             if(!_loc67_)
                                             {
                                                break loop41;
                                             }
                                             §§push(_loc37_);
                                             if(_loc68_)
                                             {
                                                break loop39;
                                             }
                                          }
                                          §§goto(addr031d);
                                       }
                                       if(§§pop() > §§pop())
                                       {
                                          _loc35_ = 1 / Math.sqrt(_loc35_);
                                          break;
                                       }
                                       continue loop0;
                                    }
                                    §§push(_loc32_);
                                    if(!_loc68_)
                                    {
                                       §§push(§§pop() * _loc35_);
                                       if(!_loc68_)
                                       {
                                          break;
                                       }
                                       break loop37;
                                    }
                                    break loop38;
                                 }
                                 _loc32_ = §§pop();
                                 §§push(_loc33_);
                                 if(_loc68_)
                                 {
                                    break loop37;
                                 }
                              }
                              §§push(_loc35_);
                              break loop39;
                           }
                           _loc33_ = §§pop();
                           §§push(_loc34_);
                           break loop37;
                        }
                        §§push(§§pop() * §§pop());
                        break loop40;
                     }
                     §§push(Number(§§pop()));
                     break loop30;
                  }
                  §§push(§§pop() * _loc35_);
                  if(_loc67_)
                  {
                     break loop38;
                  }
                  break;
               }
               _loc34_ = §§pop();
               _loc9_.normalX = _loc32_;
               if(_loc67_)
               {
                  _loc9_.normalY = _loc33_;
                  _loc9_.normalZ = _loc34_;
                  if(!_loc68_)
                  {
                     break;
                  }
                  §§goto(addr040b);
               }
               §§goto(addr0412);
            }
            §§push(_loc9_);
            §§push(_loc19_.x);
            if(!_loc68_)
            {
               loop31:
               while(true)
               {
                  §§push(_loc32_);
                  if(_loc67_)
                  {
                     loop32:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(§§pop() * §§pop());
                           if(!(_loc68_ && Boolean(param1)))
                           {
                              §§push(_loc19_.y);
                              if(!(_loc67_ || Boolean(this)))
                              {
                                 break loop32;
                              }
                              §§push(_loc33_);
                              if(!(_loc67_ || Boolean(param3)))
                              {
                                 break;
                              }
                              §§push(§§pop() * §§pop());
                              if(!_loc67_)
                              {
                                 break loop32;
                              }
                              §§push(§§pop() + §§pop());
                              if(_loc68_ && Boolean(param1))
                              {
                                 break loop31;
                              }
                           }
                           §§push(_loc19_.z);
                           if(_loc67_)
                           {
                              break loop32;
                           }
                        }
                     }
                     §§push(_loc34_);
                     break loop33;
                  }
                  §§push(§§pop() + §§pop());
                  break;
               }
            }
            §§pop().alternativa3d::offset = §§pop();
            addr040b:
            _loc38_[_loc9_] = true;
            addr0412:
            _loc14_ = _loc9_.wrapper;
            if(!(_loc68_ && Boolean(this)))
            {
               loop2:
               for(; _loc14_ != null; _loc14_ = _loc14_.next)
               {
                  _loc18_ = _loc14_.vertex;
                  _loc36_ = _loc39_[_loc18_];
                  while(true)
                  {
                     if(_loc67_)
                     {
                        if(_loc36_ != null)
                        {
                           break;
                        }
                        if(_loc68_ && Boolean(param1))
                        {
                           continue loop2;
                        }
                     }
                     _loc36_ = new Dictionary();
                     if(_loc67_ || Boolean(param3))
                     {
                        _loc39_[_loc18_] = _loc36_;
                     }
                     break;
                  }
                  _loc36_[_loc9_] = true;
               }
            }
         }
         while(true)
         {
            if(_loc67_ || Boolean(this))
            {
               this._faces = new Dictionary();
               if(_loc68_ && Boolean(param2))
               {
                  break;
               }
            }
            this.faceIdCounter = 0;
            break;
         }
         _loc40_ = new Vector.<Face>();
         _loc41_ = new Dictionary();
         _loc42_ = new Dictionary();
         if(_loc67_ || Boolean(param2))
         {
            loop1:
            while(true)
            {
               _loc9_ = null;
               var _loc65_:* = 0;
               var _loc66_:* = _loc38_;
               for(_loc7_ in _loc66_)
               {
                  _loc9_ = _loc7_;
                  if(_loc67_ || Boolean(param1))
                  {
                     delete _loc38_[_loc7_];
                  }
               }
               loop51:
               while(true)
               {
                  loop52:
                  while(true)
                  {
                     while(true)
                     {
                        if(!(_loc68_ && Boolean(param2)))
                        {
                           if(_loc9_ == null)
                           {
                              if(_loc67_)
                              {
                                 break;
                              }
                              break loop51;
                           }
                           §§push(0);
                           if(_loc68_ && Boolean(this))
                           {
                              break loop52;
                           }
                           §§push(int(§§pop()));
                           if(!_loc67_)
                           {
                              break loop52;
                           }
                           _loc43_ = §§pop();
                           if(!_loc67_)
                           {
                              break loop51;
                           }
                        }
                        _loc40_[_loc43_] = _loc9_;
                        if(!(_loc68_ && Boolean(param2)))
                        {
                           break loop51;
                        }
                        §§goto(addr05a3);
                     }
                     break loop14;
                  }
                  _loc43_ = §§pop();
                  addr05a3:
                  _loc19_ = _loc9_.wrapper.vertex;
                  _loc20_ = _loc9_.wrapper.next.vertex;
                  §§push(_loc9_.wrapper.next);
                  if(!(_loc68_ && Boolean(this)))
                  {
                     §§push(§§pop().alternativa3d::next);
                  }
                  _loc21_ = §§pop().alternativa3d::vertex;
                  _loc22_ = _loc20_.x - _loc19_.x;
                  loop54:
                  while(true)
                  {
                     while(true)
                     {
                        loop120:
                        while(true)
                        {
                           loop138:
                           while(true)
                           {
                              loop140:
                              while(true)
                              {
                                 loop141:
                                 while(true)
                                 {
                                    loop145:
                                    while(true)
                                    {
                                       loop146:
                                       while(true)
                                       {
                                          loop147:
                                          while(true)
                                          {
                                             loop148:
                                             while(true)
                                             {
                                                loop149:
                                                while(true)
                                                {
                                                   loop150:
                                                   while(true)
                                                   {
                                                      loop151:
                                                      while(true)
                                                      {
                                                         loop152:
                                                         while(true)
                                                         {
                                                            loop153:
                                                            while(true)
                                                            {
                                                               loop154:
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
                                                                           loop166:
                                                                           while(true)
                                                                           {
                                                                              loop167:
                                                                              while(true)
                                                                              {
                                                                                 loop168:
                                                                                 while(true)
                                                                                 {
                                                                                    loop169:
                                                                                    while(true)
                                                                                    {
                                                                                       loop170:
                                                                                       while(true)
                                                                                       {
                                                                                          loop171:
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
                                                                                                      if(!_loc68_)
                                                                                                      {
                                                                                                         §§push(_loc20_.y - _loc19_.y);
                                                                                                         if(_loc68_ && Boolean(param1))
                                                                                                         {
                                                                                                            break loop146;
                                                                                                         }
                                                                                                         _loc23_ = Number(§§pop());
                                                                                                         if(!_loc67_)
                                                                                                         {
                                                                                                            break loop145;
                                                                                                         }
                                                                                                         loop175:
                                                                                                         while(true)
                                                                                                         {
                                                                                                            loop176:
                                                                                                            while(true)
                                                                                                            {
                                                                                                               loop177:
                                                                                                               while(true)
                                                                                                               {
                                                                                                                  while(true)
                                                                                                                  {
                                                                                                                     §§push(_loc20_.z - _loc19_.z);
                                                                                                                     if(!(_loc68_ && Boolean(this)))
                                                                                                                     {
                                                                                                                        _loc24_ = §§pop();
                                                                                                                        if(!(_loc67_ || Boolean(param2)))
                                                                                                                        {
                                                                                                                           break loop141;
                                                                                                                        }
                                                                                                                        _loc25_ = _loc20_.u - _loc19_.u;
                                                                                                                        _loc26_ = _loc20_.v - _loc19_.v;
                                                                                                                        if(!(_loc67_ || Boolean(this)))
                                                                                                                        {
                                                                                                                           break loop140;
                                                                                                                        }
                                                                                                                        §§push(_loc21_.x - _loc19_.x);
                                                                                                                        if(_loc68_ && Boolean(param1))
                                                                                                                        {
                                                                                                                           break loop138;
                                                                                                                        }
                                                                                                                        _loc27_ = §§pop();
                                                                                                                        §§push(_loc21_.y - _loc19_.y);
                                                                                                                        if(!(_loc68_ && Boolean(param3)))
                                                                                                                        {
                                                                                                                           _loc28_ = Number(§§pop());
                                                                                                                           §§push(_loc21_.z - _loc19_.z);
                                                                                                                           if(!(_loc67_ || Boolean(this)))
                                                                                                                           {
                                                                                                                              break loop120;
                                                                                                                           }
                                                                                                                           §§push(Number(§§pop()));
                                                                                                                           if(!(_loc67_ || Boolean(param1)))
                                                                                                                           {
                                                                                                                              break loop176;
                                                                                                                           }
                                                                                                                           _loc29_ = §§pop();
                                                                                                                           if(!_loc67_)
                                                                                                                           {
                                                                                                                              break loop59;
                                                                                                                           }
                                                                                                                           §§push(_loc21_.u);
                                                                                                                           §§push(_loc19_.u);
                                                                                                                           if(_loc68_ && Boolean(param1))
                                                                                                                           {
                                                                                                                              continue loop121;
                                                                                                                           }
                                                                                                                           _loc30_ = §§pop() - §§pop();
                                                                                                                           §§push(_loc21_.v);
                                                                                                                           if(!_loc67_)
                                                                                                                           {
                                                                                                                              break;
                                                                                                                           }
                                                                                                                           §§push(§§pop() - _loc19_.v);
                                                                                                                        }
                                                                                                                        §§push(Number(§§pop()));
                                                                                                                        if(!(_loc67_ || Boolean(this)))
                                                                                                                        {
                                                                                                                           break loop177;
                                                                                                                        }
                                                                                                                        _loc31_ = §§pop();
                                                                                                                        if(!_loc67_)
                                                                                                                        {
                                                                                                                           break loop151;
                                                                                                                        }
                                                                                                                        §§push(_loc9_.normalX);
                                                                                                                        if(_loc68_ && Boolean(param2))
                                                                                                                        {
                                                                                                                           break loop150;
                                                                                                                        }
                                                                                                                        _loc32_ = §§pop();
                                                                                                                        if(_loc68_)
                                                                                                                        {
                                                                                                                           break loop140;
                                                                                                                        }
                                                                                                                        §§push(_loc9_.normalY);
                                                                                                                        if(!(_loc67_ || Boolean(param1)))
                                                                                                                        {
                                                                                                                           break loop176;
                                                                                                                        }
                                                                                                                        §§push(Number(§§pop()));
                                                                                                                        if(_loc68_)
                                                                                                                        {
                                                                                                                           §§goto(addr0a23);
                                                                                                                        }
                                                                                                                     }
                                                                                                                     _loc33_ = §§pop();
                                                                                                                     if(!(_loc67_ || Boolean(param3)))
                                                                                                                     {
                                                                                                                        break loop59;
                                                                                                                     }
                                                                                                                     _loc34_ = _loc9_.normalZ;
                                                                                                                     if(_loc68_ && Boolean(param2))
                                                                                                                     {
                                                                                                                        break loop172;
                                                                                                                     }
                                                                                                                     §§push(-_loc32_);
                                                                                                                     if(!(_loc67_ || Boolean(this)))
                                                                                                                     {
                                                                                                                        break loop176;
                                                                                                                     }
                                                                                                                     §§push(_loc28_);
                                                                                                                     if(_loc68_ && Boolean(this))
                                                                                                                     {
                                                                                                                        continue loop158;
                                                                                                                     }
                                                                                                                     §§push(§§pop() * §§pop());
                                                                                                                     if(!_loc67_)
                                                                                                                     {
                                                                                                                        break loop171;
                                                                                                                     }
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        §§push(§§pop() * _loc24_);
                                                                                                                        §§push(_loc27_);
                                                                                                                        §§push(_loc33_);
                                                                                                                        if(!_loc68_)
                                                                                                                        {
                                                                                                                           §§push(§§pop() * §§pop());
                                                                                                                           §§push(_loc24_);
                                                                                                                           if(!(_loc67_ || Boolean(param1)))
                                                                                                                           {
                                                                                                                              break;
                                                                                                                           }
                                                                                                                           §§push(§§pop() * §§pop());
                                                                                                                           if(_loc67_ || Boolean(this))
                                                                                                                           {
                                                                                                                              §§push(§§pop() + §§pop());
                                                                                                                              §§push(_loc32_ * _loc23_);
                                                                                                                              §§push(_loc29_);
                                                                                                                              if(_loc67_)
                                                                                                                              {
                                                                                                                                 §§push(§§pop() + §§pop() * §§pop());
                                                                                                                                 §§push(_loc22_);
                                                                                                                                 if(_loc68_)
                                                                                                                                 {
                                                                                                                                    break loop170;
                                                                                                                                 }
                                                                                                                                 §§push(_loc33_);
                                                                                                                                 if(_loc68_)
                                                                                                                                 {
                                                                                                                                    break loop169;
                                                                                                                                 }
                                                                                                                                 §§push(§§pop() * §§pop());
                                                                                                                                 if(_loc67_ || Boolean(param1))
                                                                                                                                 {
                                                                                                                                    §§push(_loc29_);
                                                                                                                                    if(!_loc68_)
                                                                                                                                    {
                                                                                                                                       §§push(§§pop() - §§pop() * §§pop());
                                                                                                                                       if(!_loc68_)
                                                                                                                                       {
                                                                                                                                          break loop177;
                                                                                                                                       }
                                                                                                                                       break loop168;
                                                                                                                                    }
                                                                                                                                    §§goto(addr0b6b);
                                                                                                                                 }
                                                                                                                                 else
                                                                                                                                 {
                                                                                                                                    §§goto(addr0a7b);
                                                                                                                                 }
                                                                                                                              }
                                                                                                                              §§goto(addr0a7d);
                                                                                                                           }
                                                                                                                           §§goto(addr080b);
                                                                                                                        }
                                                                                                                        §§goto(addr082a);
                                                                                                                     }
                                                                                                                     §§goto(addr08f0);
                                                                                                                  }
                                                                                                                  §§goto(addr08a2);
                                                                                                               }
                                                                                                               §§push(_loc27_);
                                                                                                               if(!_loc67_)
                                                                                                               {
                                                                                                                  break loop152;
                                                                                                               }
                                                                                                               §§push(_loc23_);
                                                                                                               if(!(_loc68_ && Boolean(param3)))
                                                                                                               {
                                                                                                                  §§push(§§pop() * §§pop());
                                                                                                                  if(!(_loc68_ && Boolean(param2)))
                                                                                                                  {
                                                                                                                     addr080b:
                                                                                                                     §§push(§§pop() - §§pop() * _loc34_);
                                                                                                                     if(!(_loc68_ && Boolean(param3)))
                                                                                                                     {
                                                                                                                        §§push(_loc22_);
                                                                                                                        §§push(_loc28_);
                                                                                                                        if(_loc67_)
                                                                                                                        {
                                                                                                                           addr082a:
                                                                                                                           §§push(§§pop() + §§pop() * §§pop() * _loc34_);
                                                                                                                           if(!_loc68_)
                                                                                                                           {
                                                                                                                              _loc44_ = §§pop();
                                                                                                                              §§push(_loc33_);
                                                                                                                              if(!_loc68_)
                                                                                                                              {
                                                                                                                                 §§push(-§§pop());
                                                                                                                                 §§push(_loc29_);
                                                                                                                                 if(_loc67_)
                                                                                                                                 {
                                                                                                                                    §§push(§§pop() * §§pop());
                                                                                                                                    §§push(_loc28_ * _loc34_);
                                                                                                                                    if(!(_loc68_ && Boolean(param1)))
                                                                                                                                    {
                                                                                                                                       §§push(§§pop() + §§pop());
                                                                                                                                       §§push(_loc44_);
                                                                                                                                       if(!_loc68_)
                                                                                                                                       {
                                                                                                                                          §§push(§§pop() / §§pop());
                                                                                                                                          break;
                                                                                                                                       }
                                                                                                                                       break loop129;
                                                                                                                                    }
                                                                                                                                    break loop152;
                                                                                                                                 }
                                                                                                                                 break loop153;
                                                                                                                              }
                                                                                                                              break loop154;
                                                                                                                           }
                                                                                                                           break loop162;
                                                                                                                        }
                                                                                                                        break loop163;
                                                                                                                     }
                                                                                                                     break loop164;
                                                                                                                  }
                                                                                                                  break loop166;
                                                                                                               }
                                                                                                               §§goto(addr09a4);
                                                                                                            }
                                                                                                            while(true)
                                                                                                            {
                                                                                                               §§push(Number(§§pop()));
                                                                                                               if(_loc67_ || Boolean(this))
                                                                                                               {
                                                                                                                  _loc45_ = §§pop();
                                                                                                                  §§push(_loc32_);
                                                                                                                  §§push(_loc29_);
                                                                                                                  if(!(_loc67_ || Boolean(param1)))
                                                                                                                  {
                                                                                                                     break loop149;
                                                                                                                  }
                                                                                                                  §§push(§§pop() * §§pop());
                                                                                                                  §§push(_loc27_);
                                                                                                                  if(!_loc67_)
                                                                                                                  {
                                                                                                                     break loop148;
                                                                                                                  }
                                                                                                                  §§push(_loc34_);
                                                                                                                  if(_loc68_ && Boolean(this))
                                                                                                                  {
                                                                                                                     break loop147;
                                                                                                                  }
                                                                                                                  §§push(§§pop() - §§pop() * §§pop());
                                                                                                                  §§push(_loc44_);
                                                                                                                  if(!_loc67_)
                                                                                                                  {
                                                                                                                     break loop54;
                                                                                                                  }
                                                                                                                  §§push(§§pop() / §§pop());
                                                                                                                  if(_loc67_ || Boolean(param2))
                                                                                                                  {
                                                                                                                     _loc46_ = §§pop();
                                                                                                                     if(_loc68_ && Boolean(param2))
                                                                                                                     {
                                                                                                                        break;
                                                                                                                     }
                                                                                                                     §§push(-_loc32_);
                                                                                                                     §§push(_loc28_);
                                                                                                                     if(!(_loc67_ || Boolean(this)))
                                                                                                                     {
                                                                                                                        break loop174;
                                                                                                                     }
                                                                                                                     §§push(§§pop() * §§pop());
                                                                                                                     if(_loc68_ && Boolean(param1))
                                                                                                                     {
                                                                                                                        break loop175;
                                                                                                                     }
                                                                                                                     §§push(§§pop() + _loc27_ * _loc33_);
                                                                                                                  }
                                                                                                                  §§push(§§pop() / _loc44_);
                                                                                                                  if(_loc68_ && Boolean(param2))
                                                                                                                  {
                                                                                                                     break loop164;
                                                                                                                  }
                                                                                                               }
                                                                                                               _loc47_ = §§pop();
                                                                                                               break;
                                                                                                            }
                                                                                                         }
                                                                                                         §§goto(addr0a24);
                                                                                                      }
                                                                                                      §§push(_loc19_.x);
                                                                                                      if(!(_loc67_ || Boolean(param2)))
                                                                                                      {
                                                                                                         break loop173;
                                                                                                      }
                                                                                                      §§push(§§pop() * _loc33_);
                                                                                                      §§push(_loc29_);
                                                                                                      if(!(_loc68_ && Boolean(this)))
                                                                                                      {
                                                                                                         §§push(§§pop() * §§pop());
                                                                                                         §§push(_loc32_);
                                                                                                         if(_loc67_ || Boolean(param3))
                                                                                                         {
                                                                                                            §§push(§§pop() * _loc19_.y);
                                                                                                            §§push(_loc29_);
                                                                                                            if(!_loc68_)
                                                                                                            {
                                                                                                               break loop163;
                                                                                                            }
                                                                                                            break loop167;
                                                                                                         }
                                                                                                         break loop142;
                                                                                                      }
                                                                                                      §§goto(addr0a4e);
                                                                                                   }
                                                                                                   §§goto(addr0b9c);
                                                                                                }
                                                                                                §§goto(addr0a2f);
                                                                                             }
                                                                                             §§goto(addr0b8a);
                                                                                          }
                                                                                          §§goto(addr0bfb);
                                                                                       }
                                                                                       §§goto(addr0bf1);
                                                                                    }
                                                                                    §§goto(addr0ac4);
                                                                                 }
                                                                                 §§goto(addr0976);
                                                                              }
                                                                              §§goto(addr0ab5);
                                                                           }
                                                                           §§goto(addr0aed);
                                                                        }
                                                                        §§goto(addr0a05);
                                                                     }
                                                                     §§push(§§pop() - §§pop() * §§pop());
                                                                     if(_loc68_)
                                                                     {
                                                                        break loop164;
                                                                     }
                                                                     while(true)
                                                                     {
                                                                        §§push(_loc19_.x);
                                                                        §§push(_loc28_);
                                                                        if(_loc67_ || Boolean(param1))
                                                                        {
                                                                           §§push(§§pop() * §§pop());
                                                                           §§push(_loc34_);
                                                                           if(!_loc68_)
                                                                           {
                                                                              §§push(§§pop() * §§pop());
                                                                              if(_loc67_)
                                                                              {
                                                                                 break loop153;
                                                                              }
                                                                              break loop158;
                                                                           }
                                                                           §§goto(addr0c5e);
                                                                        }
                                                                        §§goto(addr0cfc);
                                                                     }
                                                                     §§goto(addr0d0b);
                                                                  }
                                                                  §§goto(addr0aaf);
                                                               }
                                                               §§goto(addr0d0c);
                                                            }
                                                            addr0976:
                                                            §§push(§§pop() - §§pop() + _loc27_ * _loc19_.y * _loc34_);
                                                            §§push(_loc32_ * _loc28_);
                                                            if(_loc67_ || Boolean(param2))
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
                                                                           while(true)
                                                                           {
                                                                              §§push(§§pop() + §§pop() * _loc19_.z);
                                                                              §§push(_loc27_);
                                                                              if(_loc67_)
                                                                              {
                                                                                 addr09a4:
                                                                                 §§push(§§pop() * _loc33_);
                                                                                 if(!(_loc67_ || Boolean(this)))
                                                                                 {
                                                                                    break;
                                                                                 }
                                                                                 §§push(§§pop() * _loc19_.z);
                                                                                 if(!(_loc68_ && Boolean(param3)))
                                                                                 {
                                                                                    §§push(§§pop() - §§pop());
                                                                                    if(!(_loc68_ && Boolean(param1)))
                                                                                    {
                                                                                       §§push(_loc44_);
                                                                                       if(_loc68_)
                                                                                       {
                                                                                          break loop158;
                                                                                       }
                                                                                       §§push(§§pop() / §§pop());
                                                                                       if(_loc68_ && Boolean(this))
                                                                                       {
                                                                                          break loop157;
                                                                                       }
                                                                                    }
                                                                                    _loc48_ = §§pop();
                                                                                    if(_loc67_ || Boolean(param1))
                                                                                    {
                                                                                       §§push(_loc33_);
                                                                                       if(!_loc67_)
                                                                                       {
                                                                                          break loop157;
                                                                                       }
                                                                                       §§push(_loc24_);
                                                                                       if(_loc68_)
                                                                                       {
                                                                                          break loop156;
                                                                                       }
                                                                                       §§push(§§pop() * §§pop());
                                                                                       §§push(_loc23_ * _loc34_);
                                                                                       if(_loc68_)
                                                                                       {
                                                                                          break loop155;
                                                                                       }
                                                                                       §§push(§§pop() - §§pop());
                                                                                       §§push(_loc44_);
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       §§goto(addr0d5b);
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    §§goto(addr0a84);
                                                                                 }
                                                                              }
                                                                              while(true)
                                                                              {
                                                                                 while(true)
                                                                                 {
                                                                                    §§push(§§pop() / §§pop());
                                                                                    if(!_loc68_)
                                                                                    {
                                                                                       addr0a24:
                                                                                       _loc49_ = §§pop();
                                                                                       addr0a2f:
                                                                                       addr0a23:
                                                                                       §§push(_loc32_);
                                                                                       if(!_loc68_)
                                                                                       {
                                                                                          §§push(-§§pop());
                                                                                       }
                                                                                       §§push(_loc24_);
                                                                                       break loop148;
                                                                                    }
                                                                                    §§goto(addr0b9a);
                                                                                 }
                                                                                 §§goto(addr0d14);
                                                                              }
                                                                              §§goto(addr0cdf);
                                                                           }
                                                                           §§goto(addr0ab3);
                                                                        }
                                                                        §§goto(addr0d10);
                                                                     }
                                                                     §§goto(addr0aeb);
                                                                  }
                                                                  §§goto(addr0c5c);
                                                               }
                                                               §§goto(addr0be0);
                                                            }
                                                            §§goto(addr0c19);
                                                         }
                                                         §§goto(addr0cc9);
                                                      }
                                                      §§goto(addr135b);
                                                   }
                                                   §§goto(addr0bd0);
                                                }
                                                §§goto(addr0b17);
                                             }
                                             §§push(§§pop() * §§pop());
                                             §§push(_loc22_);
                                             if(!_loc68_)
                                             {
                                                §§push(§§pop() + §§pop() * _loc34_);
                                                if(!(_loc68_ && Boolean(param2)))
                                                {
                                                   addr0a4e:
                                                   §§push(§§pop() / _loc44_);
                                                   if(_loc67_ || Boolean(param1))
                                                   {
                                                      _loc50_ = §§pop();
                                                      break loop140;
                                                   }
                                                   §§goto(addr0c14);
                                                }
                                                else
                                                {
                                                   §§goto(addr0a85);
                                                }
                                             }
                                             §§goto(addr0c65);
                                          }
                                          §§goto(addr0c8a);
                                       }
                                       §§goto(addr0c43);
                                    }
                                    §§goto(addr0c7b);
                                 }
                                 §§goto(addr134d);
                              }
                              loop142:
                              while(true)
                              {
                                 loop143:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(_loc32_ * _loc23_);
                                       if(_loc67_ || Boolean(this))
                                       {
                                          §§push(_loc22_);
                                          if(_loc68_)
                                          {
                                             break;
                                          }
                                          §§push(§§pop() * _loc33_);
                                          if(_loc68_)
                                          {
                                             break loop143;
                                          }
                                          §§push(§§pop() - §§pop());
                                          §§push(_loc44_);
                                          if(!(_loc67_ || Boolean(this)))
                                          {
                                             break loop142;
                                          }
                                          _loc51_ = §§pop() / §§pop();
                                          §§push(_loc32_);
                                          if(_loc68_)
                                          {
                                             break loop124;
                                          }
                                       }
                                       addr0ab3:
                                       addr0ab5:
                                       §§push(_loc19_.y);
                                       if(!_loc68_)
                                       {
                                          addr0aaf:
                                          §§push(§§pop() * §§pop() * _loc24_);
                                          §§push(_loc19_.x);
                                       }
                                       §§push(§§pop() * _loc33_);
                                       if(!_loc68_)
                                       {
                                          §§push(_loc24_);
                                          if(!_loc68_)
                                          {
                                             addr0ac4:
                                             §§push(§§pop() * §§pop());
                                             continue loop121;
                                          }
                                          §§goto(addr0adb);
                                       }
                                       §§goto(addr0afe);
                                    }
                                    §§goto(addr0d0b);
                                 }
                                 §§goto(addr0bf4);
                              }
                              §§goto(addr0b41);
                           }
                           §§goto(addr0cad);
                        }
                        §§push(Number(§§pop()));
                        if(_loc67_ || Boolean(this))
                        {
                           _loc54_ = §§pop();
                           while(true)
                           {
                              if(_loc67_)
                              {
                                 §§push(_loc25_);
                                 if(_loc68_ && Boolean(param3))
                                 {
                                    break loop130;
                                 }
                                 §§push(_loc47_);
                                 if(!(_loc67_ || Boolean(this)))
                                 {
                                    break loop134;
                                 }
                                 §§push(§§pop() * §§pop());
                                 §§push(_loc30_);
                                 if(_loc68_ && Boolean(param2))
                                 {
                                    break loop133;
                                 }
                                 §§goto(addr0bf1);
                              }
                              §§goto(addr23ab);
                           }
                           §§goto(addr2456);
                        }
                        §§goto(addr0c17);
                     }
                     loop121:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(§§pop() - §§pop());
                           §§push(_loc19_.x * _loc23_);
                           if(_loc67_)
                           {
                              §§push(_loc34_);
                              if(_loc67_)
                              {
                                 addr0adb:
                                 §§push(§§pop() * §§pop());
                                 if(_loc68_ && Boolean(param2))
                                 {
                                    break;
                                 }
                                 §§push(§§pop() + §§pop());
                                 §§push(_loc22_ * _loc19_.y);
                                 §§push(_loc34_);
                              }
                              §§push(§§pop() - §§pop() * §§pop());
                              if(!_loc67_)
                              {
                                 break loop121;
                              }
                              §§push(_loc32_);
                           }
                           addr0afe:
                           §§push(§§pop() * _loc23_ * _loc19_.z);
                           if(_loc68_ && Boolean(param3))
                           {
                              break loop125;
                           }
                           loop128:
                           while(true)
                           {
                              §§push(§§pop() - §§pop());
                              §§push(_loc22_);
                              §§push(_loc33_);
                              if(!_loc68_)
                              {
                                 §§push(§§pop() * §§pop());
                                 if(!(_loc67_ || Boolean(this)))
                                 {
                                    break;
                                 }
                                 §§push(_loc19_.z);
                              }
                              §§push(§§pop() * §§pop());
                              if(!(_loc67_ || Boolean(this)))
                              {
                                 continue loop125;
                              }
                              §§push(§§pop() + §§pop());
                              §§push(_loc44_);
                              if(!_loc67_)
                              {
                                 break loop54;
                              }
                              while(true)
                              {
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       §§push(§§pop() / §§pop());
                                       if(!_loc68_)
                                       {
                                          _loc52_ = §§pop();
                                          loop132:
                                          while(true)
                                          {
                                             loop133:
                                             while(true)
                                             {
                                                loop134:
                                                while(true)
                                                {
                                                   while(true)
                                                   {
                                                      §§push(_loc25_ * _loc45_);
                                                      if(!(_loc68_ && Boolean(this)))
                                                      {
                                                         addr0b6b:
                                                         §§push(_loc30_ * _loc49_);
                                                         if(!_loc68_)
                                                         {
                                                            break loop128;
                                                         }
                                                         addr0bf1:
                                                         addr0bf4:
                                                         §§push(§§pop() + §§pop() * _loc51_);
                                                         if(_loc67_)
                                                         {
                                                            addr0bfb:
                                                            §§push(Number(§§pop()));
                                                            if(!_loc67_)
                                                            {
                                                               break loop132;
                                                            }
                                                         }
                                                         else
                                                         {
                                                            §§goto(addr0c4c);
                                                         }
                                                      }
                                                      _loc55_ = §§pop();
                                                      while(true)
                                                      {
                                                         §§push(_loc25_);
                                                         if(!(_loc68_ && Boolean(param1)))
                                                         {
                                                            addr0c14:
                                                            §§push(_loc48_);
                                                            break loop134;
                                                         }
                                                         §§goto(addr0cd8);
                                                      }
                                                      §§goto(addr0ce9);
                                                   }
                                                   addr0c17:
                                                   addr0c19:
                                                   §§push(_loc30_ * _loc52_);
                                                   break loop133;
                                                }
                                                §§push(§§pop() * §§pop());
                                                break loop135;
                                             }
                                             §§push(§§pop() + §§pop());
                                             if(_loc67_ || Boolean(this))
                                             {
                                                break loop121;
                                             }
                                             §§goto(addr0c9b);
                                          }
                                          §§goto(addr0c30);
                                       }
                                       §§goto(addr0c73);
                                    }
                                    §§goto(addr23ab);
                                 }
                                 §§goto(addr0d11);
                              }
                              §§goto(addr0c7f);
                           }
                           §§push(§§pop() + §§pop());
                           if(_loc68_ && Boolean(param2))
                           {
                              break loop124;
                           }
                           _loc53_ = §§pop();
                           if(_loc67_)
                           {
                              addr0b8a:
                              while(true)
                              {
                                 §§push(_loc25_);
                                 if(!(_loc68_ && Boolean(param3)))
                                 {
                                    addr0b9a:
                                    addr0b9c:
                                    §§push(§§pop() * _loc46_ + _loc30_ * _loc50_);
                                    if(!_loc68_)
                                    {
                                       break loop120;
                                    }
                                    §§goto(addr0c8c);
                                 }
                                 §§goto(addr0cdf);
                              }
                              §§goto(addr0ce9);
                           }
                           §§goto(addr0d14);
                        }
                        §§goto(addr0d0b);
                     }
                     addr0c30:
                     _loc56_ = §§pop() + _loc19_.u;
                     §§push(_loc26_);
                     if(_loc67_ || Boolean(param3))
                     {
                        addr0c43:
                        loop123:
                        while(true)
                        {
                           loop124:
                           while(true)
                           {
                              loop125:
                              while(true)
                              {
                                 while(true)
                                 {
                                    §§push(§§pop() * _loc45_);
                                    if(_loc67_)
                                    {
                                       addr0c4c:
                                       §§push(_loc31_);
                                       if(!(_loc67_ || Boolean(param3)))
                                       {
                                          break;
                                       }
                                       §§push(§§pop() * _loc49_);
                                       if(_loc68_)
                                       {
                                          break loop125;
                                       }
                                       §§push(§§pop() + §§pop());
                                       if(!_loc67_)
                                       {
                                          break loop124;
                                       }
                                       §§push(Number(§§pop()));
                                       if(!_loc67_)
                                       {
                                          break loop123;
                                       }
                                    }
                                    addr0c73:
                                    _loc57_ = §§pop();
                                    if(!_loc68_)
                                    {
                                       addr0c7b:
                                       §§push(_loc26_);
                                       §§push(_loc46_);
                                       break;
                                    }
                                    break loop59;
                                 }
                                 addr0c7f:
                                 §§push(§§pop() * §§pop());
                                 break loop124;
                              }
                              §§goto(addr0cc0);
                           }
                           while(true)
                           {
                              §§push(_loc31_);
                              §§push(_loc50_);
                              if(!_loc68_)
                              {
                                 addr0c8c:
                                 addr0c8a:
                                 §§push(§§pop() + §§pop() * §§pop());
                                 if(_loc67_ || Boolean(param3))
                                 {
                                    addr0c9b:
                                    _loc58_ = §§pop();
                                    if(_loc68_ && Boolean(this))
                                    {
                                       break loop59;
                                    }
                                    §§push(_loc26_);
                                 }
                                 addr0cad:
                                 §§push(_loc47_);
                                 break loop54;
                              }
                              §§goto(addr0cfc);
                           }
                           §§goto(addr0d11);
                        }
                        §§goto(addr0d12);
                     }
                     §§goto(addr0cb0);
                  }
                  addr0cb0:
                  loop56:
                  while(true)
                  {
                     §§push(§§pop() * §§pop());
                     §§push(_loc31_);
                     if(_loc67_ || Boolean(this))
                     {
                        addr0cc0:
                        §§push(§§pop() * _loc51_);
                        if(!_loc67_)
                        {
                           break;
                        }
                     }
                     addr0cc9:
                     while(true)
                     {
                        §§push(§§pop() + §§pop());
                        if(!(_loc68_ && Boolean(param3)))
                        {
                           addr0cd8:
                           §§push(Number(§§pop()));
                           if(_loc68_)
                           {
                              break;
                           }
                           _loc59_ = §§pop();
                           §§push(_loc26_);
                           if(!_loc67_)
                           {
                              break;
                           }
                        }
                        addr0ce9:
                        §§push(_loc48_);
                        if(_loc67_)
                        {
                           §§push(§§pop() * §§pop());
                           if(_loc67_)
                           {
                              addr0cfc:
                              §§push(_loc31_ * _loc52_);
                              if(_loc67_ || Boolean(this))
                              {
                                 break loop56;
                              }
                              addr0d10:
                              §§push(§§pop() + §§pop());
                           }
                           break;
                        }
                        break loop56;
                     }
                     addr0d12:
                     _loc60_ = §§pop();
                     addr0d14:
                     _loc65_ = 0;
                     if(_loc67_)
                     {
                        for(_loc7_ in _loc42_)
                        {
                           if(_loc67_)
                           {
                              delete _loc42_[_loc7_];
                           }
                        }
                     }
                     loop58:
                     while(true)
                     {
                        loop59:
                        while(true)
                        {
                           loop60:
                           while(true)
                           {
                              §§push(0);
                              if(!(_loc68_ && Boolean(param3)))
                              {
                                 _loc5_ = §§pop();
                                 addr0d5b:
                                 loop4:
                                 while(true)
                                 {
                                    §§push(_loc5_);
                                    if(!_loc67_)
                                    {
                                       break loop60;
                                    }
                                    §§push(_loc43_);
                                    if(!_loc67_)
                                    {
                                       break;
                                    }
                                    if(§§pop() < §§pop())
                                    {
                                       _loc9_ = _loc40_[_loc5_];
                                       if(!(_loc68_ && Boolean(param1)))
                                       {
                                          _loc65_ = 0;
                                          if(!_loc68_)
                                          {
                                             for(_loc7_ in _loc41_)
                                             {
                                                if(!(_loc68_ && Boolean(param3)))
                                                {
                                                   delete _loc41_[_loc7_];
                                                }
                                             }
                                          }
                                       }
                                       _loc12_ = _loc9_.wrapper;
                                       loop87:
                                       while(true)
                                       {
                                          loop88:
                                          while(true)
                                          {
                                             if(!_loc68_)
                                             {
                                                loop8:
                                                while(true)
                                                {
                                                   loop89:
                                                   while(true)
                                                   {
                                                      loop90:
                                                      while(true)
                                                      {
                                                         loop91:
                                                         while(true)
                                                         {
                                                            if(_loc12_ == null)
                                                            {
                                                               if(!(_loc67_ || Boolean(param2)))
                                                               {
                                                                  break loop8;
                                                               }
                                                               §§push(0);
                                                               if(_loc68_)
                                                               {
                                                                  break loop88;
                                                               }
                                                               _loc65_ = §§pop();
                                                               if(!_loc67_)
                                                               {
                                                                  break loop89;
                                                               }
                                                            }
                                                            else
                                                            {
                                                               §§push(0);
                                                               if(_loc68_)
                                                               {
                                                                  break loop87;
                                                               }
                                                               _loc65_ = §§pop();
                                                               if(!(_loc68_ && Boolean(param3)))
                                                               {
                                                                  _loc66_ = _loc39_[_loc12_.vertex];
                                                                  while(true)
                                                                  {
                                                                     §§push(§§hasnext(_loc66_,_loc65_));
                                                                     if(!_loc67_)
                                                                     {
                                                                        break loop91;
                                                                     }
                                                                     if(§§pop())
                                                                     {
                                                                        _loc7_ = §§nextname(_loc65_,_loc66_);
                                                                        if(_loc67_ || Boolean(param2))
                                                                        {
                                                                           §§push(Boolean(_loc38_[_loc7_]));
                                                                           if(!_loc68_)
                                                                           {
                                                                              var _temp_191:* = §§pop();
                                                                              §§push(_temp_191);
                                                                              §§push(_temp_191);
                                                                              if(_loc67_)
                                                                              {
                                                                                 §§push(Boolean(§§pop()));
                                                                              }
                                                                              if(§§pop())
                                                                              {
                                                                                 if(!(_loc68_ && Boolean(param1)))
                                                                                 {
                                                                                    §§pop();
                                                                                    if(_loc68_ && Boolean(param2))
                                                                                    {
                                                                                       continue;
                                                                                    }
                                                                                    §§push(!_loc42_[_loc7_]);
                                                                                    if(_loc67_ || Boolean(this))
                                                                                    {
                                                                                       §§push(Boolean(§§pop()));
                                                                                    }
                                                                                 }
                                                                              }
                                                                           }
                                                                           if(!§§pop())
                                                                           {
                                                                              continue;
                                                                           }
                                                                           if(!_loc67_)
                                                                           {
                                                                              continue;
                                                                           }
                                                                        }
                                                                        _loc41_[_loc7_] = true;
                                                                        continue;
                                                                     }
                                                                     if(!_loc67_)
                                                                     {
                                                                        break loop90;
                                                                     }
                                                                     if(_loc67_)
                                                                     {
                                                                        if(_loc68_ && Boolean(this))
                                                                        {
                                                                           break loop8;
                                                                        }
                                                                        _loc12_ = _loc12_.next;
                                                                        continue loop91;
                                                                     }
                                                                  }
                                                                  break;
                                                               }
                                                            }
                                                            _loc66_ = _loc41_;
                                                            while(true)
                                                            {
                                                               §§push(§§hasnext(_loc66_,_loc65_));
                                                               break loop91;
                                                            }
                                                            break loop14;
                                                            addr12ea:
                                                         }
                                                         if(!§§pop())
                                                         {
                                                            break;
                                                         }
                                                         _loc7_ = §§nextname(_loc65_,_loc66_);
                                                         _loc8_ = _loc7_;
                                                         if(_loc67_ || Boolean(param2))
                                                         {
                                                            §§push(_loc32_);
                                                            if(_loc67_ || Boolean(param3))
                                                            {
                                                               §§push(_loc8_.normalX);
                                                               if(!_loc68_)
                                                               {
                                                                  §§push(§§pop() * §§pop());
                                                                  if(!_loc68_)
                                                                  {
                                                                     §§push(_loc33_);
                                                                     if(_loc67_ || Boolean(param2))
                                                                     {
                                                                        §§push(_loc8_.normalY);
                                                                        if(_loc67_ || Boolean(this))
                                                                        {
                                                                           §§push(§§pop() * §§pop());
                                                                           if(!(_loc68_ && Boolean(param3)))
                                                                           {
                                                                              addr0f32:
                                                                              §§push(§§pop() + §§pop());
                                                                              if(!_loc68_)
                                                                              {
                                                                                 addr0f4e:
                                                                                 addr0f39:
                                                                                 §§push(_loc34_);
                                                                                 if(!_loc68_)
                                                                                 {
                                                                                    addr0f45:
                                                                                    §§push(§§pop() * _loc8_.normalZ);
                                                                                    if(!_loc68_)
                                                                                    {
                                                                                       addr0f4d:
                                                                                       §§push(§§pop() + §§pop());
                                                                                       §§push(param1);
                                                                                    }
                                                                                 }
                                                                                 if(§§pop() >= §§pop())
                                                                                 {
                                                                                    if(!(_loc68_ && Boolean(param3)))
                                                                                    {
                                                                                       _loc13_ = _loc8_.wrapper;
                                                                                       if(_loc67_ || Boolean(this))
                                                                                       {
                                                                                          addr0f76:
                                                                                          loop16:
                                                                                          while(true)
                                                                                          {
                                                                                             while(true)
                                                                                             {
                                                                                                if(_loc13_ != null)
                                                                                                {
                                                                                                   _loc18_ = _loc13_.vertex;
                                                                                                   loop93:
                                                                                                   while(true)
                                                                                                   {
                                                                                                      loop94:
                                                                                                      while(true)
                                                                                                      {
                                                                                                         loop95:
                                                                                                         while(true)
                                                                                                         {
                                                                                                            loop106:
                                                                                                            while(true)
                                                                                                            {
                                                                                                               loop109:
                                                                                                               while(true)
                                                                                                               {
                                                                                                                  §§push(_loc53_);
                                                                                                                  if(!(_loc68_ && Boolean(param1)))
                                                                                                                  {
                                                                                                                     §§push(§§pop() * _loc18_.x);
                                                                                                                     if(!_loc68_)
                                                                                                                     {
                                                                                                                        loop110:
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              §§push(_loc54_);
                                                                                                                              if(!(_loc68_ && Boolean(param2)))
                                                                                                                              {
                                                                                                                                 §§push(_loc18_.y);
                                                                                                                                 if(!_loc67_)
                                                                                                                                 {
                                                                                                                                    break;
                                                                                                                                 }
                                                                                                                                 §§push(§§pop() * §§pop());
                                                                                                                                 if(_loc68_ && Boolean(param3))
                                                                                                                                 {
                                                                                                                                    break loop110;
                                                                                                                                 }
                                                                                                                              }
                                                                                                                              loop112:
                                                                                                                              while(true)
                                                                                                                              {
                                                                                                                                 while(true)
                                                                                                                                 {
                                                                                                                                    §§push(§§pop() + §§pop());
                                                                                                                                    if(!(_loc68_ && Boolean(this)))
                                                                                                                                    {
                                                                                                                                       §§push(_loc55_);
                                                                                                                                       if(!(_loc67_ || Boolean(this)))
                                                                                                                                       {
                                                                                                                                          break loop95;
                                                                                                                                       }
                                                                                                                                       §§push(_loc18_.z);
                                                                                                                                       if(_loc68_ && Boolean(param3))
                                                                                                                                       {
                                                                                                                                          break;
                                                                                                                                       }
                                                                                                                                       §§push(§§pop() * §§pop());
                                                                                                                                       if(!(_loc67_ || Boolean(this)))
                                                                                                                                       {
                                                                                                                                          break loop112;
                                                                                                                                       }
                                                                                                                                       §§push(§§pop() + §§pop());
                                                                                                                                       §§push(_loc56_);
                                                                                                                                       if(!_loc67_)
                                                                                                                                       {
                                                                                                                                          break loop109;
                                                                                                                                       }
                                                                                                                                       §§push(§§pop() + §§pop());
                                                                                                                                    }
                                                                                                                                    _loc61_ = §§pop() - _loc18_.u;
                                                                                                                                    if(_loc67_ || Boolean(this))
                                                                                                                                    {
                                                                                                                                       §§push(_loc57_);
                                                                                                                                       §§push(_loc18_.x);
                                                                                                                                       break loop112;
                                                                                                                                    }
                                                                                                                                    break loop106;
                                                                                                                                 }
                                                                                                                                 §§goto(addr1050);
                                                                                                                              }
                                                                                                                              §§push(§§pop() * §§pop());
                                                                                                                              §§push(_loc58_);
                                                                                                                              §§push(_loc18_.y);
                                                                                                                              if(_loc67_ || Boolean(param2))
                                                                                                                              {
                                                                                                                                 break;
                                                                                                                              }
                                                                                                                              break loop113;
                                                                                                                           }
                                                                                                                           §§push(§§pop() * §§pop());
                                                                                                                           if(_loc67_)
                                                                                                                           {
                                                                                                                              §§push(§§pop() + §§pop());
                                                                                                                              §§push(_loc59_);
                                                                                                                              break;
                                                                                                                           }
                                                                                                                           §§goto(addr105f);
                                                                                                                        }
                                                                                                                        addr1050:
                                                                                                                        §§push(§§pop() * _loc18_.z);
                                                                                                                        if(_loc68_ && Boolean(param1))
                                                                                                                        {
                                                                                                                           break loop94;
                                                                                                                        }
                                                                                                                        addr105f:
                                                                                                                        §§push(§§pop() + §§pop());
                                                                                                                        if(!(_loc67_ || Boolean(param1)))
                                                                                                                        {
                                                                                                                           break loop93;
                                                                                                                        }
                                                                                                                        §§push(§§pop() + _loc60_ - _loc18_.v);
                                                                                                                     }
                                                                                                                     §§push(Number(§§pop()));
                                                                                                                  }
                                                                                                                  _loc62_ = §§pop();
                                                                                                                  if(_loc68_)
                                                                                                                  {
                                                                                                                     break loop16;
                                                                                                                  }
                                                                                                                  while(true)
                                                                                                                  {
                                                                                                                     loop115:
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              §§push(_loc61_ > param2);
                                                                                                                              if(!(_loc68_ && Boolean(param1)))
                                                                                                                              {
                                                                                                                                 var _temp_227:* = §§pop();
                                                                                                                                 §§push(_temp_227);
                                                                                                                                 §§push(_temp_227);
                                                                                                                                 if(!(_loc68_ && Boolean(param1)))
                                                                                                                                 {
                                                                                                                                    §§push(Boolean(§§pop()));
                                                                                                                                    if(_loc68_ && Boolean(param1))
                                                                                                                                    {
                                                                                                                                       break loop115;
                                                                                                                                    }
                                                                                                                                 }
                                                                                                                                 if(!§§pop())
                                                                                                                                 {
                                                                                                                                    §§pop();
                                                                                                                                    §§push(_loc61_);
                                                                                                                                    if(!_loc68_)
                                                                                                                                    {
                                                                                                                                       §§push(param2);
                                                                                                                                       break loop109;
                                                                                                                                    }
                                                                                                                                    break loop93;
                                                                                                                                 }
                                                                                                                                 §§goto(addr10d5);
                                                                                                                              }
                                                                                                                              §§goto(addr10ef);
                                                                                                                           }
                                                                                                                           §§goto(addr1130);
                                                                                                                        }
                                                                                                                        §§goto(addr1110);
                                                                                                                     }
                                                                                                                     §§goto(addr1111);
                                                                                                                  }
                                                                                                                  §§goto(addr1109);
                                                                                                               }
                                                                                                               while(true)
                                                                                                               {
                                                                                                                  while(true)
                                                                                                                  {
                                                                                                                     §§push(-§§pop());
                                                                                                                     if(!_loc68_)
                                                                                                                     {
                                                                                                                        break loop95;
                                                                                                                     }
                                                                                                                     §§goto(addr112d);
                                                                                                                  }
                                                                                                                  §§goto(addr1130);
                                                                                                               }
                                                                                                               §§goto(addr112e);
                                                                                                            }
                                                                                                            §§goto(addr12df);
                                                                                                         }
                                                                                                         §§push(§§pop() < §§pop());
                                                                                                         if(!(_loc68_ && Boolean(param1)))
                                                                                                         {
                                                                                                            addr10d5:
                                                                                                            var _temp_213:* = §§pop();
                                                                                                            while(true)
                                                                                                            {
                                                                                                               §§push(_temp_213);
                                                                                                               §§push(_temp_213);
                                                                                                               if(!(_loc68_ && Boolean(param3)))
                                                                                                               {
                                                                                                                  §§push(Boolean(§§pop()));
                                                                                                                  if(_loc68_)
                                                                                                                  {
                                                                                                                     break;
                                                                                                                  }
                                                                                                                  if(!§§pop())
                                                                                                                  {
                                                                                                                     addr10ef:
                                                                                                                     §§pop();
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        §§push(_loc62_);
                                                                                                                        §§push(param2);
                                                                                                                        if(_loc67_ || Boolean(param2))
                                                                                                                        {
                                                                                                                           break loop94;
                                                                                                                        }
                                                                                                                        §§goto(addr112d);
                                                                                                                     }
                                                                                                                     §§goto(addr112e);
                                                                                                                  }
                                                                                                                  §§goto(addr1109);
                                                                                                               }
                                                                                                               §§goto(addr1110);
                                                                                                            }
                                                                                                            §§goto(addr1111);
                                                                                                         }
                                                                                                         §§goto(addr1130);
                                                                                                      }
                                                                                                      while(true)
                                                                                                      {
                                                                                                         §§push(§§pop() > §§pop());
                                                                                                         if(_loc67_)
                                                                                                         {
                                                                                                            addr1109:
                                                                                                            var _temp_204:* = §§pop();
                                                                                                            addr1111:
                                                                                                            §§push(_temp_204);
                                                                                                            §§push(_temp_204);
                                                                                                            if(!_loc68_)
                                                                                                            {
                                                                                                               addr1110:
                                                                                                               §§push(Boolean(§§pop()));
                                                                                                            }
                                                                                                            if(§§pop())
                                                                                                            {
                                                                                                               break;
                                                                                                            }
                                                                                                         }
                                                                                                         §§pop();
                                                                                                         addr115c:
                                                                                                         if(!_loc68_)
                                                                                                         {
                                                                                                            §§push(_loc62_);
                                                                                                            break loop93;
                                                                                                         }
                                                                                                         _loc12_ = _loc9_.wrapper;
                                                                                                         if(!_loc68_)
                                                                                                         {
                                                                                                            addr116a:
                                                                                                            loop22:
                                                                                                            while(true)
                                                                                                            {
                                                                                                               while(true)
                                                                                                               {
                                                                                                                  if(_loc12_ != null)
                                                                                                                  {
                                                                                                                     loop98:
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           §§push(_loc12_.next);
                                                                                                                           if(_loc67_ || Boolean(param2))
                                                                                                                           {
                                                                                                                              if(§§pop() == null)
                                                                                                                              {
                                                                                                                                 §§push(_loc9_.wrapper);
                                                                                                                                 break;
                                                                                                                              }
                                                                                                                              if(_loc68_ && Boolean(param2))
                                                                                                                              {
                                                                                                                                 break loop98;
                                                                                                                              }
                                                                                                                              §§push(_loc12_.next);
                                                                                                                           }
                                                                                                                           §§push(§§pop());
                                                                                                                           break;
                                                                                                                        }
                                                                                                                        _loc14_ = §§pop();
                                                                                                                        _loc13_ = _loc8_.wrapper;
                                                                                                                        loop100:
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           if(!_loc68_)
                                                                                                                           {
                                                                                                                              while(true)
                                                                                                                              {
                                                                                                                                 if(_loc13_ == null)
                                                                                                                                 {
                                                                                                                                    break loop100;
                                                                                                                                 }
                                                                                                                                 while(true)
                                                                                                                                 {
                                                                                                                                    §§push(_loc13_.next);
                                                                                                                                    if(_loc67_)
                                                                                                                                    {
                                                                                                                                       if(§§pop() == null)
                                                                                                                                       {
                                                                                                                                          §§push(_loc8_.wrapper);
                                                                                                                                          break;
                                                                                                                                       }
                                                                                                                                       if(_loc68_)
                                                                                                                                       {
                                                                                                                                          break loop100;
                                                                                                                                       }
                                                                                                                                       §§push(_loc13_.next);
                                                                                                                                    }
                                                                                                                                    §§push(§§pop());
                                                                                                                                    break;
                                                                                                                                 }
                                                                                                                                 _loc15_ = §§pop();
                                                                                                                                 loop102:
                                                                                                                                 while(true)
                                                                                                                                 {
                                                                                                                                    loop103:
                                                                                                                                    while(true)
                                                                                                                                    {
                                                                                                                                       loop104:
                                                                                                                                       while(true)
                                                                                                                                       {
                                                                                                                                          while(true)
                                                                                                                                          {
                                                                                                                                             §§push(_loc12_.vertex);
                                                                                                                                             if(!_loc68_)
                                                                                                                                             {
                                                                                                                                                §§push(_loc15_.vertex);
                                                                                                                                                if(_loc68_)
                                                                                                                                                {
                                                                                                                                                   break;
                                                                                                                                                }
                                                                                                                                                §§push(§§pop() == §§pop());
                                                                                                                                                if(!_loc67_)
                                                                                                                                                {
                                                                                                                                                   break loop104;
                                                                                                                                                }
                                                                                                                                                §§push(Boolean(§§pop()));
                                                                                                                                                if(!_loc67_)
                                                                                                                                                {
                                                                                                                                                   break loop103;
                                                                                                                                                }
                                                                                                                                                var _temp_208:* = §§pop();
                                                                                                                                                §§push(_temp_208);
                                                                                                                                                §§push(_temp_208);
                                                                                                                                                if(!(_loc68_ && Boolean(this)))
                                                                                                                                                {
                                                                                                                                                   §§push(Boolean(§§pop()));
                                                                                                                                                }
                                                                                                                                                if(!§§pop())
                                                                                                                                                {
                                                                                                                                                   break loop102;
                                                                                                                                                }
                                                                                                                                                if(!(_loc67_ || Boolean(param1)))
                                                                                                                                                {
                                                                                                                                                   break loop102;
                                                                                                                                                }
                                                                                                                                                §§pop();
                                                                                                                                                §§push(_loc14_.vertex);
                                                                                                                                             }
                                                                                                                                             §§push(_loc13_.vertex);
                                                                                                                                             break;
                                                                                                                                          }
                                                                                                                                          §§push(§§pop() == §§pop());
                                                                                                                                          if(_loc67_ || Boolean(param3))
                                                                                                                                          {
                                                                                                                                             break loop103;
                                                                                                                                          }
                                                                                                                                          break;
                                                                                                                                       }
                                                                                                                                       §§pop();
                                                                                                                                       break loop22;
                                                                                                                                    }
                                                                                                                                    §§push(Boolean(§§pop()));
                                                                                                                                    if(_loc67_)
                                                                                                                                    {
                                                                                                                                       break;
                                                                                                                                    }
                                                                                                                                    break loop104;
                                                                                                                                 }
                                                                                                                                 if(§§pop())
                                                                                                                                 {
                                                                                                                                    break loop100;
                                                                                                                                 }
                                                                                                                                 §§push(_loc13_.next);
                                                                                                                                 if(_loc67_ || Boolean(param2))
                                                                                                                                 {
                                                                                                                                    continue;
                                                                                                                                 }
                                                                                                                                 continue loop22;
                                                                                                                                 _loc13_ = §§pop();
                                                                                                                              }
                                                                                                                              break loop53;
                                                                                                                           }
                                                                                                                           §§goto(addr11da);
                                                                                                                        }
                                                                                                                        if(_loc13_ != null)
                                                                                                                        {
                                                                                                                           break;
                                                                                                                        }
                                                                                                                        §§push(_loc12_.next);
                                                                                                                        continue loop22;
                                                                                                                     }
                                                                                                                  }
                                                                                                                  break loop98;
                                                                                                               }
                                                                                                               _loc12_ = §§pop();
                                                                                                               §§goto(addr116a);
                                                                                                            }
                                                                                                            addr12df:
                                                                                                            §§goto(addr12ea);
                                                                                                         }
                                                                                                         break loop98;
                                                                                                      }
                                                                                                      §§goto(addr1130);
                                                                                                   }
                                                                                                   addr1130:
                                                                                                   addr112e:
                                                                                                   §§push(param2);
                                                                                                   if(!(_loc68_ && Boolean(param1)))
                                                                                                   {
                                                                                                      addr112d:
                                                                                                      §§push(-§§pop());
                                                                                                   }
                                                                                                   if(§§pop() < §§pop())
                                                                                                   {
                                                                                                      break loop16;
                                                                                                   }
                                                                                                   _loc13_ = _loc13_.next;
                                                                                                   continue;
                                                                                                }
                                                                                             }
                                                                                             §§goto(addr0f76);
                                                                                          }
                                                                                       }
                                                                                       if(_loc13_ == null)
                                                                                       {
                                                                                          if(_loc68_ && Boolean(param1))
                                                                                          {
                                                                                             break loop106;
                                                                                          }
                                                                                          §§goto(addr115c);
                                                                                       }
                                                                                       _loc42_[_loc8_] = true;
                                                                                       break loop106;
                                                                                    }
                                                                                    §§goto(addr12ea);
                                                                                 }
                                                                                 _loc42_[_loc8_] = true;
                                                                                 §§goto(addr12ea);
                                                                              }
                                                                              §§goto(addr0f4d);
                                                                           }
                                                                           §§goto(addr0f4e);
                                                                        }
                                                                        §§goto(addr0f45);
                                                                     }
                                                                     §§goto(addr0f32);
                                                                  }
                                                                  §§goto(addr0f39);
                                                               }
                                                               §§goto(addr0f32);
                                                            }
                                                            §§goto(addr0f39);
                                                         }
                                                         §§goto(addr12ea);
                                                      }
                                                      break;
                                                   }
                                                   if(!_loc67_)
                                                   {
                                                      break;
                                                   }
                                                }
                                                continue loop4;
                                             }
                                             §§push(_loc5_);
                                             if(_loc67_ || Boolean(param1))
                                             {
                                                break;
                                             }
                                             §§goto(addr131b);
                                          }
                                          §§push(§§pop() + 1);
                                          if(!(_loc68_ && Boolean(param1)))
                                          {
                                             break;
                                          }
                                          §§goto(addr131b);
                                       }
                                       addr131b:
                                       _loc5_ = int(§§pop());
                                       continue;
                                    }
                                    loop61:
                                    while(true)
                                    {
                                       §§push(_loc43_);
                                       §§push(1);
                                       if(_loc67_)
                                       {
                                          break loop4;
                                       }
                                       addr2353:
                                       if(§§pop() >= §§pop() - 1)
                                       {
                                          if(!_loc67_)
                                          {
                                             break loop59;
                                          }
                                          §§push(_loc63_);
                                          if(!_loc68_)
                                          {
                                             §§push(!§§pop());
                                             if(!_loc68_)
                                             {
                                                if(!§§pop())
                                                {
                                                   loop5:
                                                   while(true)
                                                   {
                                                      §§push(true);
                                                      addr2386:
                                                      while(true)
                                                      {
                                                         if(!§§pop())
                                                         {
                                                            break loop59;
                                                         }
                                                         while(true)
                                                         {
                                                            §§push(false);
                                                            if(!_loc68_)
                                                            {
                                                               §§push(Boolean(§§pop()));
                                                               if(_loc68_ && Boolean(param3))
                                                               {
                                                                  break;
                                                               }
                                                            }
                                                            _loc63_ = §§pop();
                                                            if(_loc68_)
                                                            {
                                                               break loop58;
                                                            }
                                                            §§push(0);
                                                            if(_loc67_)
                                                            {
                                                               _loc5_ = §§pop();
                                                               while(true)
                                                               {
                                                               }
                                                               break loop5;
                                                               addr2349:
                                                            }
                                                            §§push(_loc43_);
                                                            if(!_loc67_)
                                                            {
                                                               break loop61;
                                                            }
                                                            §§goto(addr2353);
                                                         }
                                                         §§goto(addr2368);
                                                         addr2368:
                                                      }
                                                   }
                                                   break loop1;
                                                   addr2385:
                                                }
                                                if(!(_loc68_ && Boolean(param3)))
                                                {
                                                   break loop58;
                                                }
                                                break loop59;
                                             }
                                             §§goto(addr2386);
                                          }
                                          §§goto(addr236f);
                                       }
                                       _loc9_ = _loc40_[_loc5_];
                                       if(_loc67_)
                                       {
                                          if(_loc9_ != null)
                                          {
                                             if(_loc67_ || Boolean(param1))
                                             {
                                                §§push(1);
                                                if(!_loc68_)
                                                {
                                                   §§push(int(§§pop()));
                                                   if(_loc67_ || Boolean(param1))
                                                   {
                                                      _loc6_ = §§pop();
                                                      if(_loc67_ || Boolean(param3))
                                                      {
                                                         addr13ff:
                                                         loop12:
                                                         while(true)
                                                         {
                                                            while(true)
                                                            {
                                                               loop64:
                                                               while(true)
                                                               {
                                                                  loop65:
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
                                                                                    §§push(_loc6_);
                                                                                    if(_loc67_ || Boolean(param1))
                                                                                    {
                                                                                       addr231b:
                                                                                       if(§§pop() >= _loc43_)
                                                                                       {
                                                                                          if(_loc67_)
                                                                                          {
                                                                                             addr2327:
                                                                                             §§push(_loc5_);
                                                                                             if(_loc67_ || Boolean(param1))
                                                                                             {
                                                                                                addr2337:
                                                                                                §§push(§§pop() + 1);
                                                                                                if(_loc67_ || Boolean(param3))
                                                                                                {
                                                                                                   addr2346:
                                                                                                   §§push(int(§§pop()));
                                                                                                }
                                                                                                _loc5_ = §§pop();
                                                                                                §§goto(addr2349);
                                                                                             }
                                                                                             §§goto(addr2346);
                                                                                          }
                                                                                          §§goto(addr2349);
                                                                                       }
                                                                                       _loc8_ = _loc40_[_loc6_];
                                                                                       if(_loc67_)
                                                                                       {
                                                                                          if(_loc8_ == null)
                                                                                          {
                                                                                             break loop64;
                                                                                          }
                                                                                          if(!(_loc67_ || Boolean(param2)))
                                                                                          {
                                                                                             continue loop12;
                                                                                          }
                                                                                       }
                                                                                       _loc12_ = _loc9_.wrapper;
                                                                                       if(_loc67_)
                                                                                       {
                                                                                          addr1437:
                                                                                          loop14:
                                                                                          while(true)
                                                                                          {
                                                                                             while(true)
                                                                                             {
                                                                                                if(_loc12_ != null)
                                                                                                {
                                                                                                   §§push(_loc12_.next);
                                                                                                   if(_loc67_)
                                                                                                   {
                                                                                                      if(§§pop() != null)
                                                                                                      {
                                                                                                         if(!(_loc68_ && Boolean(this)))
                                                                                                         {
                                                                                                            addr1469:
                                                                                                            _loc14_ = _loc12_.next;
                                                                                                            _loc13_ = _loc8_.wrapper;
                                                                                                            addr145d:
                                                                                                            addr1459:
                                                                                                            if(!_loc68_)
                                                                                                            {
                                                                                                               loop15:
                                                                                                               while(_loc13_ != null)
                                                                                                               {
                                                                                                                  while(true)
                                                                                                                  {
                                                                                                                     §§push(_loc13_.next);
                                                                                                                     if(!_loc68_)
                                                                                                                     {
                                                                                                                        if(§§pop() == null)
                                                                                                                        {
                                                                                                                           §§push(_loc8_.wrapper);
                                                                                                                           break;
                                                                                                                        }
                                                                                                                        if(!_loc67_)
                                                                                                                        {
                                                                                                                           break loop15;
                                                                                                                        }
                                                                                                                        §§push(_loc13_.next);
                                                                                                                     }
                                                                                                                     §§push(§§pop());
                                                                                                                     break;
                                                                                                                  }
                                                                                                                  _loc15_ = §§pop();
                                                                                                                  loop73:
                                                                                                                  while(true)
                                                                                                                  {
                                                                                                                     loop74:
                                                                                                                     while(true)
                                                                                                                     {
                                                                                                                        loop85:
                                                                                                                        while(true)
                                                                                                                        {
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              §§push(_loc12_.vertex);
                                                                                                                              if(!_loc68_)
                                                                                                                              {
                                                                                                                                 §§push(_loc15_.vertex);
                                                                                                                                 if(!_loc67_)
                                                                                                                                 {
                                                                                                                                    break;
                                                                                                                                 }
                                                                                                                                 §§push(§§pop() == §§pop());
                                                                                                                                 if(_loc68_)
                                                                                                                                 {
                                                                                                                                    break loop74;
                                                                                                                                 }
                                                                                                                                 §§push(Boolean(§§pop()));
                                                                                                                                 if(_loc68_)
                                                                                                                                 {
                                                                                                                                    break loop85;
                                                                                                                                 }
                                                                                                                                 var _temp_179:* = §§pop();
                                                                                                                                 §§push(_temp_179);
                                                                                                                                 §§push(_temp_179);
                                                                                                                                 if(_loc67_ || Boolean(param1))
                                                                                                                                 {
                                                                                                                                    §§push(Boolean(§§pop()));
                                                                                                                                 }
                                                                                                                                 if(!§§pop())
                                                                                                                                 {
                                                                                                                                    break loop85;
                                                                                                                                 }
                                                                                                                                 if(_loc68_)
                                                                                                                                 {
                                                                                                                                    break loop74;
                                                                                                                                 }
                                                                                                                                 §§pop();
                                                                                                                                 if(!(_loc67_ || Boolean(param1)))
                                                                                                                                 {
                                                                                                                                    break loop73;
                                                                                                                                 }
                                                                                                                                 §§push(_loc14_.vertex);
                                                                                                                              }
                                                                                                                              §§push(_loc13_.vertex);
                                                                                                                              break;
                                                                                                                           }
                                                                                                                           §§push(§§pop() == §§pop());
                                                                                                                           if(!(_loc68_ && Boolean(this)))
                                                                                                                           {
                                                                                                                              break loop74;
                                                                                                                           }
                                                                                                                           break;
                                                                                                                        }
                                                                                                                        if(§§pop())
                                                                                                                        {
                                                                                                                           break loop15;
                                                                                                                        }
                                                                                                                        §§push(_loc13_.next);
                                                                                                                        if(!_loc68_)
                                                                                                                        {
                                                                                                                           _loc13_ = §§pop();
                                                                                                                           continue loop15;
                                                                                                                        }
                                                                                                                        §§goto(addr1575);
                                                                                                                     }
                                                                                                                     §§push(Boolean(§§pop()));
                                                                                                                     if(_loc67_ || Boolean(param3))
                                                                                                                     {
                                                                                                                        break loop85;
                                                                                                                     }
                                                                                                                     §§goto(addr1654);
                                                                                                                  }
                                                                                                                  loop17:
                                                                                                                  while(true)
                                                                                                                  {
                                                                                                                     addr1654:
                                                                                                                     §§push(_loc14_.next);
                                                                                                                     if(!_loc68_)
                                                                                                                     {
                                                                                                                        _loc16_ = §§pop() != null ? _loc14_.next : _loc9_.wrapper;
                                                                                                                        _loc11_ = _loc8_.wrapper;
                                                                                                                        addr1575:
                                                                                                                        if(!(_loc68_ && Boolean(this)))
                                                                                                                        {
                                                                                                                           loop18:
                                                                                                                           while(true)
                                                                                                                           {
                                                                                                                              loop75:
                                                                                                                              while(true)
                                                                                                                              {
                                                                                                                                 §§push(_loc11_.next);
                                                                                                                                 if(!(_loc68_ && Boolean(param2)))
                                                                                                                                 {
                                                                                                                                    while(true)
                                                                                                                                    {
                                                                                                                                       §§push(§§pop() == _loc13_);
                                                                                                                                       if(!(_loc67_ || Boolean(param1)))
                                                                                                                                       {
                                                                                                                                          break loop18;
                                                                                                                                       }
                                                                                                                                       var _temp_60:* = !§§pop();
                                                                                                                                       §§push(_temp_60);
                                                                                                                                       §§push(_temp_60);
                                                                                                                                       if(!_loc68_)
                                                                                                                                       {
                                                                                                                                          §§push(Boolean(§§pop()));
                                                                                                                                       }
                                                                                                                                       if(§§pop())
                                                                                                                                       {
                                                                                                                                          §§pop();
                                                                                                                                          if(_loc68_ && Boolean(param1))
                                                                                                                                          {
                                                                                                                                             break loop75;
                                                                                                                                          }
                                                                                                                                          while(true)
                                                                                                                                          {
                                                                                                                                             §§push(_loc11_.next == null);
                                                                                                                                             if(!_loc68_)
                                                                                                                                             {
                                                                                                                                                §§push(!§§pop());
                                                                                                                                                if(_loc68_ && Boolean(param3))
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
                                                                                                                                          §§push(_loc11_.next);
                                                                                                                                          if(!(_loc68_ && Boolean(param2)))
                                                                                                                                          {
                                                                                                                                             continue loop18;
                                                                                                                                          }
                                                                                                                                          continue;
                                                                                                                                       }
                                                                                                                                       if(_loc68_)
                                                                                                                                       {
                                                                                                                                          continue loop17;
                                                                                                                                       }
                                                                                                                                       if(_loc16_.vertex == _loc11_.vertex)
                                                                                                                                       {
                                                                                                                                          if(!(_loc67_ || Boolean(param2)))
                                                                                                                                          {
                                                                                                                                             break loop75;
                                                                                                                                          }
                                                                                                                                          continue loop17;
                                                                                                                                       }
                                                                                                                                       addr1771:
                                                                                                                                       addr1658:
                                                                                                                                       addr1658:
                                                                                                                                       while(true)
                                                                                                                                       {
                                                                                                                                          §§push(true);
                                                                                                                                          break loop18;
                                                                                                                                          _loc12_ = _loc10_;
                                                                                                                                          _loc15_ = _loc17_;
                                                                                                                                       }
                                                                                                                                       §§goto(addr1658);
                                                                                                                                    }
                                                                                                                                    break loop17;
                                                                                                                                 }
                                                                                                                                 §§goto(addr1603);
                                                                                                                              }
                                                                                                                              _loc11_ = §§pop();
                                                                                                                           }
                                                                                                                           if(!§§pop())
                                                                                                                           {
                                                                                                                              addr177a:
                                                                                                                              _loc19_ = _loc12_.vertex;
                                                                                                                              _loc20_ = _loc17_.vertex;
                                                                                                                              _loc21_ = _loc10_.vertex;
                                                                                                                              addr1776:
                                                                                                                              §§push(_loc20_.x);
                                                                                                                              if(_loc67_ || Boolean(param3))
                                                                                                                              {
                                                                                                                                 §§push(§§pop() - _loc19_.x);
                                                                                                                                 if(!(_loc68_ && Boolean(param3)))
                                                                                                                                 {
                                                                                                                                    _loc22_ = Number(§§pop());
                                                                                                                                    if(_loc67_ || Boolean(param3))
                                                                                                                                    {
                                                                                                                                       §§push(_loc20_.y);
                                                                                                                                       §§push(_loc19_.y);
                                                                                                                                       if(!_loc68_)
                                                                                                                                       {
                                                                                                                                          §§push(§§pop() - §§pop());
                                                                                                                                          if(!(_loc68_ && Boolean(param3)))
                                                                                                                                          {
                                                                                                                                             _loc23_ = §§pop();
                                                                                                                                             if(_loc67_)
                                                                                                                                             {
                                                                                                                                                §§push(_loc20_.z - _loc19_.z);
                                                                                                                                                if(_loc67_)
                                                                                                                                                {
                                                                                                                                                   _loc24_ = §§pop();
                                                                                                                                                   addr1800:
                                                                                                                                                   §§push(_loc21_.x - _loc19_.x);
                                                                                                                                                   if(!(_loc68_ && Boolean(this)))
                                                                                                                                                   {
                                                                                                                                                      _loc27_ = §§pop();
                                                                                                                                                      if(!_loc68_)
                                                                                                                                                      {
                                                                                                                                                         §§push(_loc21_.y);
                                                                                                                                                         if(_loc67_)
                                                                                                                                                         {
                                                                                                                                                            §§push(§§pop() - _loc19_.y);
                                                                                                                                                            if(!(_loc68_ && Boolean(param1)))
                                                                                                                                                            {
                                                                                                                                                               _loc28_ = §§pop();
                                                                                                                                                               if(!(_loc68_ && Boolean(param2)))
                                                                                                                                                               {
                                                                                                                                                                  §§push(_loc21_.z);
                                                                                                                                                                  if(_loc67_)
                                                                                                                                                                  {
                                                                                                                                                                     _loc29_ = §§pop() - _loc19_.z;
                                                                                                                                                                     if(!(_loc68_ && Boolean(param3)))
                                                                                                                                                                     {
                                                                                                                                                                        addr186a:
                                                                                                                                                                        addr186e:
                                                                                                                                                                        §§push(_loc29_ * _loc23_);
                                                                                                                                                                        §§push(_loc28_);
                                                                                                                                                                        §§push(_loc24_);
                                                                                                                                                                        if(_loc67_)
                                                                                                                                                                        {
                                                                                                                                                                           addr187c:
                                                                                                                                                                           _loc32_ = §§pop() - §§pop() * §§pop();
                                                                                                                                                                           addr187e:
                                                                                                                                                                           §§push(_loc27_);
                                                                                                                                                                           §§push(_loc24_);
                                                                                                                                                                           if(_loc67_)
                                                                                                                                                                           {
                                                                                                                                                                              addr188f:
                                                                                                                                                                              §§push(§§pop() * §§pop() - _loc29_ * _loc22_);
                                                                                                                                                                              if(_loc67_ || Boolean(param1))
                                                                                                                                                                              {
                                                                                                                                                                                 _loc33_ = §§pop();
                                                                                                                                                                                 if(_loc67_)
                                                                                                                                                                                 {
                                                                                                                                                                                    §§push(_loc28_ * _loc22_);
                                                                                                                                                                                    if(_loc67_ || Boolean(this))
                                                                                                                                                                                    {
                                                                                                                                                                                       §§push(_loc27_);
                                                                                                                                                                                       §§push(_loc23_);
                                                                                                                                                                                       if(_loc67_ || Boolean(param1))
                                                                                                                                                                                       {
                                                                                                                                                                                          §§push(§§pop() * §§pop());
                                                                                                                                                                                          if(_loc67_)
                                                                                                                                                                                          {
                                                                                                                                                                                             _loc34_ = §§pop() - §§pop();
                                                                                                                                                                                             if(!_loc68_)
                                                                                                                                                                                             {
                                                                                                                                                                                                var _temp_76:* = _loc32_ < _loc37_;
                                                                                                                                                                                                §§push(_temp_76);
                                                                                                                                                                                                §§push(_temp_76);
                                                                                                                                                                                                if(_loc67_ || Boolean(param3))
                                                                                                                                                                                                {
                                                                                                                                                                                                   §§push(Boolean(§§pop()));
                                                                                                                                                                                                   if(!_loc68_)
                                                                                                                                                                                                   {
                                                                                                                                                                                                      if(§§pop())
                                                                                                                                                                                                      {
                                                                                                                                                                                                         if(_loc67_ || Boolean(param1))
                                                                                                                                                                                                         {
                                                                                                                                                                                                            §§pop();
                                                                                                                                                                                                            addr190b:
                                                                                                                                                                                                            §§push(_loc32_);
                                                                                                                                                                                                            if(!(_loc68_ && Boolean(param3)))
                                                                                                                                                                                                            {
                                                                                                                                                                                                               §§push(_loc37_);
                                                                                                                                                                                                               if(!(_loc68_ && Boolean(param1)))
                                                                                                                                                                                                               {
                                                                                                                                                                                                                  §§push(§§pop() > -§§pop());
                                                                                                                                                                                                                  if(_loc67_)
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                     §§push(Boolean(§§pop()));
                                                                                                                                                                                                                     if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                     {
                                                                                                                                                                                                                        addr1942:
                                                                                                                                                                                                                        var _temp_82:* = §§pop();
                                                                                                                                                                                                                        §§push(_temp_82);
                                                                                                                                                                                                                        §§push(_temp_82);
                                                                                                                                                                                                                        if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                           addr1951:
                                                                                                                                                                                                                           §§push(Boolean(§§pop()));
                                                                                                                                                                                                                           if(_loc67_)
                                                                                                                                                                                                                           {
                                                                                                                                                                                                                              if(§§pop())
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                 §§pop();
                                                                                                                                                                                                                                 if(_loc67_)
                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                    addr1963:
                                                                                                                                                                                                                                    §§push(_loc33_);
                                                                                                                                                                                                                                    §§push(_loc37_);
                                                                                                                                                                                                                                    if(_loc67_)
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                       §§push(§§pop() < §§pop());
                                                                                                                                                                                                                                       if(_loc67_)
                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                          addr1975:
                                                                                                                                                                                                                                          var _temp_84:* = Boolean(§§pop());
                                                                                                                                                                                                                                          §§push(_temp_84);
                                                                                                                                                                                                                                          §§push(_temp_84);
                                                                                                                                                                                                                                          if(!(_loc68_ && Boolean(param2)))
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                             addr1984:
                                                                                                                                                                                                                                             §§push(Boolean(§§pop()));
                                                                                                                                                                                                                                             if(_loc67_)
                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                addr198b:
                                                                                                                                                                                                                                                if(§§pop())
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                   §§pop();
                                                                                                                                                                                                                                                   if(!(_loc67_ || Boolean(param2)))
                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                      break loop67;
                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                   §§push(_loc33_);
                                                                                                                                                                                                                                                   §§push(_loc37_);
                                                                                                                                                                                                                                                   if(_loc67_)
                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                      addr19a9:
                                                                                                                                                                                                                                                      §§push(§§pop() > -§§pop());
                                                                                                                                                                                                                                                      if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                         addr19b8:
                                                                                                                                                                                                                                                         §§push(Boolean(§§pop()));
                                                                                                                                                                                                                                                         if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                            addr19c7:
                                                                                                                                                                                                                                                            var _temp_89:* = §§pop();
                                                                                                                                                                                                                                                            §§push(_temp_89);
                                                                                                                                                                                                                                                            §§push(_temp_89);
                                                                                                                                                                                                                                                            if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                               addr19d6:
                                                                                                                                                                                                                                                               §§push(Boolean(§§pop()));
                                                                                                                                                                                                                                                               if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                  addr19e5:
                                                                                                                                                                                                                                                                  if(§§pop())
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                     addr19e9:
                                                                                                                                                                                                                                                                     §§pop();
                                                                                                                                                                                                                                                                     §§push(_loc34_);
                                                                                                                                                                                                                                                                     §§push(_loc37_);
                                                                                                                                                                                                                                                                     if(!_loc68_)
                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                        §§push(§§pop() < §§pop());
                                                                                                                                                                                                                                                                        if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                           addr1a04:
                                                                                                                                                                                                                                                                           var _temp_93:* = Boolean(§§pop());
                                                                                                                                                                                                                                                                           addr1a05:
                                                                                                                                                                                                                                                                           addr1a06:
                                                                                                                                                                                                                                                                           §§push(_temp_93);
                                                                                                                                                                                                                                                                           if(_temp_93)
                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                              if(_loc67_)
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                 §§pop();
                                                                                                                                                                                                                                                                                 §§push(_loc34_);
                                                                                                                                                                                                                                                                                 if(_loc67_)
                                                                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                                                                    addr1a1e:
                                                                                                                                                                                                                                                                                    addr1a1d:
                                                                                                                                                                                                                                                                                    if(§§pop() > -_loc37_)
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                       if(!_loc67_)
                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                          break loop67;
                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                       addr1a28:
                                                                                                                                                                                                                                                                                       §§push(_loc22_);
                                                                                                                                                                                                                                                                                       §§push(_loc27_);
                                                                                                                                                                                                                                                                                       if(!_loc68_)
                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                          addr1a32:
                                                                                                                                                                                                                                                                                          §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                          if(!_loc68_)
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                             addr1a3b:
                                                                                                                                                                                                                                                                                             addr1a39:
                                                                                                                                                                                                                                                                                             §§push(§§pop() + _loc23_ * _loc28_);
                                                                                                                                                                                                                                                                                             §§push(_loc24_);
                                                                                                                                                                                                                                                                                             if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                §§push(§§pop() * _loc29_);
                                                                                                                                                                                                                                                                                                if(!_loc68_)
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                   addr1a58:
                                                                                                                                                                                                                                                                                                   §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                                                                   if(_loc67_ || Boolean(param3))
                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                      addr1a67:
                                                                                                                                                                                                                                                                                                      §§push(0);
                                                                                                                                                                                                                                                                                                      if(!_loc68_)
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                         if(§§pop() > §§pop())
                                                                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                                                                            if(!(_loc68_ && Boolean(param1)))
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                               break loop67;
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                            addr1af6:
                                                                                                                                                                                                                                                                                                            §§push(_loc22_);
                                                                                                                                                                                                                                                                                                            if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                               §§push(_loc35_);
                                                                                                                                                                                                                                                                                                               if(!_loc68_)
                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                  addr1b0e:
                                                                                                                                                                                                                                                                                                                  §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                                                  if(_loc67_)
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                     addr1b15:
                                                                                                                                                                                                                                                                                                                     _loc22_ = Number(§§pop());
                                                                                                                                                                                                                                                                                                                     if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                        addr1b40:
                                                                                                                                                                                                                                                                                                                        §§push(_loc23_ * _loc35_);
                                                                                                                                                                                                                                                                                                                        if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                           §§push(Number(§§pop()));
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                        _loc23_ = §§pop();
                                                                                                                                                                                                                                                                                                                        §§push(_loc24_ * _loc35_);
                                                                                                                                                                                                                                                                                                                        if(!_loc68_)
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                           §§push(Number(§§pop()));
                                                                                                                                                                                                                                                                                                                           if(!_loc68_)
                                                                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                                                                              addr1b4e:
                                                                                                                                                                                                                                                                                                                              _loc24_ = §§pop();
                                                                                                                                                                                                                                                                                                                              addr1b52:
                                                                                                                                                                                                                                                                                                                              §§push(1 / Math.sqrt(_loc27_ * _loc27_ + _loc28_ * _loc28_ + _loc29_ * _loc29_));
                                                                                                                                                                                                                                                                                                                              if(_loc67_)
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                 addr1b71:
                                                                                                                                                                                                                                                                                                                                 §§push(Number(§§pop()));
                                                                                                                                                                                                                                                                                                                                 if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                                                                                                                    _loc35_ = §§pop();
                                                                                                                                                                                                                                                                                                                                    addr1b7c:
                                                                                                                                                                                                                                                                                                                                    §§push(_loc27_);
                                                                                                                                                                                                                                                                                                                                    §§push(_loc35_);
                                                                                                                                                                                                                                                                                                                                    if(!(_loc68_ && Boolean(param2)))
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                       addr1b8e:
                                                                                                                                                                                                                                                                                                                                       _loc27_ = §§pop() * §§pop();
                                                                                                                                                                                                                                                                                                                                       addr1b8d:
                                                                                                                                                                                                                                                                                                                                       if(!_loc67_)
                                                                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                                                                          break loop66;
                                                                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                       §§push(_loc28_);
                                                                                                                                                                                                                                                                                                                                       if(!(_loc68_ && Boolean(param3)))
                                                                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                                                                          addr1baa:
                                                                                                                                                                                                                                                                                                                                          _loc28_ = §§pop() * _loc35_;
                                                                                                                                                                                                                                                                                                                                          addr1bae:
                                                                                                                                                                                                                                                                                                                                          addr1bac:
                                                                                                                                                                                                                                                                                                                                          §§push(_loc29_);
                                                                                                                                                                                                                                                                                                                                          §§push(_loc35_);
                                                                                                                                                                                                                                                                                                                                          if(!(_loc68_ && Boolean(param1)))
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                             addr1bbe:
                                                                                                                                                                                                                                                                                                                                             _loc29_ = §§pop() * §§pop();
                                                                                                                                                                                                                                                                                                                                             if(!_loc67_)
                                                                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                                                                break loop66;
                                                                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                                                                             §§push(_loc22_);
                                                                                                                                                                                                                                                                                                                                             if(!(_loc68_ && Boolean(param1)))
                                                                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                                                                addr1bd8:
                                                                                                                                                                                                                                                                                                                                                addr1bda:
                                                                                                                                                                                                                                                                                                                                                §§push(§§pop() * _loc27_);
                                                                                                                                                                                                                                                                                                                                                if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                   addr1c08:
                                                                                                                                                                                                                                                                                                                                                   §§push(_loc23_);
                                                                                                                                                                                                                                                                                                                                                   if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                                                                      addr1be9:
                                                                                                                                                                                                                                                                                                                                                      addr1beb:
                                                                                                                                                                                                                                                                                                                                                      §§push(§§pop() * _loc28_);
                                                                                                                                                                                                                                                                                                                                                      if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                         addr1c07:
                                                                                                                                                                                                                                                                                                                                                         addr1bfb:
                                                                                                                                                                                                                                                                                                                                                         addr1bfa:
                                                                                                                                                                                                                                                                                                                                                         §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                                                                                                                         §§push(_loc24_);
                                                                                                                                                                                                                                                                                                                                                         if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                                                                                                                            §§push(§§pop() * _loc29_);
                                                                                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                                                                                         §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                                                                                                                         §§push(param3);
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                                                                   if(§§pop() < §§pop())
                                                                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                                                                      break loop66;
                                                                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                                                                   _loc19_ = _loc13_.vertex;
                                                                                                                                                                                                                                                                                                                                                   _loc20_ = _loc16_.vertex;
                                                                                                                                                                                                                                                                                                                                                   _loc21_ = _loc11_.vertex;
                                                                                                                                                                                                                                                                                                                                                   if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                                                                      §§push(_loc20_.x);
                                                                                                                                                                                                                                                                                                                                                      if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                         _loc22_ = §§pop() - _loc19_.x;
                                                                                                                                                                                                                                                                                                                                                         §§push(_loc20_.y);
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                      §§push(§§pop() - _loc19_.y);
                                                                                                                                                                                                                                                                                                                                                      if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                         §§push(Number(§§pop()));
                                                                                                                                                                                                                                                                                                                                                         if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                                                                                                                            _loc23_ = §§pop();
                                                                                                                                                                                                                                                                                                                                                            if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                               §§push(_loc20_.z);
                                                                                                                                                                                                                                                                                                                                                               §§push(_loc19_.z);
                                                                                                                                                                                                                                                                                                                                                               if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                                                                  _loc24_ = §§pop() - §§pop();
                                                                                                                                                                                                                                                                                                                                                                  §§push(_loc21_.x);
                                                                                                                                                                                                                                                                                                                                                                  §§push(_loc19_.x);
                                                                                                                                                                                                                                                                                                                                                                  if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                     §§push(§§pop() - §§pop());
                                                                                                                                                                                                                                                                                                                                                                     if(_loc67_ || Boolean(param1))
                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                        _loc27_ = §§pop();
                                                                                                                                                                                                                                                                                                                                                                        if(_loc67_ || Boolean(param3))
                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                           §§push(_loc21_.y);
                                                                                                                                                                                                                                                                                                                                                                           if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                                                                                                                              _loc28_ = §§pop() - _loc19_.y;
                                                                                                                                                                                                                                                                                                                                                                              §§push(_loc21_.z);
                                                                                                                                                                                                                                                                                                                                                                              if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                                 §§push(_loc19_.z);
                                                                                                                                                                                                                                                                                                                                                                                 if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                                                                                                                                                                    §§push(§§pop() - §§pop());
                                                                                                                                                                                                                                                                                                                                                                                    if(!(_loc68_ && Boolean(param1)))
                                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                                       _loc29_ = §§pop();
                                                                                                                                                                                                                                                                                                                                                                                       §§push(_loc29_ * _loc23_);
                                                                                                                                                                                                                                                                                                                                                                                       if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                                                                                                                          §§push(_loc28_ * _loc24_);
                                                                                                                                                                                                                                                                                                                                                                                          if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                                                             §§push(§§pop() - §§pop());
                                                                                                                                                                                                                                                                                                                                                                                             if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                                                                                                                §§push(Number(§§pop()));
                                                                                                                                                                                                                                                                                                                                                                                                if(!(_loc68_ && Boolean(param2)))
                                                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                                                   addr1d32:
                                                                                                                                                                                                                                                                                                                                                                                                   _loc32_ = §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                   if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                                                                                                                      addr1d3a:
                                                                                                                                                                                                                                                                                                                                                                                                      §§push(_loc27_);
                                                                                                                                                                                                                                                                                                                                                                                                      if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                                                         §§push(_loc24_);
                                                                                                                                                                                                                                                                                                                                                                                                         if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                                                                                                                                                                            §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                            if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                                                                               addr1d53:
                                                                                                                                                                                                                                                                                                                                                                                                               §§push(_loc29_);
                                                                                                                                                                                                                                                                                                                                                                                                               §§push(_loc22_);
                                                                                                                                                                                                                                                                                                                                                                                                               if(!(_loc68_ && Boolean(param2)))
                                                                                                                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                  if(!(_loc68_ && Boolean(param2)))
                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                     §§push(§§pop() - §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                     if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                        _loc33_ = Number(§§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                        if(!(_loc68_ && Boolean(param1)))
                                                                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                                                                           §§push(_loc28_ * _loc22_);
                                                                                                                                                                                                                                                                                                                                                                                                                           if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                                                                                                                                                                              §§push(_loc27_ * _loc23_);
                                                                                                                                                                                                                                                                                                                                                                                                                              if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                                                                                 §§push(§§pop() - §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                 if(!(_loc68_ && Boolean(param3)))
                                                                                                                                                                                                                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                                                                                                                                                                                                                    _loc34_ = Number(§§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                    if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                                                                                       addr1db8:
                                                                                                                                                                                                                                                                                                                                                                                                                                       §§push(_loc32_ < _loc37_);
                                                                                                                                                                                                                                                                                                                                                                                                                                       if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                                                                                                                                                                          var _temp_120:* = §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                          §§push(_temp_120);
                                                                                                                                                                                                                                                                                                                                                                                                                                          §§push(Boolean(_temp_120));
                                                                                                                                                                                                                                                                                                                                                                                                                                          if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                                                                                                             if(§§pop())
                                                                                                                                                                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                                                                                                                                                                §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                if(_loc67_ || Boolean(param1))
                                                                                                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                                                                                                   addr1def:
                                                                                                                                                                                                                                                                                                                                                                                                                                                   §§push(_loc32_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                   if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                                                                                                                                                                      addr1dfc:
                                                                                                                                                                                                                                                                                                                                                                                                                                                      var _temp_123:* = §§pop() > -_loc37_;
                                                                                                                                                                                                                                                                                                                                                                                                                                                      addr1df7:
                                                                                                                                                                                                                                                                                                                                                                                                                                                      §§push(_temp_123);
                                                                                                                                                                                                                                                                                                                                                                                                                                                      if(_temp_123)
                                                                                                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                                                                                                                                                                                                                            §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                            §§push(_loc33_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                            §§push(_loc37_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                            if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                                                                                                                               §§push(§§pop() < §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                               if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  addr1e23:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  var _temp_125:* = Boolean(§§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(_temp_125);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(_temp_125);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     §§push(Boolean(§§pop()));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  if(§§pop())
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        §§push(_loc33_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                           §§push(_loc37_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                           if(!(_loc68_ && Boolean(param3)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                              §§push(-§§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                              if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 addr1e6f:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 var _temp_130:* = §§pop() > §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 addr1e6e:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 §§push(_temp_130);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 §§push(_temp_130);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    addr1e77:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if(§§pop())
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       if(_loc67_ || Boolean(param1))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          §§push(_loc34_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          §§push(_loc37_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             addr1e96:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             var _temp_132:* = §§pop() < §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             addr1e95:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             addr1e97:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             §§push(_temp_132);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             if(_temp_132)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                addr1e9c:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                §§push(_loc34_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                §§push(_loc37_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   addr1eb2:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   addr1eaf:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   if(§§pop() > -§§pop())
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         §§push(_loc22_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            §§push(_loc27_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  addr1eeb:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(_loc23_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     §§push(_loc28_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     if(_loc67_ || Boolean(param1))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        addr1f03:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if(!(_loc68_ && Boolean(param2)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           addr1f12:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           if(_loc67_ || Boolean(param1))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              §§push(_loc24_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              if(_loc67_ || Boolean(param3))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 §§push(§§pop() + §§pop() * _loc29_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 if(!(_loc68_ && Boolean(param1)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    §§push(0);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       if(§§pop() > §§pop())
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          break loop70;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       addr1fba:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       §§push(1);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          §§push(§§pop() / Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             addr1fe1:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             §§push(Number(§§pop()));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                _loc35_ = §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                addr1ff4:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                addr1ff6:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                §§push(_loc22_ * _loc35_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   _loc22_ = §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      addr2008:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      addr2006:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      §§push(_loc23_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      §§push(_loc35_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         addr2010:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            addr2018:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            _loc23_ = §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            §§push(_loc24_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            §§push(_loc35_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               addr202c:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  _loc24_ = §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  addr2038:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  addr2036:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(1 / Math.sqrt(_loc27_ * _loc27_ + _loc28_ * _loc28_ + _loc29_ * _loc29_));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               _loc35_ = Number(§§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  addr205a:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  addr205c:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(_loc27_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(_loc35_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     if(!(_loc68_ && Boolean(param3)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        addr2074:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        _loc27_ = Number(§§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        addr2076:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        §§push(_loc28_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           addr207e:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           addr2080:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           §§push(§§pop() * _loc35_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              addr208f:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              §§push(Number(§§pop()));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 addr2096:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 _loc28_ = §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 §§push(_loc29_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    addr20a8:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    §§push(_loc35_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       addr20bf:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       addr20bc:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       addr20be:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          addr20b8:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          _loc29_ = §§pop();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          §§push(_loc22_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       §§push(§§pop() * _loc27_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       §§push(_loc23_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          §§push(§§pop() * _loc28_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          if(!(_loc68_ && Boolean(param3)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             addr20d8:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                addr20fc:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                addr20eb:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                §§push(_loc24_ * _loc29_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if(_loc67_ || Boolean(param3))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   addr20fb:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   addr20fa:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   §§push(param3);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if(§§pop() < §§pop())
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   break loop69;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                _loc63_ = true;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                addr2108:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                _loc64_ = new Face();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   _loc64_.material = _loc9_.material;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      addr212d:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      _loc64_.normalX = _loc9_.normalX;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         _loc64_.normalY = _loc9_.normalY;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            addr2151:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            _loc64_.normalZ = _loc9_.normalZ;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               _loc64_.offset = _loc9_.offset;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         addr216f:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         _loc16_ = null;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         if(!(_loc68_ && Boolean(param3)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            loop24:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            for(; _loc14_ != _loc12_; _loc14_ = §§pop())
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               _loc17_ = new Wrapper();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  _loc17_.vertex = _loc14_.vertex;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  loop77:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  while(true)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     while(true)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if(_loc67_ || Boolean(param3))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           if(_loc16_ == null)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              _loc64_.wrapper = _loc17_;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              break;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           if(_loc68_ && Boolean(param2))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              break loop77;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        _loc16_.next = _loc17_;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           break loop77;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        break;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  break loop78;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               _loc16_ = _loc17_;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               while(true)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     §§push(_loc14_.next);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     if(!(_loc67_ || Boolean(param3)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        break;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     if(§§pop() == null)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        §§push(_loc9_.wrapper);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        continue loop24;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(_loc14_.next);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  break;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               §§push(§§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               loop25:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               for(; _loc15_ != _loc13_; _loc15_ = §§pop())
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  _loc17_ = new Wrapper();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     _loc17_.vertex = _loc15_.vertex;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     while(true)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           if(_loc16_ == null)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              _loc64_.wrapper = _loc17_;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              break;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           if(_loc67_ || Boolean(param2))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              _loc16_.next = _loc17_;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              if(!_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 break;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        break;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  _loc16_ = _loc17_;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  while(true)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        §§push(_loc15_.next);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if(!_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           break;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if(§§pop() == null)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           §§push(_loc8_.wrapper);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           continue loop25;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     §§push(_loc15_.next);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     break;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(§§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  _loc40_[_loc5_] = _loc64_;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     addr22c4:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     _loc40_[_loc6_] = null;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  addr22cb:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  _loc9_ = _loc64_;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  if(!(_loc68_ && Boolean(param2)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     if(!param4)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        break loop64;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§goto(addr2327);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            §§goto(addr22c4);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         §§goto(addr22cb);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      §§goto(addr2151);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   §§goto(addr216f);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                §§goto(addr212d);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             §§goto(addr20fb);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          §§goto(addr20fa);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    §§goto(addr20d8);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 §§goto(addr20bf);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              §§goto(addr20bc);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        §§goto(addr20b8);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        addr2073:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     §§goto(addr2096);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§goto(addr20be);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               §§goto(addr2108);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            §§goto(addr20fc);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         §§goto(addr207e);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      §§goto(addr20fa);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   §§goto(addr205a);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                §§goto(addr2018);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             §§goto(addr20a8);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          §§goto(addr2074);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       §§goto(addr2038);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    addr1fa4:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if(§§pop() < §§pop())
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       if(!(_loc68_ && Boolean(this)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          break loop65;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       §§goto(addr2108);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    §§goto(addr1fba);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 §§goto(addr1ff4);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              addr1f8a:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              §§push(§§pop() * _loc34_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              if(!_loc68_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 addr1f93:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 if(!(_loc68_ && Boolean(param2)))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    addr1fa2:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    §§goto(addr1fa4);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    §§push(0);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 §§goto(addr20bf);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              §§goto(addr20fc);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           §§goto(addr20a8);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        §§goto(addr202c);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     §§goto(addr20eb);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  addr1f71:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  addr1f76:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§push(_loc9_.normalY * _loc33_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     §§push(§§pop() + §§pop());
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     §§push(_loc9_.normalZ);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        §§goto(addr1f8a);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§goto(addr20fa);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               §§goto(addr2008);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            §§goto(addr1ff6);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         §§goto(addr20bf);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      §§goto(addr2076);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   §§push(_loc9_.normalX);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      §§push(_loc32_);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      if(_loc67_)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         §§goto(addr1f71);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      §§goto(addr20be);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   §§goto(addr1fa2);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                §§goto(addr2080);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             §§goto(addr1eb2);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          §§goto(addr1eaf);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       §§goto(addr1e95);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    §§goto(addr1e96);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 §§goto(addr1e97);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                              §§goto(addr1f76);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                           §§goto(addr1f12);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        §§goto(addr1fe1);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     §§goto(addr1e6e);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  §§goto(addr1e6f);
                                                                                                                                                                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                                                                                                                                                                               §§goto(addr1eb2);
                                                                                                                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                                                                                                                            §§goto(addr20be);
                                                                                                                                                                                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                                                                                                                                                                                         §§goto(addr1e6e);
                                                                                                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                                                                                                      §§goto(addr1e23);
                                                                                                                                                                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                                                                                                                                                                   §§goto(addr2073);
                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                §§goto(addr2076);
                                                                                                                                                                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                                                                                                                                                                             §§goto(addr1dfc);
                                                                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                          §§goto(addr1e77);
                                                                                                                                                                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                                                                                                                       §§goto(addr1e9c);
                                                                                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                                                                                    §§goto(addr1def);
                                                                                                                                                                                                                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                                                                                                                                                                                                                 §§goto(addr205c);
                                                                                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                                                                                              §§goto(addr202c);
                                                                                                                                                                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                                                                                                                                                                           §§goto(addr20a8);
                                                                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                                                                        §§goto(addr2108);
                                                                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                                                                     §§goto(addr1df7);
                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                  §§goto(addr1f93);
                                                                                                                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                                                                                                                               §§goto(addr1f03);
                                                                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                                                                            §§goto(addr2008);
                                                                                                                                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                                                                                                                                         §§goto(addr20be);
                                                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                                                      §§goto(addr208f);
                                                                                                                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                                                                                                                   §§goto(addr2006);
                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                §§goto(addr208f);
                                                                                                                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                                                                                                                             §§goto(addr2008);
                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                          §§goto(addr1f12);
                                                                                                                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                                                                       §§goto(addr1eeb);
                                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                                    §§goto(addr20b8);
                                                                                                                                                                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                                                                                                                                                                 §§goto(addr1f93);
                                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                                              §§goto(addr205c);
                                                                                                                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                                                                                                                           §§goto(addr1d32);
                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                        §§goto(addr1d3a);
                                                                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                                                                     §§goto(addr2096);
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                  §§goto(addr1d53);
                                                                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                                                                               §§goto(addr2010);
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                            §§goto(addr2036);
                                                                                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                                                                                         §§goto(addr1df7);
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                      §§goto(addr2096);
                                                                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                                                                   §§goto(addr1db8);
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                §§goto(addr1c07);
                                                                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                                                                             §§goto(addr1bfb);
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                          §§goto(addr1bfa);
                                                                                                                                                                                                                                                                                                                                          addr1ba9:
                                                                                                                                                                                                                                                                                                                                          addr1ba6:
                                                                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                                                                       §§goto(addr1bd8);
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                    §§goto(addr1be9);
                                                                                                                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                                                                                                                 §§goto(addr1b8e);
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                              §§goto(addr1bfb);
                                                                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                                                                           §§goto(addr1bae);
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                        §§goto(addr1ba9);
                                                                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                                                                     §§goto(addr1bac);
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                  §§goto(addr1ba9);
                                                                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                                                                               §§goto(addr1b40);
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                            §§goto(addr1b4e);
                                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                                         addr1ac4:
                                                                                                                                                                                                                                                                                                         §§push(1);
                                                                                                                                                                                                                                                                                                         if(!_loc68_)
                                                                                                                                                                                                                                                                                                         {
                                                                                                                                                                                                                                                                                                            §§push(§§pop() / Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_));
                                                                                                                                                                                                                                                                                                            if(_loc67_ || Boolean(param3))
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                               _loc35_ = §§pop();
                                                                                                                                                                                                                                                                                                               §§goto(addr1af6);
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                            §§goto(addr1b8d);
                                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                                         §§goto(addr1b52);
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                      addr1abc:
                                                                                                                                                                                                                                                                                                      if(§§pop() < §§pop())
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                         break loop68;
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                      §§goto(addr1ac4);
                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                   addr1aac:
                                                                                                                                                                                                                                                                                                   §§push(_loc9_.normalZ);
                                                                                                                                                                                                                                                                                                   if(!_loc68_)
                                                                                                                                                                                                                                                                                                   {
                                                                                                                                                                                                                                                                                                      addr1ab6:
                                                                                                                                                                                                                                                                                                      §§goto(addr1abc);
                                                                                                                                                                                                                                                                                                      §§push(§§pop() + §§pop() * _loc34_);
                                                                                                                                                                                                                                                                                                      §§push(0);
                                                                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                                                                   §§goto(addr1b40);
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                §§goto(addr1c08);
                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                             addr1a9a:
                                                                                                                                                                                                                                                                                             §§push(§§pop() + §§pop() * _loc33_);
                                                                                                                                                                                                                                                                                             if(_loc67_ || Boolean(this))
                                                                                                                                                                                                                                                                                             {
                                                                                                                                                                                                                                                                                                §§goto(addr1aac);
                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                             §§goto(addr1b7c);
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                          §§goto(addr1a67);
                                                                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                                                                       §§goto(addr1a3b);
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                    §§push(_loc9_.normalX);
                                                                                                                                                                                                                                                                                    §§push(_loc32_);
                                                                                                                                                                                                                                                                                    if(_loc67_)
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                       §§goto(addr1a9a);
                                                                                                                                                                                                                                                                                       §§push(§§pop() * §§pop());
                                                                                                                                                                                                                                                                                       §§push(_loc9_.normalY);
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                    §§goto(addr1bda);
                                                                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                                                                 §§goto(addr1baa);
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                           }
                                                                                                                                                                                                                                                                           §§goto(addr1a1e);
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                        §§goto(addr1a1d);
                                                                                                                                                                                                                                                                     }
                                                                                                                                                                                                                                                                     §§goto(addr1a32);
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                  §§goto(addr1a04);
                                                                                                                                                                                                                                                               }
                                                                                                                                                                                                                                                               §§goto(addr1a05);
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            §§goto(addr1a06);
                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                         §§goto(addr19e9);
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                      §§goto(addr1a1e);
                                                                                                                                                                                                                                                   }
                                                                                                                                                                                                                                                   §§goto(addr1a58);
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                §§goto(addr19c7);
                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                             §§goto(addr1a06);
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          §§goto(addr198b);
                                                                                                                                                                                                                                       }
                                                                                                                                                                                                                                       §§goto(addr1a1e);
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    §§goto(addr19a9);
                                                                                                                                                                                                                                 }
                                                                                                                                                                                                                                 §§goto(addr1a28);
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              §§goto(addr1975);
                                                                                                                                                                                                                           }
                                                                                                                                                                                                                           §§goto(addr19e5);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        §§goto(addr1984);
                                                                                                                                                                                                                     }
                                                                                                                                                                                                                     §§goto(addr19b8);
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  §§goto(addr19e9);
                                                                                                                                                                                                               }
                                                                                                                                                                                                               §§goto(addr1ab6);
                                                                                                                                                                                                            }
                                                                                                                                                                                                            §§goto(addr1b8d);
                                                                                                                                                                                                         }
                                                                                                                                                                                                         §§goto(addr1a1e);
                                                                                                                                                                                                      }
                                                                                                                                                                                                      §§goto(addr1942);
                                                                                                                                                                                                   }
                                                                                                                                                                                                   §§goto(addr19d6);
                                                                                                                                                                                                }
                                                                                                                                                                                                §§goto(addr1951);
                                                                                                                                                                                             }
                                                                                                                                                                                             §§goto(addr1bac);
                                                                                                                                                                                          }
                                                                                                                                                                                          §§goto(addr1b0e);
                                                                                                                                                                                       }
                                                                                                                                                                                       §§goto(addr1beb);
                                                                                                                                                                                    }
                                                                                                                                                                                    §§goto(addr1bae);
                                                                                                                                                                                 }
                                                                                                                                                                                 §§goto(addr1963);
                                                                                                                                                                              }
                                                                                                                                                                              §§goto(addr1b7c);
                                                                                                                                                                           }
                                                                                                                                                                           §§goto(addr1bbe);
                                                                                                                                                                        }
                                                                                                                                                                        §§goto(addr1beb);
                                                                                                                                                                     }
                                                                                                                                                                     §§goto(addr190b);
                                                                                                                                                                  }
                                                                                                                                                                  §§goto(addr1bae);
                                                                                                                                                               }
                                                                                                                                                               §§goto(addr186a);
                                                                                                                                                            }
                                                                                                                                                            §§goto(addr1ba6);
                                                                                                                                                         }
                                                                                                                                                         §§goto(addr1b71);
                                                                                                                                                      }
                                                                                                                                                      §§goto(addr187e);
                                                                                                                                                   }
                                                                                                                                                   §§goto(addr187c);
                                                                                                                                                }
                                                                                                                                                §§goto(addr188f);
                                                                                                                                             }
                                                                                                                                             §§goto(addr1af6);
                                                                                                                                          }
                                                                                                                                          §§goto(addr1a39);
                                                                                                                                       }
                                                                                                                                       §§goto(addr186e);
                                                                                                                                    }
                                                                                                                                    §§goto(addr190b);
                                                                                                                                 }
                                                                                                                                 §§goto(addr1800);
                                                                                                                              }
                                                                                                                              §§goto(addr1b15);
                                                                                                                           }
                                                                                                                           _loc10_ = _loc9_.wrapper;
                                                                                                                           if(!(_loc68_ && Boolean(param2)))
                                                                                                                           {
                                                                                                                              loop21:
                                                                                                                              while(true)
                                                                                                                              {
                                                                                                                                 loop82:
                                                                                                                                 while(true)
                                                                                                                                 {
                                                                                                                                    loop83:
                                                                                                                                    while(true)
                                                                                                                                    {
                                                                                                                                       while(true)
                                                                                                                                       {
                                                                                                                                          §§push(_loc10_.next);
                                                                                                                                          if(_loc67_ || Boolean(this))
                                                                                                                                          {
                                                                                                                                             §§push(§§pop() == _loc12_);
                                                                                                                                             if(_loc67_ || Boolean(param1))
                                                                                                                                             {
                                                                                                                                                §§push(!§§pop());
                                                                                                                                             }
                                                                                                                                             var _temp_169:* = Boolean(§§pop());
                                                                                                                                             §§push(_temp_169);
                                                                                                                                             §§push(_temp_169);
                                                                                                                                             if(_loc67_ || Boolean(param2))
                                                                                                                                             {
                                                                                                                                                §§push(Boolean(§§pop()));
                                                                                                                                             }
                                                                                                                                             if(!§§pop())
                                                                                                                                             {
                                                                                                                                                break;
                                                                                                                                             }
                                                                                                                                             §§pop();
                                                                                                                                             if(!_loc67_)
                                                                                                                                             {
                                                                                                                                                break loop83;
                                                                                                                                             }
                                                                                                                                             §§push(_loc10_.next);
                                                                                                                                             if(!(_loc67_ || Boolean(param3)))
                                                                                                                                             {
                                                                                                                                                break loop82;
                                                                                                                                             }
                                                                                                                                          }
                                                                                                                                          §§push(null);
                                                                                                                                          if(!(_loc68_ && Boolean(param1)))
                                                                                                                                          {
                                                                                                                                             §§push(§§pop() == §§pop());
                                                                                                                                             if(!(_loc68_ && Boolean(this)))
                                                                                                                                             {
                                                                                                                                                §§push(!§§pop());
                                                                                                                                             }
                                                                                                                                             §§push(Boolean(§§pop()));
                                                                                                                                             break;
                                                                                                                                          }
                                                                                                                                          §§goto(addr171d);
                                                                                                                                       }
                                                                                                                                       if(!§§pop())
                                                                                                                                       {
                                                                                                                                          if(!(_loc68_ && Boolean(param3)))
                                                                                                                                          {
                                                                                                                                             §§push(_loc15_.next);
                                                                                                                                             if(_loc67_)
                                                                                                                                             {
                                                                                                                                                break loop82;
                                                                                                                                             }
                                                                                                                                             §§push(§§pop());
                                                                                                                                             break loop21;
                                                                                                                                          }
                                                                                                                                          break;
                                                                                                                                       }
                                                                                                                                       §§push(_loc10_.next);
                                                                                                                                       if(!(_loc67_ || Boolean(this)))
                                                                                                                                       {
                                                                                                                                          break loop82;
                                                                                                                                       }
                                                                                                                                       continue loop21;
                                                                                                                                    }
                                                                                                                                 }
                                                                                                                                 addr171d:
                                                                                                                                 if(§§pop() != null)
                                                                                                                                 {
                                                                                                                                    break loop83;
                                                                                                                                 }
                                                                                                                                 §§push(_loc8_.wrapper);
                                                                                                                                 break;
                                                                                                                                 _loc10_ = §§pop();
                                                                                                                              }
                                                                                                                              _loc17_ = §§pop();
                                                                                                                              if(!(_loc68_ && Boolean(param1)))
                                                                                                                              {
                                                                                                                                 §§push(_loc10_.vertex);
                                                                                                                                 if(!(_loc68_ && Boolean(param2)))
                                                                                                                                 {
                                                                                                                                    if(§§pop() == _loc17_.vertex)
                                                                                                                                    {
                                                                                                                                       addr175d:
                                                                                                                                       _loc12_ = _loc10_;
                                                                                                                                       _loc15_ = _loc17_;
                                                                                                                                       §§goto(addr1771);
                                                                                                                                    }
                                                                                                                                    §§goto(addr1776);
                                                                                                                                 }
                                                                                                                                 §§goto(addr177a);
                                                                                                                              }
                                                                                                                              §§goto(addr175d);
                                                                                                                           }
                                                                                                                           break loop83;
                                                                                                                        }
                                                                                                                        §§goto(addr1776);
                                                                                                                     }
                                                                                                                     §§goto(addr157e);
                                                                                                                     §§goto(addr1658);
                                                                                                                     _loc14_ = _loc16_;
                                                                                                                     _loc13_ = _loc11_;
                                                                                                                  }
                                                                                                                  break loop14;
                                                                                                               }
                                                                                                            }
                                                                                                            if(_loc13_ != null)
                                                                                                            {
                                                                                                               addr155f:
                                                                                                               if(_loc12_ != null)
                                                                                                               {
                                                                                                                  break loop73;
                                                                                                               }
                                                                                                               break loop64;
                                                                                                            }
                                                                                                            §§push(_loc12_.next);
                                                                                                            if(_loc67_ || Boolean(param2))
                                                                                                            {
                                                                                                               continue loop14;
                                                                                                            }
                                                                                                            §§goto(addr157e);
                                                                                                         }
                                                                                                         §§goto(addr155f);
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                         §§push(_loc9_.wrapper);
                                                                                                      }
                                                                                                      §§goto(addr1469);
                                                                                                   }
                                                                                                   §§goto(addr145d);
                                                                                                }
                                                                                                §§goto(addr155f);
                                                                                             }
                                                                                             _loc12_ = §§pop();
                                                                                             §§goto(addr1437);
                                                                                          }
                                                                                          break loop12;
                                                                                       }
                                                                                       §§goto(addr1459);
                                                                                    }
                                                                                    §§goto(addr2337);
                                                                                 }
                                                                                 break loop64;
                                                                              }
                                                                              break loop64;
                                                                           }
                                                                           break loop64;
                                                                        }
                                                                        break loop64;
                                                                     }
                                                                     break loop64;
                                                                  }
                                                                  break;
                                                               }
                                                               §§push(_loc6_);
                                                               if(_loc67_ || Boolean(param1))
                                                               {
                                                                  §§push(§§pop() + 1);
                                                                  if(_loc67_ || Boolean(param1))
                                                                  {
                                                                     §§push(int(§§pop()));
                                                                  }
                                                               }
                                                               _loc6_ = §§pop();
                                                               continue loop12;
                                                            }
                                                            §§goto(addr13ff);
                                                         }
                                                         break loop14;
                                                      }
                                                      §§goto(addr2327);
                                                   }
                                                }
                                                §§goto(addr231b);
                                             }
                                             §§goto(addr2349);
                                          }
                                       }
                                       §§goto(addr2327);
                                    }
                                    §§goto(addr2458);
                                 }
                                 if(§§pop() == §§pop())
                                 {
                                    if(_loc67_ || Boolean(param2))
                                    {
                                       addr134d:
                                       this._faces[this.faceIdCounter] = _loc40_[0];
                                       addr135b:
                                       _loc65_ = this;
                                       _loc66_ = _loc65_.alternativa3d::faceIdCounter + 1;
                                       if(!(_loc68_ && Boolean(param2)))
                                       {
                                          _loc65_.alternativa3d::faceIdCounter = _loc66_;
                                       }
                                    }
                                    continue loop1;
                                 }
                                 §§goto(addr2385);
                              }
                              §§goto(addr13a5);
                           }
                           _loc5_ = §§pop();
                           addr23ab:
                           §§goto(addr2454);
                        }
                        §§push(0);
                        if(_loc67_ || Boolean(param1))
                        {
                           §§push(int(§§pop()));
                           if(!(_loc68_ && Boolean(param3)))
                           {
                              break loop60;
                           }
                        }
                        addr2456:
                        if(§§pop() >= _loc43_)
                        {
                           continue loop1;
                        }
                        _loc9_ = _loc40_[_loc5_];
                        if(_loc67_ || Boolean(param3))
                        {
                           if(_loc9_ != null)
                           {
                              if(_loc67_ || Boolean(param2))
                              {
                                 _loc9_.calculateBestSequenceAndNormal();
                                 if(_loc67_)
                                 {
                                    this._faces[this.faceIdCounter] = _loc9_;
                                    if(_loc67_ || Boolean(param3))
                                    {
                                       _loc65_ = this;
                                       _loc66_ = _loc65_.alternativa3d::faceIdCounter + 1;
                                       if(!(_loc68_ && Boolean(param1)))
                                       {
                                          _loc65_.alternativa3d::faceIdCounter = _loc66_;
                                       }
                                       if(!(_loc68_ && Boolean(param1)))
                                       {
                                          addr2430:
                                          §§push(_loc5_);
                                          if(!_loc68_)
                                          {
                                             §§push(§§pop() + 1);
                                             if(!(_loc68_ && Boolean(param1)))
                                             {
                                                addr2451:
                                                §§push(int(§§pop()));
                                             }
                                             _loc5_ = §§pop();
                                             while(true)
                                             {
                                                §§goto(addr2456);
                                             }
                                             break loop1;
                                             addr2454:
                                          }
                                          §§goto(addr2451);
                                       }
                                    }
                                 }
                              }
                              §§goto(addr2454);
                           }
                        }
                        §§goto(addr2430);
                        addr2458:
                     }
                     break loop59;
                     addr0d11:
                  }
                  addr0d0b:
                  addr0d0c:
                  §§goto(addr0d10);
               }
               §§push(_loc43_);
               if(!_loc68_)
               {
                  §§push(§§pop() + 1);
                  if(_loc68_)
                  {
                     break loop52;
                  }
               }
               §§push(int(§§pop()));
               break loop52;
            }
         }
         break loop14;
      }
      
      public function transform(param1:Matrix3D) : void
      {
         §§push(false);
         var _loc10_:Boolean = true;
         var _loc11_:* = §§pop();
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:Vertex = null;
         var _loc7_:Vector.<Number> = null;
         if(_loc10_)
         {
            if(param1 != null)
            {
               var _loc5_:Vector.<Vertex> = new Vector.<Vertex>();
               var _loc6_:* = 0;
               for each(_loc4_ in this._vertices)
               {
                  if(!(_loc11_ && Boolean(_loc3_)))
                  {
                     _loc5_[_loc6_] = _loc4_;
                     if(!(_loc11_ && Boolean(_loc2_)))
                     {
                        §§push(_loc6_);
                        if(_loc10_ || Boolean(this))
                        {
                           §§push(§§pop() + 1);
                           if(!_loc11_)
                           {
                              §§push(int(§§pop()));
                           }
                        }
                        _loc6_ = §§pop();
                     }
                  }
               }
               _loc7_ = new Vector.<Number>();
               _loc2_ = 0;
               _loc3_ = 0;
               loop1:
               while(_loc2_ < _loc6_)
               {
                  _loc4_ = _loc5_[_loc2_];
                  _loc7_[_loc3_] = _loc4_.x;
                  §§push(int(_loc3_ + 1));
                  if(_loc10_ || Boolean(this))
                  {
                     _loc3_ = §§pop();
                     _loc7_[_loc3_] = _loc4_.y;
                     loop3:
                     while(true)
                     {
                        while(true)
                        {
                           §§push(_loc3_);
                           if(!(_loc11_ && Boolean(this)))
                           {
                              _loc3_ = int(§§pop() + 1);
                              if(!_loc10_)
                              {
                                 continue loop1;
                              }
                              _loc7_[_loc3_] = _loc4_.z;
                              if(_loc11_ && Boolean(_loc3_))
                              {
                                 break;
                              }
                              §§push(_loc3_);
                              if(_loc11_ && Boolean(_loc3_))
                              {
                                 break loop3;
                              }
                              §§push(int(§§pop() + 1));
                           }
                           _loc3_ = §§pop();
                           if(!_loc11_)
                           {
                              break;
                           }
                           continue loop1;
                        }
                        §§push(_loc2_);
                        break;
                     }
                  }
                  _loc2_ = int(§§pop());
               }
               param1.transformVectors(_loc7_,_loc7_);
               _loc2_ = 0;
               _loc3_ = 0;
               loop2:
               for(; _loc2_ < _loc6_; _loc2_ = §§pop())
               {
                  _loc4_ = _loc5_[_loc2_];
                  loop5:
                  while(true)
                  {
                     loop6:
                     while(true)
                     {
                        if(!(_loc11_ && Boolean(param1)))
                        {
                           _loc4_.x = _loc7_[_loc3_];
                           §§push(_loc3_);
                           if(!(_loc10_ || Boolean(param1)))
                           {
                              break loop5;
                           }
                           _loc3_ = int(§§pop() + 1);
                           _loc4_.y = _loc7_[_loc3_];
                           if(_loc11_)
                           {
                              break;
                           }
                           §§push(_loc3_ + 1);
                           if(_loc11_)
                           {
                              break loop5;
                           }
                           _loc3_ = int(§§pop());
                        }
                        _loc4_.z = _loc7_[_loc3_];
                        while(true)
                        {
                           §§push(_loc3_);
                           if(!(_loc11_ && Boolean(this)))
                           {
                              §§push(§§pop() + 1);
                              if(!(_loc10_ || Boolean(_loc2_)))
                              {
                                 break;
                              }
                              §§push(int(§§pop()));
                              if(_loc11_ && Boolean(_loc3_))
                              {
                                 break loop5;
                              }
                           }
                           _loc3_ = §§pop();
                           break loop6;
                        }
                        addr01f6:
                        §§push(§§pop() + 1);
                        if(!_loc11_)
                        {
                           break loop5;
                        }
                        continue loop2;
                     }
                     §§goto(addr01f6);
                  }
                  §§push(int(§§pop()));
               }
               return;
            }
         }
         throw new TypeError("Parameter matrix must be non-null.");
      }
      
      public function clone() : Geometry
      {
         §§push(false);
         var _loc12_:Boolean = true;
         var _loc13_:* = §§pop();
         var _loc2_:* = undefined;
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Face = null;
         var _loc6_:Face = null;
         var _loc7_:Wrapper = null;
         var _loc8_:Wrapper = null;
         var _loc9_:Wrapper = null;
         var _loc1_:Geometry = new Geometry();
         while(true)
         {
            if(_loc12_)
            {
               _loc1_.vertexIdCounter = this.vertexIdCounter;
               if(_loc13_ && Boolean(_loc2_))
               {
                  break;
               }
            }
            _loc1_.faceIdCounter = this.faceIdCounter;
            break;
         }
         var _loc10_:* = 0;
         var _loc11_:* = this._vertices;
         loop0:
         while(true)
         {
            §§push(§§hasnext(_loc11_,_loc10_));
            if(_loc13_ && Boolean(_loc3_))
            {
               break;
            }
            if(§§pop())
            {
               _loc2_ = §§nextname(_loc10_,_loc11_);
               _loc3_ = this._vertices[_loc2_];
               _loc4_ = new Vertex();
               if(_loc12_ || Boolean(_loc3_))
               {
                  _loc4_.x = _loc3_.x;
                  _loc4_.y = _loc3_.y;
                  _loc4_.z = _loc3_.z;
                  _loc4_.u = _loc3_.u;
                  _loc4_.v = _loc3_.v;
                  _loc3_.value = _loc4_;
                  if(_loc13_)
                  {
                     continue;
                  }
               }
               _loc1_._vertices[_loc2_] = _loc4_;
               continue;
            }
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
                        while(true)
                        {
                           if(_loc12_)
                           {
                              if(_loc12_)
                              {
                                 if(_loc12_ || Boolean(_loc1_))
                                 {
                                    §§push(0);
                                    if(_loc12_)
                                    {
                                       _loc10_ = §§pop();
                                       if(_loc12_)
                                       {
                                          _loc11_ = this._faces;
                                          while(true)
                                          {
                                             §§push(§§hasnext(_loc11_,_loc10_));
                                             if(!_loc12_)
                                             {
                                                break;
                                             }
                                             if(§§pop())
                                             {
                                                _loc2_ = §§nextname(_loc10_,_loc11_);
                                                _loc5_ = this._faces[_loc2_];
                                                _loc6_ = new Face();
                                                if(_loc12_ || Boolean(_loc2_))
                                                {
                                                   _loc6_.material = _loc5_.material;
                                                }
                                                _loc7_ = null;
                                                _loc8_ = _loc5_.wrapper;
                                                if(!_loc13_)
                                                {
                                                   for(; _loc8_ != null; _loc7_ = _loc9_,_loc8_ = _loc8_.next)
                                                   {
                                                      _loc9_ = new Wrapper();
                                                      if(!_loc13_)
                                                      {
                                                         _loc9_.vertex = _loc8_.vertex.value;
                                                         if(_loc12_)
                                                         {
                                                            if(_loc7_ == null)
                                                            {
                                                               _loc6_.wrapper = _loc9_;
                                                               continue;
                                                            }
                                                            if(!(_loc13_ && Boolean(_loc2_)))
                                                            {
                                                               _loc7_.next = _loc9_;
                                                               if(_loc13_ && Boolean(_loc2_))
                                                               {
                                                                  continue;
                                                               }
                                                            }
                                                         }
                                                      }
                                                   }
                                                   if(!_loc12_)
                                                   {
                                                      continue;
                                                   }
                                                }
                                                _loc1_._faces[_loc2_] = _loc6_;
                                                continue;
                                             }
                                             if(_loc13_)
                                             {
                                                break loop5;
                                             }
                                          }
                                          break loop0;
                                       }
                                       break loop6;
                                    }
                                    break loop7;
                                 }
                                 break loop8;
                              }
                              break;
                           }
                           §§goto(addr01f3);
                        }
                        §§goto(addr0215);
                     }
                     §§goto(addr0203);
                  }
                  _loc10_ = §§pop();
                  if(!(_loc13_ && Boolean(_loc2_)))
                  {
                     addr0215:
                     _loc11_ = this._vertices;
                     while(true)
                     {
                        §§push(§§hasnext(_loc11_,_loc10_));
                        break loop0;
                     }
                     addr01f3:
                     if(!_loc13_)
                     {
                        break;
                     }
                     addr0244:
                  }
                  §§goto(addr024d);
               }
               if(!_loc13_)
               {
                  addr0203:
                  §§push(0);
                  break loop7;
               }
               §§goto(addr024f);
            }
            addr024f:
            return _loc1_;
            addr024d:
         }
         if(!§§pop())
         {
            break loop5;
         }
         _loc3_ = §§nextvalue(_loc10_,_loc11_);
         if(_loc12_ || Boolean(_loc1_))
         {
            _loc3_.value = null;
         }
         §§goto(addr0244);
      }
      
      private function sort(param1:Vector.<int>, param2:int) : void
      {
         var _temp_1:* = true;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = _temp_1;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc3_:Vector.<int> = new Vector.<int>();
         while(true)
         {
            if(!_loc12_)
            {
               _loc3_[0] = 0;
               if(!(_loc13_ || Boolean(this)))
               {
                  break;
               }
            }
            _loc3_[1] = param2 - 1;
            break;
         }
         §§push(2);
         if(_loc13_)
         {
            §§push(int(§§pop()));
         }
         var _loc4_:* = §§pop();
         loop0:
         while(true)
         {
            §§push(_loc4_);
            loop1:
            do
            {
               §§push(0);
               loop2:
               while(true)
               {
                  if(§§pop() <= §§pop())
                  {
                     break loop0;
                  }
                  _loc4_--;
                  _loc5_ = _loc3_[_loc4_];
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
                              §§push(_loc5_);
                              if(!(_loc12_ && Boolean(param2)))
                              {
                                 _loc6_ = int(§§pop());
                                 loop13:
                                 while(true)
                                 {
                                    while(true)
                                    {
                                       if(_loc13_ || Boolean(this))
                                       {
                                          §§push(_loc4_ - 1);
                                          if(_loc12_)
                                          {
                                             break loop4;
                                          }
                                          _loc4_ = int(§§pop());
                                          §§push(_loc3_[_loc4_]);
                                          if(!(_loc13_ || Boolean(_loc3_)))
                                          {
                                             break;
                                          }
                                          _loc7_ = §§pop();
                                          §§push(int(_loc7_));
                                          if(_loc12_)
                                          {
                                             break loop13;
                                          }
                                          _loc8_ = §§pop();
                                          if(!_loc13_)
                                          {
                                             break loop2;
                                          }
                                       }
                                       _loc9_ = param1[_loc5_ + _loc7_ >> 1];
                                       if(_loc12_)
                                       {
                                          §§goto(addr01d7);
                                       }
                                       §§goto(addr01f1);
                                    }
                                    _loc6_ = §§pop();
                                    if(!_loc13_)
                                    {
                                       break loop11;
                                    }
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(param1[_loc6_]);
                                             if(_loc13_ || Boolean(param2))
                                             {
                                                _loc11_ = §§pop();
                                                §§goto(addr018b);
                                             }
                                             §§goto(addr01d5);
                                          }
                                          §§goto(addr01f1);
                                       }
                                       §§goto(addr01d7);
                                    }
                                 }
                                 _loc10_ = §§pop();
                                 if(_loc13_)
                                 {
                                    loop4:
                                    while(true)
                                    {
                                       loop15:
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc10_);
                                             §§push(_loc9_);
                                             if(!_loc12_)
                                             {
                                                if(§§pop() <= §§pop())
                                                {
                                                   §§push(param1[_loc6_]);
                                                   if(_loc13_ || Boolean(this))
                                                   {
                                                      _loc11_ = §§pop();
                                                      while(true)
                                                      {
                                                         _loc11_ = §§pop();
                                                      }
                                                      break loop0;
                                                      addr018b:
                                                   }
                                                   break loop15;
                                                }
                                                §§push(_loc8_ + 1);
                                                if(_loc12_)
                                                {
                                                   break loop15;
                                                }
                                                §§push(int(§§pop()));
                                                if(_loc13_ || Boolean(param2))
                                                {
                                                   _loc8_ = §§pop();
                                                   addr0214:
                                                   if(_loc13_ || Boolean(param1))
                                                   {
                                                      §§goto(addr012e);
                                                      §§push(param1[_loc8_]);
                                                   }
                                                   §§push(_loc4_ + 1);
                                                   if(!_loc13_)
                                                   {
                                                      break loop8;
                                                   }
                                                   §§push(int(§§pop()));
                                                }
                                                else
                                                {
                                                   §§goto(addr01cd);
                                                }
                                                §§goto(addr021e);
                                             }
                                             if(§§pop() < §§pop())
                                             {
                                                §§push(int(_loc6_ - 1));
                                                break loop14;
                                             }
                                             §§push(_loc8_);
                                             if(!(_loc12_ && Boolean(_loc3_)))
                                             {
                                                break loop15;
                                             }
                                             break;
                                          }
                                          if(§§pop() >= _loc6_)
                                          {
                                             break loop9;
                                          }
                                          _loc3_[_loc4_] = _loc7_;
                                       }
                                       if(§§pop() <= _loc6_)
                                       {
                                          if(_loc13_ || Boolean(this))
                                          {
                                             param1[_loc8_] = _loc11_;
                                             while(true)
                                             {
                                                if(_loc13_)
                                                {
                                                   param1[_loc6_] = _loc10_;
                                                   addr01cd:
                                                   §§push(int(_loc8_ + 1));
                                                   if(_loc12_)
                                                   {
                                                      break;
                                                   }
                                                   _loc8_ = §§pop();
                                                }
                                                addr01d7:
                                                while(true)
                                                {
                                                   §§push(_loc6_);
                                                   if(!(_loc12_ && Boolean(param1)))
                                                   {
                                                      §§push(int(§§pop() - 1));
                                                      if(_loc13_)
                                                      {
                                                         _loc6_ = §§pop();
                                                         while(true)
                                                         {
                                                            §§push(_loc8_);
                                                            if(_loc13_)
                                                            {
                                                               if(§§pop() > _loc6_)
                                                               {
                                                                  if(!_loc12_)
                                                                  {
                                                                     §§push(_loc7_);
                                                                     break loop16;
                                                                  }
                                                                  break loop11;
                                                               }
                                                               §§push(param1[_loc8_]);
                                                               break loop4;
                                                            }
                                                            break loop7;
                                                         }
                                                         break loop0;
                                                         addr01f1:
                                                      }
                                                      break loop1;
                                                   }
                                                   §§goto(addr026d);
                                                }
                                                §§goto(addr0297);
                                             }
                                             addr021e:
                                             _loc4_ = §§pop();
                                             if(!_loc12_)
                                             {
                                                break loop11;
                                             }
                                             addr022d:
                                             while(true)
                                             {
                                                while(true)
                                                {
                                                   §§push(_loc4_);
                                                   if(_loc13_ || Boolean(_loc3_))
                                                   {
                                                      §§push(§§pop() + 1);
                                                      if(!(_loc12_ && Boolean(this)))
                                                      {
                                                         break loop8;
                                                      }
                                                      §§goto(addr02c1);
                                                   }
                                                   §§goto(addr0290);
                                                }
                                                §§goto(addr0297);
                                             }
                                             §§goto(addr02af);
                                          }
                                       }
                                       §§goto(addr01f1);
                                    }
                                    _loc10_ = §§pop();
                                    if(_loc12_)
                                    {
                                       break loop0;
                                    }
                                    continue loop15;
                                 }
                                 §§goto(addr0214);
                              }
                              break loop21;
                           }
                           _loc3_[_loc4_] = _loc6_;
                           §§goto(addr022d);
                        }
                        while(true)
                        {
                           §§push(_loc8_);
                           if(_loc13_ || Boolean(param2))
                           {
                              addr026d:
                              §§push(_loc5_);
                              if(_loc12_)
                              {
                                 continue loop2;
                              }
                              if(§§pop() >= §§pop())
                              {
                                 break loop2;
                              }
                              §§goto(addr0279);
                           }
                           §§goto(addr0297);
                        }
                        §§goto(addr02af);
                     }
                     _loc4_ = int(§§pop());
                     while(true)
                     {
                        if(_loc13_ || Boolean(_loc3_))
                        {
                           break loop9;
                        }
                        addr0279:
                        _loc3_[_loc4_] = _loc8_;
                        if(_loc13_ || Boolean(this))
                        {
                           addr0290:
                           §§push(_loc4_ + 1);
                           if(_loc13_)
                           {
                              break;
                           }
                           continue loop1;
                        }
                        §§goto(addr02af);
                     }
                     addr0297:
                     §§push(int(§§pop()));
                     break;
                  }
                  _loc4_ = §§pop();
                  if(!(_loc12_ && Boolean(this)))
                  {
                     _loc3_[_loc4_] = _loc5_;
                  }
                  addr02af:
                  §§push(_loc4_);
                  if(_loc12_)
                  {
                     break loop1;
                  }
                  addr02c1:
                  §§push(§§pop() + 1);
                  continue loop1;
               }
               continue loop0;
            }
            while(§§push(int(§§pop())), _loc12_);
            _loc4_ = §§pop();
         }
      }
      
      private function group(param1:Vector.<Vertex>, param2:int, param3:int, param4:int, param5:Number, param6:Number, param7:Vector.<int>) : void
      {
         §§push(false);
         var _loc20_:Boolean = true;
         var _loc21_:* = §§pop();
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:Vertex = null;
         var _loc11_:* = NaN;
         var _loc13_:* = 0;
         var _loc14_:* = 0;
         var _loc15_:* = NaN;
         var _loc16_:Vertex = null;
         var _loc17_:Vertex = null;
         var _loc18_:Vertex = null;
         §§push(param4);
         loop0:
         while(true)
         {
            var _loc19_:* = §§pop();
            loop11:
            while(true)
            {
               loop12:
               while(true)
               {
                  if(!(_loc21_ && Boolean(param1)))
                  {
                     loop41:
                     while(true)
                     {
                        loop42:
                        while(true)
                        {
                           §§push(0);
                           if(_loc20_ || Boolean(param2))
                           {
                              §§push(_loc19_);
                              if(!_loc20_)
                              {
                                 break;
                              }
                              if(§§pop() === §§pop())
                              {
                                 §§push(0);
                                 break loop11;
                              }
                              §§push(1);
                              if(_loc21_ && Boolean(param2))
                              {
                                 break loop41;
                              }
                           }
                           while(true)
                           {
                              §§push(_loc19_);
                              if(!_loc21_)
                              {
                                 break loop42;
                              }
                              addr034e:
                              if(§§pop() === §§pop())
                              {
                                 if(_loc20_ || Boolean(param3))
                                 {
                                    §§push(2);
                                    break loop11;
                                 }
                                 §§push(5);
                                 break loop41;
                              }
                              §§push(3);
                              §§push(_loc19_);
                              if(_loc20_)
                              {
                                 if(§§pop() === §§pop())
                                 {
                                    §§push(3);
                                    break loop11;
                                 }
                                 §§push(4);
                                 if(_loc20_)
                                 {
                                    §§push(_loc19_);
                                    break;
                                 }
                                 break loop12;
                              }
                              break;
                           }
                           addr0384:
                           if(§§pop() !== §§pop())
                           {
                              §§push(5);
                              break loop11;
                           }
                        }
                        if(§§pop() === §§pop())
                        {
                           §§push(1);
                           break loop11;
                        }
                        §§push(2);
                        if(!_loc20_)
                        {
                           break loop11;
                        }
                        §§push(_loc19_);
                        if(!(_loc21_ && Boolean(param1)))
                        {
                           §§goto(addr034e);
                        }
                        §§goto(addr0384);
                     }
                     break loop11;
                  }
                  §§push(4);
                  break;
               }
               break;
            }
            loop13:
            switch(§§pop())
            {
               case 0:
                  §§push(param2);
                  if(!(_loc21_ && Boolean(param3)))
                  {
                     _loc8_ = §§pop();
                     loop14:
                     while(true)
                     {
                        loop15:
                        while(true)
                        {
                           if(!(_loc21_ && Boolean(param1)))
                           {
                              while(true)
                              {
                                 §§push(_loc8_);
                                 if(!(_loc20_ || Boolean(this)))
                                 {
                                    break loop13;
                                 }
                                 §§push(param3);
                                 if(!_loc20_)
                                 {
                                    break;
                                 }
                                 if(§§pop() >= §§pop())
                                 {
                                    if(!_loc21_)
                                    {
                                       §§push(param5);
                                       if(!(_loc21_ && Boolean(param3)))
                                       {
                                          _loc11_ = Number(§§pop());
                                          break loop14;
                                       }
                                       addr01e1:
                                       _loc11_ = §§pop();
                                       break loop14;
                                    }
                                    addr0149:
                                    §§push(param5);
                                    if(_loc20_)
                                    {
                                       _loc11_ = §§pop();
                                       break loop14;
                                    }
                                    addr0253:
                                    _loc11_ = Number(§§pop());
                                    if(_loc20_ || Boolean(param2))
                                    {
                                       addr0264:
                                    }
                                    break loop14;
                                 }
                                 _loc10_ = param1[_loc8_];
                                 if(_loc20_ || Boolean(param2))
                                 {
                                    _loc10_.offset = _loc10_.x;
                                    if(!_loc21_)
                                    {
                                       while(true)
                                       {
                                          §§push(_loc8_);
                                          if(_loc20_)
                                          {
                                             §§push(§§pop() + 1);
                                             if(_loc21_ && Boolean(param3))
                                             {
                                                break;
                                             }
                                          }
                                          §§push(int(§§pop()));
                                          break;
                                       }
                                       _loc8_ = §§pop();
                                    }
                                 }
                              }
                              addr02c0:
                              if(§§pop() < §§pop())
                              {
                                 _loc10_ = param1[_loc8_];
                                 if(_loc20_ || Boolean(param1))
                                 {
                                    _loc10_.offset = _loc10_.v;
                                    if(!_loc21_)
                                    {
                                       §§push(_loc8_);
                                       if(_loc20_)
                                       {
                                          while(true)
                                          {
                                             §§push(§§pop() + 1);
                                             if(!_loc21_)
                                             {
                                                §§push(int(§§pop()));
                                             }
                                          }
                                          addr02c4:
                                          if(_loc20_ || Boolean(param1))
                                          {
                                             addr02d4:
                                             _loc11_ = param6;
                                             addr02d2:
                                          }
                                          break loop14;
                                       }
                                       _loc8_ = §§pop();
                                    }
                                 }
                                 while(true)
                                 {
                                    §§push(_loc8_);
                                    if(!(_loc20_ || Boolean(param2)))
                                    {
                                       break loop15;
                                    }
                                    §§goto(addr02c0);
                                    §§push(param3);
                                 }
                                 addr02af:
                              }
                              §§goto(addr02c4);
                           }
                           §§goto(addr02d2);
                        }
                        addr03cd:
                        §§push(int(§§pop()));
                        break loop13;
                     }
                     param7[0] = param2;
                     if(!_loc21_)
                     {
                        param7[1] = param3 - 1;
                     }
                     addr03cb:
                     §§push(2);
                     break loop15;
                  }
                  break;
               case 1:
                  while(true)
                  {
                     §§push(param2);
                     if(!(_loc21_ && Boolean(this)))
                     {
                        _loc8_ = §§pop();
                        while(true)
                        {
                           §§push(_loc8_);
                           §§push(param3);
                           if(_loc21_ && Boolean(param1))
                           {
                              addr0247:
                              if(§§pop() < §§pop())
                              {
                                 _loc10_ = param1[_loc8_];
                                 if(_loc20_ || Boolean(param2))
                                 {
                                    _loc10_.offset = _loc10_.u;
                                    if(_loc21_ && Boolean(param2))
                                    {
                                       break loop0;
                                    }
                                 }
                                 §§push(_loc8_);
                                 if(!_loc21_)
                                 {
                                    while(true)
                                    {
                                       while(true)
                                       {
                                          §§push(§§pop() + 1);
                                          if(_loc20_)
                                          {
                                             §§push(int(§§pop()));
                                          }
                                       }
                                       §§goto(addr02c0);
                                    }
                                    if(_loc20_)
                                    {
                                       §§push(param6);
                                       break;
                                    }
                                    §§goto(addr03cb);
                                 }
                                 _loc8_ = §§pop();
                                 break loop0;
                              }
                              break loop19;
                           }
                           if(§§pop() < §§pop())
                           {
                              _loc10_ = param1[_loc8_];
                              if(_loc20_)
                              {
                                 _loc10_.offset = _loc10_.y;
                                 if(_loc20_)
                                 {
                                    §§push(_loc8_);
                                    if(_loc20_ || Boolean(param2))
                                    {
                                       §§push(§§pop() + 1);
                                       if(_loc20_ || Boolean(param3))
                                       {
                                          §§push(int(§§pop()));
                                       }
                                    }
                                    _loc8_ = §§pop();
                                 }
                              }
                              continue;
                           }
                           §§goto(addr0149);
                        }
                        §§goto(addr0253);
                     }
                     §§goto(addr02bf);
                  }
                  §§goto(addr03cd);
               case 2:
                  §§push(param2);
                  if(_loc20_)
                  {
                     §§push(int(§§pop()));
                     if(!_loc20_)
                     {
                        continue;
                     }
                     _loc8_ = §§pop();
                     while(true)
                     {
                        §§push(_loc8_);
                        §§push(param3);
                        if(!_loc20_)
                        {
                           break;
                        }
                        if(§§pop() < §§pop())
                        {
                           _loc10_ = param1[_loc8_];
                           if(_loc20_ || Boolean(param3))
                           {
                              _loc10_.offset = _loc10_.z;
                              if(!_loc20_)
                              {
                                 continue;
                              }
                           }
                           §§push(_loc8_);
                           if(_loc20_ || Boolean(this))
                           {
                              §§push(§§pop() + 1);
                              if(!(_loc21_ && Boolean(param3)))
                              {
                                 §§push(int(§§pop()));
                              }
                           }
                           _loc8_ = §§pop();
                           continue;
                        }
                        if(_loc20_ || Boolean(param1))
                        {
                           §§push(param5);
                           if(!(_loc21_ && Boolean(param1)))
                           {
                              §§goto(addr01e1);
                           }
                           else
                           {
                              §§goto(addr02d4);
                           }
                        }
                        else
                        {
                           §§goto(addr0264);
                        }
                     }
                  }
                  continue;
                  §§goto(addr0247);
                  break;
               case 3:
                  _loc8_ = param2;
                  while(true)
                  {
                     if(_loc20_)
                     {
                        break loop0;
                     }
                     §§goto(addr02d2);
                  }
                  §§goto(addr03cd);
               case 4:
                  while(true)
                  {
                     §§push(param2);
                     if(_loc20_)
                     {
                        _loc8_ = int(§§pop());
                        §§goto(addr02af);
                     }
                     §§goto(addr02bf);
                  }
                  §§goto(addr03cd);
               default:
                  break loop14;
            }
            var _loc12_:* = §§pop();
            loop6:
            while(true)
            {
               loop23:
               while(true)
               {
                  §§push(_loc12_);
                  if(!(_loc21_ && Boolean(param3)))
                  {
                     loop24:
                     while(true)
                     {
                        if(§§pop() <= 0)
                        {
                           if(_loc20_)
                           {
                              §§push(param2);
                              if(_loc20_)
                              {
                                 break;
                              }
                              break loop23;
                           }
                           break loop6;
                        }
                        §§push(_loc12_);
                        if(!_loc20_)
                        {
                           break loop23;
                        }
                        _loc12_ = int(§§pop() - 1);
                        while(true)
                        {
                           if(!_loc21_)
                           {
                              §§push(param7[_loc12_]);
                              if(!_loc21_)
                              {
                                 _loc13_ = §§pop();
                                 if(_loc21_)
                                 {
                                    break loop6;
                                 }
                                 §§push(_loc13_);
                                 if(_loc21_ && Boolean(this))
                                 {
                                    break;
                                 }
                                 §§push(int(§§pop()));
                              }
                              _loc9_ = §§pop();
                              while(true)
                              {
                                 §§push(_loc12_);
                                 if(!_loc21_)
                                 {
                                    §§push(§§pop() - 1);
                                    if(_loc21_ && Boolean(param1))
                                    {
                                       break loop24;
                                    }
                                    §§push(int(§§pop()));
                                    if(!(_loc20_ || Boolean(this)))
                                    {
                                       break;
                                    }
                                 }
                                 _loc12_ = §§pop();
                                 if(!_loc21_)
                                 {
                                    §§push(param7[_loc12_]);
                                    if(_loc20_ || Boolean(this))
                                    {
                                       break;
                                    }
                                    break loop24;
                                 }
                              }
                              _loc14_ = §§pop();
                              if(_loc21_ && Boolean(this))
                              {
                                 break loop6;
                              }
                           }
                           §§push(_loc14_);
                           break;
                        }
                        _loc8_ = int(§§pop());
                        _loc10_ = param1[_loc13_ + _loc14_ >> 1];
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
                                    if(_loc20_)
                                    {
                                       §§push(_loc10_.offset);
                                       if(_loc20_ || Boolean(param2))
                                       {
                                          §§push(Number(§§pop()));
                                       }
                                       _loc15_ = §§pop();
                                       loop7:
                                       while(true)
                                       {
                                          §§push(_loc8_);
                                          §§push(_loc9_);
                                          if(_loc21_ && Boolean(param1))
                                          {
                                             break loop29;
                                          }
                                          if(§§pop() <= §§pop())
                                          {
                                             _loc16_ = param1[_loc8_];
                                             loop31:
                                             while(true)
                                             {
                                                if(_loc20_)
                                                {
                                                   while(true)
                                                   {
                                                      if(_loc16_.offset <= _loc15_)
                                                      {
                                                         break loop31;
                                                      }
                                                      while(true)
                                                      {
                                                         §§push(_loc8_);
                                                         if(!_loc21_)
                                                         {
                                                            §§push(§§pop() + 1);
                                                            if(_loc21_ && Boolean(param1))
                                                            {
                                                               break;
                                                            }
                                                         }
                                                         §§push(int(§§pop()));
                                                         break;
                                                      }
                                                      _loc8_ = §§pop();
                                                      if(_loc21_ && Boolean(param1))
                                                      {
                                                         break loop31;
                                                      }
                                                   }
                                                   break loop24;
                                                   addr04e5:
                                                }
                                                _loc16_ = param1[_loc8_];
                                                §§goto(addr04e5);
                                             }
                                             _loc17_ = param1[_loc9_];
                                             loop10:
                                             while(true)
                                             {
                                                if(_loc17_.offset >= _loc15_)
                                                {
                                                   §§push(_loc8_);
                                                   if(!_loc20_)
                                                   {
                                                      break;
                                                   }
                                                }
                                                else
                                                {
                                                   §§push(_loc9_);
                                                   if(_loc20_ || Boolean(param1))
                                                   {
                                                      §§push(§§pop() - 1);
                                                      if(!(_loc21_ && Boolean(param1)))
                                                      {
                                                         continue;
                                                      }
                                                   }
                                                }
                                                if(§§pop() <= _loc9_)
                                                {
                                                   if(_loc20_ || Boolean(this))
                                                   {
                                                      param1[_loc8_] = _loc17_;
                                                      param1[_loc9_] = _loc16_;
                                                   }
                                                   while(true)
                                                   {
                                                      §§push(_loc8_);
                                                      if(_loc20_ || Boolean(this))
                                                      {
                                                         §§push(§§pop() + 1);
                                                         if(!_loc20_)
                                                         {
                                                            break;
                                                         }
                                                         §§push(int(§§pop()));
                                                         if(!(_loc20_ || Boolean(param3)))
                                                         {
                                                            break loop10;
                                                         }
                                                         _loc8_ = §§pop();
                                                         §§push(_loc9_);
                                                      }
                                                      §§push(§§pop() - 1);
                                                      break;
                                                   }
                                                   §§push(int(§§pop()));
                                                   break;
                                                }
                                                continue loop7;
                                                _loc9_ = int(§§pop());
                                                _loc17_ = param1[_loc9_];
                                             }
                                             _loc9_ = §§pop();
                                             continue;
                                          }
                                          §§push(_loc14_);
                                          if(_loc21_ && Boolean(this))
                                          {
                                             break loop30;
                                          }
                                          §§push(_loc9_);
                                          if(_loc21_ && Boolean(param1))
                                          {
                                             break loop29;
                                          }
                                          if(§§pop() >= §§pop())
                                          {
                                             break loop28;
                                          }
                                          param7[_loc12_] = _loc14_;
                                          if(!_loc20_)
                                          {
                                             break loop27;
                                          }
                                       }
                                       §§goto(addr0622);
                                    }
                                    _loc12_++;
                                    param7[_loc12_] = _loc9_;
                                    §§push(_loc12_ + 1);
                                    if(_loc20_ || Boolean(this))
                                    {
                                       §§push(int(§§pop()));
                                       if(!_loc21_)
                                       {
                                          _loc12_ = §§pop();
                                          break loop28;
                                       }
                                       §§goto(addr05fc);
                                    }
                                    §§goto(addr0614);
                                 }
                                 §§goto(addr0620);
                              }
                              if(§§pop() < §§pop())
                              {
                                 break loop27;
                              }
                              continue loop6;
                           }
                           addr05fc:
                           §§push(_loc8_);
                           §§push(_loc13_);
                           break loop29;
                        }
                        param7[_loc12_] = _loc8_;
                        addr0622:
                        §§push(_loc12_);
                        if(_loc20_)
                        {
                           addr0614:
                           _loc12_ = int(§§pop() + 1);
                           param7[_loc12_] = _loc13_;
                           addr0620:
                           §§push(int(_loc12_ + 1));
                        }
                        _loc12_ = §§pop();
                        continue loop6;
                     }
                     §§push(int(§§pop()));
                  }
                  break;
               }
               _loc8_ = §§pop();
               break;
            }
            _loc10_ = param1[_loc8_];
            loop34:
            while(true)
            {
               loop35:
               while(true)
               {
                  loop36:
                  while(true)
                  {
                     loop37:
                     while(true)
                     {
                        while(true)
                        {
                           if(_loc20_)
                           {
                              §§push(_loc8_);
                              if(_loc20_)
                              {
                                 §§push(1);
                                 if(!_loc20_)
                                 {
                                    break loop36;
                                 }
                                 §§push(§§pop() + §§pop());
                                 if(!_loc20_)
                                 {
                                    break;
                                 }
                                 §§push(int(§§pop()));
                                 if(_loc20_)
                                 {
                                    _loc9_ = §§pop();
                                    if(!(_loc20_ || Boolean(this)))
                                    {
                                       break loop34;
                                    }
                                    while(true)
                                    {
                                       §§push(_loc9_);
                                       if(_loc21_ && Boolean(this))
                                       {
                                          break loop37;
                                       }
                                    }
                                    addr07dc:
                                    if(_loc20_)
                                    {
                                       §§push(param4);
                                       if(_loc20_ || Boolean(param1))
                                       {
                                          §§push(4);
                                          if(!(_loc21_ && Boolean(this)))
                                          {
                                             addr0802:
                                             §§push(§§pop() < §§pop());
                                             if(_loc20_)
                                             {
                                                §§push(Boolean(§§pop()));
                                                if(_loc21_)
                                                {
                                                   break loop35;
                                                }
                                                var _temp_46:* = §§pop();
                                                §§push(_temp_46);
                                                §§push(_temp_46);
                                                if(!(_loc21_ && Boolean(param2)))
                                                {
                                                   §§push(Boolean(§§pop()));
                                                }
                                                if(!§§pop())
                                                {
                                                   break loop35;
                                                }
                                                if(!(_loc20_ || Boolean(param3)))
                                                {
                                                   break loop35;
                                                }
                                             }
                                             §§pop();
                                             if(!(_loc21_ && Boolean(param1)))
                                             {
                                                addr0841:
                                                §§push(_loc9_);
                                                break loop37;
                                             }
                                             break loop34;
                                          }
                                          break loop36;
                                       }
                                       break loop37;
                                    }
                                    break loop34;
                                    addr07b9:
                                 }
                              }
                              §§push(param3);
                              if(_loc20_ || Boolean(param2))
                              {
                                 if(§§pop() < §§pop())
                                 {
                                    _loc18_ = param1[_loc9_];
                                    §§push(_loc10_.offset);
                                    if(!_loc21_)
                                    {
                                       while(true)
                                       {
                                          while(true)
                                          {
                                             §§push(_loc18_.offset);
                                             if(!_loc21_)
                                             {
                                                §§push(§§pop() - §§pop());
                                                if(_loc20_ || Boolean(this))
                                                {
                                                   addr06ba:
                                                   addr06b8:
                                                   if(§§pop() > _loc11_)
                                                   {
                                                      §§push(param4);
                                                      if(!_loc21_)
                                                      {
                                                         §§push(4);
                                                         if(_loc20_ || Boolean(param1))
                                                         {
                                                            §§push(§§pop() < §§pop());
                                                            if(!(_loc21_ && Boolean(this)))
                                                            {
                                                               §§push(Boolean(§§pop()));
                                                               if(_loc20_)
                                                               {
                                                                  var _temp_54:* = §§pop();
                                                                  §§push(_temp_54);
                                                                  §§push(_temp_54);
                                                                  if(!(_loc21_ && Boolean(param3)))
                                                                  {
                                                                     §§push(Boolean(§§pop()));
                                                                  }
                                                                  if(§§pop())
                                                                  {
                                                                     if(_loc20_)
                                                                     {
                                                                        addr0706:
                                                                        §§pop();
                                                                        §§push(_loc9_);
                                                                        if(_loc20_ || Boolean(this))
                                                                        {
                                                                           §§push(_loc8_);
                                                                           if(!(_loc21_ && Boolean(param3)))
                                                                           {
                                                                              addr073a:
                                                                              addr0728:
                                                                              §§push(§§pop() - §§pop() > 1);
                                                                              if(!(_loc21_ && Boolean(this)))
                                                                              {
                                                                                 addr0739:
                                                                                 §§push(Boolean(§§pop()));
                                                                              }
                                                                              if(§§pop())
                                                                              {
                                                                                 if(!(_loc21_ && Boolean(this)))
                                                                                 {
                                                                                    this.group(param1,_loc8_,_loc9_,param4 + 1,param5,param6,param7);
                                                                                    addr0761:
                                                                                    §§push(_loc9_);
                                                                                    if(_loc20_)
                                                                                    {
                                                                                       §§push(int(§§pop()));
                                                                                       if(!_loc21_)
                                                                                       {
                                                                                          addr0770:
                                                                                          _loc8_ = §§pop();
                                                                                          if(_loc20_)
                                                                                          {
                                                                                             _loc10_ = param1[_loc8_];
                                                                                             if(!_loc21_)
                                                                                             {
                                                                                                addr07a7:
                                                                                                §§push(_loc9_);
                                                                                                if(!_loc21_)
                                                                                                {
                                                                                                   §§push(§§pop() + 1);
                                                                                                   if(_loc20_)
                                                                                                   {
                                                                                                      addr07b6:
                                                                                                      §§push(int(§§pop()));
                                                                                                   }
                                                                                                   _loc9_ = §§pop();
                                                                                                   §§goto(addr07b9);
                                                                                                }
                                                                                                §§goto(addr07b6);
                                                                                             }
                                                                                             §§goto(addr07b9);
                                                                                          }
                                                                                          §§goto(addr07a7);
                                                                                       }
                                                                                    }
                                                                                    addr078f:
                                                                                    addr078d:
                                                                                    if(§§pop() == 4)
                                                                                    {
                                                                                       if(_loc20_ || Boolean(param2))
                                                                                       {
                                                                                          addr07a1:
                                                                                          _loc18_.value = _loc10_;
                                                                                       }
                                                                                    }
                                                                                    §§goto(addr07a7);
                                                                                 }
                                                                                 §§goto(addr07a1);
                                                                              }
                                                                              §§goto(addr0761);
                                                                           }
                                                                           §§goto(addr078f);
                                                                        }
                                                                        §§goto(addr078d);
                                                                     }
                                                                  }
                                                                  §§goto(addr073a);
                                                               }
                                                               §§goto(addr0739);
                                                            }
                                                            §§goto(addr0706);
                                                         }
                                                         §§goto(addr078f);
                                                      }
                                                      §§goto(addr0770);
                                                   }
                                                   §§goto(addr078d);
                                                   §§push(param4);
                                                }
                                                §§goto(addr0728);
                                             }
                                             §§goto(addr06ba);
                                          }
                                          §§goto(addr0802);
                                       }
                                       §§goto(addr07dc);
                                    }
                                    §§goto(addr06b8);
                                 }
                                 break loop39;
                              }
                              §§goto(addr0802);
                           }
                           §§goto(addr0841);
                        }
                        §§goto(addr0846);
                     }
                     §§push(_loc8_);
                     break;
                  }
                  addr0846:
                  §§push(§§pop() - §§pop() > 1);
                  if(!_loc21_)
                  {
                     §§push(Boolean(§§pop()));
                  }
                  break;
               }
               if(§§pop())
               {
                  if(_loc20_ || Boolean(this))
                  {
                     this.group(param1,_loc8_,_loc9_,param4 + 1,param5,param6,param7);
                  }
               }
               break;
            }
            return;
         }
         while(true)
         {
            §§push(_loc8_);
            §§push(param3);
            if(_loc20_ || Boolean(param2))
            {
               §§goto(addr0247);
            }
            else
            {
               §§goto(addr02c0);
            }
         }
         §§goto(addr02bf);
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(!_loc1_)
{
   Geometry = §§newclass(Geometry,Object);
}

