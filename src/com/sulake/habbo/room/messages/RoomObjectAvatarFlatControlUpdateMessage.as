package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFlatControlUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2784:Boolean = false;
      
      private var var_2785:String;
      
      public function RoomObjectAvatarFlatControlUpdateMessage(param1:String)
      {
         super();
         this.var_2785 = param1;
         if(param1 != null && param1.indexOf("useradmin") != -1)
         {
            this.var_2784 = true;
         }
      }
      
      public function get isAdmin() : Boolean
      {
         return this.var_2784;
      }
      
      public function get rawData() : String
      {
         return this.var_2785;
      }
   }
}
