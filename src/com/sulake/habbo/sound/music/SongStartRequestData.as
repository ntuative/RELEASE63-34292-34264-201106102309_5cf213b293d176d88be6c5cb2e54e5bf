package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1798:int;
      
      private var var_2143:Number;
      
      private var var_2964:Number;
      
      private var var_2961:int;
      
      private var var_2963:Number;
      
      private var var_2962:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1798 = param1;
         this.var_2143 = param2;
         this.var_2964 = param3;
         this.var_2963 = param4;
         this.var_2962 = param5;
         this.var_2961 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1798;
      }
      
      public function get startPos() : Number
      {
         if(this.var_2143 < 0)
         {
            return 0;
         }
         return this.var_2143 + (getTimer() - this.var_2961) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2964;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2963;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2962;
      }
   }
}
