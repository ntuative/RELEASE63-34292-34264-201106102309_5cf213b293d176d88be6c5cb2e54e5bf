package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomData;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomModerationData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetModeratorRoomInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetRoomChatlogMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModerateRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModeratorActionMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   
   public class RoomToolCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_37:ModerationManager;
      
      private var var_414:int;
      
      private var _data:RoomModerationData;
      
      private var _frame:IFrameWindow;
      
      private var var_64:IItemListWindow;
      
      private var _disposed:Boolean;
      
      private var var_1298:IDropMenuWindow;
      
      private var var_542:ITextFieldWindow;
      
      private var var_716:Boolean = true;
      
      private var var_1062:ICheckBoxWindow;
      
      private var var_1595:ICheckBoxWindow;
      
      private var var_1596:ICheckBoxWindow;
      
      public function RoomToolCtrl(param1:ModerationManager, param2:int)
      {
         super();
         this.var_37 = param1;
         this.var_414 = param2;
      }
      
      public static function getLowestPoint(param1:IWindowContainer) : int
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_);
            if(_loc4_.visible)
            {
               _loc2_ = Math.max(_loc2_,_loc4_.y + _loc4_.height);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function moveChildrenToColumn(param1:IWindowContainer, param2:int, param3:int) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.numChildren)
         {
            _loc5_ = param1.getChildAt(_loc4_);
            if(_loc5_ != null && _loc5_.visible && _loc5_.height > 0)
            {
               _loc5_.y = param2;
               param2 += _loc5_.height + param3;
            }
            _loc4_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function show() : void
      {
         this._frame = IFrameWindow(this.var_37.getXmlWindow("roomtool_frame"));
         this.var_37.messageHandler.addRoomInfoListener(this);
         this.var_37.connection.send(new GetModeratorRoomInfoMessageComposer(this.var_414));
         Logger.log("BEGINNING TO SHOW: " + this.var_414);
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1760;
      }
      
      public function getId() : String
      {
         return "" + this.var_414;
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._frame;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.dispose();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_37.messageHandler.removeRoomEnterListener(this);
         if(this._frame != null)
         {
            this._frame.destroy();
            this._frame = null;
         }
         if(this._data != null)
         {
            this._data.dispose();
            this._data = null;
         }
         this.var_37 = null;
         this.var_64 = null;
         this.var_1298 = null;
         this.var_542 = null;
         this.var_1062 = null;
         this.var_1595 = null;
         this.var_1596 = null;
      }
      
      public function onRoomChange() : void
      {
         this.setSendButtonState("send_caution_but");
         this.setSendButtonState("send_message_but");
      }
      
      private function setSendButtonState(param1:String) : void
      {
         var _loc2_:Boolean = this._data != null && this._data.flatId == this.var_37.currentFlatId;
         var _loc3_:IButtonWindow = IButtonWindow(this._frame.findChildByName(param1));
         if(_loc2_ && this.var_37.initMsg.roomAlertPermission)
         {
            _loc3_.enable();
         }
         else
         {
            _loc3_.disable();
         }
      }
      
      public function onRoomInfo(param1:RoomModerationData) : void
      {
         Logger.log("GOT ROOM INFO: " + param1.flatId + ", " + this.var_414);
         if(param1.flatId != this.var_414)
         {
            Logger.log("NOT THE SAME FLAT: " + param1.flatId + ", " + this.var_414);
            return;
         }
         this._data = param1;
         this.populate();
         this.var_37.messageHandler.removeRoomInfoListener(this);
         this._frame.visible = true;
         this.var_37.messageHandler.addRoomEnterListener(this);
         Logger.log("TURNED VISIBLE: " + this._frame.rectangle + ", " + this._frame.visible);
      }
      
      public function populate() : void
      {
         this.var_64 = IItemListWindow(this._frame.findChildByName("list_cont"));
         var _loc1_:IWindow = this._frame.findChildByTag("close");
         _loc1_.procedure = this.onClose;
         this.var_542 = ITextFieldWindow(this._frame.findChildByName("message_input"));
         this.var_542.procedure = this.onInputClick;
         this.var_1298 = IDropMenuWindow(this._frame.findChildByName("msgTemplatesSelect"));
         this.prepareMsgSelect(this.var_1298);
         this.var_1298.procedure = this.onSelectTemplate;
         this.var_1062 = ICheckBoxWindow(this._frame.findChildByName("kick_check"));
         this.var_1595 = ICheckBoxWindow(this._frame.findChildByName("lock_check"));
         this.var_1596 = ICheckBoxWindow(this._frame.findChildByName("changename_check"));
         this.refreshRoomData(this._data.room,"room_cont");
         this.refreshRoomData(this._data.event,"event_cont");
         this.setTxt("owner_name_txt",this._data.ownerName);
         this.setTxt("owner_in_room_txt",!!this._data.ownerInRoom ? "Yes" : "No");
         this.setTxt("user_count_txt","" + this._data.userCount);
         this.setTxt("has_event_txt",!!this._data.event.exists ? "Yes" : "No");
         this._frame.findChildByName("enter_room_but").procedure = this.onEnterRoom;
         this._frame.findChildByName("chatlog_but").procedure = this.onChatlog;
         this._frame.findChildByName("edit_in_hk_but").procedure = this.onEditInHk;
         this._frame.findChildByName("send_caution_but").procedure = this.onSendCaution;
         this._frame.findChildByName("send_message_but").procedure = this.onSendMessage;
         this.var_37.disableButton(this.var_37.initMsg.chatlogsPermission,this._frame,"chatlog_but");
         if(!this.var_37.initMsg.roomKickPermission)
         {
            this.var_1062.disable();
         }
         this._frame.findChildByName("owner_name_txt").procedure = this.onOwnerName;
         this.onRoomChange();
      }
      
      private function disposeItemFromList(param1:IItemListWindow, param2:IWindow) : void
      {
         var _loc3_:IWindow = param1.removeListItem(param2);
         if(_loc3_ != null)
         {
            _loc3_.dispose();
         }
      }
      
      private function refreshRoomData(param1:RoomData, param2:String) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(this.var_64.getListItemByName(param2));
         var _loc4_:IWindowContainer = IWindowContainer(_loc3_.findChildByName("room_data"));
         if(_loc4_ == null)
         {
            _loc4_ = IWindowContainer(this.var_37.getXmlWindow("roomtool_roomdata"));
            _loc3_.addChild(_loc4_);
         }
         if(!param1.exists)
         {
            this.disposeItemFromList(this.var_64,_loc3_);
            this.disposeItemFromList(this.var_64,this.var_64.getListItemByName("event_spacing"));
            return;
         }
         var _loc5_:ITextWindow = ITextWindow(_loc4_.findChildByName("name"));
         _loc5_.text = param1.name;
         _loc5_.height = _loc5_.textHeight + 5;
         var _loc6_:ITextWindow = ITextWindow(_loc4_.findChildByName("desc"));
         _loc6_.text = param1.desc;
         _loc6_.height = _loc6_.textHeight + 5;
         var _loc7_:IWindowContainer = IWindowContainer(_loc4_.findChildByName("tags_cont"));
         var _loc8_:ITextWindow = ITextWindow(_loc7_.findChildByName("tags_txt"));
         _loc8_.text = this.getTagsAsString(param1.tags);
         _loc8_.height = _loc8_.textHeight + 5;
         _loc7_.height = _loc8_.height;
         if(param1.tags.length < 1)
         {
            _loc4_.removeChild(_loc7_);
         }
         moveChildrenToColumn(_loc4_,_loc5_.y,0);
         _loc4_.height = getLowestPoint(_loc4_);
         _loc3_.height = _loc4_.height + 2 * _loc4_.y;
         Logger.log("XXXX: " + _loc3_.height + ", " + _loc4_.height + ", " + _loc5_.height + ", " + _loc6_.height + ", " + _loc7_.height + ", " + _loc8_.height);
      }
      
      private function getTagsAsString(param1:Array) : String
      {
         var _loc3_:* = null;
         var _loc2_:String = "";
         for each(_loc3_ in param1)
         {
            if(_loc2_ == "")
            {
               _loc2_ = _loc3_;
            }
            else
            {
               _loc2_ = _loc2_ + ", " + _loc3_;
            }
         }
         return _loc2_;
      }
      
      private function setTxt(param1:String, param2:String) : void
      {
         var _loc3_:ITextWindow = ITextWindow(this._frame.findChildByName(param1));
         _loc3_.text = param2;
      }
      
      private function onOwnerName(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_37.windowTracker.show(new UserInfoFrameCtrl(this.var_37,this._data.ownerId),this._frame,false,false,true);
      }
      
      private function onEnterRoom(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Enter room clicked");
         this.var_37.goToRoom(this._data.flatId);
      }
      
      private function onChatlog(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_37.windowTracker.show(new ChatlogCtrl(new GetRoomChatlogMessageComposer(0,this._data.flatId),this.var_37,WindowTracker.const_756,this._data.flatId),this._frame,false,false,true);
      }
      
      private function onEditInHk(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Edit in hk clicked");
         this.var_37.openHkPage("roomadmin.url","" + this._data.flatId);
      }
      
      private function onSendCaution(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending caution...");
         this.act(true);
      }
      
      private function onSendMessage(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         this.act(false);
      }
      
      private function act(param1:Boolean) : void
      {
         if(this.var_716 || this.var_542.text == "")
         {
            this.var_37.windowManager.alert("Alert","You must input a message to the user",0,this.onAlertClose);
            return;
         }
         var _loc2_:int = this.determineAction(param1,this.var_1062.isSelected);
         this.var_37.connection.send(new ModeratorActionMessageComposer(ModeratorActionMessageComposer.const_1767,_loc2_,this.var_542.text,"",""));
         if(this.var_1595.isSelected || this.var_1596.isSelected || this.var_1062.isSelected)
         {
            this.var_37.connection.send(new ModerateRoomMessageComposer(this._data.flatId,this.var_1595.isSelected,this.var_1596.isSelected,this.var_1062.isSelected));
         }
         this.dispose();
      }
      
      private function determineAction(param1:Boolean, param2:Boolean) : int
      {
         if(param2)
         {
            return !!param1 ? 0 : int(ModeratorActionMessageComposer.const_1779);
         }
         return !!param1 ? 0 : int(ModeratorActionMessageComposer.const_1692);
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_339)
         {
            return;
         }
         if(!this.var_716)
         {
            return;
         }
         this.var_542.text = "";
         this.var_716 = false;
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:WindowEvent) : void
      {
         param1.dispose();
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + this.var_37.initMsg.roomMessageTemplates.length);
         param1.populate(this.var_37.initMsg.roomMessageTemplates);
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_48)
         {
            return;
         }
         var _loc3_:String = this.var_37.initMsg.roomMessageTemplates[this.var_1298.selection];
         if(_loc3_ != null)
         {
            this.var_716 = false;
            this.var_542.text = _loc3_;
         }
      }
   }
}
