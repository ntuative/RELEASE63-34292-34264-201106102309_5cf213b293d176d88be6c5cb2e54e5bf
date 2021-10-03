package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1469:Number = 12;
       
      
      private var var_2479:int = -1;
      
      private var var_2488:int = -2;
      
      private var var_216:Vector3d = null;
      
      private var var_1216:Number = 0;
      
      private var var_1488:Number = 0;
      
      private var var_1844:Boolean = false;
      
      private var var_192:Vector3d = null;
      
      private var var_1843:Vector3d;
      
      private var var_2484:Boolean = false;
      
      private var var_2482:Boolean = false;
      
      private var var_2486:Boolean = false;
      
      private var var_2481:Boolean = false;
      
      private var var_2487:int = 0;
      
      private var var_2480:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2483:int = 0;
      
      private var var_2485:int = 0;
      
      private var var_1840:int = -1;
      
      private var var_1841:int = 0;
      
      private var var_1842:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1843 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_192;
      }
      
      public function get targetId() : int
      {
         return this.var_2479;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2488;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1843;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2484;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2482;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2486;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2481;
      }
      
      public function get screenWd() : int
      {
         return this.var_2487;
      }
      
      public function get screenHt() : int
      {
         return this.var_2480;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2483;
      }
      
      public function get roomHt() : int
      {
         return this.var_2485;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1840;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_216 != null && this.var_192 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2479 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1843.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2488 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2484 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2482 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2486 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2481 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2487 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2480 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1842 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2483 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2485 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1840 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_216 == null)
         {
            this.var_216 = new Vector3d();
         }
         if(this.var_216.x != param1.x || this.var_216.y != param1.y || this.var_216.z != param1.z)
         {
            this.var_216.assign(param1);
            this.var_1841 = 0;
            _loc2_ = Vector3d.dif(this.var_216,this.var_192);
            this.var_1216 = _loc2_.length;
            this.var_1844 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_216 = null;
         this.var_192 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_192 != null)
         {
            return;
         }
         this.var_192 = new Vector3d();
         this.var_192.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_192 == null)
         {
            this.var_192 = new Vector3d();
         }
         this.var_192.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_216 != null && this.var_192 != null)
         {
            ++this.var_1841;
            if(this.var_1842)
            {
               this.var_1842 = false;
               this.var_192 = this.var_216;
               this.var_216 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_216,this.var_192);
            if(_loc3_.length > this.var_1216)
            {
               this.var_1216 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_192 = this.var_216;
               this.var_216 = null;
               this.var_1488 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1216);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1216 / const_1469;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_1844)
               {
                  if(_loc7_ < this.var_1488)
                  {
                     _loc7_ = this.var_1488;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_1844 = false;
                  }
               }
               this.var_1488 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_192 = Vector3d.sum(this.var_192,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1840 = -1;
      }
   }
}
