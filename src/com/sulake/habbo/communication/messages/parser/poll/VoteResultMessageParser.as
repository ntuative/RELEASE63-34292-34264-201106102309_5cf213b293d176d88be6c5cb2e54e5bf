package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1194:String;
      
      private var var_1600:Array;
      
      private var var_1241:Array;
      
      private var var_2031:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1194;
      }
      
      public function get choices() : Array
      {
         return this.var_1600.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1241.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2031;
      }
      
      public function flush() : Boolean
      {
         this.var_1194 = "";
         this.var_1600 = [];
         this.var_1241 = [];
         this.var_2031 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1194 = param1.readString();
         this.var_1600 = [];
         this.var_1241 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1600.push(param1.readString());
            this.var_1241.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2031 = param1.readInteger();
         return true;
      }
   }
}
