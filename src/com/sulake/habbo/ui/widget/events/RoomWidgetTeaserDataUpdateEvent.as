package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_534:String = "RWTDUE_TEASER_DATA";
      
      public static const const_955:String = "RWTDUE_GIFT_DATA";
      
      public static const const_884:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_231:int;
      
      private var _data:String;
      
      private var var_425:int;
      
      private var var_202:String;
      
      private var var_2704:String;
      
      private var var_2706:Boolean;
      
      private var var_1625:int = 0;
      
      private var var_2705:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_231;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_425;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2704;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2706;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2705;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1625;
      }
      
      public function set status(param1:int) : void
      {
         this.var_425 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2704 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2706 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2705 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_231 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_202;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_202 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1625 = param1;
      }
   }
}
