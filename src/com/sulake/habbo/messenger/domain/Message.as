package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_929:int = 1;
      
      public static const const_928:int = 2;
      
      public static const const_727:int = 3;
      
      public static const const_1169:int = 4;
      
      public static const const_883:int = 5;
      
      public static const const_1309:int = 6;
       
      
      private var _type:int;
      
      private var var_1260:int;
      
      private var var_2230:String;
      
      private var var_2231:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1260 = param2;
         this.var_2230 = param3;
         this.var_2231 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2230;
      }
      
      public function get time() : String
      {
         return this.var_2231;
      }
      
      public function get senderId() : int
      {
         return this.var_1260;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
