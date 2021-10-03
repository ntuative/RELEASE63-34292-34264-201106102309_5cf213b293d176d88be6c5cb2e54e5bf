package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2883:String;
      
      private var var_2091:String;
      
      private var var_2884:String;
      
      private var var_2092:Boolean;
      
      private var var_2090:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2883 = String(param1["set-type"]);
         this.var_2091 = String(param1["flipped-set-type"]);
         this.var_2884 = String(param1["remove-set-type"]);
         this.var_2092 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_2090 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_2090;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_2090 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2883;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_2091;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2884;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_2092;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_2092 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_2091 = param1;
      }
   }
}
