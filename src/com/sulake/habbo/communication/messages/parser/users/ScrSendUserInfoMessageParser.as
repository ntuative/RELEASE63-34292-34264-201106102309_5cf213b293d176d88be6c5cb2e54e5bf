package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2152:int = 1;
      
      public static const const_1683:int = 2;
       
      
      private var var_1111:String;
      
      private var var_2755:int;
      
      private var var_2754:int;
      
      private var var_2756:int;
      
      private var var_2751:int;
      
      private var var_2752:Boolean;
      
      private var var_2496:Boolean;
      
      private var var_2495:int;
      
      private var var_2494:int;
      
      private var var_2757:Boolean;
      
      private var var_2750:int;
      
      private var var_2753:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1111 = param1.readString();
         this.var_2755 = param1.readInteger();
         this.var_2754 = param1.readInteger();
         this.var_2756 = param1.readInteger();
         this.var_2751 = param1.readInteger();
         this.var_2752 = param1.readBoolean();
         this.var_2496 = param1.readBoolean();
         this.var_2495 = param1.readInteger();
         this.var_2494 = param1.readInteger();
         this.var_2757 = param1.readBoolean();
         this.var_2750 = param1.readInteger();
         this.var_2753 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_1111;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2755;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2754;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2756;
      }
      
      public function get responseType() : int
      {
         return this.var_2751;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2752;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2496;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2495;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2494;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2757;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2750;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2753;
      }
   }
}
