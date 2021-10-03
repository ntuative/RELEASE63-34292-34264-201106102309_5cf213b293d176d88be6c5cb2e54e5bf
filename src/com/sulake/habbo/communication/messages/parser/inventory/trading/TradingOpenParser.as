package com.sulake.habbo.communication.messages.parser.inventory.trading
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TradingOpenParser implements IMessageParser
   {
       
      
      private var _userID:int;
      
      private var var_2077:Boolean;
      
      private var var_2078:int;
      
      private var var_2076:Boolean;
      
      public function TradingOpenParser()
      {
         super();
      }
      
      public function get userID() : int
      {
         return this._userID;
      }
      
      public function get userCanTrade() : Boolean
      {
         return this.var_2077;
      }
      
      public function get otherUserID() : int
      {
         return this.var_2078;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return this.var_2076;
      }
      
      public function flush() : Boolean
      {
         this._userID = -1;
         this.var_2077 = false;
         this.var_2078 = -1;
         this.var_2076 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._userID = param1.readInteger();
         this.var_2077 = param1.readInteger() == 1;
         this.var_2078 = param1.readInteger();
         this.var_2076 = param1.readInteger() == 1;
         return true;
      }
   }
}
