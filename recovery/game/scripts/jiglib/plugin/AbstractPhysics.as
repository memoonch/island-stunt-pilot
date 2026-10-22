package jiglib.plugin
{
   import flash.utils.getTimer;
   import jiglib.physics.PhysicsSystem;
   import jiglib.physics.RigidBody;
   
   public class AbstractPhysics
   {
      
      private var initTime:int;
      
      private var stepTime:int;
      
      private var speed:Number;
      
      private var deltaTime:Number = 0;
      
      private var physicsSystem:PhysicsSystem;
      
      public function AbstractPhysics(speed:Number = 5)
      {
         super();
         this.speed = speed;
         this.initTime = getTimer();
         this.physicsSystem = PhysicsSystem.getInstance();
      }
      
      public function addBody(body:RigidBody) : void
      {
         this.physicsSystem.addBody(body as RigidBody);
      }
      
      public function removeBody(body:RigidBody) : void
      {
         this.physicsSystem.removeBody(body as RigidBody);
      }
      
      public function get engine() : PhysicsSystem
      {
         return this.physicsSystem;
      }
      
      public function afterPause() : void
      {
         this.initTime = getTimer();
      }
      
      public function step() : void
      {
         this.stepTime = getTimer();
         this.deltaTime = (this.stepTime - this.initTime) / 1000 * this.speed;
         this.initTime = this.stepTime;
         this.physicsSystem.integrate(this.deltaTime);
      }
   }
}

