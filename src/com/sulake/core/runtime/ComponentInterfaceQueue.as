package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_2028:IID;
      
      private var var_1123:Boolean;
      
      private var var_1301:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_2028 = param1;
         this.var_1301 = new Array();
         this.var_1123 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_2028;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1123;
      }
      
      public function get receivers() : Array
      {
         return this.var_1301;
      }
      
      public function dispose() : void
      {
         if(!this.var_1123)
         {
            this.var_1123 = true;
            this.var_2028 = null;
            while(this.var_1301.length > 0)
            {
               this.var_1301.pop();
            }
            this.var_1301 = null;
         }
      }
   }
}
