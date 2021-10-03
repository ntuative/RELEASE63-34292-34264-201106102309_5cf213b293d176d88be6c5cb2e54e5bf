package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1234:String = "M";
      
      public static const const_1806:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_178:Number = 0;
      
      private var var_179:Number = 0;
      
      private var var_490:int = 0;
      
      private var _name:String = "";
      
      private var var_1680:int = 0;
      
      private var var_934:String = "";
      
      private var _figure:String = "";
      
      private var var_2365:String = "";
      
      private var var_2313:int;
      
      private var var_2363:int = 0;
      
      private var var_2366:String = "";
      
      private var var_2362:int = 0;
      
      private var var_2361:int = 0;
      
      private var var_2364:String = "";
      
      private var var_190:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_190 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_190)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_178;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_190)
         {
            this.var_178 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_179;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_190)
         {
            this.var_179 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_490;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_490 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_190)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1680;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_1680 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_934;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_190)
         {
            this.var_934 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_190)
         {
            this._figure = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2365;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_190)
         {
            this.var_2365 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2313;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_2313 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2363;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_2363 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2366;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_190)
         {
            this.var_2366 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2362;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_2362 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2361;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_2361 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2364;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_190)
         {
            this.var_2364 = param1;
         }
      }
   }
}
