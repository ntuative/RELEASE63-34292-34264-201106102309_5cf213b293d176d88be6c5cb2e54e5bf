package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1955:int = 0;
      
      private var var_1956:int = 0;
      
      private var var_2051:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1955;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1956;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2051;
      }
      
      public function flush() : Boolean
      {
         this.var_1955 = 0;
         this.var_1956 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1955 = param1.readInteger();
         this.var_1956 = param1.readInteger();
         this.var_2051 = param1.readInteger();
         return true;
      }
   }
}
