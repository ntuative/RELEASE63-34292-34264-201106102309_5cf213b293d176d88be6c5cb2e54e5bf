package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1881:int;
      
      private var var_1201:int;
      
      private var var_2523:int;
      
      private var var_2521:int;
      
      private var var_2526:int;
      
      private var _energy:int;
      
      private var var_2525:int;
      
      private var _nutrition:int;
      
      private var var_2524:int;
      
      private var var_2308:int;
      
      private var _ownerName:String;
      
      private var var_2559:int;
      
      private var var_512:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1881;
      }
      
      public function get level() : int
      {
         return this.var_1201;
      }
      
      public function get levelMax() : int
      {
         return this.var_2523;
      }
      
      public function get experience() : int
      {
         return this.var_2521;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2526;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2525;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2524;
      }
      
      public function get ownerId() : int
      {
         return this.var_2308;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2559;
      }
      
      public function get age() : int
      {
         return this.var_512;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1881 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1201 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2523 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2521 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2526 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2525 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2524 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2308 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2559 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_512 = param1;
      }
   }
}
