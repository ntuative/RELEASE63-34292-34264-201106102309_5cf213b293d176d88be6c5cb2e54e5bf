package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1584:Boolean;
      
      private var var_2234:int;
      
      private var var_1695:int;
      
      private var var_1694:int;
      
      private var var_2237:int;
      
      private var var_2239:int;
      
      private var var_2235:int;
      
      private var var_2240:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1584;
      }
      
      public function get commission() : int
      {
         return this.var_2234;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1695;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1694;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2239;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2237;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2235;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2240;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1584 = param1.readBoolean();
         this.var_2234 = param1.readInteger();
         this.var_1695 = param1.readInteger();
         this.var_1694 = param1.readInteger();
         this.var_2239 = param1.readInteger();
         this.var_2237 = param1.readInteger();
         this.var_2235 = param1.readInteger();
         this.var_2240 = param1.readInteger();
         return true;
      }
   }
}
