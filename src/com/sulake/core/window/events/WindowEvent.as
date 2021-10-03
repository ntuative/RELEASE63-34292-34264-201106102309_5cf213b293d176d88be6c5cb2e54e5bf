package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1789:String = "WE_DESTROY";
      
      public static const const_316:String = "WE_DESTROYED";
      
      public static const const_1794:String = "WE_OPEN";
      
      public static const const_1720:String = "WE_OPENED";
      
      public static const const_1822:String = "WE_CLOSE";
      
      public static const const_1961:String = "WE_CLOSED";
      
      public static const const_1781:String = "WE_FOCUS";
      
      public static const const_339:String = "WE_FOCUSED";
      
      public static const const_1681:String = "WE_UNFOCUS";
      
      public static const const_1971:String = "WE_UNFOCUSED";
      
      public static const const_1785:String = "WE_ACTIVATE";
      
      public static const const_493:String = "WE_ACTIVATED";
      
      public static const const_1772:String = "WE_DEACTIVATE";
      
      public static const const_585:String = "WE_DEACTIVATED";
      
      public static const const_373:String = "WE_SELECT";
      
      public static const const_48:String = "WE_SELECTED";
      
      public static const const_652:String = "WE_UNSELECT";
      
      public static const const_484:String = "WE_UNSELECTED";
      
      public static const const_1752:String = "WE_LOCK";
      
      public static const const_1810:String = "WE_LOCKED";
      
      public static const const_1802:String = "WE_UNLOCK";
      
      public static const const_1832:String = "WE_UNLOCKED";
      
      public static const const_890:String = "WE_ENABLE";
      
      public static const const_264:String = "WE_ENABLED";
      
      public static const const_729:String = "WE_DISABLE";
      
      public static const const_267:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_410:String = "WE_RELOCATED";
      
      public static const const_1168:String = "WE_RESIZE";
      
      public static const const_40:String = "WE_RESIZED";
      
      public static const const_1849:String = "WE_MINIMIZE";
      
      public static const const_1872:String = "WE_MINIMIZED";
      
      public static const const_1877:String = "WE_MAXIMIZE";
      
      public static const const_1890:String = "WE_MAXIMIZED";
      
      public static const const_1824:String = "WE_RESTORE";
      
      public static const const_1693:String = "WE_RESTORED";
      
      public static const const_601:String = "WE_CHILD_ADDED";
      
      public static const const_403:String = "WE_CHILD_REMOVED";
      
      public static const const_231:String = "WE_CHILD_RELOCATED";
      
      public static const const_177:String = "WE_CHILD_RESIZED";
      
      public static const const_333:String = "WE_CHILD_ACTIVATED";
      
      public static const const_635:String = "WE_PARENT_ADDED";
      
      public static const const_1701:String = "WE_PARENT_REMOVED";
      
      public static const const_1927:String = "WE_PARENT_RELOCATED";
      
      public static const const_775:String = "WE_PARENT_RESIZED";
      
      public static const const_1237:String = "WE_PARENT_ACTIVATED";
      
      public static const const_179:String = "WE_OK";
      
      public static const const_592:String = "WE_CANCEL";
      
      public static const const_111:String = "WE_CHANGE";
      
      public static const const_506:String = "WE_SCROLL";
      
      public static const const_115:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_733:IWindow;
      
      protected var var_1125:Boolean;
      
      protected var var_500:Boolean;
      
      protected var var_502:Boolean;
      
      protected var var_732:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_733 = param3;
         _loc5_.var_500 = param4;
         _loc5_.var_502 = false;
         _loc5_.var_732 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_733;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_500;
      }
      
      public function recycle() : void
      {
         if(this.var_502)
         {
            throw new Error("Event already recycled!");
         }
         this.var_733 = null;
         this._window = null;
         this.var_502 = true;
         this.var_1125 = false;
         this.var_732.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1125;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1125 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1125;
      }
      
      public function stopPropagation() : void
      {
         this.var_1125 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1125 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_500 + " window: " + this._window + " }";
      }
   }
}
