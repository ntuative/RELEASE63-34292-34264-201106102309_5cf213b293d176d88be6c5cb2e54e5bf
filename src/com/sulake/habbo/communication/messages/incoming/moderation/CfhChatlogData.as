package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2126:int;
      
      private var var_2941:int;
      
      private var var_1516:int;
      
      private var var_2770:int;
      
      private var var_130:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2126 = param1.readInteger();
         this.var_2941 = param1.readInteger();
         this.var_1516 = param1.readInteger();
         this.var_2770 = param1.readInteger();
         this.var_130 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_2126);
      }
      
      public function get callId() : int
      {
         return this.var_2126;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2941;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1516;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2770;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_130;
      }
   }
}
