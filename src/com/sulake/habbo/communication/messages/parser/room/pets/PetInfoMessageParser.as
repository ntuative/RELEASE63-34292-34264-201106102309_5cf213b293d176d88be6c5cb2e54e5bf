package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1881:int;
      
      private var _name:String;
      
      private var var_1201:int;
      
      private var var_2558:int;
      
      private var var_2521:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var _figure:String;
      
      private var var_2561:int;
      
      private var var_2560:int;
      
      private var var_2557:int;
      
      private var var_2559:int;
      
      private var var_2308:int;
      
      private var _ownerName:String;
      
      private var var_512:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1881;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1201;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2558;
      }
      
      public function get experience() : int
      {
         return this.var_2521;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2561;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2560;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2557;
      }
      
      public function get respect() : int
      {
         return this.var_2559;
      }
      
      public function get ownerId() : int
      {
         return this.var_2308;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_512;
      }
      
      public function flush() : Boolean
      {
         this.var_1881 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1881 = param1.readInteger();
         this._name = param1.readString();
         this.var_1201 = param1.readInteger();
         this.var_2558 = param1.readInteger();
         this.var_2521 = param1.readInteger();
         this.var_2561 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2560 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2557 = param1.readInteger();
         this._figure = param1.readString();
         this.var_2559 = param1.readInteger();
         this.var_2308 = param1.readInteger();
         this.var_512 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
