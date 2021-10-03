package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_823:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2646:int;
      
      private var var_2648:int;
      
      private var _color:uint;
      
      private var var_1220:int;
      
      private var var_2669:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_823);
         this.var_2646 = param1;
         this.var_2648 = param2;
         this._color = param3;
         this.var_1220 = param4;
         this.var_2669 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2646;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2648;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1220;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2669;
      }
   }
}
