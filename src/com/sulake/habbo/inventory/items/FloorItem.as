package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2214:String;
      
      protected var var_1425:Number;
      
      protected var var_2996:Boolean;
      
      protected var var_2997:Boolean;
      
      protected var var_2686:Boolean;
      
      protected var var_2908:Boolean;
      
      protected var var_3001:int;
      
      protected var var_2691:int;
      
      protected var var_2688:int;
      
      protected var var_2690:int;
      
      protected var var_2001:String;
      
      protected var var_1798:int;
      
      protected var var_1011:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2686 = param5;
         this.var_2997 = param6;
         this.var_2996 = param7;
         this.var_2908 = param8;
         this.var_2214 = param9;
         this.var_1425 = param10;
         this.var_3001 = param11;
         this.var_2691 = param12;
         this.var_2688 = param13;
         this.var_2690 = param14;
         this.var_2001 = param15;
         this.var_1798 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2214;
      }
      
      public function get extra() : Number
      {
         return this.var_1425;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2996;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2997;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2686;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2908;
      }
      
      public function get expires() : int
      {
         return this.var_3001;
      }
      
      public function get creationDay() : int
      {
         return this.var_2691;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2688;
      }
      
      public function get creationYear() : int
      {
         return this.var_2690;
      }
      
      public function get slotId() : String
      {
         return this.var_2001;
      }
      
      public function get songId() : int
      {
         return this.var_1798;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_1011 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_1011;
      }
   }
}
