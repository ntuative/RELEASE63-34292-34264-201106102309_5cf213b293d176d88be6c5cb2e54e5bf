package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_848:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1871:String = "inventory_effects";
      
      public static const const_1290:String = "inventory_badges";
      
      public static const const_1801:String = "inventory_clothes";
      
      public static const const_1856:String = "inventory_furniture";
       
      
      private var var_2508:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_848);
         this.var_2508 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2508;
      }
   }
}
