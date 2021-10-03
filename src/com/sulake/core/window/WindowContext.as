package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_486:uint = 0;
      
      public static const const_1960:uint = 1;
      
      public static const const_2259:int = 0;
      
      public static const const_2059:int = 1;
      
      public static const const_2118:int = 2;
      
      public static const const_2054:int = 3;
      
      public static const const_1852:int = 4;
      
      public static const const_453:int = 5;
      
      public static var var_420:IEventQueue;
      
      private static var var_713:IEventProcessor;
      
      private static var var_2079:uint = const_486;
      
      private static var stage:Stage;
      
      private static var var_173:IWindowRenderer;
       
      
      private var var_2865:EventProcessorState;
      
      private var var_2864:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_142:DisplayObjectContainer;
      
      protected var var_3041:Boolean = true;
      
      protected var var_1394:Error;
      
      protected var var_2225:int = -1;
      
      protected var var_1407:IInternalWindowServices;
      
      protected var var_1682:IWindowParser;
      
      protected var var_3000:IWindowFactory;
      
      protected var var_93:IDesktopWindow;
      
      protected var var_1683:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_599:Boolean = false;
      
      private var var_2866:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_173 = param2;
         this._localization = param4;
         this.var_142 = param5;
         this.var_1407 = new ServiceManager(this,param5);
         this.var_3000 = param3;
         this.var_1682 = new WindowParser(this);
         this.var_2864 = param7;
         if(!stage)
         {
            if(this.var_142 is Stage)
            {
               stage = this.var_142 as Stage;
            }
            else if(this.var_142.stage)
            {
               stage = this.var_142.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_93 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_93.limits.maxWidth = param6.width;
         this.var_93.limits.maxHeight = param6.height;
         this.var_142.addChild(this.var_93.getDisplayObject());
         this.var_142.doubleClickEnabled = true;
         this.var_142.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2865 = new EventProcessorState(var_173,this.var_93,this.var_93,null,this.var_2864);
         inputMode = const_486;
         this.var_1683 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_2079;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_420)
         {
            if(var_420 is IDisposable)
            {
               IDisposable(var_420).dispose();
            }
         }
         if(var_713)
         {
            if(var_713 is IDisposable)
            {
               IDisposable(var_713).dispose();
            }
         }
         switch(value)
         {
            case const_486:
               var_420 = new MouseEventQueue(stage);
               var_713 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1960:
               var_420 = new TabletEventQueue(stage);
               var_713 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_486;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_142.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_142.removeChild(IGraphicContextHost(this.var_93).getGraphicContext(true) as DisplayObject);
            this.var_93.destroy();
            this.var_93 = null;
            this.var_1683.destroy();
            this.var_1683 = null;
            if(this.var_1407 is IDisposable)
            {
               IDisposable(this.var_1407).dispose();
            }
            this.var_1407 = null;
            this.var_1682.dispose();
            this.var_1682 = null;
            var_173 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1394;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2225;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1394 = param2;
         this.var_2225 = param1;
         if(this.var_3041)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1394 = null;
         this.var_2225 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1407;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1682;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_3000;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_93;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_93.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1852,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1683;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_93,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_93)
         {
            this.var_93 = null;
         }
         if(param1.state != WindowState.const_476)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_173.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_599 = true;
         if(this.var_1394)
         {
            throw this.var_1394;
         }
         var_713.process(this.var_2865,var_420);
         this.var_599 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2866 = true;
         var_173.update(param1);
         this.var_2866 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_93 != null && !this.var_93.disposed)
         {
            if(this.var_142 is Stage)
            {
               this.var_93.limits.maxWidth = Stage(this.var_142).stageWidth;
               this.var_93.limits.maxHeight = Stage(this.var_142).stageHeight;
               this.var_93.width = Stage(this.var_142).stageWidth;
               this.var_93.height = Stage(this.var_142).stageHeight;
            }
            else
            {
               this.var_93.limits.maxWidth = this.var_142.width;
               this.var_93.limits.maxHeight = this.var_142.height;
               this.var_93.width = this.var_142.width;
               this.var_93.height = this.var_142.height;
            }
         }
      }
   }
}
