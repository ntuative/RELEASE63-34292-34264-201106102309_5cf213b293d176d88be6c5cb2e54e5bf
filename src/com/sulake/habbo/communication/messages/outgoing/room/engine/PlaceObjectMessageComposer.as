package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_231:int;
      
      private var var_2228:int;
      
      private var var_1929:String;
      
      private var _x:int = 0;
      
      private var var_178:int = 0;
      
      private var var_490:int = 0;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         this.var_231 = param1;
         this.var_2228 = param2;
         this.var_1929 = param3;
         this._x = param4;
         this.var_178 = param5;
         this.var_490 = param6;
         this._roomId = param7;
         this._roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(this.var_2228)
         {
            case RoomObjectCategoryEnum.const_27:
               return [this.var_231 + " " + this._x + " " + this.var_178 + " " + this.var_490];
            case RoomObjectCategoryEnum.const_26:
               return [this.var_231 + " " + this.var_1929];
            default:
               return [];
         }
      }
   }
}
