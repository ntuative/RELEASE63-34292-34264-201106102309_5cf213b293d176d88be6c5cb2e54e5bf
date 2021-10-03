package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1409:int = 3;
      
      private static const const_1482:int = 2;
      
      private static const const_1481:int = 1;
      
      private static const const_1480:int = 15;
       
      
      private var var_310:Array;
      
      private var var_1221:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_310 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1482)
         {
            this.var_310 = new Array();
            this.var_310.push(const_1481);
            this.var_1221 = const_1480;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1221 > 0)
         {
            --this.var_1221;
         }
         if(this.var_1221 == 0)
         {
            if(this.var_310.length > 0)
            {
               super.setAnimation(this.var_310.shift());
            }
         }
         return super.updateAnimation(param1);
      }
      
      override protected function usesAnimationResetting() : Boolean
      {
         return true;
      }
   }
}
