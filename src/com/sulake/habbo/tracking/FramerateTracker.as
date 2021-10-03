package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1945:int;
      
      private var var_2665:int;
      
      private var var_787:int;
      
      private var var_575:Number;
      
      private var var_2666:Boolean;
      
      private var var_2667:int;
      
      private var var_1944:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_575);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2665 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2667 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2666 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_787;
         if(this.var_787 == 1)
         {
            this.var_575 = param1;
            this.var_1945 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_787);
            this.var_575 = this.var_575 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2666 && param3 - this.var_1945 >= this.var_2665)
         {
            this.var_787 = 0;
            if(this.var_1944 < this.var_2667)
            {
               param2.trackGoogle("performance","averageFramerate",this.frameRate);
               ++this.var_1944;
               this.var_1945 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
