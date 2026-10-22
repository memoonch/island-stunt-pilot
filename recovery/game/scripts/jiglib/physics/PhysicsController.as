package jiglib.physics
{
   public class PhysicsController
   {
      
      private var _controllerEnabled:Boolean;
      
      public function PhysicsController()
      {
         super();
         this._controllerEnabled = false;
      }
      
      public function updateController(dt:Number) : void
      {
      }
      
      public function enableController() : void
      {
         if(this._controllerEnabled)
         {
            return;
         }
         this._controllerEnabled = true;
         PhysicsSystem.getInstance().addController(this);
      }
      
      public function disableController() : void
      {
         if(!this._controllerEnabled)
         {
            return;
         }
         this._controllerEnabled = false;
         PhysicsSystem.getInstance().removeController(this);
      }
      
      public function get controllerEnabled() : Boolean
      {
         return this._controllerEnabled;
      }
   }
}

