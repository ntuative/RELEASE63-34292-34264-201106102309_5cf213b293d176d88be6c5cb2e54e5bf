package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1770:String;
      
      private var var_1774:int;
      
      private var var_1775:int;
      
      private var var_2051:int;
      
      private var _id:int;
      
      private var var_1773:Boolean;
      
      private var _type:String;
      
      private var var_1771:String;
      
      private var var_1769:int;
      
      private var _localizationCode:String;
      
      private var var_2374:int;
      
      private var var_2373:int;
      
      private var var_1454:int;
      
      private var var_1772:Date;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         this.var_1772 = new Date();
         super();
         this.var_1770 = param1.readString();
         this.var_1774 = param1.readInteger();
         this.var_1775 = param1.readInteger();
         this.var_2051 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1773 = param1.readBoolean();
         this._type = param1.readString();
         this.var_1771 = param1.readString();
         this.var_1769 = param1.readInteger();
         this._localizationCode = param1.readString();
         this.var_2374 = param1.readInteger();
         this.var_2373 = param1.readInteger();
         this.var_1454 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_1771 = "";
         this.var_1769 = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_1770;
      }
      
      public function get localizationCode() : String
      {
         return this._localizationCode;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_1774;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_1775;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2051;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_1773;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_1771;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1769;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2374;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2373;
      }
      
      public function get waitPeriodSeconds() : int
      {
         return this.var_1454;
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1770;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this._localizationCode;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_1773 = param1;
      }
      
      public function get lastQuestInCampaign() : Boolean
      {
         return this.var_1774 >= this.var_1775;
      }
      
      public function get receiveTime() : Date
      {
         return this.var_1772;
      }
      
      public function set waitPeriodSeconds(param1:int) : void
      {
         this.var_1454 = param1;
      }
      
      public function getRemainingTimeInSecs() : int
      {
         var _loc1_:Date = new Date();
         var _loc2_:int = _loc1_.getTime() - this.var_1772.getTime();
         return int(Math.max(0,this.var_1454 - Math.round(_loc2_ / 1000)));
      }
   }
}
