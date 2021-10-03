package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2331:int = 0;
      
      private var var_1620:String = "";
      
      private var var_2074:String = "";
      
      private var var_2576:String = "";
      
      private var var_2578:String = "";
      
      private var var_1889:int = 0;
      
      private var var_2575:int = 0;
      
      private var var_2574:int = 0;
      
      private var var_1619:int = 0;
      
      private var var_2577:int = 0;
      
      private var var_1617:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2331 = param1;
         this.var_1620 = param2;
         this.var_2074 = param3;
         this.var_2576 = param4;
         this.var_2578 = param5;
         if(param6)
         {
            this.var_1889 = 1;
         }
         else
         {
            this.var_1889 = 0;
         }
         this.var_2575 = param7;
         this.var_2574 = param8;
         this.var_1619 = param9;
         this.var_2577 = param10;
         this.var_1617 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2331,this.var_1620,this.var_2074,this.var_2576,this.var_2578,this.var_1889,this.var_2575,this.var_2574,this.var_1619,this.var_2577,this.var_1617];
      }
   }
}
