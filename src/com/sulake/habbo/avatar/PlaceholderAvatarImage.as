package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_816:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1123)
         {
            _structure = null;
            _assets = null;
            var_296 = null;
            var_306 = null;
            _figure = null;
            var_595 = null;
            var_351 = null;
            if(!var_1398 && var_47)
            {
               var_47.dispose();
            }
            var_47 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_888 = null;
            var_1123 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_816[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_816[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_399:
               switch(_loc3_)
               {
                  case AvatarAction.const_896:
                  case AvatarAction.const_579:
                  case AvatarAction.const_419:
                  case AvatarAction.const_926:
                  case AvatarAction.const_409:
                  case AvatarAction.const_932:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_338:
            case AvatarAction.const_157:
            case AvatarAction.const_287:
            case AvatarAction.const_841:
            case AvatarAction.const_991:
            case AvatarAction.const_843:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
