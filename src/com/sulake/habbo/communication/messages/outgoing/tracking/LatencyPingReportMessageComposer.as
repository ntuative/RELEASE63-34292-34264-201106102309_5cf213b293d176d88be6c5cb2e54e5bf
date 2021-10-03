package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2448:int;
      
      private var var_2449:int;
      
      private var var_2447:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2448 = param1;
         this.var_2449 = param2;
         this.var_2447 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2448,this.var_2449,this.var_2447];
      }
      
      public function dispose() : void
      {
      }
   }
}
