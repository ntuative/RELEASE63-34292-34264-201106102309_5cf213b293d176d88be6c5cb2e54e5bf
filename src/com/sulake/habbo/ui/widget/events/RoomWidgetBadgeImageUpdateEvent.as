package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_967:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2356:String;
      
      private var var_2355:BitmapData;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_967,param3,param4);
         this.var_2356 = param1;
         this.var_2355 = param2;
      }
      
      public function get badgeID() : String
      {
         return this.var_2356;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_2355;
      }
   }
}
