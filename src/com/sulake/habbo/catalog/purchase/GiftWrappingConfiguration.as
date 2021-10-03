package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1584:Boolean = false;
      
      private var var_1696:int;
      
      private var var_1915:Array;
      
      private var var_841:Array;
      
      private var var_842:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1584 = _loc2_.isWrappingEnabled;
         this.var_1696 = _loc2_.wrappingPrice;
         this.var_1915 = _loc2_.stuffTypes;
         this.var_841 = _loc2_.boxTypes;
         this.var_842 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1584;
      }
      
      public function get price() : int
      {
         return this.var_1696;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1915;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_841;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_842;
      }
   }
}
