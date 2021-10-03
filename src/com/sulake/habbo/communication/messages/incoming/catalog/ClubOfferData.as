package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1285:int;
      
      private var var_2025:String;
      
      private var var_1696:int;
      
      private var _upgrade:Boolean;
      
      private var var_2711:Boolean;
      
      private var var_2712:int;
      
      private var var_2710:int;
      
      private var var_2713:int;
      
      private var var_2708:int;
      
      private var var_2709:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1285 = param1.readInteger();
         this.var_2025 = param1.readString();
         this.var_1696 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2711 = param1.readBoolean();
         this.var_2712 = param1.readInteger();
         this.var_2710 = param1.readInteger();
         this.var_2713 = param1.readInteger();
         this.var_2708 = param1.readInteger();
         this.var_2709 = param1.readInteger();
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
   }
}
