package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2498:int;
      
      private var var_2497:int;
      
      private var var_1313:int;
      
      private var var_1312:int;
      
      private var var_2051:int;
      
      private var var_2499:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2498 = param1.readInteger();
         this.var_2497 = param1.readInteger();
         this.var_1313 = param1.readInteger();
         this.var_1312 = param1.readInteger();
         this.var_2051 = param1.readInteger();
         this.var_2499 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2498;
      }
      
      public function get charges() : int
      {
         return this.var_2497;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1313;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1312;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2499;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2051;
      }
   }
}
