package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_3038:uint;
      
      private var var_162:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_725:IWindowContext;
      
      private var var_1374:IMouseDraggingService;
      
      private var var_1372:IMouseScalingService;
      
      private var var_1373:IMouseListenerService;
      
      private var var_1375:IFocusManagerService;
      
      private var var_1376:IToolTipAgentService;
      
      private var var_1371:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_3038 = 0;
         this.var_162 = param2;
         this.var_725 = param1;
         this.var_1374 = new WindowMouseDragger(param2);
         this.var_1372 = new WindowMouseScaler(param2);
         this.var_1373 = new WindowMouseListener(param2);
         this.var_1375 = new FocusManager(param2);
         this.var_1376 = new WindowToolTipAgent(param2);
         this.var_1371 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1374 != null)
         {
            this.var_1374.dispose();
            this.var_1374 = null;
         }
         if(this.var_1372 != null)
         {
            this.var_1372.dispose();
            this.var_1372 = null;
         }
         if(this.var_1373 != null)
         {
            this.var_1373.dispose();
            this.var_1373 = null;
         }
         if(this.var_1375 != null)
         {
            this.var_1375.dispose();
            this.var_1375 = null;
         }
         if(this.var_1376 != null)
         {
            this.var_1376.dispose();
            this.var_1376 = null;
         }
         if(this.var_1371 != null)
         {
            this.var_1371.dispose();
            this.var_1371 = null;
         }
         this.var_162 = null;
         this.var_725 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1374;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1372;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1373;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1375;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1376;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1371;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
