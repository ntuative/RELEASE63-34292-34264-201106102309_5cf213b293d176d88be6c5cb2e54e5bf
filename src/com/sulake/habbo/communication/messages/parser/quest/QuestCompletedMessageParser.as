package com.sulake.habbo.communication.messages.parser.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestCompletedMessageParser implements IMessageParser
   {
       
      
      private var var_1338:QuestMessageData;
      
      public function QuestCompletedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(this.var_1338)
         {
            this.var_1338.dispose();
         }
         this.var_1338 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1338 = new QuestMessageData(param1);
         return true;
      }
      
      public function get questData() : QuestMessageData
      {
         return this.var_1338;
      }
   }
}
