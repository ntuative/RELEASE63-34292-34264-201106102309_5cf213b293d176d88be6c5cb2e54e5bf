package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2170:int = 1;
      
      public static const const_2226:int = 2;
      
      public static const const_2255:int = 3;
      
      public static const const_2125:int = 4;
      
      public static const const_1898:int = 5;
      
      public static const const_2220:int = 6;
      
      public static const const_1947:int = 7;
      
      public static const const_1958:int = 8;
      
      public static const const_2091:int = 9;
      
      public static const const_1976:int = 10;
      
      public static const const_1792:int = 11;
      
      public static const const_1878:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1707:int;
      
      private var var_724:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1707 = param1.readInteger();
         this.var_724 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1707;
      }
      
      public function get info() : String
      {
         return this.var_724;
      }
   }
}
