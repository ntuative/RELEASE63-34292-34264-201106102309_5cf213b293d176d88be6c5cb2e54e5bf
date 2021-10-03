package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1278:int;
      
      private var var_2589:String;
      
      private var var_2588:int;
      
      private var var_2476:String;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1278 = param1.readInteger();
         this.var_2589 = param1.readString();
         this.var_2476 = param1.readString();
         this.var_2588 = this.var_1278;
      }
      
      public function get requestId() : int
      {
         return this.var_1278;
      }
      
      public function get requesterName() : String
      {
         return this.var_2589;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2588;
      }
      
      public function get figureString() : String
      {
         return this.var_2476;
      }
   }
}
