package
{
   import alternativa.engine3d.containers.*;
   import alternativa.engine3d.core.*;
   import alternativa.engine3d.materials.*;
   import alternativa.engine3d.objects.*;
   import flash.display.*;
   import flash.geom.*;
   import flash.utils.*;
   import jiglib.geometry.*;
   import jiglib.physics.*;
   import jiglib.plugin.alternativa3d.*;
   
   public class core_interface
   {
      
      public var levelDebug:Boolean = false;
      
      public var useParticle:Boolean = true;
      
      public var bspSort:Boolean = false;
      
      public var physics:a3dPhysics;
      
      public var sceneRoot:Object3DContainer;
      
      public var camera:Camera3D;
      
      public var cameraMatrix:Matrix3D = new Matrix3D();
      
      public var drawSurface:Shape = new Shape();
      
      private var _main:Sprite;
      
      public const _controlPointDistance:Number = 90;
      
      public var masterVolume:Number = 1;
      
      public var soundEnabled:Boolean = true;
      
      public var paused:Boolean;
      
      public var excluders:Vector.<RigidBody> = new Vector.<RigidBody>();
      
      public const EPSILON:Number = 0.000001;
      
      public function core_interface(main:Sprite)
      {
         super();
         this._main = main;
         this.bspSort = !this.levelDebug;
         if(this.bspSort)
         {
            this.sceneRoot = new BSPContainer();
         }
         else
         {
            this.sceneRoot = new DistanceSortContainer();
         }
         this.physics = new a3dPhysics(this.sceneRoot,5);
         main.stage.align = StageAlign.TOP_LEFT;
         main.stage.scaleMode = StageScaleMode.NO_SCALE;
         this.camera = new Camera3D();
         this.camera.view = new View(main.stage.stageWidth,main.stage.stageHeight);
         main.addChild(this.camera.view);
         this.camera.diagram.y = 200;
         this.camera.view.hideLogo();
         this.camera.farClipping = 100000;
         this.camera.nearClipping = 0.1;
         this.sceneRoot.addChild(this.camera);
         if(this.levelDebug)
         {
            main.stage.quality = "LOW";
            main.addChild(this.drawSurface);
         }
         else
         {
            main.stage.quality = "MEDIUM";
         }
      }
      
      public function stage() : Stage
      {
         return this._main.stage;
      }
      
      public function lineIntersectCircle(c:Vector3D, r:Number, a1:Vector3D, a2:Vector3D) : Boolean
      {
         var e:Number = NaN;
         var u1:Number = NaN;
         var u2:Number = NaN;
         var a2x_a1x:Number = a2.x - a1.x;
         var a2y_a1y:Number = a2.z - a1.z;
         var a:Number = a2x_a1x * a2x_a1x + a2y_a1y * a2y_a1y;
         var b:Number = 2 * (a2x_a1x * (a1.x - c.x) + a2y_a1y * (a1.z - c.z));
         var cc:Number = c.x * c.x + c.z * c.z + a1.x * a1.x + a1.z * a1.z - 2 * (c.x * a1.x + c.z * a1.z) - r * r;
         var deter:Number = b * b - 4 * a * cc;
         if(deter > 0)
         {
            e = Math.sqrt(deter);
            u1 = (-b + e) / (2 * a);
            u2 = (-b - e) / (2 * a);
            if((u1 < 0 || u1 > 1) && (u2 < 0 || u2 > 1))
            {
               return false;
            }
            return true;
         }
         return false;
      }
      
      public function rayMeshIntersection(from:Vector3D, dir:Vector3D, mesh:Mesh, out:Vector3D, mat:Matrix3D = null) : Boolean
      {
         var trans_temp:Vector.<Number> = null;
         var _i:uint = 0;
         var _t:uint = 0;
         var trans_done:Vector.<Number> = new Vector.<Number>();
         if(mat != null)
         {
            trans_temp = new Vector.<Number>();
            for(_i = 0; _i < mesh.faces.length; _i++)
            {
               trans_temp[_i * 9 + 0] = mesh.faces[_i].vertices[0].x;
               trans_temp[_i * 9 + 1] = mesh.faces[_i].vertices[0].y;
               trans_temp[_i * 9 + 2] = mesh.faces[_i].vertices[0].z;
               trans_temp[_i * 9 + 3] = mesh.faces[_i].vertices[1].x;
               trans_temp[_i * 9 + 4] = mesh.faces[_i].vertices[1].y;
               trans_temp[_i * 9 + 5] = mesh.faces[_i].vertices[1].z;
               trans_temp[_i * 9 + 6] = mesh.faces[_i].vertices[2].x;
               trans_temp[_i * 9 + 7] = mesh.faces[_i].vertices[2].y;
               trans_temp[_i * 9 + 8] = mesh.faces[_i].vertices[2].z;
            }
            mat.transformVectors(trans_temp,trans_done);
         }
         else
         {
            for(_t = 0; _t < mesh.faces.length; _t++)
            {
               trans_done[_t * 9 + 0] = mesh.faces[_t].vertices[0].x;
               trans_done[_t * 9 + 1] = mesh.faces[_t].vertices[0].y;
               trans_done[_t * 9 + 2] = mesh.faces[_t].vertices[0].z;
               trans_done[_t * 9 + 3] = mesh.faces[_t].vertices[1].x;
               trans_done[_t * 9 + 4] = mesh.faces[_t].vertices[1].y;
               trans_done[_t * 9 + 5] = mesh.faces[_t].vertices[1].z;
               trans_done[_t * 9 + 6] = mesh.faces[_t].vertices[2].x;
               trans_done[_t * 9 + 7] = mesh.faces[_t].vertices[2].y;
               trans_done[_t * 9 + 8] = mesh.faces[_t].vertices[2].z;
            }
         }
         var v0:Vector3D = new Vector3D();
         var v1:Vector3D = new Vector3D();
         var v2:Vector3D = new Vector3D();
         var temp_out:Vector3D = new Vector3D();
         var hit:Boolean = false;
         for(var _j:Number = 0; _j < trans_done.length / 9; _j++)
         {
            v0.x = trans_done[_j * 9 + 0];
            v0.y = trans_done[_j * 9 + 1];
            v0.z = trans_done[_j * 9 + 2];
            v1.x = trans_done[_j * 9 + 3];
            v1.y = trans_done[_j * 9 + 4];
            v1.z = trans_done[_j * 9 + 5];
            v2.x = trans_done[_j * 9 + 6];
            v2.y = trans_done[_j * 9 + 7];
            v2.z = trans_done[_j * 9 + 8];
            if(this.rayTriangleIntersect(from,dir,v0,v1,v2,temp_out))
            {
               hit = true;
               break;
            }
         }
         if(!hit)
         {
            return false;
         }
         temp_out.z = 1 - temp_out.x - temp_out.y;
         out.x = temp_out.z * v0.x + temp_out.x * v1.x + temp_out.y * v2.x;
         out.y = temp_out.z * v0.y + temp_out.x * v1.y + temp_out.y * v2.y;
         out.z = temp_out.z * v0.z + temp_out.x * v1.z + temp_out.y * v2.z;
         return true;
      }
      
      public function rayTriangleIntersect(from:Vector3D, dir:Vector3D, vx0:Vector3D, vx1:Vector3D, vx2:Vector3D, out:Vector3D) : Boolean
      {
         var det:Number = NaN;
         var inv_det:Number = NaN;
         var edge1:Vector3D = new Vector3D();
         var edge2:Vector3D = new Vector3D();
         var tvec:Vector3D = new Vector3D();
         var pvec:Vector3D = new Vector3D();
         var qvec:Vector3D = new Vector3D();
         edge1 = vx1.subtract(vx0);
         edge2 = vx2.subtract(vx0);
         pvec = dir.crossProduct(edge2);
         det = edge1.dotProduct(pvec);
         if(det > -this.EPSILON && det < this.EPSILON)
         {
            return false;
         }
         inv_det = 1 / det;
         tvec = from.subtract(vx0);
         out.x = tvec.dotProduct(pvec) * inv_det;
         if(out.x < 0 || out.x > 1)
         {
            return false;
         }
         qvec = tvec.crossProduct(edge1);
         out.y = dir.dotProduct(qvec) * inv_det;
         if(out.y < 0 || out.x + out.y > 1)
         {
            return false;
         }
         out.z = edge2.dotProduct(qvec) * inv_det;
         return out.z >= 0;
      }
      
      private function __drawLine(v0:Vector3D, v1:Vector3D) : void
      {
         if(v0.z > 0 && v1.z > 0)
         {
            this.drawSurface.graphics.moveTo(v0.x,v0.y);
            this.drawSurface.graphics.lineTo(v1.x,v1.y);
         }
      }
      
      public function drawLine(p0:Vector3D, p1:Vector3D, col:uint = 16777215) : void
      {
         this.drawSurface.graphics.lineStyle(1,col);
         this.__drawLine(this.camera.projectGlobal(p0),this.camera.projectGlobal(p1));
      }
      
      public function drawBox(mtx:Matrix3D, sideLengths:Vector3D, col:uint = 16777215) : void
      {
         var axisx:Vector3D = new Vector3D(mtx.rawData[0],mtx.rawData[1],mtx.rawData[2]);
         axisx.scaleBy(sideLengths.x * 0.5);
         var axisy:Vector3D = new Vector3D(mtx.rawData[4],mtx.rawData[5],mtx.rawData[6]);
         axisy.scaleBy(sideLengths.y * 0.5);
         var axisz:Vector3D = new Vector3D(mtx.rawData[8],mtx.rawData[9],mtx.rawData[10]);
         axisz.scaleBy(sideLengths.z * 0.5);
         var p0:Vector3D = mtx.position.clone();
         var p1:Vector3D = mtx.position.clone();
         var p2:Vector3D = mtx.position.clone();
         var p3:Vector3D = mtx.position.clone();
         var p4:Vector3D = mtx.position.clone();
         var p5:Vector3D = mtx.position.clone();
         var p6:Vector3D = mtx.position.clone();
         var p7:Vector3D = mtx.position.clone();
         p0.decrementBy(axisx);
         p0.decrementBy(axisy);
         p0.decrementBy(axisz);
         p1.incrementBy(axisx);
         p1.decrementBy(axisy);
         p1.decrementBy(axisz);
         p2.incrementBy(axisx);
         p2.decrementBy(axisy);
         p2.incrementBy(axisz);
         p3.decrementBy(axisx);
         p3.decrementBy(axisy);
         p3.incrementBy(axisz);
         p4.decrementBy(axisx);
         p4.incrementBy(axisy);
         p4.decrementBy(axisz);
         p5.incrementBy(axisx);
         p5.incrementBy(axisy);
         p5.decrementBy(axisz);
         p6.incrementBy(axisx);
         p6.incrementBy(axisy);
         p6.incrementBy(axisz);
         p7.decrementBy(axisx);
         p7.incrementBy(axisy);
         p7.incrementBy(axisz);
         var v0:Vector3D = this.camera.projectGlobal(p0);
         var v1:Vector3D = this.camera.projectGlobal(p1);
         var v2:Vector3D = this.camera.projectGlobal(p2);
         var v3:Vector3D = this.camera.projectGlobal(p3);
         var v4:Vector3D = this.camera.projectGlobal(p4);
         var v5:Vector3D = this.camera.projectGlobal(p5);
         var v6:Vector3D = this.camera.projectGlobal(p6);
         var v7:Vector3D = this.camera.projectGlobal(p7);
         this.drawSurface.graphics.lineStyle(1,col);
         this.__drawLine(v0,v1);
         this.__drawLine(v1,v2);
         this.__drawLine(v2,v3);
         this.__drawLine(v3,v0);
         this.__drawLine(v0,v4);
         this.__drawLine(v4,v5);
         this.__drawLine(v5,v6);
         this.__drawLine(v6,v7);
         this.__drawLine(v7,v4);
         this.__drawLine(v1,v5);
         this.__drawLine(v2,v6);
         this.__drawLine(v3,v7);
      }
      
      public function clearVector(vec:Vector.<Vector3D>) : void
      {
         while(Boolean(vec.length))
         {
            vec[vec.length - 1] = null;
            vec.pop();
         }
      }
      
      public function clearVectorN(vec:Vector.<Number>) : void
      {
         while(Boolean(vec.length))
         {
            vec.pop();
         }
      }
      
      public function lerp(a:Number, b:Number, t:Number) : Number
      {
         return a * (1 - t) + b * t;
      }
      
      public function generateSpheres(exs:Vector.<Vector3D>, siz:Vector.<Number>) : void
      {
         var sphere:RigidBody = null;
         for(var _i:int = 0; _i < exs.length; _i++)
         {
            sphere = this.physics.createInvisibleSphere(siz[_i]);
            sphere.movable = false;
            this.excluders.push(sphere);
            sphere.moveTo(exs[_i]);
         }
         this.clearVector(exs);
         this.clearVectorN(siz);
      }
      
      public function generateBoxes(mat:Vector.<Vector3D>, matrix:Matrix3D = null) : void
      {
         var box:RigidBody = null;
         var _mtx:Matrix3D = null;
         var mtx:Matrix3D = null;
         for(var _i:int = 0; _i < mat.length / 3; _i++)
         {
            box = this.physics.createInvisibleCube(mat[_i * 3 + 2].x,mat[_i * 3 + 2].y,mat[_i * 3 + 2].z);
            box.movable = false;
            this.excluders.push(box);
            box.moveTo(mat[_i * 3]);
            box.rotationX = mat[_i * 3 + 1].x;
            box.rotationY = mat[_i * 3 + 1].y;
            box.rotationZ = mat[_i * 3 + 1].z;
            if(matrix != null)
            {
               _mtx = box.currentState.orientation.clone();
               _mtx.position = box.currentState.position.clone();
               mtx = matrix.clone();
               mtx.prepend(_mtx);
               box.moveTo(mtx.position);
               mtx.position = new Vector3D(0,0,0);
               box.currentState.orientation = mtx;
            }
         }
         this.clearVector(mat);
      }
      
      public function generateWall(exs:Vector.<Vector3D>, close:Boolean) : void
      {
         var _j:int = 0;
         var len:Number = NaN;
         var wall:RigidBody = null;
         var dir:Vector3D = null;
         var sign:Number = NaN;
         var angle:Number = NaN;
         var pos:Vector3D = null;
         for(var _i:int = 0; _i < exs.length; _i++)
         {
            _j = _i + 1;
            if(_j == exs.length)
            {
               if(!close)
               {
                  this.clearVector(exs);
                  return;
               }
               _j = 0;
            }
            len = Vector3D.distance(exs[_i],exs[_j]);
            wall = this.physics.createInvisibleCube(1,1000,len);
            wall.movable = false;
            this.excluders.push(wall);
            dir = new Vector3D(exs[_j].x,0,exs[_j].z);
            dir.decrementBy(exs[_i]);
            dir.normalize();
            sign = dir.dotProduct(Vector3D.X_AXIS);
            angle = Math.acos(dir.dotProduct(Vector3D.Z_AXIS));
            angle *= sign < 0 ? -180 / Math.PI : 180 / Math.PI;
            wall.rotationY = angle;
            pos = new Vector3D(exs[_i].x,0,exs[_i].z);
            pos.incrementBy(exs[_j]);
            pos.scaleBy(0.5);
            wall.moveTo(pos);
         }
         this.clearVector(exs);
      }
      
      public function destroyExcluders() : void
      {
         while(Boolean(this.excluders.length))
         {
            this.physics.removeBody(this.excluders[this.excluders.length - 1]);
            this.excluders[this.excluders.length - 1] = null;
            this.excluders.pop();
         }
      }
      
      public function drawExcluders() : void
      {
         for(var _i:uint = 0; _i < this.excluders.length; _i++)
         {
            if(getQualifiedClassName(this.excluders[_i]) == "jiglib.geometry::JBox")
            {
               this.drawBox(this.excluders[_i].getTransform(),(this.excluders[_i] as JBox).sideLengths,65280);
            }
            else if(getQualifiedClassName(this.excluders[_i]) == "jiglib.geometry::JSphere")
            {
            }
         }
      }
      
      public function formatTime(time:Number, precise:Boolean = true) : String
      {
         var ssec:uint = 0;
         var s:String = new String();
         var min:uint = time / 60;
         var sec:uint = time - min * 60;
         if(precise)
         {
            ssec = (time - min * 60 - sec) * 100;
            s = (min < 10 ? "0" : "") + min + ":" + (sec < 10 ? "0" : "") + sec + ":" + (ssec < 10 ? "0" : "") + ssec;
         }
         else
         {
            s = (min < 10 ? "0" : "") + min + ":" + (sec < 10 ? "0" : "") + sec;
         }
         return s;
      }
      
      public function randFromTo(from:Number, to:Number) : Number
      {
         return from + Math.random() * (to - from);
      }
      
      public function limit(what:Number, min:Number, max:Number) : Number
      {
         if(what > max)
         {
            return max;
         }
         if(what < min)
         {
            return min;
         }
         return what;
      }
      
      public function polyCheck(pos:Vector3D, poly:Vector.<Vector3D>, sidx:uint = 0, eidx:uint = 0) : Boolean
      {
         var p1:Vector3D = null;
         var p2:Vector3D = null;
         var _is:Boolean = false;
         var slope:Number = NaN;
         var _x_:Number = NaN;
         var nm:uint = 0;
         if(eidx == 0)
         {
            eidx = poly.length;
         }
         for(var i:uint = sidx; i < eidx; i++)
         {
            _is = false;
            p1 = poly[i];
            p2 = poly[i + 1 < eidx ? i + 1 : sidx];
            if(Math.max(p1.z,p2.z) >= pos.z && Math.min(p1.z,p2.z) <= pos.z && Math.max(p1.x,p2.x) >= pos.x)
            {
               if(p1.x == p2.x)
               {
                  _is = true;
               }
               else if(p1.z == p2.z)
               {
                  _is = true;
               }
               else
               {
                  slope = (p1.x - p2.x) / (p1.z - p2.z);
                  _x_ = p1.x - (p1.z - pos.z) * slope;
                  if(_x_ >= pos.x)
                  {
                     _is = true;
                  }
               }
            }
            if(_is)
            {
               nm++;
            }
         }
         if(!(nm & 1))
         {
            return true;
         }
         return false;
      }
      
      public function splitBitmap(src:BitmapData, out:Vector.<Material>, x:uint, y:uint) : void
      {
         var _x:int = 0;
         var piece:BitmapData = null;
         var bw:uint = src.width / x;
         var bh:uint = src.height / y;
         for(var _y:int = 0; _y < y; _y++)
         {
            for(_x = 0; _x < x; _x++)
            {
               piece = new BitmapData(bw,bh);
               piece.copyPixels(src,new Rectangle(_x * bw,_y * bh,bw,bh),new Point(0,0));
               out.push(new TextureMaterial(piece,false,true,MipMapping.NONE));
            }
         }
      }
      
      private function subColorValue(input:int, delta:int) : int
      {
         if(input - delta >= 0)
         {
            return input - delta;
         }
         return 0;
      }
      
      private function addColorValue(input:int, delta:int) : int
      {
         if(input + delta < 255)
         {
            return input + delta;
         }
         return 255;
      }
      
      public function decrementColor(col:uint, val:int) : uint
      {
         var R:int = (col & 0xFF0000) >> 16;
         var G:int = (col & 0xFF00) >> 8;
         var B:int = col & 0xFF;
         R = this.subColorValue(R,val);
         G = this.subColorValue(G,val);
         B = this.subColorValue(B,val);
         return R << 16 | G << 8 | B;
      }
      
      public function incrementColor(col:uint, val:int) : uint
      {
         var R:int = (col & 0xFF0000) >> 16;
         var G:int = (col & 0xFF00) >> 8;
         var B:int = col & 0xFF;
         R = this.addColorValue(R,val);
         G = this.addColorValue(G,val);
         B = this.addColorValue(B,val);
         return R << 16 | G << 8 | B;
      }
      
      public function generateLightTexture(src:TextureMaterial, count:uint, out:Vector.<TextureMaterial>) : void
      {
         var bm:BitmapData = null;
         var col:uint = 0;
         var _y:uint = 0;
         var _x:uint = 0;
         var w:uint = uint(src.texture.width);
         var h:uint = uint(src.texture.height);
         for(var _i:uint = 0; _i < count; _i++)
         {
            bm = new BitmapData(w,h);
            for(_y = 0; _y < h; _y++)
            {
               for(_x = 0; _x < w; _x++)
               {
                  col = src.texture.getPixel(_x,_y);
                  bm.setPixel(_x,_y,this.decrementColor(col,255 / count * _i));
               }
            }
            out.push(new TextureMaterial(bm,false,true,MipMapping.NONE));
         }
      }
      
      public function updateLightOnMesh(mesh:Mesh, count:uint, mat:Vector.<TextureMaterial>, intensity:Number) : void
      {
         var dot:Number = NaN;
         var tn:Vector3D = null;
         var idx:uint = 0;
         var lightDir:Vector3D = new Vector3D(1,0,0);
         lightDir.normalize();
         for(var _i:uint = 0; _i < mesh.faces.length; _i++)
         {
            tn = mesh.matrix.transformVector(mesh.faces[_i].normal);
            tn.decrementBy(mesh.matrix.position);
            tn.normalize();
            dot = Math.abs(tn.dotProduct(lightDir));
            dot *= count * intensity;
            idx = dot;
            mesh.faces[_i].material = mat[Math.min(count - 1,idx)];
         }
      }
   }
}

