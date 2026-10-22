package jiglib.collision
{
   import flash.geom.Vector3D;
   import jiglib.cof.JConfig;
   import jiglib.data.EdgeData;
   import jiglib.data.SpanData;
   import jiglib.geometry.*;
   import jiglib.math.*;
   import jiglib.physics.MaterialProperties;
   import jiglib.physics.PhysicsState;
   
   public class CollDetectBoxBox extends CollDetectFunctor
   {
      
      private const MAX_SUPPORT_VERTS:Number = 10;
      
      private var combinationDist:Number;
      
      public function CollDetectBoxBox()
      {
         super();
         name = "BoxBox";
         type0 = "BOX";
         type1 = "BOX";
      }
      
      private function disjoint(out:SpanData, axis:Vector3D, box0:JBox, box1:JBox) : Boolean
      {
         var obj0:SpanData = box0.getSpan(axis);
         var obj1:SpanData = box1.getSpan(axis);
         var obj0Min:Number = obj0.min;
         var obj0Max:Number = obj0.max;
         var obj1Min:Number = obj1.min;
         var obj1Max:Number = obj1.max;
         if(obj0Min > obj1Max + JConfig.collToll + JNumber3D.NUM_TINY || obj1Min > obj0Max + JConfig.collToll + JNumber3D.NUM_TINY)
         {
            out.flag = true;
            return true;
         }
         if(obj0Max > obj1Max && obj1Min > obj0Min)
         {
            out.depth = Math.min(obj0Max - obj1Min,obj1Max - obj0Min);
         }
         else if(obj1Max > obj0Max && obj0Min > obj1Min)
         {
            out.depth = Math.min(obj1Max - obj0Min,obj0Max - obj1Min);
         }
         else
         {
            out.depth = Math.min(obj0Max,obj1Max);
            out.depth -= Math.max(obj0Min,obj1Min);
         }
         out.flag = false;
         return false;
      }
      
      private function addPoint(contactPoints:Vector.<Vector3D>, pt:Vector3D, combinationDistanceSq:Number) : Boolean
      {
         var contactPoint:Vector3D = null;
         for each(contactPoint in contactPoints)
         {
            if(contactPoint.subtract(pt).lengthSquared < combinationDistanceSq)
            {
               contactPoint = JNumber3D.getDivideVector(contactPoint.add(pt),2);
               return false;
            }
         }
         contactPoints.push(pt);
         return true;
      }
      
      private function getSupportPoint(box:JBox, axis:Vector3D) : Vector3D
      {
         var orientationCol:Vector.<Vector3D> = box.currentState.getOrientationCols();
         var _as:Number = axis.dotProduct(orientationCol[0]);
         var _au:Number = axis.dotProduct(orientationCol[1]);
         var _ad:Number = axis.dotProduct(orientationCol[2]);
         var p:Vector3D = box.currentState.position.clone();
         if(_as < -JNumber3D.NUM_TINY)
         {
            p = p.add(JNumber3D.getScaleVector(orientationCol[0],0.5 * box.sideLengths.x));
         }
         else if(_as >= JNumber3D.NUM_TINY)
         {
            p = p.subtract(JNumber3D.getScaleVector(orientationCol[0],0.5 * box.sideLengths.x));
         }
         if(_au < -JNumber3D.NUM_TINY)
         {
            p = p.add(JNumber3D.getScaleVector(orientationCol[1],0.5 * box.sideLengths.y));
         }
         else if(_au > JNumber3D.NUM_TINY)
         {
            p = p.subtract(JNumber3D.getScaleVector(orientationCol[1],0.5 * box.sideLengths.y));
         }
         if(_ad < -JNumber3D.NUM_TINY)
         {
            p = p.add(JNumber3D.getScaleVector(orientationCol[2],0.5 * box.sideLengths.z));
         }
         else if(_ad > JNumber3D.NUM_TINY)
         {
            p = p.subtract(JNumber3D.getScaleVector(orientationCol[2],0.5 * box.sideLengths.z));
         }
         return p;
      }
      
      private function getAABox2EdgeIntersectionPoints(contactPoint:Vector.<Vector3D>, origBoxSides:Vector3D, origBoxState:PhysicsState, edgePt0:Vector3D, edgePt1:Vector3D) : int
      {
         var jDir:int = 0;
         var kDir:int = 0;
         var dist0:Number = NaN;
         var dist1:Number = NaN;
         var frac:Number = NaN;
         var pt:Vector3D = null;
         var ptArr:Array = null;
         var faceOffsets:Array = null;
         var iFace:int = 0;
         var num:int = 0;
         var edgeDir:Vector3D = edgePt1.subtract(edgePt0);
         edgeDir.normalize();
         var edgePt0Arr:Array = JNumber3D.toArray(edgePt0);
         var edgePt1Arr:Array = JNumber3D.toArray(edgePt1);
         var edgeDirArr:Array = JNumber3D.toArray(edgeDir);
         var sidesArr:Array = JNumber3D.toArray(JNumber3D.getScaleVector(origBoxSides,0.5));
         for(var iDir:int = 2; iDir >= 0; iDir--)
         {
            if(Math.abs(edgeDirArr[iDir]) >= 0.1)
            {
               jDir = (iDir + 1) % 3;
               kDir = (iDir + 2) % 3;
               faceOffsets = [-sidesArr[iDir],sidesArr[iDir]];
               iFace = 1;
               while(iFace >= 0)
               {
                  dist0 = edgePt0Arr[iDir] - faceOffsets[iFace];
                  dist1 = edgePt1Arr[iDir] - faceOffsets[iFace];
                  frac = -1;
                  if(dist0 * dist1 < -JNumber3D.NUM_TINY)
                  {
                     frac = -dist0 / (dist1 - dist0);
                  }
                  else if(Math.abs(dist0) < JNumber3D.NUM_TINY)
                  {
                     frac = 0;
                  }
                  else if(Math.abs(dist1) < JNumber3D.NUM_TINY)
                  {
                     frac = 1;
                  }
                  if(frac >= 0)
                  {
                     pt = JNumber3D.getScaleVector(edgePt0,1 - frac).add(JNumber3D.getScaleVector(edgePt1,frac));
                     ptArr = JNumber3D.toArray(pt);
                     if(ptArr[jDir] > -sidesArr[jDir] - JNumber3D.NUM_TINY && ptArr[jDir] < sidesArr[jDir] + JNumber3D.NUM_TINY && ptArr[kDir] > -sidesArr[kDir] - JNumber3D.NUM_TINY && ptArr[kDir] < sidesArr[kDir] + JNumber3D.NUM_TINY)
                     {
                        pt = origBoxState.orientation.transformVector(pt);
                        pt = pt.add(origBoxState.position);
                        this.addPoint(contactPoint,pt,this.combinationDist);
                        if(++num == 2)
                        {
                           return num;
                           break;
                        }
                     }
                  }
                  iFace--;
               }
            }
         }
         return num;
      }
      
      private function getBox2BoxEdgesIntersectionPoints(contactPoint:Vector.<Vector3D>, box0:JBox, box1:JBox, newState:Boolean) : Number
      {
         var seg:JSegment = null;
         var edgePt0:Vector3D = null;
         var edgePt1:Vector3D = null;
         var boxEdge:EdgeData = null;
         var num:Number = 0;
         var box0State:PhysicsState = newState ? box0.currentState : box0.oldState;
         var box1State:PhysicsState = newState ? box1.currentState : box1.oldState;
         var boxPts:Vector.<Vector3D> = box1.getCornerPointsInBoxSpace(box1State,box0State);
         var boxEdges:Vector.<EdgeData> = box1.edges;
         for each(boxEdge in boxEdges)
         {
            edgePt0 = boxPts[boxEdge.ind0];
            edgePt1 = boxPts[boxEdge.ind1];
            num += this.getAABox2EdgeIntersectionPoints(contactPoint,box0.sideLengths,box0State,edgePt0,edgePt1);
            if(num >= 8)
            {
               return num;
            }
         }
         return num;
      }
      
      private function getBoxBoxIntersectionPoints(contactPoint:Vector.<Vector3D>, box0:JBox, box1:JBox, newState:Boolean) : uint
      {
         this.getBox2BoxEdgesIntersectionPoints(contactPoint,box0,box1,newState);
         this.getBox2BoxEdgesIntersectionPoints(contactPoint,box1,box0,newState);
         return contactPoint.length;
      }
      
      override public function collDetect(info:CollDetectInfo, collArr:Vector.<CollisionInfo>) : void
      {
         var l2:Number = NaN;
         var collPts:Vector.<CollPointInfo> = null;
         var _overlapDepth:SpanData = null;
         var ax:Vector3D = null;
         var ia:int = 0;
         var ib:int = 0;
         var P0:Vector3D = null;
         var P1:Vector3D = null;
         var planeNormal:Vector3D = null;
         var planeD:Number = NaN;
         var div:Number = NaN;
         var t:Number = NaN;
         var minDist:Number = NaN;
         var maxDist:Number = NaN;
         var dist:Number = NaN;
         var depth:Number = NaN;
         var depthScale:Number = NaN;
         var cpInfo:CollPointInfo = null;
         var contactPoint:Vector3D = null;
         var box0:JBox = info.body0 as JBox;
         var box1:JBox = info.body1 as JBox;
         if(!box0.hitTestObject3D(box1))
         {
            return;
         }
         if(JConfig.aabbDetection && !box0.boundingBox.overlapTest(box1.boundingBox))
         {
            return;
         }
         var numTiny:Number = JNumber3D.NUM_TINY;
         var numHuge:Number = JNumber3D.NUM_HUGE;
         var dirs0Arr:Vector.<Vector3D> = box0.currentState.getOrientationCols();
         var dirs1Arr:Vector.<Vector3D> = box1.currentState.getOrientationCols();
         var axes:Vector.<Vector3D> = Vector.<Vector3D>([dirs0Arr[0],dirs0Arr[1],dirs0Arr[2],dirs1Arr[0],dirs1Arr[1],dirs1Arr[2],dirs0Arr[0].crossProduct(dirs1Arr[0]),dirs0Arr[1].crossProduct(dirs1Arr[0]),dirs0Arr[2].crossProduct(dirs1Arr[0]),dirs0Arr[0].crossProduct(dirs1Arr[1]),dirs0Arr[1].crossProduct(dirs1Arr[1]),dirs0Arr[2].crossProduct(dirs1Arr[1]),dirs0Arr[0].crossProduct(dirs1Arr[2]),dirs0Arr[1].crossProduct(dirs1Arr[2]),dirs0Arr[2].crossProduct(dirs1Arr[2])]);
         var overlapDepths:Vector.<SpanData> = new Vector.<SpanData>();
         var i:int = 0;
         var axesLength:int = int(axes.length);
         for(i = 0; i < axesLength; i++)
         {
            _overlapDepth = overlapDepths[i] = new SpanData();
            _overlapDepth.depth = numHuge;
            l2 = axes[i].lengthSquared;
            if(l2 >= numTiny)
            {
               ax = axes[i].clone();
               ax.normalize();
               if(this.disjoint(overlapDepths[i],ax,box0,box1))
               {
                  return;
               }
            }
         }
         var minDepth:Number = numHuge;
         var minAxis:int = -1;
         axesLength = int(axes.length);
         for(i = 0; i < axesLength; i++)
         {
            l2 = axes[i].lengthSquared;
            if(l2 >= numTiny)
            {
               if(overlapDepths[i].depth < minDepth)
               {
                  minDepth = overlapDepths[i].depth;
                  minAxis = int(i);
               }
            }
         }
         if(minAxis == -1)
         {
            return;
         }
         var N:Vector3D = axes[minAxis].clone();
         if(box1.currentState.position.subtract(box0.currentState.position).dotProduct(N) > 0)
         {
            N = JNumber3D.getScaleVector(N,-1);
         }
         var contactPointsFromOld:Boolean = true;
         var contactPoints:Vector.<Vector3D> = new Vector.<Vector3D>();
         this.combinationDist = 0.05 * Math.min(Math.min(box0.sideLengths.x,box0.sideLengths.y,box0.sideLengths.z),Math.min(box1.sideLengths.x,box1.sideLengths.y,box1.sideLengths.z));
         this.combinationDist += JConfig.collToll * 3.464;
         this.combinationDist *= this.combinationDist;
         if(minDepth > -JNumber3D.NUM_TINY)
         {
            this.getBoxBoxIntersectionPoints(contactPoints,box0,box1,false);
         }
         if(contactPoints.length == 0)
         {
            contactPointsFromOld = false;
            this.getBoxBoxIntersectionPoints(contactPoints,box0,box1,true);
         }
         var bodyDelta:Vector3D = box0.currentState.position.subtract(box0.oldState.position).subtract(box1.currentState.position.subtract(box1.oldState.position));
         var bodyDeltaLen:Number = bodyDelta.dotProduct(N);
         var oldDepth:Number = minDepth + bodyDeltaLen;
         var SATPoint:Vector3D = new Vector3D();
         switch(minAxis)
         {
            case 0:
            case 1:
            case 2:
               SATPoint = this.getSupportPoint(box1,JNumber3D.getScaleVector(N,-1));
               break;
            case 3:
            case 4:
            case 5:
               SATPoint = this.getSupportPoint(box0,N);
               break;
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
               i = minAxis - 6;
               ia = i / 3;
               ib = i - ia * 3;
               P0 = this.getSupportPoint(box0,N);
               P1 = this.getSupportPoint(box1,JNumber3D.getScaleVector(N,-1));
               planeNormal = N.crossProduct(dirs1Arr[ib]);
               planeD = planeNormal.dotProduct(P1);
               div = dirs0Arr[ia].dotProduct(planeNormal);
               if(Math.abs(div) < JNumber3D.NUM_TINY)
               {
                  return;
               }
               t = (planeD - P0.dotProduct(planeNormal)) / div;
               P0 = P0.add(JNumber3D.getScaleVector(dirs0Arr[ia],t));
               SATPoint = P0.add(JNumber3D.getScaleVector(N,0.5 * minDepth));
         }
         if(contactPoints.length > 0)
         {
            collPts = new Vector.<CollPointInfo>(contactPoints.length,true);
            minDist = JNumber3D.NUM_HUGE;
            maxDist = -JNumber3D.NUM_HUGE;
            for each(contactPoint in contactPoints)
            {
               dist = contactPoint.subtract(SATPoint).length;
               if(dist < minDist)
               {
                  minDist = dist;
               }
               if(dist > maxDist)
               {
                  maxDist = dist;
               }
            }
            if(maxDist < minDist + JNumber3D.NUM_TINY)
            {
               maxDist = minDist + JNumber3D.NUM_TINY;
            }
            i = 0;
            for each(contactPoint in contactPoints)
            {
               dist = contactPoint.subtract(SATPoint).length;
               depthScale = (dist - minDist) / (maxDist - minDist);
               depth = (1 - depthScale) * oldDepth;
               cpInfo = new CollPointInfo();
               if(contactPointsFromOld)
               {
                  cpInfo.r0 = contactPoint.subtract(box0.oldState.position);
                  cpInfo.r1 = contactPoint.subtract(box1.oldState.position);
               }
               else
               {
                  cpInfo.r0 = contactPoint.subtract(box0.currentState.position);
                  cpInfo.r1 = contactPoint.subtract(box1.currentState.position);
               }
               cpInfo.initialPenetration = depth;
               collPts[int(i++)] = cpInfo;
            }
         }
         else
         {
            cpInfo = new CollPointInfo();
            cpInfo.r0 = SATPoint.subtract(box0.currentState.position);
            cpInfo.r1 = SATPoint.subtract(box1.currentState.position);
            cpInfo.initialPenetration = oldDepth;
            collPts = new Vector.<CollPointInfo>(1,true);
            collPts[0] = cpInfo;
         }
         var collInfo:CollisionInfo = new CollisionInfo();
         collInfo.objInfo = info;
         collInfo.dirToBody = N;
         collInfo.pointInfo = collPts;
         var mat:MaterialProperties = new MaterialProperties();
         mat.restitution = Math.sqrt(box0.material.restitution * box1.material.restitution);
         mat.friction = Math.sqrt(box0.material.friction * box1.material.friction);
         collInfo.mat = mat;
         collArr.push(collInfo);
         info.body0.collisions.push(collInfo);
         info.body1.collisions.push(collInfo);
      }
   }
}

