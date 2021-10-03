package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_262:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2611:int = 0;
      
      private var var_2612:int = 0;
      
      private var var_2613:int = 0;
      
      private var var_2614:Boolean = false;
      
      private var var_1814:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_262,param6,param7);
         this.var_2611 = param1;
         this.var_2612 = param2;
         this.var_2613 = param3;
         this.var_2614 = param4;
         this.var_1814 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2611;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2612;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2613;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2614;
      }
      
      public function get clubLevel() : int
      {
         return this.var_1814;
      }
   }
}
