package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.SecurityLevelEnum;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.ui.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChatMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.PointMath;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   
   public class ChatWidgetHandler implements IRoomWidgetHandler, IPetImageListener, IAvatarImageListener, IGetImageListener
   {
       
      
      private var var_1123:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_495:Map = null;
      
      private var var_343:Map = null;
      
      private var var_721:Map = null;
      
      private var var_2136:Map = null;
      
      private var var_1361:Array;
      
      private var _connection:IConnection = null;
      
      private var var_1360:Number = 0.0;
      
      private var var_900:Point = null;
      
      private var var_585:Vector3d;
      
      public function ChatWidgetHandler()
      {
         this.var_1361 = [];
         this.var_585 = new Vector3d();
         super();
         this.var_495 = new Map();
         this.var_343 = new Map();
         this.var_721 = new Map();
         this.var_2136 = new Map();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1123;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_393;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.var_1123 = true;
         this._container = null;
         this.var_900 = null;
         if(this.var_495 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_495.length)
            {
               _loc2_ = this.var_495.getWithIndex(_loc1_) as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_495.dispose();
            this.var_495 = null;
         }
         if(this.var_343 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_343.length)
            {
               _loc2_ = this.var_343.getWithIndex(_loc1_) as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_343.dispose();
            this.var_343 = null;
         }
         for each(_loc3_ in this.var_1361)
         {
            if(_loc3_ != null)
            {
               _loc3_.dispose();
            }
         }
         this.var_1361 = [];
         if(this.var_721 != null)
         {
            this.var_721.dispose();
            this.var_721 = null;
         }
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetChatMessage.const_913,RoomWidgetChatSelectAvatarMessage.const_873];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         switch(param1.type)
         {
            case RoomWidgetChatMessage.const_913:
               if(this._container != null && this._container.roomSession != null)
               {
                  _loc3_ = param1 as RoomWidgetChatMessage;
                  if(_loc3_ != null)
                  {
                     if(_loc3_.text == "")
                     {
                        return null;
                     }
                     _loc4_ = null;
                     _loc5_ = _loc3_.text.split(" ");
                     if(_loc5_.length > 0)
                     {
                        _loc6_ = _loc5_[0];
                        _loc7_ = "";
                        if(_loc5_.length > 1)
                        {
                           _loc7_ = _loc5_[1];
                        }
                        if(_loc6_.charAt(0) == ":" && _loc7_ == "x")
                        {
                           _loc8_ = this._container.roomEngine.getSelectedAvatarId();
                           if(_loc8_ > -1)
                           {
                              _loc9_ = this._container.roomSession.userDataManager.getUserDataByIndex(_loc8_);
                              if(_loc9_ != null)
                              {
                                 this._container.roomSession.sendChatMessage(_loc3_.text.replace(" x"," " + _loc9_.name));
                                 return null;
                              }
                           }
                        }
                        switch(_loc6_.toLowerCase())
                        {
                           case "o/":
                              this._container.roomSession.sendWaveMessage();
                              return null;
                           case ":sign":
                              this._container.roomSession.sendSignMessage(int(_loc7_));
                              return null;
                           case ":chooser":
                              if(this._container.sessionDataManager.hasUserRight("fuse_habbo_chooser",HabboClubLevelEnum.const_38) || this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.const_1296))
                              {
                                 _loc4_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_391);
                                 this._container.processWidgetMessage(_loc4_);
                              }
                              return null;
                           case ":furni":
                              if(this._container.sessionDataManager.hasUserRight("fuse_furni_chooser",HabboClubLevelEnum.const_38) || this._container.sessionDataManager.hasSecurity(SecurityLevelEnum.const_1296))
                              {
                                 _loc4_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_517);
                                 this._container.processWidgetMessage(_loc4_);
                              }
                              return null;
                           case ":pickall":
                              this._container.sessionDataManager.pickAllFurniture(this._container.roomSession.roomId,this._container.roomSession.roomCategory);
                              return null;
                           case ":news":
                              if(false)
                              {
                                 ExternalInterface.call("FlashExternalInterface.openHabblet","news");
                              }
                              return null;
                        }
                     }
                     switch(_loc3_.chatType)
                     {
                        case RoomWidgetChatMessage.const_131:
                           this._container.roomSession.sendChatMessage(_loc3_.text);
                           break;
                        case RoomWidgetChatMessage.const_136:
                           this._container.roomSession.sendShoutMessage(_loc3_.text);
                           break;
                        case RoomWidgetChatMessage.const_149:
                           this._container.roomSession.sendWhisperMessage(_loc3_.recipientName,_loc3_.text);
                     }
                  }
               }
               break;
            case RoomWidgetChatSelectAvatarMessage.const_873:
               _loc2_ = param1 as RoomWidgetChatSelectAvatarMessage;
               if(_loc2_ != null)
               {
                  this._container.roomEngine.selectAvatar(_loc2_.roomId,_loc2_.roomCategory,_loc2_.objectId,true);
                  _loc10_ = this._container.roomSession.userDataManager.getUserDataByIndex(_loc2_.objectId);
                  if(_loc10_ != null)
                  {
                     this._container.moderation.userSelected(_loc10_.webID,_loc2_.userName);
                  }
               }
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionChatEvent.const_203];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = NaN;
         var _loc7_:* = NaN;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc2_:* = null;
         switch(param1.type)
         {
            case RoomSessionChatEvent.const_203:
               _loc3_ = param1 as RoomSessionChatEvent;
               if(_loc3_ != null)
               {
                  _loc4_ = this._container.roomEngine.getRoomObject(_loc3_.session.roomId,_loc3_.session.roomCategory,_loc3_.userId,RoomObjectCategoryEnum.const_29);
                  if(_loc4_ != null)
                  {
                     _loc5_ = this._container.roomEngine.getRoomCanvasGeometry(_loc3_.session.roomId,_loc3_.session.roomCategory,this._container.getFirstCanvasId());
                     if(_loc5_ != null)
                     {
                        this.updateWidgetPosition();
                        _loc6_ = 0;
                        _loc7_ = 0;
                        _loc8_ = _loc4_.getLocation();
                        _loc9_ = _loc5_.getScreenPoint(_loc8_);
                        if(_loc9_ != null)
                        {
                           _loc6_ = Number(_loc9_.x);
                           _loc7_ = Number(_loc9_.y);
                           _loc15_ = this._container.roomEngine.getRoomCanvasScreenOffset(_loc3_.session.roomId,_loc3_.session.roomCategory,this._container.getFirstCanvasId());
                           if(_loc15_ != null)
                           {
                              _loc6_ += _loc15_.x;
                              _loc7_ += _loc15_.y;
                           }
                        }
                        _loc10_ = this._container.roomSession.userDataManager.getUserDataByIndex(_loc3_.userId);
                        _loc11_ = "";
                        _loc12_ = 0;
                        _loc13_ = null;
                        if(_loc10_ != null)
                        {
                           _loc16_ = _loc10_.figure;
                           if(_loc10_.type == RoomObjectTypeEnum.const_223)
                           {
                              _loc13_ = this.var_343.getValue(this.getPetFigureString(_loc16_)) as BitmapData;
                           }
                           else
                           {
                              _loc13_ = this.var_495.getValue(_loc16_) as BitmapData;
                           }
                           _loc12_ = uint(this.var_721.getValue(_loc16_));
                           if(_loc13_ == null)
                           {
                              if(this._container.avatarRenderManager != null)
                              {
                                 switch(_loc10_.type)
                                 {
                                    case RoomObjectTypeEnum.const_223:
                                       _loc13_ = this.getPetImage(_loc16_);
                                       _loc12_ = uint(this.var_721.getValue(_loc16_));
                                       break;
                                    default:
                                       _loc17_ = this._container.avatarRenderManager.createAvatarImage(_loc16_,AvatarScaleType.const_109,null,this);
                                       if(_loc17_ != null)
                                       {
                                          _loc13_ = _loc17_.getCroppedImage(AvatarSetType.const_52);
                                          _loc18_ = _loc17_.getPartColor("ch");
                                          _loc17_.dispose();
                                          if(_loc18_ != null)
                                          {
                                             _loc12_ = uint(_loc18_.rgb);
                                             this.var_721.add(_loc16_,_loc12_);
                                          }
                                       }
                                 }
                                 if(_loc13_ != null)
                                 {
                                    if(_loc10_.type == RoomObjectTypeEnum.const_223)
                                    {
                                       this.var_343.add(this.getPetFigureString(_loc16_),_loc13_);
                                    }
                                    else
                                    {
                                       this.var_495.add(_loc16_,_loc13_);
                                    }
                                 }
                              }
                           }
                           _loc11_ = _loc10_.name;
                        }
                        _loc14_ = "null";
                        _loc2_ = new RoomWidgetChatUpdateEvent(_loc14_,_loc3_.userId,_loc3_.text,_loc11_,RoomObjectCategoryEnum.const_29,_loc6_,_loc7_,_loc13_,_loc12_,_loc3_.session.roomId,_loc3_.session.roomCategory,_loc3_.chatType,_loc3_.links);
                     }
                  }
               }
         }
         if(this._container != null && this._container.events != null && _loc2_ != null)
         {
            this._container.events.dispatchEvent(_loc2_);
         }
      }
      
      public function update() : void
      {
         this.updateWidgetPosition();
      }
      
      private function updateWidgetPosition() : void
      {
         var _loc5_:* = NaN;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(this._container == null || this._container.roomSession == null || this._container.roomEngine == null || this._container.events == null)
         {
            return;
         }
         var _loc1_:int = this._container.getFirstCanvasId();
         var _loc2_:int = this._container.roomSession.roomId;
         var _loc3_:int = this._container.roomSession.roomCategory;
         var _loc4_:RoomGeometry = this._container.roomEngine.getRoomCanvasGeometry(_loc2_,_loc3_,_loc1_) as RoomGeometry;
         if(_loc4_ != null)
         {
            _loc5_ = 1;
            if(this.var_1360 > 0)
            {
               _loc5_ = Number(_loc4_.scale / this.var_1360);
            }
            if(this.var_900 == null)
            {
               this.var_585.x = 0;
               this.var_585.y = 0;
               this.var_585.z = 0;
               this.var_900 = _loc4_.getScreenPoint(this.var_585);
               this.var_1360 = _loc4_.scale - 10;
            }
            _loc6_ = "";
            _loc7_ = null;
            this.var_585.x = 0;
            this.var_585.y = 0;
            this.var_585.z = 0;
            _loc8_ = _loc4_.getScreenPoint(this.var_585);
            if(_loc8_ != null)
            {
               _loc9_ = this._container.roomEngine.getRoomCanvasScreenOffset(_loc2_,_loc3_,_loc1_);
               if(_loc9_ != null)
               {
                  _loc8_.offset(_loc9_.x,_loc9_.y);
               }
               if(_loc8_.x != this.var_900.x || _loc8_.y != this.var_900.y)
               {
                  _loc10_ = PointMath.sub(_loc8_,PointMath.mul(this.var_900,_loc5_));
                  if(_loc10_.x != 0 || _loc10_.y != 0)
                  {
                     _loc6_ = "null";
                     _loc7_ = new RoomWidgetRoomViewUpdateEvent(_loc6_,null,_loc10_);
                     this._container.events.dispatchEvent(_loc7_);
                  }
                  this.var_900 = _loc8_;
               }
            }
            if(_loc4_.scale != this.var_1360)
            {
               _loc6_ = "null";
               _loc7_ = new RoomWidgetRoomViewUpdateEvent(_loc6_,null,null,_loc4_.scale);
               this._container.events.dispatchEvent(_loc7_);
               this.var_1360 = _loc4_.scale;
            }
         }
      }
      
      public function petImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.var_343)
         {
            _loc2_ = this.var_343.remove(param1) as BitmapData;
            if(_loc2_ != null)
            {
               this.var_1361.push(_loc2_);
            }
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.var_495)
         {
            _loc2_ = this.var_495.remove(param1) as BitmapData;
            if(_loc2_ != null)
            {
               this.var_1361.push(_loc2_);
            }
         }
      }
      
      private function getPetFigureString(param1:String) : String
      {
         var _loc2_:int = this.getPetType(param1);
         if(_loc2_ < 0)
         {
            return param1;
         }
         if(_loc2_ < 8)
         {
            return this._container.avatarRenderManager.getPetFigureString(param1);
         }
         return param1;
      }
      
      private function getPetImage(param1:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = this.getPetType(param1);
         var _loc4_:int = this.getPetRace(param1);
         if(_loc3_ < 0 || _loc4_ < 0)
         {
            return _loc2_;
         }
         if(_loc3_ < 8)
         {
            _loc5_ = this._container.avatarRenderManager.createPetImageFromFigure(param1,AvatarScaleType.const_109,this);
            if(_loc5_ != null)
            {
               _loc2_ = _loc5_.getCroppedImage(AvatarSetType.const_41);
               _loc6_ = _loc5_.getPartColor("pbd");
               _loc5_.dispose();
               if(_loc6_ != null)
               {
                  _loc7_ = uint(_loc6_.rgb);
                  if(_loc7_ != 0)
                  {
                     this.var_721.add(param1,_loc7_);
                  }
               }
            }
         }
         else
         {
            _loc8_ = 0;
            _loc9_ = this._container.roomEngine.getPetImage(_loc3_,_loc4_,new Vector3d(90),32,this,_loc8_);
            if(_loc9_ != null)
            {
               _loc2_ = _loc9_.data;
               if(_loc9_.id > 0)
               {
                  this.var_2136.add(_loc9_.id,param1);
               }
            }
         }
         return _loc2_;
      }
      
      private function getPetType(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = -1;
         if(param1 != null)
         {
            _loc3_ = param1.split(" ");
            if(_loc3_.length >= 2)
            {
               _loc2_ = int(_loc3_[0]);
            }
         }
         return _loc2_;
      }
      
      private function getPetRace(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = -1;
         if(param1 != null)
         {
            _loc3_ = param1.split(" ");
            if(_loc3_.length >= 2)
            {
               _loc2_ = int(_loc3_[1]);
            }
         }
         return _loc2_;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:String = this.var_2136.remove(param1);
         if(_loc3_ != null)
         {
            this.petImageReady(_loc3_);
            if(this.var_343)
            {
               this.var_343.add(_loc3_,param2);
            }
         }
      }
   }
}
