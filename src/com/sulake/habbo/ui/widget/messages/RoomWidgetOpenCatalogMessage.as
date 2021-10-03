package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_450:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1302:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1354:String = "RWOCM_PIXELS";
      
      public static const const_1205:String = "RWOCM_CREDITS";
       
      
      private var var_2516:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_450);
         this.var_2516 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2516;
      }
   }
}
