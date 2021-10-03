package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_110:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_156:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_824:int = 2;
      
      public static const const_836:int = 3;
      
      public static const const_1816:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1755:String = "";
      
      private var var_2313:int;
      
      private var var_2363:int = 0;
      
      private var var_2361:int = 0;
      
      private var _figure:String = "";
      
      private var var_47:BitmapData = null;
      
      private var var_254:Array;
      
      private var var_1458:int = 0;
      
      private var var_2506:String = "";
      
      private var var_2504:int = 0;
      
      private var var_2505:int = 0;
      
      private var var_1879:Boolean = false;
      
      private var var_1754:String = "";
      
      private var var_2217:Boolean = false;
      
      private var var_2828:Boolean = false;
      
      private var var_2829:Boolean = true;
      
      private var var_1199:int = 0;
      
      private var var_2827:Boolean = false;
      
      private var var_2834:Boolean = false;
      
      private var var_2826:Boolean = false;
      
      private var var_2832:Boolean = false;
      
      private var var_2833:Boolean = false;
      
      private var var_2831:Boolean = false;
      
      private var var_2830:int = 0;
      
      private var var_1877:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_254 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1755 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1755;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2313 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2313;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2363 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2363;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2361 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2361;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_47 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_47;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_254 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_254;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1458 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1458;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2506 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2506;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2828 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2828;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1199 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1199;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2827 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2827;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2834 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2834;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2826 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2826;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2832 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2832;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2833 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2833;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2831 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2831;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2830 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2830;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2829 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2829;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1877 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1877;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2504 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2504;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2505 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2505;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1879 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1879;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1754 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1754;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         this.var_2217 = param1;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2217;
      }
   }
}
