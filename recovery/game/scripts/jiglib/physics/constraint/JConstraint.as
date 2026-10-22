package jiglib.physics.constraint
{
   import jiglib.physics.PhysicsSystem;
   
   public class JConstraint
   {
      
      private var _satisfied:Boolean;
      
      private var _constraintEnabled:Boolean;
      
      public function JConstraint()
      {
         super();
         this._constraintEnabled = false;
         this.enableConstraint();
      }
      
      public function set satisfied(s:Boolean) : void
      {
         this._satisfied = s;
      }
      
      public function get satisfied() : Boolean
      {
         return this._satisfied;
      }
      
      public function preApply(dt:Number) : void
      {
         this._satisfied = false;
      }
      
      public function apply(dt:Number) : Boolean
      {
         return false;
      }
      
      public function enableConstraint() : void
      {
         if(this._constraintEnabled)
         {
            return;
         }
         this._constraintEnabled = true;
         PhysicsSystem.getInstance().addConstraint(this);
      }
      
      public function disableConstraint() : void
      {
         if(!this._constraintEnabled)
         {
            return;
         }
         this._constraintEnabled = false;
         PhysicsSystem.getInstance().removeConstraint(this);
      }
      
      public function get constraintEnabled() : Boolean
      {
         return this._constraintEnabled;
      }
   }
}

