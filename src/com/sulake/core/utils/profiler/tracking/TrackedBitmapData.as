package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2227:int = 16777215;
      
      public static const const_1316:int = 8191;
      
      public static const const_1152:int = 8191;
      
      public static const const_2235:int = 1;
      
      public static const const_1190:int = 1;
      
      public static const const_1185:int = 1;
      
      private static var var_570:uint = 0;
      
      private static var var_571:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1316)
         {
            param2 = const_1316;
         }
         else if(param2 < const_1190)
         {
            param2 = const_1190;
         }
         if(param3 > const_1152)
         {
            param3 = const_1152;
         }
         else if(param3 < const_1185)
         {
            param3 = const_1185;
         }
         super(param2,param3,param4,param5);
         ++var_570;
         var_571 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_570;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_571;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_571 -= width * height * 4;
            --var_570;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
