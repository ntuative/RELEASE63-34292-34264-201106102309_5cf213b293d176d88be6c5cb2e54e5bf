package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2243:int;
      
      private var var_2305:int;
      
      private var var_2306:int;
      
      private var _dayOffsets:Array;
      
      private var var_2003:Array;
      
      private var var_2002:Array;
      
      private var var_2304:int;
      
      private var var_2303:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2243;
      }
      
      public function get offerCount() : int
      {
         return this.var_2305;
      }
      
      public function get historyLength() : int
      {
         return this.var_2306;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_2003;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_2002;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2304;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2303;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2243 = param1.readInteger();
         this.var_2305 = param1.readInteger();
         this.var_2306 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_2003 = [];
         this.var_2002 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_2003.push(param1.readInteger());
            this.var_2002.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2303 = param1.readInteger();
         this.var_2304 = param1.readInteger();
         return true;
      }
   }
}
