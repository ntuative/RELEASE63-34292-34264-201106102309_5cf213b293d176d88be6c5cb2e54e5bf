package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Icon implements IDisposable
   {
      
      protected static const const_2260:int = 0;
      
      protected static const const_660:int = 1;
      
      protected static const const_1984:int = 2;
      
      protected static const const_1982:int = 3;
      
      protected static const const_134:int = 4;
      
      protected static const const_659:int = 8;
      
      protected static const const_290:int = 18;
      
      protected static const const_1983:int = 18;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1689:Boolean = false;
      
      protected var var_47:BitmapDataAsset;
      
      protected var var_95:IBitmapWrapperWindow;
      
      private var var_1134:uint;
      
      protected var var_220:Timer;
      
      protected var _frame:int = 0;
      
      private var var_603:Point;
      
      protected var var_908:Boolean = false;
      
      protected var _hover:Boolean = false;
      
      public function Icon()
      {
         this.var_1134 = const_660 | const_659;
         this.var_603 = new Point();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_1689;
      }
      
      protected function set image(param1:BitmapDataAsset) : void
      {
         this.var_47 = param1;
         this.redraw();
      }
      
      protected function get image() : BitmapDataAsset
      {
         return this.var_47;
      }
      
      protected function set canvas(param1:IBitmapWrapperWindow) : void
      {
         this.var_95 = param1;
         this.redraw();
      }
      
      protected function get canvas() : IBitmapWrapperWindow
      {
         return this.var_95;
      }
      
      protected function set alignment(param1:uint) : void
      {
         this.var_1134 = param1;
         this.redraw();
      }
      
      protected function get alignment() : uint
      {
         return this.var_1134;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.toggleTimer(false,0);
            this.image = null;
            this.canvas = null;
            this._disposed = true;
         }
      }
      
      public function notify(param1:Boolean) : void
      {
         this.var_908 = param1;
         if(this.var_908 && this.var_1689)
         {
            this.enable(true);
         }
      }
      
      public function hover(param1:Boolean) : void
      {
         this._hover = param1;
      }
      
      public function enable(param1:Boolean) : void
      {
         this.var_1689 = !param1;
      }
      
      protected function redraw() : void
      {
         var _loc1_:* = null;
         if(this.var_95 && !this.var_95.disposed)
         {
            if(!this.var_95.bitmap)
            {
               this.var_95.bitmap = new BitmapData(this.var_95.width,this.var_95.height,true,0);
            }
            else
            {
               this.var_95.bitmap.fillRect(this.var_95.bitmap.rect,0);
            }
            if(this.var_47 && !this.var_47.disposed)
            {
               this.var_603.x = this.var_603.y = 0;
               _loc1_ = this.var_47.content as BitmapData;
               switch(this.var_1134 & const_1982)
               {
                  case const_660:
                     this.var_603.x = this.var_95.bitmap.width / 2 - _loc1_.width / 2;
                     break;
                  case const_1984:
                     this.var_603.x = this.var_95.bitmap.width - _loc1_.width;
               }
               switch(this.var_1134 & const_1983)
               {
                  case const_659:
                     this.var_603.y = this.var_95.bitmap.height / 2 - _loc1_.height / 2;
                     break;
                  case const_290:
                     this.var_603.y = this.var_95.bitmap.height - _loc1_.height;
               }
               this.var_95.bitmap.copyPixels(_loc1_,_loc1_.rect,this.var_603);
               this.var_95.invalidate();
            }
         }
      }
      
      protected function toggleTimer(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(!this.var_220)
            {
               this.var_220 = new Timer(param2,0);
               this.var_220.addEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_220.start();
               this.onTimerEvent(null);
            }
            this.var_220.delay = param2;
         }
         else
         {
            this._frame = 0;
            if(this.var_220)
            {
               this.var_220.reset();
               this.var_220.removeEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_220 = null;
            }
         }
      }
      
      protected function onTimerEvent(param1:TimerEvent) : void
      {
      }
   }
}
