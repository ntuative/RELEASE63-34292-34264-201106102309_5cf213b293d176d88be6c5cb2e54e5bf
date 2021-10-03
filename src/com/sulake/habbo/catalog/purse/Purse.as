package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_2117:int = 0;
      
      private var var_1492:Dictionary;
      
      private var var_1849:int = 0;
      
      private var var_1850:int = 0;
      
      private var var_2496:Boolean = false;
      
      private var var_2495:int = 0;
      
      private var var_2494:int = 0;
      
      public function Purse()
      {
         this.var_1492 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2117;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2117 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1849;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1849 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1850;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1850 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1849 > 0 || this.var_1850 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2496;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2496 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2495;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2495 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2494;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2494 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1492;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1492 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1492[param1];
      }
   }
}
