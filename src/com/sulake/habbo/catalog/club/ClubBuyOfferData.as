package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1285:int;
      
      private var var_2025:String;
      
      private var var_1696:int;
      
      private var _upgrade:Boolean;
      
      private var var_2711:Boolean;
      
      private var var_2712:int;
      
      private var var_2710:int;
      
      private var var_365:ICatalogPage;
      
      private var var_2713:int;
      
      private var var_2708:int;
      
      private var var_2709:int;
      
      private var var_1578:String;
      
      private var var_2791:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this.var_1285 = param1;
         this.var_2025 = param2;
         this.var_1696 = param3;
         this._upgrade = param4;
         this.var_2711 = param5;
         this.var_2712 = param6;
         this.var_2710 = param7;
         this.var_2713 = param8;
         this.var_2708 = param9;
         this.var_2709 = param10;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_365 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get extraParameter() : String
      {
         return this.var_1578;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1578 = param1;
      }
      
      public function get offerId() : int
      {
         return this.var_1285;
      }
      
      public function get method_2() : String
      {
         return this.var_2025;
      }
      
      public function get price() : int
      {
         return this.var_1696;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2711;
      }
      
      public function get periods() : int
      {
         return this.var_2712;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2710;
      }
      
      public function get year() : int
      {
         return this.var_2713;
      }
      
      public function get month() : int
      {
         return this.var_2708;
      }
      
      public function get day() : int
      {
         return this.var_2709;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return ActivityPointTypeEnum.PIXEL;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1696;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_365;
      }
      
      public function get priceType() : String
      {
         return Offer.const_977;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_2025;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_365 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2791;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2791 = param1;
      }
   }
}
