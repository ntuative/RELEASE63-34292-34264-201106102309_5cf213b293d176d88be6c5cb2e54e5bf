package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_854:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_2415:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_854);
         this.var_2415 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2415;
      }
   }
}
