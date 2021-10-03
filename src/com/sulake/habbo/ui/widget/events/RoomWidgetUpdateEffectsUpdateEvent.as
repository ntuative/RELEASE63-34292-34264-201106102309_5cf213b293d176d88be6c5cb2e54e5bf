package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_874:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_286:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_874,param2,param3);
         this.var_286 = param1;
      }
      
      public function get effects() : Array
      {
         return this.var_286;
      }
   }
}
