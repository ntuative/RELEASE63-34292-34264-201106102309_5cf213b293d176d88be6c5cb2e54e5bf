package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1413:IHabboTracking;
      
      private var var_2045:Boolean = false;
      
      private var var_2606:int = 0;
      
      private var var_1909:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1413 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1413 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2045 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2606 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2045)
         {
            return;
         }
         ++this.var_1909;
         if(this.var_1909 <= this.var_2606)
         {
            this.var_1413.trackGoogle("toolbar",param1);
         }
      }
   }
}
