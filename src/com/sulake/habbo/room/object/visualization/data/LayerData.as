package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_772:String = "";
      
      public static const const_428:int = 0;
      
      public static const const_526:int = 255;
      
      public static const const_866:Boolean = false;
      
      public static const const_618:int = 0;
      
      public static const const_576:int = 0;
      
      public static const const_447:int = 0;
      
      public static const const_1334:int = 1;
      
      public static const const_1285:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2415:String = "";
      
      private var var_1991:int = 0;
      
      private var var_2639:int = 255;
      
      private var var_2765:Boolean = false;
      
      private var var_2763:int = 0;
      
      private var var_2764:int = 0;
      
      private var var_2762:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2415 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2415;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1991 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1991;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2639 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2639;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2765 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2765;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2763 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2763;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2764 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2764;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2762 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2762;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
