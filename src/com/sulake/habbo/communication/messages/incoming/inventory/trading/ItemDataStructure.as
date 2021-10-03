package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2357:int;
      
      private var var_1497:String;
      
      private var var_2689:int;
      
      private var var_2685:int;
      
      private var _category:int;
      
      private var var_2214:String;
      
      private var var_1425:int;
      
      private var var_2687:int;
      
      private var var_2691:int;
      
      private var var_2688:int;
      
      private var var_2690:int;
      
      private var var_2686:Boolean;
      
      private var var_3056:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2357 = param1;
         this.var_1497 = param2;
         this.var_2689 = param3;
         this.var_2685 = param4;
         this._category = param5;
         this.var_2214 = param6;
         this.var_1425 = param7;
         this.var_2687 = param8;
         this.var_2691 = param9;
         this.var_2688 = param10;
         this.var_2690 = param11;
         this.var_2686 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2357;
      }
      
      public function get itemType() : String
      {
         return this.var_1497;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2689;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2685;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2214;
      }
      
      public function get extra() : int
      {
         return this.var_1425;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2687;
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
      
      public function get groupable() : Boolean
      {
         return this.var_2686;
      }
      
      public function get songID() : int
      {
         return this.var_1425;
      }
   }
}
