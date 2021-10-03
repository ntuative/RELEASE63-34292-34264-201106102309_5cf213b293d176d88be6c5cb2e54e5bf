package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1285:int;
      
      private var var_2463:Boolean;
      
      private var var_2461:Boolean;
      
      private var var_2462:int;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1285 = param1.readInteger();
         this.var_2463 = param1.readBoolean();
         this.var_2462 = param1.readInteger();
         this.var_2461 = param1.readBoolean();
      }
      
      public function get offerId() : int
      {
         return this.var_1285;
      }
      
      public function get isVip() : Boolean
      {
         return this.var_2463;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2461;
      }
      
      public function get daysRequired() : int
      {
         return this.var_2462;
      }
   }
}
