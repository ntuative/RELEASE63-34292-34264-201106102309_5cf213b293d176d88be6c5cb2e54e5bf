package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1285:int;
      
      private var var_2050:String;
      
      private var var_1313:int;
      
      private var var_1312:int;
      
      private var var_2051:int;
      
      private var var_1814:int;
      
      private var var_1138:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1285 = param1.readInteger();
         this.var_2050 = param1.readString();
         this.var_1313 = param1.readInteger();
         this.var_1312 = param1.readInteger();
         this.var_2051 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1138 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1138.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
         this.var_1814 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1285;
      }
      
      public function get localizationId() : String
      {
         return this.var_2050;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1313;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1312;
      }
      
      public function get products() : Array
      {
         return this.var_1138;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2051;
      }
      
      public function get clubLevel() : int
      {
         return this.var_1814;
      }
   }
}
