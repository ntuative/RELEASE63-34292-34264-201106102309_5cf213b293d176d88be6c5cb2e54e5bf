package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1426:IID;
      
      private var var_1723:String;
      
      private var var_119:IUnknown;
      
      private var var_749:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1426 = param1;
         this.var_1723 = getQualifiedClassName(this.var_1426);
         this.var_119 = param2;
         this.var_749 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1426;
      }
      
      public function get iis() : String
      {
         return this.var_1723;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_119;
      }
      
      public function get references() : uint
      {
         return this.var_749;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_119 == null;
      }
      
      public function dispose() : void
      {
         this.var_1426 = null;
         this.var_1723 = null;
         this.var_119 = null;
         this.var_749 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_749;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_749) : uint(0);
      }
   }
}
