package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2761:int;
      
      private var var_1497:String;
      
      private var _objId:int;
      
      private var var_2085:int;
      
      private var _category:int;
      
      private var var_2214:String;
      
      private var var_2906:Boolean;
      
      private var var_2904:Boolean;
      
      private var var_2905:Boolean;
      
      private var var_2252:Boolean;
      
      private var var_2328:int;
      
      private var var_1425:int;
      
      private var var_2001:String = "";
      
      private var var_1798:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2761 = param1;
         this.var_1497 = param2;
         this._objId = param3;
         this.var_2085 = param4;
         this._category = param5;
         this.var_2214 = param6;
         this.var_2906 = param7;
         this.var_2904 = param8;
         this.var_2905 = param9;
         this.var_2252 = param10;
         this.var_2328 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_2001 = param1;
         this.var_1425 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2761;
      }
      
      public function get itemType() : String
      {
         return this.var_1497;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_2085;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2214;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2906;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2904;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2905;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2252;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2328;
      }
      
      public function get slotId() : String
      {
         return this.var_2001;
      }
      
      public function get songId() : int
      {
         return this.var_1798;
      }
      
      public function get extra() : int
      {
         return this.var_1425;
      }
   }
}
