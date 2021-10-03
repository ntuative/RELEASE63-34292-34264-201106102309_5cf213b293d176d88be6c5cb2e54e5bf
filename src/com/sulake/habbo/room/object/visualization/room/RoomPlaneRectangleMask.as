package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2474:Number = 0.0;
      
      private var var_2473:Number = 0.0;
      
      private var var_2953:Number = 0.0;
      
      private var var_2952:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2474 = param1;
         this.var_2473 = param2;
         this.var_2953 = param3;
         this.var_2952 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2474;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2473;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2953;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2952;
      }
   }
}
