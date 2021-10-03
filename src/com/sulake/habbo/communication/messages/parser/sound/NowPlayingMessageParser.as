package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1784:int;
      
      private var _currentPosition:int;
      
      private var var_1782:int;
      
      private var var_1783:int;
      
      private var var_1781:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1784;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1782;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1783;
      }
      
      public function get syncCount() : int
      {
         return this.var_1781;
      }
      
      public function flush() : Boolean
      {
         this.var_1784 = -1;
         this._currentPosition = -1;
         this.var_1782 = -1;
         this.var_1783 = -1;
         this.var_1781 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1784 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1782 = param1.readInteger();
         this.var_1783 = param1.readInteger();
         this.var_1781 = param1.readInteger();
         return true;
      }
   }
}
