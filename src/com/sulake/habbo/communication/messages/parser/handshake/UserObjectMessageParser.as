package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      private var var_934:String;
      
      private var var_2444:String;
      
      private var var_1754:String;
      
      private var var_2442:int;
      
      private var var_2445:String;
      
      private var var_2443:int;
      
      private var var_2441:int;
      
      private var var_2376:int;
      
      private var var_1199:int;
      
      private var var_773:int;
      
      private var var_2433:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this._figure = param1.readString();
         this.var_934 = param1.readString();
         this.var_2444 = param1.readString();
         this.var_1754 = param1.readString();
         this.var_2442 = param1.readInteger();
         this.var_2445 = param1.readString();
         this.var_2443 = param1.readInteger();
         this.var_2441 = param1.readInteger();
         this.var_2376 = param1.readInteger();
         this.var_1199 = param1.readInteger();
         this.var_773 = param1.readInteger();
         this.var_2433 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get sex() : String
      {
         return this.var_934;
      }
      
      public function get customData() : String
      {
         return this.var_2444;
      }
      
      public function get realName() : String
      {
         return this.var_1754;
      }
      
      public function get tickets() : int
      {
         return this.var_2442;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2445;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2443;
      }
      
      public function get directMail() : int
      {
         return this.var_2441;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2376;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1199;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_773;
      }
      
      public function get identityId() : int
      {
         return this.var_2433;
      }
   }
}
