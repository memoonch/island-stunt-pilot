package jiglib.physics
{
   public class MaterialProperties
   {
      
      private var _restitution:Number;
      
      private var _friction:Number;
      
      public function MaterialProperties(_restitution:Number = 0.2, _friction:Number = 0.5)
      {
         super();
         this._restitution = _restitution;
         this._friction = _friction;
      }
      
      public function get restitution() : Number
      {
         return this._restitution;
      }
      
      public function set restitution(restitution:Number) : void
      {
         this._restitution = restitution;
      }
      
      public function get friction() : Number
      {
         return this._friction;
      }
      
      public function set friction(friction:Number) : void
      {
         this._friction = friction;
      }
   }
}

