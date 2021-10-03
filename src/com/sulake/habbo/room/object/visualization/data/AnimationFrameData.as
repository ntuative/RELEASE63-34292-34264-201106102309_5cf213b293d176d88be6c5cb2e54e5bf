package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrameData
   {
       
      
      private var _id:int = 0;
      
      private var _x:int = 0;
      
      private var var_178:int = 0;
      
      private var var_2787:int = 0;
      
      private var var_2786:int = 0;
      
      private var var_2591:int = 1;
      
      public function AnimationFrameData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_178 = param3;
         this.var_2787 = param4;
         this.var_2786 = param5;
         this.var_2591 = param6;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function hasDirectionalOffsets() : Boolean
      {
         return false;
      }
      
      public function getX(param1:int) : int
      {
         return this._x;
      }
      
      public function getY(param1:int) : int
      {
         return this.var_178;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this._x;
      }
      
      public function get randomX() : int
      {
         return this.var_2787;
      }
      
      public function get randomY() : int
      {
         return this.var_2786;
      }
      
      public function get repeats() : int
      {
         return this.var_2591;
      }
   }
}
