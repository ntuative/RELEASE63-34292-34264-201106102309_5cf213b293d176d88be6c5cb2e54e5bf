package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectVisibilityUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_606:String = "ROVUM_ENABLED";
      
      public static const const_643:String = "ROVUM_DISABLED";
       
      
      private var _type:String;
      
      public function RoomObjectVisibilityUpdateMessage(param1:String)
      {
         super(null,null);
         this._type = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}
