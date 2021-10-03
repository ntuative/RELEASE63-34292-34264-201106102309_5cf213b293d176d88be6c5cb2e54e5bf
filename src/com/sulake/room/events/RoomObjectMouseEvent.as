package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_143:String = "ROE_MOUSE_CLICK";
      
      public static const const_176:String = "ROE_MOUSE_ENTER";
      
      public static const const_537:String = "ROE_MOUSE_MOVE";
      
      public static const const_185:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2116:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_501:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1831:String = "";
      
      private var var_2582:Boolean;
      
      private var var_2583:Boolean;
      
      private var var_2587:Boolean;
      
      private var var_2586:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1831 = param2;
         this.var_2582 = param5;
         this.var_2583 = param6;
         this.var_2587 = param7;
         this.var_2586 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1831;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2582;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2583;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2587;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2586;
      }
   }
}
