package com.sulake.habbo.inventory.badges
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class Badge implements IThumbListDrawableItem
   {
      
      private static const const_1550:int = 13421772;
      
      private static const const_1551:int = 10275685;
       
      
      private var _type:String;
      
      private var var_2129:Boolean;
      
      private var _isSelected:Boolean;
      
      private var var_47:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var var_1520:IWindow;
      
      private var var_2619:IWindow;
      
      private var var_1559:Boolean;
      
      public function Badge(param1:String, param2:IWindowContainer, param3:Boolean)
      {
         this.var_47 = new BitmapData(1,1,false,4278255360);
         super();
         this._type = param1;
         this._window = param2;
         this.var_1520 = this._window.findChildByTag("BG_COLOR");
         this.var_2619 = this._window.findChildByName("outline");
         this.var_1559 = param3;
         this.isSelected = false;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get isInUse() : Boolean
      {
         return this.var_2129;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function get iconImage() : BitmapData
      {
         return this.var_47;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         this.var_2129 = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
         if(this.var_1520 == null)
         {
            return;
         }
         this.var_1520.color = !!this.var_1559 ? uint(const_1551) : uint(const_1550);
         this.var_2619.visible = param1;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         this.var_47 = param1;
         if(this.var_47 == null)
         {
            return;
         }
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("bitmap") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:BitmapData = !!_loc2_.bitmap ? _loc2_.bitmap : new BitmapData(_loc2_.width,_loc2_.height);
         _loc3_.fillRect(_loc3_.rect,0);
         _loc3_.copyPixels(param1,param1.rect,new Point(_loc3_.width / 2 - param1.width / 2,_loc3_.height / 2 - param1.height / 2));
         _loc2_.bitmap = _loc3_;
      }
      
      public function set isUnseen(param1:Boolean) : void
      {
         if(this.var_1559 != param1)
         {
            this.var_1559 = param1;
            this.isSelected = this._isSelected;
         }
      }
   }
}
