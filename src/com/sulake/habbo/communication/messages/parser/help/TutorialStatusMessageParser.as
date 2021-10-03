package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1259:Boolean;
      
      private var var_1258:Boolean;
      
      private var var_1535:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1259;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1258;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1535;
      }
      
      public function flush() : Boolean
      {
         this.var_1259 = false;
         this.var_1258 = false;
         this.var_1535 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1259 = param1.readBoolean();
         this.var_1258 = param1.readBoolean();
         this.var_1535 = param1.readBoolean();
         return true;
      }
   }
}
