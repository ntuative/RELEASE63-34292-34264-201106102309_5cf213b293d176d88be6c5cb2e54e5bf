package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_792:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         this.var_792 = new ByteArray();
         this.var_792.writeShort(param1);
         this.var_792.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         this.var_792.position = 0;
         if(this.var_792.bytesAvailable)
         {
            _loc1_ = this.var_792.readShort();
            this.var_792.position = 0;
         }
         return _loc1_;
      }
   }
}
