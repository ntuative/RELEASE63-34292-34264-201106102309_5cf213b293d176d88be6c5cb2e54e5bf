package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1019:int = 10;
      
      private static const const_666:int = 20;
      
      private static const const_1410:int = 31;
      
      private static const const_1409:int = 32;
       
      
      private var var_310:Array;
      
      private var var_898:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_310 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_898)
            {
               this.var_898 = true;
               this.var_310 = new Array();
               this.var_310.push(const_1410);
               this.var_310.push(const_1409);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_1019)
         {
            if(this.var_898)
            {
               this.var_898 = false;
               this.var_310 = new Array();
               this.var_310.push(const_1019 + param1);
               this.var_310.push(const_666 + param1);
               this.var_310.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(this.var_310.length > 0)
            {
               super.setAnimation(this.var_310.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
