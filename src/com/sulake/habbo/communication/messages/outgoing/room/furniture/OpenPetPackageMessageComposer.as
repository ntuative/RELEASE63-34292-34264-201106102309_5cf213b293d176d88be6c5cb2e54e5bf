package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_231:int;
      
      private var var_2387:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_231 = param1;
         this.var_2387 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_231,this.var_2387];
      }
      
      public function dispose() : void
      {
      }
   }
}
