package
{
   import alternativa.engine3d.containers.*;
   import alternativa.engine3d.core.*;
   import alternativa.engine3d.materials.*;
   import alternativa.engine3d.objects.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import jiglib.geometry.*;
   import jiglib.physics.*;
   import jiglib.plugin.alternativa3d.*;
   import procedural.*;
   
   public class core_plane
   {
      
      private static const smoke1:Class = core_plane_smoke1;
      
      private static const gfxSmokeWhite:BitmapData = new smoke1().bitmapData;
      
      private static const smoke2:Class = core_plane_smoke2;
      
      private static const gfxSmokeBlack:BitmapData = new smoke2().bitmapData;
      
      private static const snd_engine_die:Class = core_plane_snd_engine_die;
      
      private static const snd_engine_high:Class = core_plane_snd_engine_high;
      
      private static const snd_engine_low:Class = core_plane_snd_engine_low;
      
      private static const snd_hit_hard_01:Class = core_plane_snd_hit_hard_01;
      
      private static const snd_hit_hard_02:Class = core_plane_snd_hit_hard_02;
      
      protected var sndEngineDie:MP3Player = new MP3Player(new snd_engine_die() as Sound,true);
      
      protected var sndEngineHigh:MP3Player = new MP3Player(new snd_engine_high() as Sound,true);
      
      protected var sndEngineLow:MP3Player = new MP3Player(new snd_engine_low() as Sound,true);
      
      protected var sndHitHard01:MP3Player = new MP3Player(new snd_hit_hard_01() as Sound,true);
      
      protected var sndHitHard02:MP3Player = new MP3Player(new snd_hit_hard_02() as Sound,true);
      
      private const TURN_FORCE:Number = 0.1;
      
      private const MOTOR_FORCE:Number = 150;
      
      private const BOOST_FORCE:Number = 300;
      
      private const RIMX:Number = 300;
      
      private const RIMY:Number = 150;
      
      private var coreInterface:core_interface;
      
      private var _body:Object3DContainer = new Object3DContainer();
      
      private var _plane:Mesh = new plane();
      
      private var _prop:Mesh = new propeller();
      
      private var _excluder:RigidBody;
      
      private var _motorForce:Number;
      
      private var _turnForceX:Number;
      
      private var _turnForceY:Number;
      
      private var _mousePosX:Number;
      
      private var _mousePosY:Number;
      
      private var _crashed:Boolean;
      
      private var _invertY:Number = 1;
      
      private var coloredSmoke:Boolean;
      
      private var smokeParticle:core_particle;
      
      private var matSmokeWhite:TextureMaterial = new TextureMaterial(gfxSmokeWhite,false,true);
      
      private var matSmokeBlack:TextureMaterial = new TextureMaterial(gfxSmokeBlack,false,true);
      
      private var engineSound:MP3Player;
      
      private var engineVolume:Number;
      
      public function core_plane(cif:core_interface)
      {
         super();
         this.coreInterface = cif;
         this._body.addChild(this._plane);
         this._body.addChild(this._prop);
         this._prop.x = -0.034;
         this._prop.y = -1.611;
         this._prop.z = 44.949;
         this._excluder = this.coreInterface.physics.createInvisibleCube(111.426,21.484,77.018);
         this.smokeParticle = new core_particle(this.coreInterface);
         this.smokeParticle.gravity.y = 20;
         this.smokeParticle.alphaFactor = 0.25;
         this.smokeParticle.scaleFactor = 50;
         this.smokeParticle.rotateFactor = Math.PI * -0.1;
         this.smokeParticle.maxCount = 1000;
      }
      
      public function add(pos:Vector3D, rot:Number) : void
      {
         this.coreInterface.sceneRoot.addChild(this._body);
         this.moveTo(pos);
         this.setRotation(0,rot,0);
         this._crashed = false;
         this.smokeParticle.reset();
         this.resetControl();
      }
      
      public function remove() : void
      {
         this.coreInterface.sceneRoot.removeChild(this._body);
         this.smokeParticle.reset();
         this.mute();
      }
      
      public function mute() : void
      {
         if(this.engineSound != null)
         {
            this.engineSound.stop();
            this.engineSound = null;
         }
      }
      
      public function get mtx() : Matrix3D
      {
         return this._body.matrix;
      }
      
      public function moveTo(pos:Vector3D) : void
      {
         this._excluder.moveTo(pos);
         this._body.x = pos.x;
         this._body.y = pos.y;
         this._body.z = pos.z;
      }
      
      public function setRotation(x:Number, y:Number, z:Number) : void
      {
         this._excluder.rotationX = x;
         this._excluder.rotationY = y;
         this._excluder.rotationZ = z;
         this._body.rotationX = x * (Math.PI / 180);
         this._body.rotationY = y * (Math.PI / 180);
         this._body.rotationZ = z * (Math.PI / 180);
      }
      
      public function setInvertY(iy:Number) : void
      {
         this._invertY = iy;
      }
      
      public function resetControl() : void
      {
         this._turnForceX = this._turnForceY = 0;
         this._motorForce = this.MOTOR_FORCE;
         this.coloredSmoke = false;
      }
      
      public function keyDownHandler(event:KeyboardEvent) : void
      {
         switch(event.keyCode)
         {
            case Keyboard.UP:
               this._turnForceX = this.TURN_FORCE * this._invertY;
               break;
            case Keyboard.DOWN:
               this._turnForceX = -this.TURN_FORCE * this._invertY;
               break;
            case Keyboard.LEFT:
               this._turnForceY = this.TURN_FORCE;
               break;
            case Keyboard.RIGHT:
               this._turnForceY = -this.TURN_FORCE;
               break;
            case Keyboard.SPACE:
               this._motorForce = this.BOOST_FORCE;
               break;
            case Keyboard.TAB:
               this.coloredSmoke = true;
         }
      }
      
      public function keyUpHandler(event:KeyboardEvent) : void
      {
         switch(event.keyCode)
         {
            case Keyboard.UP:
               this._turnForceX = 0;
               break;
            case Keyboard.DOWN:
               this._turnForceX = 0;
               break;
            case Keyboard.LEFT:
               this._turnForceY = 0;
               break;
            case Keyboard.RIGHT:
               this._turnForceY = 0;
               break;
            case Keyboard.SPACE:
               this._motorForce = this.MOTOR_FORCE;
               break;
            case Keyboard.TAB:
               this.coloredSmoke = false;
         }
      }
      
      public function onMouseUpDown(e:MouseEvent) : void
      {
         if(e.buttonDown)
         {
            if(e.shiftKey)
            {
               this._motorForce = this.BOOST_FORCE;
            }
            else
            {
               this.coloredSmoke = true;
            }
         }
         else
         {
            this._motorForce = this.MOTOR_FORCE;
            this.coloredSmoke = false;
         }
      }
      
      public function onMouseMove(e:MouseEvent) : void
      {
         this._mousePosX = this.coreInterface.camera.view.mouseX;
         this._mousePosY = this.coreInterface.camera.view.mouseY;
         if(this._mousePosX < this.RIMX)
         {
            this._turnForceY = this.TURN_FORCE * ((this.RIMX - this._mousePosX) / this.RIMX);
         }
         else if(this._mousePosX > this.coreInterface.stage().stageWidth - this.RIMX)
         {
            this._turnForceY = -this.TURN_FORCE * ((this.RIMX - (this.coreInterface.stage().stageWidth - this._mousePosX)) / this.RIMX);
         }
         else
         {
            this._turnForceY = 0;
         }
         if(this._mousePosY < this.RIMY)
         {
            this._turnForceX = -this.TURN_FORCE * ((this.RIMY - this._mousePosY) / this.RIMY) * -this._invertY;
         }
         else if(this._mousePosY > this.coreInterface.stage().stageHeight - this.RIMY)
         {
            this._turnForceX = this.TURN_FORCE * ((this.RIMY - (this.coreInterface.stage().stageHeight - this._mousePosY)) / this.RIMY) * -this._invertY;
         }
         else
         {
            this._turnForceX = 0;
         }
      }
      
      public function draw() : void
      {
         this.coreInterface.drawBox(this._excluder.getTransform(),(this._excluder as JBox).sideLengths,65280);
      }
      
      public function isCrashed() : Boolean
      {
         return this._crashed;
      }
      
      public function setEngineVolume(store:Boolean) : void
      {
         if(Boolean(this.engineSound))
         {
            if(store)
            {
               this.engineVolume = this.engineSound.getVolume();
               this.engineSound.setVolumeAndPan(0);
            }
            else
            {
               this.engineSound.setVolumeAndPan(this.engineVolume);
            }
         }
      }
      
      private function updateSound(snd:MP3Player) : void
      {
         if(this.engineSound != snd)
         {
            if(this.engineSound != null)
            {
               this.engineSound.stop();
            }
            this.engineSound = snd;
            this.engineSound.playLoadedSound(0,true);
         }
         if(this.engineSound != null)
         {
            this.engineSound.setVolumeAndPan(this.coreInterface.masterVolume);
         }
      }
      
      private function updatePlayerSound(dt:Number) : void
      {
         var snd:MP3Player = this._motorForce == this.BOOST_FORCE ? this.sndEngineHigh : this.sndEngineLow;
         if(this.isCrashed())
         {
            snd = this.sndEngineDie;
         }
         this.updateSound(snd);
      }
      
      public function update(dt:Number) : void
      {
         var axisz:Vector3D = null;
         var stabX:Number = NaN;
         var stabZ:Number = NaN;
         var mat:Matrix3D = null;
         var __axisx:Vector3D = null;
         var __axisz:Vector3D = null;
         if(this.coreInterface.soundEnabled)
         {
            this.updatePlayerSound(dt);
         }
         this._body.matrix = this._excluder.currentState.orientation;
         this._body.x = this._excluder.currentState.position.x;
         this._body.y = this._excluder.currentState.position.y;
         this._body.z = this._excluder.currentState.position.z;
         this._prop.rotationZ += 1;
         if(!this._crashed)
         {
            if(Boolean(this._excluder.collisions.length))
            {
               this._crashed = true;
               if(this.coreInterface.soundEnabled)
               {
                  (Math.random() > 0.5 ? this.sndHitHard02 : this.sndHitHard01).playLoadedSound();
               }
               return;
            }
            this._plane.rotationZ = this.coreInterface.lerp(this._plane.rotationZ,-this._turnForceY * 5,0.1);
            this._excluder.setActive();
            axisz = new Vector3D(this.mtx.rawData[8],this.mtx.rawData[9],this.mtx.rawData[10]);
            axisz.scaleBy(this._motorForce);
            this._excluder.currentState.linVelocity = axisz;
            if(this._turnForceX != 0)
            {
               this._excluder.currentState.rotVelocity.incrementBy(new Vector3D(this.mtx.rawData[0] * this._turnForceX,this.mtx.rawData[1] * this._turnForceX,this.mtx.rawData[2] * this._turnForceX));
            }
            stabX = this.mtx.rawData[9] * 0.1;
            this._excluder.currentState.rotVelocity.incrementBy(new Vector3D(this.mtx.rawData[0] * stabX,this.mtx.rawData[1] * stabX,this.mtx.rawData[2] * stabX));
            if(this._turnForceY != 0)
            {
               this._excluder.currentState.rotVelocity.incrementBy(new Vector3D(this.mtx.rawData[4] * this._turnForceY,this.mtx.rawData[5] * this._turnForceY,this.mtx.rawData[6] * this._turnForceY));
               this._excluder.currentState.rotVelocity.incrementBy(new Vector3D(this.mtx.rawData[8] * -this.mtx.rawData[1],this.mtx.rawData[9] * -this.mtx.rawData[1],this.mtx.rawData[10] * -this.mtx.rawData[1]));
            }
            stabZ = -this.mtx.rawData[1] * 0.5;
            this._excluder.currentState.rotVelocity.incrementBy(new Vector3D(this.mtx.rawData[8] * stabZ,this.mtx.rawData[9] * stabZ,this.mtx.rawData[10] * stabZ));
            this._excluder.currentState.rotVelocity.x = this.coreInterface.limit(this._excluder.currentState.rotVelocity.x * 0.9,-0.5,0.5);
            this._excluder.currentState.rotVelocity.y = this.coreInterface.limit(this._excluder.currentState.rotVelocity.y * 0.9,-0.5,0.5);
            this._excluder.currentState.rotVelocity.z = this.coreInterface.limit(this._excluder.currentState.rotVelocity.z * 0.9,-0.5,0.5);
            if(this.coloredSmoke)
            {
               mat = this.mtx.clone();
               mat.prepend(this._plane.matrix);
               __axisx = new Vector3D(mat.rawData[0],mat.rawData[1],mat.rawData[2]);
               __axisx.scaleBy(40);
               this.smokeParticle.emit(this.mtx.position.add(__axisx),10,10,this.matSmokeWhite);
               this.smokeParticle.emit(this.mtx.position.subtract(__axisx),10,10,this.matSmokeWhite);
            }
         }
         else
         {
            this._excluder.currentState.linVelocity.y -= dt * 20;
            __axisz = new Vector3D(this.mtx.rawData[8],this.mtx.rawData[9],this.mtx.rawData[10]);
            __axisz.scaleBy(this._prop.z);
            this.smokeParticle.emit(this.mtx.position.add(__axisz),10,10,this.matSmokeBlack);
         }
         this.smokeParticle.update(dt);
      }
   }
}

