package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetUserTagsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_182:String = "RWUTUE_USER_TAGS";
       
      
      private var _userId:int;
      
      private var var_910:Array;
      
      private var var_2471:Boolean;
      
      public function RoomWidgetUserTagsUpdateEvent(param1:int, param2:Array, param3:Boolean, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_182,param4,param5);
         this._userId = param1;
         this.var_910 = param2;
         this.var_2471 = param3;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get tags() : Array
      {
         return this.var_910;
      }
      
      public function get isOwnUser() : Boolean
      {
         return this.var_2471;
      }
   }
}
