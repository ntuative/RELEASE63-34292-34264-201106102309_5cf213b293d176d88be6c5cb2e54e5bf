package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_2130:String = "i";
      
      public static const const_2065:String = "s";
      
      public static const const_2221:String = "e";
       
      
      private var _type:String;
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_2696:int;
      
      private var _revision:int;
      
      private var var_2699:int;
      
      private var var_2700:int;
      
      private var var_2701:int;
      
      private var var_1079:Array;
      
      private var _title:String;
      
      private var var_1785:String;
      
      private var var_2697:String;
      
      private var var_2698:int;
      
      private var var_1285:int;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String, param13:int, param14:int)
      {
         super();
         this._type = param1;
         this._id = param2;
         this._name = param3;
         this.var_2696 = param4;
         this._revision = param5;
         this.var_2699 = param6;
         this.var_2700 = param7;
         this.var_2701 = param8;
         this.var_1079 = param9;
         this._title = param10;
         this.var_1785 = param11;
         this.var_2697 = param12;
         this.var_2698 = param13;
         this.var_1285 = param14;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get colourIndex() : int
      {
         return this.var_2696;
      }
      
      public function get revision() : int
      {
         return this._revision;
      }
      
      public function get tileSizeX() : int
      {
         return this.var_2699;
      }
      
      public function get tileSizeY() : int
      {
         return this.var_2700;
      }
      
      public function get tileSizeZ() : int
      {
         return this.var_2701;
      }
      
      public function get colours() : Array
      {
         return this.var_1079;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function get description() : String
      {
         return this.var_1785;
      }
      
      public function get adUrl() : String
      {
         return this.var_2697;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2698;
      }
      
      public function get offerId() : int
      {
         return this.var_1285;
      }
   }
}
