package jiglib.geometry
{
   import flash.geom.Vector3D;
   import jiglib.math.JNumber3D;
   
   public class JAABox
   {
      
      private var _minPos:Vector3D;
      
      private var _maxPos:Vector3D;
      
      public function JAABox(minPos:Vector3D, maxPos:Vector3D)
      {
         super();
         this._minPos = minPos.clone();
         this._maxPos = maxPos.clone();
      }
      
      public function get minPos() : Vector3D
      {
         return this._minPos;
      }
      
      public function set minPos(pos:Vector3D) : void
      {
         this._minPos = pos.clone();
      }
      
      public function get maxPos() : Vector3D
      {
         return this._maxPos;
      }
      
      public function set maxPos(pos:Vector3D) : void
      {
         this._maxPos = pos.clone();
      }
      
      public function get sideLengths() : Vector3D
      {
         var pos:Vector3D = this._maxPos.clone();
         pos.subtract(this._minPos);
         return pos;
      }
      
      public function get centrePos() : Vector3D
      {
         var pos:Vector3D = this._minPos.clone();
         return JNumber3D.getScaleVector(pos.add(this._maxPos),0.5);
      }
      
      public function move(delta:Vector3D) : void
      {
         this._minPos.add(delta);
         this._maxPos.add(delta);
      }
      
      public function clear() : void
      {
         this._minPos = new Vector3D(JNumber3D.NUM_HUGE,JNumber3D.NUM_HUGE,JNumber3D.NUM_HUGE);
         this._maxPos = new Vector3D(-JNumber3D.NUM_HUGE,-JNumber3D.NUM_HUGE,-JNumber3D.NUM_HUGE);
      }
      
      public function clone() : JAABox
      {
         return new JAABox(this._minPos,this._maxPos);
      }
      
      public function addPoint(pos:Vector3D) : void
      {
         if(pos.x < this._minPos.x)
         {
            this._minPos.x = pos.x - JNumber3D.NUM_TINY;
         }
         if(pos.x > this._maxPos.x)
         {
            this._maxPos.x = pos.x + JNumber3D.NUM_TINY;
         }
         if(pos.y < this._minPos.y)
         {
            this._minPos.y = pos.y - JNumber3D.NUM_TINY;
         }
         if(pos.y > this._maxPos.y)
         {
            this._maxPos.y = pos.y + JNumber3D.NUM_TINY;
         }
         if(pos.z < this._minPos.z)
         {
            this._minPos.z = pos.z - JNumber3D.NUM_TINY;
         }
         if(pos.z > this._maxPos.z)
         {
            this._maxPos.z = pos.z + JNumber3D.NUM_TINY;
         }
      }
      
      public function addBox(box:JBox) : void
      {
         var pts:Vector.<Vector3D> = box.getCornerPoints(box.currentState);
         this.addPoint(pts[0]);
         this.addPoint(pts[1]);
         this.addPoint(pts[2]);
         this.addPoint(pts[3]);
         this.addPoint(pts[4]);
         this.addPoint(pts[5]);
         this.addPoint(pts[6]);
         this.addPoint(pts[7]);
      }
      
      public function addSphere(sphere:JSphere) : void
      {
         if(sphere.currentState.position.x - sphere.radius < this._minPos.x)
         {
            this._minPos.x = sphere.currentState.position.x - sphere.radius - 1;
         }
         if(sphere.currentState.position.x + sphere.radius > this._maxPos.x)
         {
            this._maxPos.x = sphere.currentState.position.x + sphere.radius + 1;
         }
         if(sphere.currentState.position.y - sphere.radius < this._minPos.y)
         {
            this._minPos.y = sphere.currentState.position.y - sphere.radius - 1;
         }
         if(sphere.currentState.position.y + sphere.radius > this._maxPos.y)
         {
            this._maxPos.y = sphere.currentState.position.y + sphere.radius + 1;
         }
         if(sphere.currentState.position.z - sphere.radius < this._minPos.z)
         {
            this._minPos.z = sphere.currentState.position.z - sphere.radius - 1;
         }
         if(sphere.currentState.position.z + sphere.radius > this._maxPos.z)
         {
            this._maxPos.z = sphere.currentState.position.z + sphere.radius + 1;
         }
      }
      
      public function addCapsule(capsule:JCapsule) : void
      {
         var pos:Vector3D = capsule.getBottomPos(capsule.currentState);
         if(pos.x - capsule.radius < this._minPos.x)
         {
            this._minPos.x = pos.x - capsule.radius - 1;
         }
         if(pos.x + capsule.radius > this._maxPos.x)
         {
            this._maxPos.x = pos.x + capsule.radius + 1;
         }
         if(pos.y - capsule.radius < this._minPos.y)
         {
            this._minPos.y = pos.y - capsule.radius - 1;
         }
         if(pos.y + capsule.radius > this._maxPos.y)
         {
            this._maxPos.y = pos.y + capsule.radius + 1;
         }
         if(pos.z - capsule.radius < this._minPos.z)
         {
            this._minPos.z = pos.z - capsule.radius - 1;
         }
         if(pos.z + capsule.radius > this._maxPos.z)
         {
            this._maxPos.z = pos.z + capsule.radius + 1;
         }
         pos = capsule.getEndPos(capsule.currentState);
         if(pos.x - capsule.radius < this._minPos.x)
         {
            this._minPos.x = pos.x - capsule.radius - 1;
         }
         if(pos.x + capsule.radius > this._maxPos.x)
         {
            this._maxPos.x = pos.x + capsule.radius + 1;
         }
         if(pos.y - capsule.radius < this._minPos.y)
         {
            this._minPos.y = pos.y - capsule.radius - 1;
         }
         if(pos.y + capsule.radius > this._maxPos.y)
         {
            this._maxPos.y = pos.y + capsule.radius + 1;
         }
         if(pos.z - capsule.radius < this._minPos.z)
         {
            this._minPos.z = pos.z - capsule.radius - 1;
         }
         if(pos.z + capsule.radius > this._maxPos.z)
         {
            this._maxPos.z = pos.z + capsule.radius + 1;
         }
      }
      
      public function addSegment(seg:JSegment) : void
      {
         this.addPoint(seg.origin);
         this.addPoint(seg.getEnd());
      }
      
      public function overlapTest(box:JAABox) : Boolean
      {
         return this._minPos.z >= box.maxPos.z || this._maxPos.z <= box.minPos.z || this._minPos.y >= box.maxPos.y || this._maxPos.y <= box.minPos.y || this._minPos.x >= box.maxPos.x || this._maxPos.x <= box.minPos.x ? false : true;
      }
      
      public function isPointInside(pos:Vector3D) : Boolean
      {
         return pos.x >= this._minPos.x && pos.x <= this._maxPos.x && pos.y >= this._minPos.y && pos.y <= this._maxPos.y && pos.z >= this._minPos.z && pos.z <= this._maxPos.z;
      }
   }
}

