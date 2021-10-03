package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_603:int = 0;
      
      public static const const_204:int = 1;
      
      public static const const_138:int = 2;
      
      public static const const_877:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1785:String;
      
      private var var_2280:int;
      
      private var var_1461:int;
      
      private var var_2272:int;
      
      private var var_2278:int;
      
      private var var_910:Array;
      
      private var var_2277:Array;
      
      private var var_2274:int;
      
      private var var_2273:Boolean;
      
      private var var_2275:Boolean;
      
      private var var_2276:Boolean;
      
      private var var_2279:Boolean;
      
      private var var_2282:int;
      
      private var var_2281:int;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2273;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2273 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2275;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2275 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2276;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2276 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2279;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2279 = param1;
      }
      
      public function get wallThickness() : int
      {
         return this.var_2282;
      }
      
      public function set wallThickness(param1:int) : void
      {
         this.var_2282 = param1;
      }
      
      public function get floorThickness() : int
      {
         return this.var_2281;
      }
      
      public function set floorThickness(param1:int) : void
      {
         this.var_2281 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1785;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1785 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2280;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2280 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1461;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1461 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2272;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2272 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2278;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2278 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_910;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_910 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2277;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2277 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2274;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2274 = param1;
      }
   }
}
