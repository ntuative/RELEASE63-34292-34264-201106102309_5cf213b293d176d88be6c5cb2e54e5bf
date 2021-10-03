package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1873:String = "pricing_model_unknown";
      
      public static const const_439:String = "pricing_model_single";
      
      public static const const_413:String = "pricing_model_multi";
      
      public static const const_509:String = "pricing_model_bundle";
      
      public static const const_1754:String = "price_type_none";
      
      public static const const_977:String = "price_type_credits";
      
      public static const const_1266:String = "price_type_activitypoints";
      
      public static const const_1220:String = "price_type_credits_and_activitypoints";
       
      
      private var var_867:String;
      
      private var var_1311:String;
      
      private var var_1285:int;
      
      private var var_2050:String;
      
      private var var_1313:int;
      
      private var var_1312:int;
      
      private var var_2051:int;
      
      private var var_365:ICatalogPage;
      
      private var var_703:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_1814:int = 0;
      
      private var var_2822:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1285 = param1;
         this.var_2050 = param2;
         this.var_1313 = param3;
         this.var_1312 = param4;
         this.var_2051 = param5;
         this.var_365 = param8;
         this.var_1814 = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this.var_1814;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_365;
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
      
      public function get activityPointType() : int
      {
         return this.var_2051;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_703;
      }
      
      public function get pricingModel() : String
      {
         return this.var_867;
      }
      
      public function get priceType() : String
      {
         return this.var_1311;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2822;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2822 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1285 = 0;
         this.var_2050 = "";
         this.var_1313 = 0;
         this.var_1312 = 0;
         this.var_2051 = 0;
         this.var_365 = null;
         if(this.var_703 != null)
         {
            this.var_703.dispose();
            this.var_703 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_867)
         {
            case const_439:
               this.var_703 = new SingleProductContainer(this,param1);
               break;
            case const_413:
               this.var_703 = new MultiProductContainer(this,param1);
               break;
            case const_509:
               this.var_703 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_867);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_867 = const_439;
            }
            else
            {
               this.var_867 = const_413;
            }
         }
         else if(param1.length > 1)
         {
            this.var_867 = const_509;
         }
         else
         {
            this.var_867 = const_1873;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1313 > 0 && this.var_1312 > 0)
         {
            this.var_1311 = const_1220;
         }
         else if(this.var_1313 > 0)
         {
            this.var_1311 = const_977;
         }
         else if(this.var_1312 > 0)
         {
            this.var_1311 = const_1266;
         }
         else
         {
            this.var_1311 = const_1754;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_365.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_703.products)
         {
            _loc4_ = this.var_365.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
