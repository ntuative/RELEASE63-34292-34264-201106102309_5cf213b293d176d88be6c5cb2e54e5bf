package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1201:int;
      
      private var var_2060:int;
      
      private var var_2395:int;
      
      private var var_1792:int;
      
      private var var_1465:int;
      
      private var var_314:int;
      
      private var var_2780:String = "";
      
      private var var_2779:String = "";
      
      private var var_2778:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1201 = param1.readInteger();
         this.var_314 = param1.readInteger();
         this.var_2780 = param1.readString();
         this.var_2060 = param1.readInteger();
         this.var_2395 = param1.readInteger();
         this.var_1792 = param1.readInteger();
         this.var_1465 = param1.readInteger();
         this.var_2778 = param1.readInteger();
         this.var_2779 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1201;
      }
      
      public function get points() : int
      {
         return this.var_2060;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2395;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1792;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1465;
      }
      
      public function get badgeId() : int
      {
         return this.var_314;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2780;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2779;
      }
      
      public function get achievementID() : int
      {
         return this.var_2778;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
