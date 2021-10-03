package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_65:String = "i";
      
      public static const const_70:String = "s";
      
      public static const const_195:String = "e";
       
      
      private var var_1621:String;
      
      private var var_2571:int;
      
      private var var_1081:String;
      
      private var var_1622:int;
      
      private var var_2089:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1621 = param1.readString();
         this.var_2571 = param1.readInteger();
         this.var_1081 = param1.readString();
         this.var_1622 = param1.readInteger();
         this.var_2089 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1621;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2571;
      }
      
      public function get extraParam() : String
      {
         return this.var_1081;
      }
      
      public function get productCount() : int
      {
         return this.var_1622;
      }
      
      public function get expiration() : int
      {
         return this.var_2089;
      }
   }
}
