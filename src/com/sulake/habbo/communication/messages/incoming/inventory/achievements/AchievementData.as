package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1201:int;
      
      private var var_314:String;
      
      private var var_1961:int;
      
      private var var_2395:int;
      
      private var var_1792:int;
      
      private var var_1963:int;
      
      private var var_1962:Boolean;
      
      private var _category:String;
      
      private var var_2682:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1201 = param1.readInteger();
         this.var_314 = param1.readString();
         this.var_1961 = Math.max(1,param1.readInteger());
         this.var_2395 = param1.readInteger();
         this.var_1792 = param1.readInteger();
         this.var_1963 = param1.readInteger();
         this.var_1962 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2682 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_314;
      }
      
      public function get level() : int
      {
         return this.var_1201;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1961;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2395;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1792;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1963;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1962;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2682;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1201 > 1 || this.var_1962;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1963 = this.var_1961;
      }
   }
}
