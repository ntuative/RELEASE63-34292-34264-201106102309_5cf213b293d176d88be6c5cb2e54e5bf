package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1019:int = 20;
      
      private static const const_666:int = 10;
      
      private static const const_1410:int = 31;
      
      private static const const_1409:int = 32;
      
      private static const const_667:int = 30;
       
      
      private var var_310:Array;
      
      private var var_898:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_310 = new Array();
         super();
         super.setAnimation(const_667);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
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
         if(param1 > 0 && param1 <= const_666)
         {
            if(this.var_898)
            {
               this.var_898 = false;
               this.var_310 = new Array();
               if(direction == 2)
               {
                  this.var_310.push(const_1019 + 5 - param1);
                  this.var_310.push(const_666 + 5 - param1);
               }
               else
               {
                  this.var_310.push(const_1019 + param1);
                  this.var_310.push(const_666 + param1);
               }
               this.var_310.push(const_667);
               return;
            }
            super.setAnimation(const_667);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
