package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_178:Number = 0;
      
      private var var_179:Number = 0;
      
      private var var_2937:Number = 0;
      
      private var var_2935:Number = 0;
      
      private var var_2936:Number = 0;
      
      private var var_2939:Number = 0;
      
      private var var_490:int = 0;
      
      private var var_2372:int = 0;
      
      private var var_351:Array;
      
      private var var_2938:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_351 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_178 = param3;
         this.var_179 = param4;
         this.var_2937 = param5;
         this.var_490 = param6;
         this.var_2372 = param7;
         this.var_2935 = param8;
         this.var_2936 = param9;
         this.var_2939 = param10;
         this.var_2938 = param11;
         this.var_351 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_178;
      }
      
      public function get z() : Number
      {
         return this.var_179;
      }
      
      public function get localZ() : Number
      {
         return this.var_2937;
      }
      
      public function get targetX() : Number
      {
         return this.var_2935;
      }
      
      public function get targetY() : Number
      {
         return this.var_2936;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2939;
      }
      
      public function get dir() : int
      {
         return this.var_490;
      }
      
      public function get dirHead() : int
      {
         return this.var_2372;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2938;
      }
      
      public function get actions() : Array
      {
         return this.var_351.slice();
      }
   }
}
