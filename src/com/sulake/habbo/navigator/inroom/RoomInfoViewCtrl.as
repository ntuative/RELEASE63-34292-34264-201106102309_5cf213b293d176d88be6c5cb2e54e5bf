package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_196:IWindowContainer;
      
      private var var_3015:int;
      
      private var var_366:RoomEventViewCtrl;
      
      private var var_369:Timer;
      
      private var var_145:RoomSettingsCtrl;
      
      private var var_271:RoomThumbnailCtrl;
      
      private var var_986:TagRenderer;
      
      private var var_368:IWindowContainer;
      
      private var var_367:IWindowContainer;
      
      private var var_644:IWindowContainer;
      
      private var var_1826:IWindowContainer;
      
      private var var_1823:IWindowContainer;
      
      private var var_1207:IWindowContainer;
      
      private var var_962:ITextWindow;
      
      private var var_989:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_776:ITextWindow;
      
      private var var_1210:ITextWindow;
      
      private var var_987:ITextWindow;
      
      private var var_777:ITextWindow;
      
      private var var_1476:ITextWindow;
      
      private var var_270:IWindowContainer;
      
      private var var_774:IWindowContainer;
      
      private var var_1479:IWindowContainer;
      
      private var var_1825:ITextWindow;
      
      private var var_643:ITextWindow;
      
      private var var_1824:IWindow;
      
      private var var_1205:IContainerButtonWindow;
      
      private var var_1208:IContainerButtonWindow;
      
      private var var_1209:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1206:IContainerButtonWindow;
      
      private var var_1480:IButtonWindow;
      
      private var var_1478:IButtonWindow;
      
      private var var_1475:IButtonWindow;
      
      private var var_775:IWindowContainer;
      
      private var var_1204:ITextWindow;
      
      private var var_988:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_778:IButtonWindow;
      
      private var var_1477:Boolean = false;
      
      private const const_805:int = 75;
      
      private const const_959:int = 3;
      
      private const const_817:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_366 = new RoomEventViewCtrl(this._navigator);
         this.var_145 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_271 = new RoomThumbnailCtrl(this._navigator);
         this.var_986 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_145);
         this.var_369 = new Timer(6000,1);
         this.var_369.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_369)
         {
            this.var_369.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_369.reset();
            this.var_369 = null;
         }
         this._navigator = null;
         this.var_366 = null;
         this.var_145 = null;
         this.var_271 = null;
         if(this.var_986)
         {
            this.var_986.dispose();
            this.var_986 = null;
         }
         this.var_196 = null;
         this.var_368 = null;
         this.var_367 = null;
         this.var_644 = null;
         this.var_1826 = null;
         this.var_1823 = null;
         this.var_1207 = null;
         this.var_962 = null;
         this.var_989 = null;
         this._ownerName = null;
         this.var_776 = null;
         this.var_1210 = null;
         this.var_987 = null;
         this.var_777 = null;
         this.var_1476 = null;
         this.var_270 = null;
         this.var_774 = null;
         this.var_1479 = null;
         this.var_1825 = null;
         this.var_643 = null;
         this.var_1824 = null;
         this.var_1205 = null;
         this.var_1208 = null;
         this.var_1209 = null;
         this._remFavouriteButton = null;
         this.var_1206 = null;
         this.var_1480 = null;
         this.var_1478 = null;
         this.var_1475 = null;
         this.var_775 = null;
         this.var_1204 = null;
         this.var_988 = null;
         this._buttons = null;
         this.var_778 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_369.reset();
         this.var_366.active = true;
         this.var_145.active = false;
         this.var_271.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_369.reset();
         this.var_145.load(param1);
         this.var_145.active = true;
         this.var_366.active = false;
         this.var_271.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_145.active = true;
         this.var_366.active = false;
         this.var_271.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_369.reset();
         this.var_145.active = false;
         this.var_366.active = false;
         this.var_271.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this.var_1477 = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_369.reset();
         this.var_366.active = false;
         this.var_145.active = false;
         this.var_271.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_959;
         this._window.y = this.const_805;
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_196,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_196.height = Util.getLowestPoint(this.var_196);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_817;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_368);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_145.refresh(this.var_368);
         this.var_271.refresh(this.var_368);
         Util.moveChildrenToColumn(this.var_368,["room_details","room_buttons"],0,2);
         this.var_368.height = Util.getLowestPoint(this.var_368);
         this.var_368.visible = true;
         Logger.log("XORP: " + this.var_367.visible + ", " + this.var_1207.visible + ", " + this.var_644.visible + ", " + this.var_644.rectangle + ", " + this.var_368.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_270);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_366.refresh(this.var_270);
         if(Util.hasVisibleChildren(this.var_270) && !(this.var_145.active || this.var_271.active))
         {
            Util.moveChildrenToColumn(this.var_270,["event_details","event_buttons"],0,2);
            this.var_270.height = Util.getLowestPoint(this.var_270);
            this.var_270.visible = true;
         }
         else
         {
            this.var_270.visible = false;
         }
         Logger.log("EVENT: " + this.var_270.visible + ", " + this.var_270.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "UserTypingMessageEvent";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_145.active && !this.var_271.active && !this.var_366.active)
         {
            this.var_775.visible = true;
            this.var_988.text = this.getEmbedData();
         }
         else
         {
            this.var_775.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_145.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_778)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_778.visible = _loc1_;
            if(this.var_1477)
            {
               this.var_778.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_778.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_145.active || this.var_271.active)
         {
            return;
         }
         this.var_962.text = param1.roomName;
         this.var_962.height = this.var_962.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_776.text = param1.description;
         this.var_986.refreshTags(this.var_367,param1.tags);
         this.var_776.visible = false;
         if(param1.description != "")
         {
            this.var_776.height = this.var_776.textHeight + 5;
            this.var_776.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1208,"facebook_logo_small",_loc3_,null,0);
         this.var_1208.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1205,"thumb_up",_loc4_,null,0);
         this.var_1205.visible = _loc4_;
         this.var_777.visible = !_loc4_;
         this.var_1476.visible = !_loc4_;
         this.var_1476.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_367,"home",param2,null,0);
         this._navigator.refreshButton(this.var_367,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_367,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_962.y,0);
         this.var_367.visible = true;
         this.var_367.height = Util.getLowestPoint(this.var_367);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_367.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_145.active || this.var_271.active)
         {
            return;
         }
         this.var_989.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_989.height = this.var_989.textHeight + 5;
         this.var_1210.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1210.height = this.var_1210.textHeight + 5;
         Util.moveChildrenToColumn(this.var_644,["public_space_name","public_space_desc"],this.var_989.y,0);
         this.var_644.visible = true;
         this.var_644.height = Math.max(86,Util.getLowestPoint(this.var_644));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_366.active)
         {
            return;
         }
         this.var_1825.text = param1.eventName;
         this.var_643.text = param1.eventDescription;
         this.var_986.refreshTags(this.var_774,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_643.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_643.height = this.var_643.textHeight + 5;
            this.var_643.y = Util.getLowestPoint(this.var_774) + 2;
            this.var_643.visible = true;
         }
         this.var_774.visible = true;
         this.var_774.height = Util.getLowestPoint(this.var_774);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_145.active || this.var_271.active)
         {
            return;
         }
         this.var_1480.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1209.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1206.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1207.visible = Util.hasVisibleChildren(this.var_1207);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_366.active)
         {
            return;
         }
         this.var_1478.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1475.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1479.visible = Util.hasVisibleChildren(this.var_1479);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_196 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_368 = IWindowContainer(this.find("room_info"));
         this.var_367 = IWindowContainer(this.find("room_details"));
         this.var_644 = IWindowContainer(this.find("public_space_details"));
         this.var_1826 = IWindowContainer(this.find("owner_name_cont"));
         this.var_1823 = IWindowContainer(this.find("rating_cont"));
         this.var_1207 = IWindowContainer(this.find("room_buttons"));
         this.var_962 = ITextWindow(this.find("room_name"));
         this.var_989 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_776 = ITextWindow(this.find("room_desc"));
         this.var_1210 = ITextWindow(this.find("public_space_desc"));
         this.var_987 = ITextWindow(this.find("owner_caption"));
         this.var_777 = ITextWindow(this.find("rating_caption"));
         this.var_1476 = ITextWindow(this.find("rating_txt"));
         this.var_270 = IWindowContainer(this.find("event_info"));
         this.var_774 = IWindowContainer(this.find("event_details"));
         this.var_1479 = IWindowContainer(this.find("event_buttons"));
         this.var_1825 = ITextWindow(this.find("event_name"));
         this.var_643 = ITextWindow(this.find("event_desc"));
         this.var_1208 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1205 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_1824 = this.find("staff_pick_button");
         this.var_1209 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1206 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1480 = IButtonWindow(this.find("room_settings_button"));
         this.var_1478 = IButtonWindow(this.find("create_event_button"));
         this.var_1475 = IButtonWindow(this.find("edit_event_button"));
         this.var_775 = IWindowContainer(this.find("embed_info"));
         this.var_1204 = ITextWindow(this.find("embed_info_txt"));
         this.var_988 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_778 = IButtonWindow(this.find("zoom_button"));
         this.addMouseClickListener(this.var_1209,this.onAddFavouriteClick);
         this.addMouseClickListener(this._remFavouriteButton,this.onRemoveFavouriteClick);
         this.addMouseClickListener(this.var_1480,this.onRoomSettingsClick);
         this.addMouseClickListener(this.var_1206,this.onMakeHomeClick);
         this.addMouseClickListener(this.var_1478,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1475,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_988,this.onEmbedSrcClick);
         this.addMouseClickListener(this.var_1205,this.onThumbUp);
         this.addMouseClickListener(this.var_1824,this.onStaffPick);
         this.addMouseClickListener(this.var_1208,this.onFacebookLike);
         this.addMouseClickListener(this.var_778,this.onZoomClick);
         this._navigator.refreshButton(this.var_1209,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1206,"home",true,null,0);
         this.addMouseClickListener(this._window.findChildByTag("close"),this.onCloseButtonClick);
         this.addMouseOverListener(this.var_368,this.onHover);
         this.addMouseOverListener(this.var_270,this.onHover);
         this.var_987.width = this.var_987.textWidth;
         Util.moveChildrenToRow(this.var_1826,["owner_caption","owner_name"],this.var_987.x,this.var_987.y,3);
         this.var_777.width = this.var_777.textWidth;
         Util.moveChildrenToRow(this.var_1823,["rating_caption","rating_txt"],this.var_777.x,this.var_777.y,3);
         this.var_1204.height = this.var_1204.textHeight + 5;
         Util.moveChildrenToColumn(this.var_775,["embed_info_txt","embed_src_txt"],this.var_1204.y,2);
         this.var_775.height = Util.getLowestPoint(this.var_775) + 5;
         this.var_3015 = this._window.y + this._window.height;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function addMouseOverListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,param2);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc2_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc2_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc2_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc2_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc2_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent) : void
      {
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent) : void
      {
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent) : void
      {
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onFacebookLike(param1:WindowEvent) : void
      {
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent) : void
      {
         this.var_988.setSelection(0,this.var_988.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent) : void
      {
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.const_364));
         this.var_1477 = !this.var_1477;
         this.refreshButtons();
      }
      
      private function onHover(param1:WindowEvent) : void
      {
         this.var_369.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_145 != null)
         {
            this.var_145.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
