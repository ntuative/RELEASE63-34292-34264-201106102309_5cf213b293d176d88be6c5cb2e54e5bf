package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_3062:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_93 = param1.desktop;
         var_71 = param1.var_1382 as WindowController;
         var_187 = param1.var_1386 as WindowController;
         var_173 = param1.renderer;
         var_918 = param1.var_1384;
         param2.begin();
         param2.end();
         param1.desktop = var_93;
         param1.var_1382 = var_71;
         param1.var_1386 = var_187;
         param1.renderer = var_173;
         param1.var_1384 = var_918;
      }
   }
}
