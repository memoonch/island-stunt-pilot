package jiglib.geometry
{
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import jiglib.data.CollOutData;
   import jiglib.data.EdgeData;
   import jiglib.data.SpanData;
   import jiglib.math.*;
   import jiglib.physics.PhysicsState;
   import jiglib.physics.RigidBody;
   import jiglib.plugin.ISkin3D;
   
   public class JBox extends RigidBody
   {
      
      private var _sideLengths:Vector3D;
      
      private var _points:Vector.<Vector3D>;
      
      private var _edges:Vector.<EdgeData> = Vector.<EdgeData>([new EdgeData(0,1),new EdgeData(0,2),new EdgeData(0,6),new EdgeData(2,3),new EdgeData(2,4),new EdgeData(6,7),new EdgeData(6,4),new EdgeData(1,3),new EdgeData(1,7),new EdgeData(3,5),new EdgeData(7,5),new EdgeData(4,5)]);
      
      private var _face:Vector.<Vector.<Number>> = Vector.<Vector.<Number>>([Vector.<Number>([6,7,1,0]),Vector.<Number>([5,4,2,3]),Vector.<Number>([3,1,7,5]),Vector.<Number>([4,6,0,2]),Vector.<Number>([1,3,2,0]),Vector.<Number>([7,6,4,5])]);
      
      public function JBox(skin:ISkin3D, width:Number, depth:Number, height:Number)
      {
         super(skin);
         _type = "BOX";
         this._sideLengths = new Vector3D(width,height,depth);
         _boundingSphere = 0.5 * this._sideLengths.length;
         this.initPoint();
         mass = 1;
         this.updateBoundingBox();
      }
      
      private function initPoint() : void
      {
         var halfSide:Vector3D = this.getHalfSideLengths();
         this._points = new Vector.<Vector3D>();
         this._points[0] = new Vector3D(halfSide.x,-halfSide.y,halfSide.z);
         this._points[1] = new Vector3D(halfSide.x,halfSide.y,halfSide.z);
         this._points[2] = new Vector3D(-halfSide.x,-halfSide.y,halfSide.z);
         this._points[3] = new Vector3D(-halfSide.x,halfSide.y,halfSide.z);
         this._points[4] = new Vector3D(-halfSide.x,-halfSide.y,-halfSide.z);
         this._points[5] = new Vector3D(-halfSide.x,halfSide.y,-halfSide.z);
         this._points[6] = new Vector3D(halfSide.x,-halfSide.y,-halfSide.z);
         this._points[7] = new Vector3D(halfSide.x,halfSide.y,-halfSide.z);
      }
      
      public function set sideLengths(size:Vector3D) : void
      {
         this._sideLengths = size.clone();
         _boundingSphere = 0.5 * this._sideLengths.length;
         this.initPoint();
         setInertia(this.getInertiaProperties(mass));
         setActive();
         this.updateBoundingBox();
      }
      
      public function get sideLengths() : Vector3D
      {
         return this._sideLengths;
      }
      
      public function get edges() : Vector.<EdgeData>
      {
         return this._edges;
      }
      
      public function getVolume() : Number
      {
         return this._sideLengths.x * this._sideLengths.y * this._sideLengths.z;
      }
      
      public function getSurfaceArea() : Number
      {
         return 2 * (this._sideLengths.x * this._sideLengths.y + this._sideLengths.x * this._sideLengths.z + this._sideLengths.y * this._sideLengths.z);
      }
      
      public function getHalfSideLengths() : Vector3D
      {
         return JNumber3D.getScaleVector(this._sideLengths,0.5);
      }
      
      public function getSpan(axis:Vector3D) : SpanData
      {
         var cols:Vector.<Vector3D> = currentState.getOrientationCols();
         var obj:SpanData = new SpanData();
         var s:Number = Math.abs(axis.dotProduct(cols[0])) * (0.5 * this._sideLengths.x);
         var u:Number = Math.abs(axis.dotProduct(cols[1])) * (0.5 * this._sideLengths.y);
         var d:Number = Math.abs(axis.dotProduct(cols[2])) * (0.5 * this._sideLengths.z);
         var r:Number = s + u + d;
         var p:Number = currentState.position.dotProduct(axis);
         obj.min = p - r;
         obj.max = p + r;
         return obj;
      }
      
      public function getCornerPoints(state:PhysicsState) : Vector.<Vector3D>
      {
         var _points_length:int = int(this._points.length);
         var arr:Vector.<Vector3D> = new Vector.<Vector3D>(_points_length,true);
         var transform:Matrix3D = JMatrix3D.getTranslationMatrix(state.position.x,state.position.y,state.position.z);
         transform = JMatrix3D.getAppendMatrix3D(state.orientation,transform);
         var i:int = 0;
         while(i < _points_length)
         {
            arr[i] = transform.transformVector(this._points[i]);
            i = int(i + 1);
         }
         return arr;
      }
      
      public function getCornerPointsInBoxSpace(thisState:PhysicsState, boxState:PhysicsState) : Vector.<Vector3D>
      {
         var _point:Vector3D = null;
         var max:Matrix3D = JMatrix3D.getTransposeMatrix(boxState.orientation);
         var pos:Vector3D = thisState.position.subtract(boxState.position);
         pos = max.transformVector(pos);
         var orient:Matrix3D = JMatrix3D.getAppendMatrix3D(thisState.orientation,max);
         var arr:Vector.<Vector3D> = new Vector.<Vector3D>(this._points.length,true);
         var transform:Matrix3D = JMatrix3D.getTranslationMatrix(pos.x,pos.y,pos.z);
         transform = JMatrix3D.getAppendMatrix3D(orient,transform);
         var i:int = 0;
         for each(_point in this._points)
         {
            arr[int(i++)] = transform.transformVector(_point);
         }
         return arr;
      }
      
      public function getSqDistanceToPoint(state:PhysicsState, closestBoxPoint:Vector.<Vector3D>, point:Vector3D) : Number
      {
         var _closestBoxPoint:Vector3D = point.subtract(state.position);
         _closestBoxPoint = JMatrix3D.getTransposeMatrix(state.orientation).transformVector(_closestBoxPoint);
         var delta:Number = 0;
         var sqDistance:Number = 0;
         var halfSideLengths:Vector3D = this.getHalfSideLengths();
         if(_closestBoxPoint.x < -halfSideLengths.x)
         {
            delta = _closestBoxPoint.x + halfSideLengths.x;
            sqDistance += delta * delta;
            _closestBoxPoint.x = -halfSideLengths.x;
         }
         else if(_closestBoxPoint.x > halfSideLengths.x)
         {
            delta = _closestBoxPoint.x - halfSideLengths.x;
            sqDistance += delta * delta;
            _closestBoxPoint.x = halfSideLengths.x;
         }
         if(_closestBoxPoint.y < -halfSideLengths.y)
         {
            delta = _closestBoxPoint.y + halfSideLengths.y;
            sqDistance += delta * delta;
            _closestBoxPoint.y = -halfSideLengths.y;
         }
         else if(_closestBoxPoint.y > halfSideLengths.y)
         {
            delta = _closestBoxPoint.y - halfSideLengths.y;
            sqDistance += delta * delta;
            _closestBoxPoint.y = halfSideLengths.y;
         }
         if(_closestBoxPoint.z < -halfSideLengths.z)
         {
            delta = _closestBoxPoint.z + halfSideLengths.z;
            sqDistance += delta * delta;
            _closestBoxPoint.z = -halfSideLengths.z;
         }
         else if(_closestBoxPoint.z > halfSideLengths.z)
         {
            delta = _closestBoxPoint.z - halfSideLengths.z;
            sqDistance += delta * delta;
            _closestBoxPoint.z = halfSideLengths.z;
         }
         _closestBoxPoint = state.orientation.transformVector(_closestBoxPoint);
         closestBoxPoint[0] = state.position.add(_closestBoxPoint);
         return sqDistance;
      }
      
      public function getDistanceToPoint(state:PhysicsState, closestBoxPoint:Vector.<Vector3D>, point:Vector3D) : Number
      {
         return Math.sqrt(this.getSqDistanceToPoint(state,closestBoxPoint,point));
      }
      
      public function pointIntersect(pos:Vector3D) : Boolean
      {
         var dirVec:Vector3D = null;
         var dir:int = 0;
         var p:Vector3D = pos.subtract(currentState.position);
         var h:Vector3D = JNumber3D.getScaleVector(this._sideLengths,0.5);
         for(var cols:Vector.<Vector3D> = currentState.getOrientationCols(); dir < 3; )
         {
            dirVec = cols[dir].clone();
            dirVec.normalize();
            if(Math.abs(dirVec.dotProduct(p)) > JNumber3D.toArray(h)[dir] + JNumber3D.NUM_TINY)
            {
               return false;
            }
            dir++;
         }
         return true;
      }
      
      override public function segmentIntersect(out:CollOutData, seg:JSegment, state:PhysicsState) : Boolean
      {
         var e:Number = NaN;
         var f:Number = NaN;
         var t:Number = NaN;
         var t1:Number = NaN;
         var t2:Number = NaN;
         var directionVectorNumber:Number = NaN;
         out.frac = 0;
         out.position = new Vector3D();
         out.normal = new Vector3D();
         var frac:Number = JNumber3D.NUM_HUGE;
         var min:Number = -JNumber3D.NUM_HUGE;
         var max:Number = JNumber3D.NUM_HUGE;
         var dirMin:Number = 0;
         var dirMax:Number = 0;
         var dir:Number = 0;
         var p:Vector3D = state.position.subtract(seg.origin);
         var h:Vector3D = JNumber3D.getScaleVector(this._sideLengths,0.5);
         var orientationCol:Vector.<Vector3D> = state.getOrientationCols();
         var directionVectorArray:Array = JNumber3D.toArray(h);
         for(dir = 0; dir < 3; dir++)
         {
            directionVectorNumber = Number(directionVectorArray[dir]);
            e = orientationCol[dir].dotProduct(p);
            f = orientationCol[dir].dotProduct(seg.delta);
            if(Math.abs(f) > JNumber3D.NUM_TINY)
            {
               t1 = (e + directionVectorNumber) / f;
               t2 = (e - directionVectorNumber) / f;
               if(t1 > t2)
               {
                  t = t1;
                  t1 = t2;
                  t2 = t;
               }
               if(t1 > min)
               {
                  min = t1;
                  dirMin = dir;
               }
               if(t2 < max)
               {
                  max = t2;
                  dirMax = dir;
               }
               if(min > max)
               {
                  return false;
               }
               if(max < 0)
               {
                  return false;
               }
            }
            else if(-e - directionVectorNumber > 0 || -e + directionVectorNumber < 0)
            {
               return false;
            }
         }
         if(min > 0)
         {
            dir = dirMin;
            frac = min;
         }
         else
         {
            dir = dirMax;
            frac = max;
         }
         if(frac < 0)
         {
            frac = 0;
         }
         if(frac > 1 - JNumber3D.NUM_TINY)
         {
            return false;
         }
         out.frac = frac;
         out.position = seg.getPoint(frac);
         if(orientationCol[dir].dotProduct(seg.delta) < 0)
         {
            out.normal = JNumber3D.getScaleVector(orientationCol[dir],-1);
         }
         else
         {
            out.normal = orientationCol[dir];
         }
         return true;
      }
      
      override public function getInertiaProperties(m:Number) : Matrix3D
      {
         return JMatrix3D.getScaleMatrix(m / 12 * (this._sideLengths.y * this._sideLengths.y + this._sideLengths.z * this._sideLengths.z),m / 12 * (this._sideLengths.x * this._sideLengths.x + this._sideLengths.z * this._sideLengths.z),m / 12 * (this._sideLengths.x * this._sideLengths.x + this._sideLengths.y * this._sideLengths.y));
      }
      
      override protected function updateBoundingBox() : void
      {
         _boundingBox.clear();
         _boundingBox.addBox(this);
      }
   }
}

