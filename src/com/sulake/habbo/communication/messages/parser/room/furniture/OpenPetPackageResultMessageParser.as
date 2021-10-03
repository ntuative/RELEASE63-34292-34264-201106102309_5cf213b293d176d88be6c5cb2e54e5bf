package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_231:int = 0;
      
      private var var_1861:int = 0;
      
      private var var_1839:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_231;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1861;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1839;
      }
      
      public function flush() : Boolean
      {
         this.var_231 = 0;
         this.var_1861 = 0;
         this.var_1839 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_231 = param1.readInteger();
         this.var_1861 = param1.readInteger();
         this.var_1839 = param1.readString();
         return true;
      }
   }
}
