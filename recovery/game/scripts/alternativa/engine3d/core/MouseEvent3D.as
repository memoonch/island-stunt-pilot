package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.events.Event;
   import flash.geom.Vector3D;
   
   use namespace alternativa3d;
   
   public class MouseEvent3D extends Event
   {
      
      public static const CLICK:String = "click";
      
      public static const DOUBLE_CLICK:String = "doubleClick";
      
      public static const MOUSE_DOWN:String = "mouseDown";
      
      public static const MOUSE_UP:String = "mouseUp";
      
      public static const MOUSE_MOVE:String = "mouseMove";
      
      public static const MOUSE_WHEEL:String = "mouseWheel";
      
      §§push(false);
      var _loc1_:Boolean = true;
      var _loc2_:* = §§pop();
      while(true)
      {
         if(_loc1_ || _loc1_)
         {
            CLICK = "click";
            if(!_loc1_)
            {
               break;
            }
            DOUBLE_CLICK = "doubleClick";
            MOUSE_DOWN = "mouseDown";
         }
         MOUSE_UP = "mouseUp";
         break;
      }
      
      public static const MOUSE_OVER:String = "mouseOver";
      
      public static const MOUSE_OUT:String = "mouseOut";
      
      public static const ROLL_OVER:String = "rollOver";
      
      public static const ROLL_OUT:String = "rollOut";
      
      if(!(_loc2_ && _loc1_))
      {
         MOUSE_MOVE = "mouseMove";
         MOUSE_WHEEL = "mouseWheel";
      }
      
      public var ctrlKey:Boolean;
      
      public var altKey:Boolean;
      
      public var shiftKey:Boolean;
      
      public var buttonDown:Boolean;
      
      public var delta:int;
      
      public var relatedObject:Object3D;
      
      public var localOrigin:Vector3D;
      
      public var localDirection:Vector3D;
      
      alternativa3d var _target:Object3D;
      
      alternativa3d var _currentTarget:Object3D;
      
      alternativa3d var _bubbles:Boolean;
      
      alternativa3d var _eventPhase:uint = 3;
      
      alternativa3d var stop:Boolean = false;
      
      alternativa3d var stopImmediate:Boolean = false;
      
      public function MouseEvent3D(param1:String, param2:Boolean = true, param3:Object3D = null, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:int = 0)
      {
         §§push(false);
         var _loc9_:Boolean = true;
         var _loc10_:* = §§pop();
         this.localOrigin = new Vector3D();
         this.localDirection = new Vector3D();
         if(!(_loc10_ && Boolean(param1)))
         {
            super(param1,param2);
            this.relatedObject = param3;
            this.altKey = param4;
            if(_loc9_)
            {
               this.ctrlKey = param5;
               this.shiftKey = param6;
            }
            this.buttonDown = param7;
         }
         this.delta = param8;
      }
      
      alternativa3d function calculateLocalRay(param1:Number, param2:Number, param3:Object3D, param4:Camera3D) : void
      {
         var _temp_1:* = true;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = _temp_1;
         while(true)
         {
            if(_loc13_)
            {
               param4.calculateRay(this.localOrigin,this.localDirection,param1,param2);
               if(!_loc13_)
               {
                  break;
               }
            }
            param3.composeMatrix();
            break;
         }
         var _loc5_:Object3D = param3;
         loop0:
         while(true)
         {
            §§push(_loc5_._parent);
            do
            {
               if(§§pop() == null)
               {
                  break loop0;
               }
               §§push(_loc5_._parent);
            }
            while(!_loc13_);
            _loc5_ = §§pop();
            if(!_loc12_)
            {
               _loc5_.composeMatrix();
               if(!(_loc13_ || Boolean(param3)))
               {
                  continue;
               }
            }
            param3.appendMatrix(_loc5_);
         }
         if(_loc13_)
         {
            param3.invertMatrix();
         }
         var _loc6_:Number = this.localOrigin.x;
         var _loc7_:Number = this.localOrigin.y;
         var _loc8_:Number = this.localOrigin.z;
         var _loc9_:Number = this.localDirection.x;
         var _loc10_:Number = this.localDirection.y;
         var _loc11_:Number = this.localDirection.z;
         this.localOrigin.x = param3.ma * _loc6_ + param3.mb * _loc7_ + param3.mc * _loc8_ + param3.md;
         this.localOrigin.y = param3.me * _loc6_ + param3.mf * _loc7_ + param3.mg * _loc8_ + param3.mh;
         while(true)
         {
            if(!_loc12_)
            {
               this.localOrigin.z = param3.mi * _loc6_ + param3.mj * _loc7_ + param3.mk * _loc8_ + param3.ml;
               this.localDirection.x = param3.ma * _loc9_ + param3.mb * _loc10_ + param3.mc * _loc11_;
               if(_loc13_ || Boolean(param1))
               {
                  this.localDirection.y = param3.me * _loc9_ + param3.mf * _loc10_ + param3.mg * _loc11_;
                  if(!_loc13_)
                  {
                     break;
                  }
               }
            }
            this.localDirection.z = param3.mi * _loc9_ + param3.mj * _loc10_ + param3.mk * _loc11_;
            break;
         }
      }
      
      override public function get bubbles() : Boolean
      {
         return this._bubbles;
      }
      
      override public function get eventPhase() : uint
      {
         return this._eventPhase;
      }
      
      override public function get target() : Object
      {
         return this._target;
      }
      
      override public function get currentTarget() : Object
      {
         return this._currentTarget;
      }
      
      override public function stopPropagation() : void
      {
         §§push(false);
         var _loc1_:Boolean = true;
         var _loc2_:* = §§pop();
         if(!_loc2_)
         {
            this.stop = true;
         }
      }
      
      override public function stopImmediatePropagation() : void
      {
         var _temp_1:* = true;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = _temp_1;
         if(!(_loc1_ && _loc2_))
         {
            this.stopImmediate = true;
         }
      }
      
      override public function clone() : Event
      {
         return new MouseEvent3D(type,this._bubbles,this.relatedObject,this.altKey,this.ctrlKey,this.shiftKey,this.buttonDown,this.delta);
      }
      
      override public function toString() : String
      {
         return formatToString("MouseEvent3D","type","bubbles","eventPhase","relatedObject","altKey","ctrlKey","shiftKey","buttonDown","delta");
      }
   }
}

var _temp_1:* = true;
false;
_temp_1;
if(_loc2_)
{
   MouseEvent3D = §§newclass(MouseEvent3D,Event);
}

