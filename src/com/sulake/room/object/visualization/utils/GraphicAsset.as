package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_2353:String;
      
      private var var_2381:String;
      
      private var var_483:BitmapDataAsset;
      
      private var var_1612:Boolean;
      
      private var var_1611:Boolean;
      
      private var var_2382:Boolean;
      
      private var _offsetX:int;
      
      private var var_1143:int;
      
      private var var_283:int;
      
      private var _height:int;
      
      private var var_769:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_2353 = param1;
         this.var_2381 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_483 = _loc9_;
            this.var_769 = false;
         }
         else
         {
            this.var_483 = null;
            this.var_769 = true;
         }
         this.var_1612 = param4;
         this.var_1611 = param5;
         this._offsetX = param6;
         this.var_1143 = param7;
         this.var_2382 = param8;
      }
      
      public function dispose() : void
      {
         this.var_483 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_769 && this.var_483 != null)
         {
            _loc1_ = this.var_483.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_283 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_769 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1611;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1612;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_283;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_2353;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2381;
      }
      
      public function get asset() : IAsset
      {
         return this.var_483;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2382;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1612)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1611)
         {
            return this.var_1143;
         }
         return -(this.height + this.var_1143);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1143;
      }
   }
}
