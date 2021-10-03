package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.FriendRequest;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendbar.events.NotificationEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.tabs.AddFriendsTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.ITab;
   import com.sulake.habbo.friendbar.view.tabs.Tab;
   import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
   import com.sulake.habbo.friendbar.view.utils.FriendListIcon;
   import com.sulake.habbo.friendbar.view.utils.Icon;
   import com.sulake.habbo.friendbar.view.utils.MessengerIcon;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_1668:int = 127;
      
      private static const const_474:int = 1;
      
      private static const const_1664:int = 2;
      
      private static const const_704:int = 3;
      
      private static const const_1126:int = 3;
      
      private static const const_1671:Boolean = false;
      
      private static const const_705:int = 3;
      
      private static const const_1673:String = "arrow";
      
      private static const const_1665:String = "left";
      
      private static const const_1662:String = "right";
      
      private static const const_1663:String = "bar_xml";
      
      private static const const_1666:String = "toggle_xml";
      
      private static const const_75:String = "container";
      
      private static const const_1124:String = "wrapper";
      
      private static const const_1667:String = "border";
      
      private static const const_706:String = "list";
      
      private static const const_1000:String = "header";
      
      private static const const_1006:String = "canvas";
      
      private static const const_1125:String = "icon";
      
      private static const PIECES:String = "pieces";
      
      private static const const_1674:String = "button_left";
      
      private static const const_1661:String = "button_right";
      
      private static const const_1670:String = "button_left_page";
      
      private static const const_1669:String = "button_right_page";
      
      private static const const_1660:String = "button_left_end";
      
      private static const const_1672:String = "button_right_end";
      
      private static const const_1386:String = "button_close";
      
      private static const const_1675:String = "button_open";
      
      private static const const_1659:String = "messenger";
      
      private static const const_1127:String = "friendlist";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_901:IAvatarRenderManager;
      
      private var var_67:IHabboFriendBarData;
      
      private var var_1110:IHabboLocalizationManager;
      
      private var var_51:IWindowContainer;
      
      private var var_230:IWindowContainer;
      
      private var var_98:Vector.<ITab>;
      
      private var var_1364:ITab;
      
      private var var_1109:int = -1;
      
      private var _startIndex:int = 0;
      
      private var var_1657:TextCropper;
      
      private var var_586:FriendListIcon;
      
      private var var_418:MessengerIcon;
      
      private var var_1658:Boolean = true;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1657 = new TextCropper();
         this.var_98 = new Vector.<ITab>();
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationAvailable);
      }
      
      public function setMessengerIconNotify(param1:Boolean) : void
      {
         if(this.var_418)
         {
            this.var_418.notify(param1);
         }
      }
      
      public function setFriendListIconNotify(param1:Boolean) : void
      {
         if(this.var_586)
         {
            this.var_586.notify(param1);
         }
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_418)
            {
               this.var_418.dispose();
               this.var_418 = null;
            }
            if(this.var_586)
            {
               this.var_586.dispose();
               this.var_586 = null;
            }
            if(this.var_230)
            {
               this.var_230.dispose();
               this.var_230 = null;
            }
            if(this.var_51)
            {
               this.var_51.dispose();
               this.var_51 = null;
            }
            while(this.var_98.length > 0)
            {
               ITab(this.var_98.pop()).dispose();
            }
            if(this.var_67)
            {
               if(!this.var_67.disposed)
               {
                  if(this.var_67.events)
                  {
                     this.var_67.events.removeEventListener(FriendBarUpdateEvent.const_847,this.onRefreshView);
                     this.var_67.events.removeEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
                     this.var_67.events.removeEventListener(FriendRequestEvent.const_954,this.onFriendRequestUpdate);
                     this.var_67.events.removeEventListener(NewMessageEvent.const_811,this.onNewInstantMessage);
                     this.var_67.events.removeEventListener(NotificationEvent.const_863,this.onFriendNotification);
                  }
                  this.var_67.release(new IIDHabboFriendBarData());
                  this.var_67 = null;
               }
            }
            if(this._windowManager)
            {
               if(!this._windowManager.disposed)
               {
                  this._windowManager.getWindowContext(const_474).getDesktopWindow().removeEventListener(WindowEvent.const_40,this.onDesktopResized);
                  this._windowManager.release(new IIDHabboWindowManager());
                  this._windowManager = null;
               }
            }
            if(this.var_901)
            {
               if(!this.var_901.disposed)
               {
                  this.var_901.release(new IIDAvatarRenderManager());
                  this.var_901 = null;
               }
            }
            if(this.var_1110)
            {
               if(!this.var_1110.disposed)
               {
                  this.var_1110.release(new IIDHabboLocalizationManager());
                  this.var_1110 = null;
               }
            }
            this.var_1657.dispose();
            this.var_1657 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_51)
         {
            this.var_51.visible = param1;
            this.var_51.activate();
         }
         if(this.var_230)
         {
            this.var_230.visible = !param1;
            if(this.var_51)
            {
               this.var_230.x = this.var_51.x;
               this.var_230.y = this.var_51.y;
               this.var_230.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_51 && this.var_51.visible;
      }
      
      public function populate() : void
      {
         var _loc5_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc1_:int = this.var_1109;
         this.deSelect(false);
         var _loc2_:IWindowContainer = this.var_51.findChildByName(const_75) as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_706) as IItemListWindow;
         _loc3_.autoArrangeItems = false;
         var _loc4_:int = _loc3_.numListItems;
         _loc5_ = _loc4_;
         while(_loc5_ > 0)
         {
            _loc3_.removeListItemAt(_loc5_ - 1);
            _loc5_--;
         }
         while(this.var_98.length > 0)
         {
            this.var_98.pop().recycle();
         }
         var _loc6_:int = this.var_67.numFriends;
         var _loc7_:int = this.var_67.numFriendRequests;
         var _loc8_:int = this.maxNumOfTabsVisible;
         var _loc9_:int = _loc6_ + (!!this.var_1658 ? 1 : 0) + (_loc7_ > 0 ? 1 : 0);
         var _loc10_:int = Math.min(_loc8_,_loc9_);
         if(this._startIndex + _loc10_ > _loc9_)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc10_ - _loc9_));
         }
         var _loc11_:int = this._startIndex;
         _loc5_ = _loc11_;
         while(_loc5_ < _loc6_ + _loc11_)
         {
            if(_loc5_ >= _loc6_)
            {
               break;
            }
            if(this.var_98.length >= _loc8_)
            {
               break;
            }
            _loc13_ = this.var_67.getFriendAt(_loc5_);
            _loc14_ = FriendEntityTab.allocate(_loc13_);
            this.var_98.push(_loc14_);
            _loc3_.addListItem(_loc14_.window);
            _loc5_++;
         }
         if(this.var_1658)
         {
            if(this.var_98.length < _loc8_)
            {
               _loc15_ = 1;
               if(this.var_98.length + _loc15_ < const_705)
               {
                  _loc15_ = Math.min(_loc8_ - this.var_98.length,const_705 - this.var_98.length);
               }
               _loc9_ = _loc6_ + _loc15_ + (_loc7_ > 0 ? 1 : 0);
               while(_loc15_-- > 0)
               {
                  _loc16_ = AddFriendsTab.allocate();
                  _loc3_.addListItem(_loc16_.window);
                  this.var_98.push(_loc16_);
               }
            }
         }
         _loc3_.autoArrangeItems = true;
         if(_loc1_ > -1)
         {
            this.selectFriendEntity(_loc1_);
         }
         _loc2_.visible = this.var_98.length > 0;
         this.toggleArrowButtons(this.var_98.length < _loc9_,this._startIndex != 0,this._startIndex + this.var_98.length < _loc9_);
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_98.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_98[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_67 = param2 as IHabboFriendBarData;
         this.var_67.events.addEventListener(FriendBarUpdateEvent.const_847,this.onRefreshView);
         this.var_67.events.addEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
         this.var_67.events.addEventListener(FriendRequestEvent.const_954,this.onFriendRequestUpdate);
         this.var_67.events.addEventListener(NewMessageEvent.const_811,this.onNewInstantMessage);
         this.var_67.events.addEventListener(NotificationEvent.const_863,this.onFriendNotification);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onLocalizationAvailable(param1:IID, param2:IHabboLocalizationManager) : void
      {
         this.var_1110 = param2 as IHabboLocalizationManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_51 && !this.var_51.disposed;
      }
      
      private function buildUserInterface() : void
      {
         var _loc2_:* = null;
         Tab.var_1118 = this.var_67;
         Tab.var_1385 = this;
         Tab.ASSETS = assets;
         Tab.WINDOWING = this._windowManager;
         Tab.var_2165 = this.var_1110;
         Tab.var_2199 = this.var_1657;
         Token.WINDOWING = this._windowManager;
         Token.ASSETS = assets;
         var _loc1_:IAsset = assets.getAssetByName(const_1663);
         this.var_51 = this._windowManager.buildFromXML(_loc1_.content as XML,const_474) as IWindowContainer;
         this.var_51.x = const_704;
         this.var_51.y = this.var_51.parent.height - (this.var_51.height + const_1664);
         this.var_51.width = this.var_51.parent.width - (const_704 + const_1126);
         this.var_51.setParamFlag(WindowParam.const_240,true);
         this.var_51.procedure = this.barWindowEventProc;
         if(const_1671)
         {
            _loc1_ = assets.getAssetByName(const_1666);
            this.var_230 = this._windowManager.buildFromXML(_loc1_.content as XML,const_474) as IWindowContainer;
            this.var_230.x = this.var_51.x;
            this.var_230.y = this.var_51.y;
            this.var_230.setParamFlag(WindowParam.const_240,true);
            this.var_230.visible = false;
            this.var_230.procedure = this.toggleWindowEventProc;
         }
         _loc2_ = IWindowContainer(this.var_51.findChildByName(const_1127));
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
         this.var_586 = new FriendListIcon(assets,_loc2_.getChildByName(const_1125) as IBitmapWrapperWindow);
         _loc2_ = IWindowContainer(this.var_51.findChildByName(const_1659));
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
         this.var_418 = new MessengerIcon(assets,_loc2_.getChildByName(const_1125) as IBitmapWrapperWindow);
         this.var_418.enable(false);
         this.visible = true;
         this._windowManager.getWindowContext(const_474).getDesktopWindow().addEventListener(WindowEvent.const_40,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_901 = param2 as IAvatarRenderManager;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_loc2_)
         {
            if(this.var_901)
            {
               _loc3_ = this.var_901.createAvatarImage(param1,AvatarScaleType.const_60,null,this);
               if(_loc3_)
               {
                  _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_52);
                  _loc3_.dispose();
               }
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_51.findChildByName(const_706) as IItemListWindow;
         var _loc4_:int = this.var_67.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_67.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(PIECES) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_1000));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.findChildByName(const_1006) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_;
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendSelected(param1:IFriendEntity) : Boolean
      {
         return this.var_1109 == param1.id;
      }
      
      public function selectTab(param1:ITab, param2:Boolean) : void
      {
         if(!param1.selected)
         {
            if(this.var_1364)
            {
               this.deSelect(true);
            }
            param1.select(param2);
            this.var_1364 = param1;
            if(param1 is FriendEntityTab)
            {
               this.var_1109 = FriendEntityTab(param1).friend.id;
            }
         }
      }
      
      public function selectFriendEntity(param1:int) : void
      {
         if(this.var_1109 == param1)
         {
            return;
         }
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1);
         if(_loc2_)
         {
            this.selectTab(_loc2_,false);
            this.var_1109 = param1;
         }
      }
      
      public function deSelect(param1:Boolean) : void
      {
         if(this.var_1364)
         {
            this.var_1364.deselect(param1);
            this.var_1364 = null;
            this.var_1109 = -1;
         }
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate(true);
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = !!event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = !!event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         this._windowManager.notify(title,text,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         },HabboAlertDialogFlag.const_549);
      }
      
      private function onFriendRequestUpdate(param1:FriendRequestEvent) : void
      {
         if(this.var_586)
         {
            this.var_586.notify(this.var_67.numFriendRequests > 0);
         }
         this.populate();
      }
      
      private function onNewInstantMessage(param1:NewMessageEvent) : void
      {
         if(this.var_418)
         {
            if(param1.notify)
            {
               this.var_418.notify(true);
            }
            else
            {
               this.var_418.enable(true);
            }
         }
      }
      
      private function onFriendNotification(param1:NotificationEvent) : void
      {
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1.var_2981);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.addNotificationToken(param1.notification,true);
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.type == WindowMouseEvent.const_45)
         {
            _loc3_ = this._startIndex;
            _loc4_ = this.var_67.numFriends + (!!this.var_1658 ? 1 : 0) + (this.var_67.numFriendRequests > 0 ? 1 : 0);
            switch(param2.name)
            {
               case const_1674:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1670:
                  _loc3_ = Math.max(0,this._startIndex - this.maxNumOfTabsVisible);
                  break;
               case const_1660:
                  _loc3_ = 0;
                  break;
               case const_1661:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + 1));
                  break;
               case const_1669:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + this.maxNumOfTabsVisible));
                  break;
               case const_1672:
                  _loc3_ = Math.max(0,_loc4_ - this.maxNumOfTabsVisible);
                  break;
               case const_1386:
                  this.visible = false;
                  break;
               case const_1667:
                  this.deSelect(true);
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelect(true);
               this._startIndex = _loc3_;
               this.resizeAndPopulate(true);
            }
         }
         if(param1.type == WindowEvent.const_585)
         {
            this.deSelect(true);
         }
      }
      
      private function onIconMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:Icon = param1.window.name == const_1127 ? this.var_586 : this.var_418;
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(_loc2_ is FriendListIcon)
               {
                  this.var_67.toggleFriendList();
                  _loc2_.notify(false);
               }
               else if(_loc2_ is MessengerIcon)
               {
                  this.var_67.toggleMessenger();
                  _loc2_.notify(false);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc2_.hover(true);
               break;
            case WindowMouseEvent.const_25:
               _loc2_.hover(false);
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_230.visible)
         {
            if(param1.type == WindowMouseEvent.const_45)
            {
               switch(param2.name)
               {
                  case const_1675:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:IWindowContainer = this.var_51.findChildByName(const_1124) as IWindowContainer;
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1673,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            _loc4_.visible = param1;
         }
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1665,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            if(param2)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1662,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            if(param3)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!disposed)
         {
            if(this.var_51)
            {
               this.var_51.width = this.var_51.parent.width - (const_704 + const_1126);
               if(!param1)
               {
                  _loc2_ = this.maxNumOfTabsVisible;
                  if(_loc2_ < this.var_98.length)
                  {
                     param1 = true;
                  }
                  else if(_loc2_ > this.var_98.length)
                  {
                     if(this.var_98.length < const_705)
                     {
                        param1 = true;
                     }
                     else if(this.var_98.length < this.var_67.numFriends + (!!this.var_1658 ? 1 : 0))
                     {
                        param1 = true;
                     }
                     else if(this.numFriendEntityTabsVisible < this.var_67.numFriends)
                     {
                        param1 = true;
                     }
                  }
               }
               if(param1)
               {
                  this.populate();
               }
            }
         }
      }
      
      private function get numFriendEntityTabsVisible() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.var_98.length;
         while(_loc2_-- > 0)
         {
            if(this.var_98[_loc2_] is FriendEntityTab)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IWindowContainer = this.var_51.findChildByName(const_75) as IWindowContainer;
         var _loc2_:IWindowContainer = _loc1_.getChildByName(const_1124) as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_706) as IItemListWindow;
         var _loc4_:int = _loc2_.width - _loc3_.width;
         return (_loc1_.width - _loc4_) / (const_1668 + _loc3_.spacing);
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate(false);
      }
   }
}
