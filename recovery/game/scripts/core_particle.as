package
{
   import alternativa.engine3d.core.*;
   import alternativa.engine3d.materials.*;
   import alternativa.engine3d.objects.*;
   import alternativa.engine3d.primitives.*;
   import flash.geom.Vector3D;
   
   public class core_particle
   {
      
      private var coreInterface:core_interface;
      
      public var sprite:Vector.<Sprite3D> = new Vector.<Sprite3D>();
      
      public var speed:Vector.<Vector3D> = new Vector.<Vector3D>();
      
      public var gravity:Vector3D = new Vector3D();
      
      public var scaleFactor:Number = 60;
      
      public var alphaFactor:Number = 0.5;
      
      public var rotateFactor:Number = 1.5707963267948966;
      
      public var maxCount:uint = 50;
      
      public var useCount:uint = 0;
      
      public var startAlpha:Number = 0.4;
      
      private var animLoop:Boolean = false;
      
      private var frameDelay:Number = -1;
      
      private var frameDelays:Vector.<Number> = new Vector.<Number>();
      
      public function core_particle(cif:core_interface, pFrameDelay:Number = -1, pLoop:Boolean = false)
      {
         super();
         this.coreInterface = cif;
         this.frameDelay = pFrameDelay;
         this.animLoop = pLoop;
      }
      
      public function emit(pos:Vector3D, w:Number, h:Number, m:Material, spd:Vector3D = null) : Sprite3D
      {
         if(this.useCount >= this.maxCount)
         {
            return null;
         }
         var newParticle:Sprite3D = new Sprite3D(w,h,m);
         newParticle.x = pos.x;
         newParticle.y = pos.y;
         newParticle.z = pos.z;
         this.placeNewSprite(newParticle,false,spd);
         return newParticle;
      }
      
      public function emitAnimated(pos:Vector3D, w:Number, h:Number, mv:Vector.<Material>, spd:Vector3D = null) : Sprite3D
      {
         if(this.useCount >= this.maxCount)
         {
            return null;
         }
         var newParticle:AnimSprite = new AnimSprite(w,h,mv,this.animLoop);
         newParticle.x = pos.x;
         newParticle.y = pos.y;
         newParticle.z = pos.z;
         this.placeNewSprite(newParticle,true,spd);
         return newParticle;
      }
      
      private function placeNewSprite(sp:Sprite3D, animated:Boolean = false, spd:Vector3D = null) : void
      {
         ++this.useCount;
         sp.alpha = this.startAlpha;
         sp.rotation = Math.random() * Math.PI;
         this.coreInterface.sceneRoot.addChild(sp);
         for(var _i:uint = 0; _i < this.sprite.length; _i++)
         {
            if(this.sprite[_i] == null)
            {
               this.sprite[_i] = sp;
               this.speed[_i] = spd;
               if(animated)
               {
                  this.frameDelays[_i] = this.frameDelay;
               }
               return;
            }
         }
         this.sprite.push(sp);
         this.speed.push(spd);
         if(animated)
         {
            this.frameDelays.push(this.frameDelay);
         }
      }
      
      public function reset() : void
      {
         for(var _i:uint = 0; _i < this.sprite.length; _i++)
         {
            if(this.sprite[_i] != null)
            {
               this.sprite[_i].visible = false;
               this.sprite[_i].alpha = 0;
            }
         }
      }
      
      public function update(dt:Number) : void
      {
         for(var _i:uint = 0; _i < this.sprite.length; _i++)
         {
            if(this.sprite[_i] != null)
            {
               this.sprite[_i].width += dt * this.scaleFactor;
               this.sprite[_i].height += dt * this.scaleFactor;
               this.sprite[_i].alpha -= dt * this.alphaFactor;
               this.sprite[_i].rotation += this.rotateFactor * dt;
               if(this.speed[_i] != null)
               {
                  this.sprite[_i].x += this.speed[_i].x * dt;
                  this.sprite[_i].y += this.speed[_i].y * dt;
                  this.sprite[_i].z += this.speed[_i].z * dt;
                  this.speed[_i].x += this.gravity.x * dt;
                  this.speed[_i].y += this.gravity.y * dt;
                  this.speed[_i].z += this.gravity.z * dt;
               }
               else
               {
                  this.sprite[_i].x += this.gravity.x * dt;
                  this.sprite[_i].y += this.gravity.y * dt;
                  this.sprite[_i].z += this.gravity.z * dt;
               }
               if(this.frameDelay != -1)
               {
                  this.frameDelays[_i] -= dt;
                  if(this.frameDelays[_i] <= 0)
                  {
                     ++(this.sprite[_i] as AnimSprite).frame;
                     this.frameDelays[_i] += this.frameDelay;
                     if((this.sprite[_i] as AnimSprite).frame == (this.sprite[_i] as AnimSprite).materials.length)
                     {
                        (this.sprite[_i] as AnimSprite).frame = 0;
                        if(!this.animLoop)
                        {
                           this.sprite[_i].alpha = 0;
                        }
                     }
                  }
               }
               if(this.sprite[_i].alpha < 0.1)
               {
                  this.sprite[_i].visible = false;
                  this.coreInterface.sceneRoot.removeChild(this.sprite[_i]);
                  this.sprite[_i] = null;
                  --this.useCount;
               }
            }
         }
      }
   }
}

