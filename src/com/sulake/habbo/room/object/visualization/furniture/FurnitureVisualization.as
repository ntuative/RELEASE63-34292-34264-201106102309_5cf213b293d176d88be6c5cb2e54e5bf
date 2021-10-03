package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.data.ColorData;
   import com.sulake.habbo.room.object.visualization.data.LayerData;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class FurnitureVisualization extends RoomObjectSpriteVisualization
   {
      
      protected static const const_1986:Number = Math.sqrt(0.5);
       
      
      private var _direction:int;
      
      private var var_2452:Number = NaN;
      
      private var var_2456:int = -1;
      
      private var _alphaMultiplier:Number = 1.0;
      
      private var var_1211:String = null;
      
      private var var_2457:Boolean = false;
      
      private var _data:FurnitureVisualizationData = null;
      
      private var _type:String = "";
      
      private var var_990:Array;
      
      private var var_991:Array;
      
      private var var_2454:Number = 0.0;
      
      private var var_2453:int = -1;
      
      private var var_2455:int = -1;
      
      private var var_782:Array;
      
      private var var_780:Array;
      
      private var var_779:Array;
      
      private var var_786:Array;
      
      private var var_785:Array;
      
      private var var_781:Array;
      
      private var var_784:Array;
      
      private var var_783:Array;
      
      private var var_1827:Boolean = true;
      
      private var var_695:int = 0;
      
      private var var_1481:int = -1;
      
      private var var_1482:int = 0;
      
      private var var_2451:Number = 0.0;
      
      public function FurnitureVisualization()
      {
         this.var_990 = [];
         this.var_991 = [];
         this.var_782 = [];
         this.var_780 = [];
         this.var_779 = [];
         this.var_786 = [];
         this.var_785 = [];
         this.var_781 = [];
         this.var_784 = [];
         this.var_783 = [];
         super();
         this.reset();
      }
      
      protected function set direction(param1:int) : void
      {
         this._direction = param1;
      }
      
      protected function get direction() : int
      {
         return this._direction;
      }
      
      protected function get type() : String
      {
         return this._type;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._data = null;
         this.var_990 = null;
         this.var_991 = null;
         this.var_782 = null;
         this.var_780 = null;
         this.var_779 = null;
         this.var_786 = null;
         this.var_785 = null;
         this.var_781 = null;
         this.var_784 = null;
         this.var_783 = null;
      }
      
      override protected function reset() : void
      {
         super.reset();
         this.direction = -1;
         this._data = null;
         this.var_990 = [];
         this.var_991 = [];
         this.var_782 = [];
         this.var_780 = [];
         this.var_779 = [];
         this.var_786 = [];
         this.var_785 = [];
         this.var_781 = [];
         this.var_784 = [];
         this.var_783 = [];
         this.createSprites(0);
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.reset();
         if(param1 == null || !(param1 is FurnitureVisualizationData))
         {
            return false;
         }
         this._data = param1 as FurnitureVisualizationData;
         this._type = this._data.getType();
         return true;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc5_:Boolean = false;
         var _loc6_:Number = param1.scale;
         if(this.updateObject(_loc6_,param1.direction.x))
         {
            _loc5_ = true;
         }
         if(this.updateModel(_loc6_))
         {
            _loc5_ = true;
         }
         var _loc7_:* = 0;
         if(param4)
         {
            this.var_1482 |= this.updateAnimation(_loc6_);
         }
         else
         {
            _loc7_ = this.updateAnimation(_loc6_) | this.var_1482;
            this.var_1482 = 0;
         }
         if(_loc5_ || _loc7_ != 0)
         {
            this.updateSprites(_loc6_,_loc5_,_loc7_);
            var_101 = _loc6_;
            increaseUpdateId();
         }
      }
      
      protected function updateSprites(param1:int, param2:Boolean, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this.var_695 != spriteCount)
         {
            createSprites(this.var_695);
         }
         if(param2)
         {
            _loc4_ = spriteCount - 1;
            while(_loc4_ >= 0)
            {
               this.updateSprite(param1,_loc4_);
               _loc4_--;
            }
         }
         else
         {
            _loc5_ = 0;
            while(param3 > 0)
            {
               if(param3 & 1)
               {
                  this.updateSprite(param1,_loc5_);
               }
               _loc5_++;
               param3 >>= 1;
            }
         }
         this.var_1827 = false;
      }
      
      private function updateSprite(param1:int, param2:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = NaN;
         var _loc7_:int = 0;
         var _loc3_:String = this.getSpriteAssetName(param1,param2);
         var _loc4_:IRoomObjectSprite = getSprite(param2);
         if(_loc4_ != null && _loc3_ != null)
         {
            _loc5_ = this.getAsset(_loc3_);
            if(_loc5_ != null && _loc5_.asset != null)
            {
               _loc4_.visible = true;
               _loc4_.asset = _loc5_.asset.content as BitmapData;
               _loc4_.flipH = _loc5_.flipH;
               _loc4_.flipV = _loc5_.flipV;
               _loc6_ = 0;
               if(param2 != this.var_1481)
               {
                  _loc4_.tag = this.getSpriteTag(param1,this._direction,param2);
                  _loc4_.alpha = this.getSpriteAlpha(param1,this._direction,param2);
                  _loc4_.color = this.getSpriteColor(param1,param2,this.var_2456);
                  _loc4_.offsetX = _loc5_.offsetX + this.getSpriteXOffset(param1,this._direction,param2);
                  _loc4_.offsetY = _loc5_.offsetY + this.getSpriteYOffset(param1,this._direction,param2);
                  _loc4_.capturesMouse = this.getSpriteMouseCapture(param1,this._direction,param2);
                  _loc4_.blendMode = this.getBlendMode(this.getSpriteInk(param1,this._direction,param2));
                  _loc6_ = Number(this.getSpriteZOffset(param1,this._direction,param2));
                  _loc6_ -= param2 * 0.001;
               }
               else
               {
                  _loc4_.offsetX = _loc5_.offsetX;
                  _loc4_.offsetY = _loc5_.offsetY + this.getSpriteYOffset(param1,this._direction,param2);
                  _loc7_ = 48;
                  _loc7_ *= this._alphaMultiplier;
                  _loc4_.alpha = _loc7_;
                  _loc4_.capturesMouse = false;
                  _loc6_ = 1;
               }
               _loc6_ *= const_1986;
               _loc4_.relativeDepth = _loc6_;
               _loc4_.assetName = _loc5_.assetName;
               _loc4_.clickHandling = this.var_2457;
            }
            else
            {
               this.resetSprite(_loc4_);
            }
         }
         else if(_loc4_ != null)
         {
            this.resetSprite(_loc4_);
         }
      }
      
      private function resetSprite(param1:IRoomObjectSprite) : void
      {
         param1.asset = null;
         param1.assetName = "";
         param1.tag = "";
         param1.flipH = false;
         param1.flipV = false;
         param1.offsetX = 0;
         param1.offsetY = 0;
         param1.relativeDepth = 0;
         param1.clickHandling = false;
      }
      
      protected function getBlendMode(param1:int) : String
      {
         var _loc2_:String = "null";
         switch(param1)
         {
            case LayerData.const_428:
               break;
            case LayerData.const_1334:
               _loc2_ = "null";
               break;
            case LayerData.INK_DARKEN:
               _loc2_ = "null";
               break;
            case LayerData.const_1285:
               _loc2_ = "null";
         }
         return _loc2_;
      }
      
      protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_507 != _loc3_.getUpdateID() || param1 != var_101 || param2 != this.var_2452)
         {
            _loc4_ = _loc3_.getDirection().x - (param2 + 135);
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            if(this._data != null)
            {
               _loc5_ = this._data.getDirectionValue(param1,_loc4_);
               this.direction = _loc5_;
            }
            var_507 = _loc3_.getUpdateID();
            this.var_2452 = param2;
            var_101 = param1;
            this.method_10(param1,this._direction);
            return true;
         }
         return false;
      }
      
      protected function updateModel(param1:Number) : Boolean
      {
         var _loc4_:* = NaN;
         var _loc2_:IRoomObject = object;
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel();
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_164 != _loc3_.getUpdateID())
         {
            this.var_2456 = _loc3_.getNumber(RoomObjectVariableEnum.const_294);
            _loc4_ = Number(_loc3_.getNumber(RoomObjectVariableEnum.const_357));
            if(isNaN(_loc4_))
            {
               _loc4_ = 1;
            }
            if(_loc4_ != this._alphaMultiplier)
            {
               this._alphaMultiplier = _loc4_;
               this.var_1827 = true;
            }
            this.var_1211 = this.getAdClickUrl(_loc3_);
            if(this.var_1211 == null || this.var_1211.indexOf("http") != 0)
            {
               this.var_1211 = null;
            }
            this.var_2457 = this.var_1211 != null;
            this.var_2451 = _loc3_.getNumber(RoomObjectVariableEnum.const_801);
            var_164 = _loc3_.getUpdateID();
            return true;
         }
         return false;
      }
      
      protected function getAdClickUrl(param1:IRoomObjectModel) : String
      {
         return param1.getString(RoomObjectVariableEnum.const_412);
      }
      
      protected function updateAnimation(param1:Number) : int
      {
         return 0;
      }
      
      private function method_10(param1:Number, param2:int) : void
      {
         if(this.var_2455 != param2 || this.var_2454 != param1)
         {
            this.var_990 = [];
            this.var_991 = [];
            this.var_782 = [];
            this.var_780 = [];
            this.var_779 = [];
            this.var_786 = [];
            this.var_785 = [];
            this.var_781 = [];
            this.var_784 = [];
            this.var_783 = [];
            this.var_2455 = param2;
            this.var_2454 = param1;
            this.var_2453 = this.getSize(param1);
            this.updateLayerCount(this._data.getLayerCount(param1) + this.getAdditionalSpriteCount());
         }
      }
      
      protected function updateLayerCount(param1:int) : void
      {
         this.var_695 = param1;
         this.var_1481 = this.var_695 - this.getAdditionalSpriteCount();
      }
      
      protected function getAdditionalSpriteCount() : int
      {
         return 1;
      }
      
      protected function getFrameNumber(param1:int, param2:int) : int
      {
         return 0;
      }
      
      protected function getAsset(param1:String) : IGraphicAsset
      {
         var _loc2_:* = null;
         if(assetCollection != null)
         {
            return assetCollection.getAsset(param1);
         }
         return null;
      }
      
      protected function getSpriteAssetName(param1:int, param2:int) : String
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(this._data == null || param2 >= FurnitureVisualizationData.const_561.length)
         {
            return "";
         }
         var _loc3_:String = this.var_990[param2];
         var _loc4_:Boolean = this.var_991[param2];
         if(_loc3_ == null || _loc3_.length == 0)
         {
            _loc5_ = this.var_2453;
            _loc3_ = this._type;
            _loc6_ = "";
            if(param2 != this.var_1481)
            {
               _loc6_ = FurnitureVisualizationData.const_561[param2];
            }
            else
            {
               _loc6_ = "sd";
            }
            if(_loc5_ == 1)
            {
               _loc3_ += "_icon_" + _loc6_;
               _loc4_ = false;
            }
            else
            {
               _loc3_ += "_" + _loc5_ + "_" + _loc6_ + "_" + this._direction + "_";
               _loc4_ = true;
            }
            this.var_990[param2] = _loc3_;
            this.var_991[param2] = _loc4_;
         }
         if(_loc4_)
         {
            _loc3_ += this.getFrameNumber(param1,param2);
         }
         return _loc3_;
      }
      
      protected function getSpriteTag(param1:int, param2:int, param3:int) : String
      {
         if(this.var_782[param3] != null)
         {
            return this.var_782[param3];
         }
         if(this._data == null)
         {
            return "";
         }
         var _loc4_:String = this._data.getTag(param1,param2,param3);
         this.var_782[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteAlpha(param1:int, param2:int, param3:int) : int
      {
         if(this.var_780[param3] != null && !this.var_1827)
         {
            return this.var_780[param3];
         }
         if(this._data == null)
         {
            return LayerData.const_526;
         }
         var _loc4_:int = this._data.getAlpha(param1,param2,param3);
         _loc4_ *= this._alphaMultiplier;
         this.var_780[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteColor(param1:int, param2:int, param3:int) : int
      {
         if(this.var_779[param2] != null)
         {
            return this.var_779[param2];
         }
         if(this._data == null)
         {
            return ColorData.const_72;
         }
         var _loc4_:int = this._data.getColor(param1,param2,param3);
         this.var_779[param2] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(this.var_786[param3] != null)
         {
            return this.var_786[param3];
         }
         if(this._data == null)
         {
            return LayerData.const_618;
         }
         var _loc4_:int = this._data.getXOffset(param1,param2,param3);
         this.var_786[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:int = 0;
         if(param3 != this.var_1481)
         {
            if(this.var_785[param3] != null)
            {
               return this.var_785[param3];
            }
            if(this._data != null)
            {
               _loc4_ = this._data.getYOffset(param1,param2,param3);
               this.var_785[param3] = _loc4_;
               return _loc4_;
            }
            return LayerData.const_576;
         }
         return Math.ceil(this.var_2451 * (param1 / 2));
      }
      
      protected function getSpriteMouseCapture(param1:int, param2:int, param3:int) : Boolean
      {
         if(this.var_784[param3] != null)
         {
            return this.var_784[param3];
         }
         if(this._data == null)
         {
            return true;
         }
         var _loc4_:* = !this._data.getIgnoreMouse(param1,param2,param3);
         this.var_784[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteInk(param1:int, param2:int, param3:int) : int
      {
         if(this.var_783[param3] != null)
         {
            return this.var_783[param3];
         }
         if(this._data == null)
         {
            return LayerData.const_428;
         }
         var _loc4_:int = this._data.getInk(param1,param2,param3);
         this.var_783[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteZOffset(param1:int, param2:int, param3:int) : Number
      {
         if(this.var_781[param3] != null)
         {
            return this.var_781[param3];
         }
         if(this._data == null)
         {
            return LayerData.const_447;
         }
         var _loc4_:Number = this._data.getZOffset(param1,param2,param3);
         this.var_781[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSize(param1:int) : int
      {
         if(this._data != null)
         {
            return this._data.getSize(param1);
         }
         return param1;
      }
   }
}
