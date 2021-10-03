package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2344:int;
      
      private var var_2341:int;
      
      private var var_2343:int;
      
      private var var_2342:String;
      
      private var var_1813:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2344 = param1.readInteger();
         this.var_2341 = param1.readInteger();
         this.var_2343 = param1.readInteger();
         this.var_2342 = param1.readString();
         this.var_1813 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2344;
      }
      
      public function get minute() : int
      {
         return this.var_2341;
      }
      
      public function get chatterId() : int
      {
         return this.var_2343;
      }
      
      public function get chatterName() : String
      {
         return this.var_2342;
      }
      
      public function get msg() : String
      {
         return this.var_1813;
      }
   }
}
