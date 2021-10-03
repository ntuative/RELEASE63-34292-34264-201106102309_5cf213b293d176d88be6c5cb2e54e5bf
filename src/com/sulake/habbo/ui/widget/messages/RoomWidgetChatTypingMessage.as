package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_908:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_674:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_908);
         this.var_674 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_674;
      }
   }
}
