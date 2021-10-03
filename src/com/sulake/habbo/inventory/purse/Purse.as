package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1849:int = 0;
      
      private var var_1850:int = 0;
      
      private var var_2948:int = 0;
      
      private var var_2947:Boolean = false;
      
      private var var_2496:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1849 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1850 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2948 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2947 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2496 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1849;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1850;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2948;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2947;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2496;
      }
   }
}
