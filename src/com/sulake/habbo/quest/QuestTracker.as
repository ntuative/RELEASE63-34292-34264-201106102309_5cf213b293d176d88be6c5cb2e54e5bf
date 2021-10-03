package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.StartCampaignMessageComposer;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class QuestTracker implements IDisposable
   {
      
      private static const const_311:int = 0;
      
      private static const const_1068:int = 1;
      
      private static const const_1070:int = 2;
      
      private static const const_1067:int = 3;
      
      private static const const_1076:int = 4;
      
      private static const const_1069:int = 5;
      
      private static const const_1072:int = 6;
      
      private static const const_1537:int = 135;
      
      private static const const_1532:int = 72;
      
      private static const const_1535:int = 4;
      
      private static const const_1074:Array = [-2,-3,-2,0,2,3,2,0,2,1,0,1];
      
      private static const const_1066:Array = [1,1,2,2,3,3,4,4,5,5,6,6,4];
      
      private static const const_1073:int = 6;
      
      private static const const_1540:int = 4;
      
      private static const const_686:int = 2;
      
      private static const const_1071:int = 200;
      
      private static const const_310:Array = ["a","b","c","d"];
      
      private static const const_1075:int = 10000;
      
      private static const const_1536:int = 0;
      
      private static const const_685:int = -1;
      
      private static const const_1533:Point = new Point(10,87);
      
      private static const const_1534:int = 162;
      
      private static const const_1541:Number = 0.01;
      
      private static const const_1538:Number = 100;
      
      private static const const_1539:int = 1000;
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_219:QuestMessageData;
      
      private var _window:IWindowContainer;
      
      private var var_550:Timer;
      
      private var var_808:ProgressBar;
      
      private var var_328:int = 0;
      
      private var var_1025:int = 0;
      
      private var var_1518:int = 0;
      
      private var var_1246:int = -1;
      
      private var var_809:int = -1;
      
      private var var_1024:int = -1;
      
      private var var_1247:int;
      
      private var var_1519:int;
      
      private var var_2602:Boolean;
      
      public function QuestTracker(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this.var_219 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_550)
         {
            this.var_550.stop();
            this.var_550 = null;
         }
         if(this.var_808)
         {
            this.var_808.dispose();
            this.var_808 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         if(this._window)
         {
            this.clearPrompt();
            this.var_219 = param1;
            this.var_1025 = 0;
            this.refreshTrackerDetails();
            this.var_1246 = 0;
            this.var_328 = const_1067;
         }
      }
      
      public function onQuestCancelled() : void
      {
         this.var_219 = null;
         if(this._window)
         {
            this.clearPrompt();
            this.var_808.refresh(0,100,-1);
            this.var_328 = const_1070;
         }
      }
      
      public function onRoomEnter() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Boolean = Boolean(parseInt(this._questEngine.configuration.getKey("new.identity","0")));
         var _loc2_:String = this.getDefaultCampaign();
         if(this.var_550 == null && _loc1_ && _loc2_ != "")
         {
            _loc3_ = int(this._questEngine.configuration.getKey("questing.startQuestDelayInSeconds","30"));
            this.var_550 = new Timer(_loc3_ * 1000,1);
            this.var_550.addEventListener(TimerEvent.TIMER,this.onStartQuestTimer);
            this.var_550.start();
            Logger.log("Initialized start quest timer with period: " + _loc3_);
         }
      }
      
      public function onRoomExit() : void
      {
         if(this._window != null && this._window.visible)
         {
            this._window.findChildByName("more_info_txt").visible = false;
            this._window.findChildByName("more_info_region").visible = false;
         }
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         if(param1.waitPeriodSeconds > 0)
         {
            return;
         }
         var _loc2_:Boolean = this._window && this._window.visible;
         this.var_219 = param1;
         this.prepareTrackerWindow();
         this.refreshTrackerDetails();
         this.refreshPromptFrames();
         this.hideSuccessFrames();
         if(_loc2_)
         {
            this.setupPrompt(this.var_809,const_1540,false);
         }
         else
         {
            this._window.x = this._window.desktop.width;
            this.var_328 = const_1068;
            this.setupPrompt(const_1536,const_686,false);
         }
         this._window.visible = true;
         this._questEngine.notifications.setQuestTrackerHeight(const_1537);
      }
      
      private function refreshPromptFrames() : void
      {
         if(!this._questEngine.isQuestWithPrompts(this.var_219))
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < const_310.length)
         {
            this._questEngine.setupPromptFrameImage(this._window,this.var_219,const_310[_loc1_]);
            _loc1_++;
         }
      }
      
      private function prepareTrackerWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._questEngine.getXmlWindow("QuestTracker"));
         this._window.y = const_1532;
         this._window.findChildByName("more_info_region").procedure = this.onMoreInfo;
         new PendingImage(this._questEngine,this._window.findChildByName("quest_tracker_bg"),"quest_tracker_with_bar");
         var _loc1_:int = 1;
         while(_loc1_ <= const_1073)
         {
            new PendingImage(this._questEngine,this.getSuccessFrame(_loc1_),"checkanim" + _loc1_);
            _loc1_++;
         }
         this.hideSuccessFrames();
         this.var_808 = new ProgressBar(this._questEngine,IWindowContainer(this._window.findChildByName("content_cont")),const_1534,"quests.tracker.progress",false,const_1533);
      }
      
      private function hideSuccessFrames() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ <= const_1073)
         {
            this.getSuccessFrame(_loc1_).visible = false;
            _loc1_++;
         }
      }
      
      private function hidePromptFrames() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < const_310.length)
         {
            this.getPromptFrame(const_310[_loc1_]).visible = false;
            _loc1_++;
         }
      }
      
      private function getSuccessFrame(param1:int) : IBitmapWrapperWindow
      {
         return IBitmapWrapperWindow(this._window.findChildByName("success_pic_" + param1));
      }
      
      private function getPromptFrame(param1:String) : IBitmapWrapperWindow
      {
         return IBitmapWrapperWindow(this._window.findChildByName("prompt_pic_" + param1));
      }
      
      private function refreshTrackerDetails() : void
      {
         this._questEngine.localization.registerParameter("quests.tracker.caption","quest_name",this._questEngine.getQuestName(this.var_219));
         this._window.findChildByName("desc_txt").caption = this._questEngine.getQuestDesc(this.var_219);
         this._window.findChildByName("more_info_txt").visible = this._questEngine.currentlyInRoom;
         this._window.findChildByName("more_info_region").visible = this._questEngine.currentlyInRoom;
         var _loc1_:int = Math.round(100 * this.var_219.completedSteps / this.var_219.totalSteps);
         this.var_808.refresh(_loc1_,100,this.var_219.id);
         this._questEngine.setupQuestImage(this._window,this.var_219);
      }
      
      private function onMoreInfo(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.questController.questDetails.showDetails(this.var_219);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._window == null)
         {
            return;
         }
         this.var_808.updateView();
         switch(this.var_328)
         {
            case const_1068:
               _loc2_ = this.getDefaultLocationX();
               _loc3_ = this._window.x - _loc2_;
               if(_loc3_ > 0)
               {
                  _loc4_ = Math.max(1,Math.round(_loc3_ * param1 * const_1541));
                  this._window.x -= _loc4_;
               }
               else
               {
                  this.var_328 = const_311;
                  this._window.x = _loc2_;
               }
               break;
            case const_1070:
               _loc2_ = this._window.desktop.width;
               _loc3_ = _loc2_ - this._window.x;
               if(_loc3_ > 0)
               {
                  _loc4_ = Math.max(1,Math.round(param1 * const_1538 / _loc3_));
                  this._window.x += _loc4_;
               }
               else
               {
                  this.var_328 = const_311;
                  this._window.x = _loc2_;
                  this._window.visible = false;
                  this._questEngine.notifications.setQuestTrackerHeight(0);
               }
               break;
            case const_1067:
               this.hideSuccessFrames();
               this.getSuccessFrame(const_1066[this.var_1246]).visible = true;
               ++this.var_1246;
               if(this.var_1246 >= const_1066.length)
               {
                  this.var_328 = const_1069;
                  this.var_1518 = const_1539;
               }
               break;
            case const_1072:
               this.setQuestImageVisible(false);
               this.hidePromptFrames();
               this.var_1247 -= param1;
               this.getPromptFrame(const_310[this.var_1024]).visible = true;
               if(this.var_1247 < 0)
               {
                  this.var_1247 = const_1071;
                  ++this.var_1024;
                  if(this.var_1024 >= const_310.length)
                  {
                     this.var_1024 = 0;
                     --this.var_1519;
                     if(this.var_1519 < 1)
                     {
                        this.setupPrompt(const_1075,const_686,true);
                        this.var_328 = const_311;
                     }
                  }
               }
               break;
            case const_1076:
               if(this.var_1025 >= -1)
               {
                  this._window.x = this.getDefaultLocationX();
                  this.var_328 = const_311;
                  this.setupPrompt(const_1075,const_686,false);
               }
               else
               {
                  this._window.x = this.getDefaultLocationX() + const_1074[this.var_1025];
                  ++this.var_1025;
               }
               break;
            case const_1069:
               this.var_1518 -= param1;
               if(this.var_1518 < 0)
               {
                  this.var_328 = const_311;
                  this._window.visible = false;
               }
               break;
            case const_311:
               if(this.var_809 != const_685)
               {
                  this.var_809 -= param1;
                  if(this.var_809 < 0)
                  {
                     this.var_809 = const_685;
                     if(this.var_219 != null && this._questEngine.isQuestWithPrompts(this.var_219))
                     {
                        if(this.var_2602)
                        {
                           this.startNudge();
                        }
                        else
                        {
                           this.var_328 = const_1072;
                           this.var_1024 = 0;
                           this.var_1247 = const_1071;
                        }
                     }
                  }
               }
         }
      }
      
      private function getDefaultLocationX() : int
      {
         return this._window.desktop.width - this._window.width - const_1535;
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      private function onStartQuestTimer(param1:TimerEvent) : void
      {
         if(this.hasBlockingWindow())
         {
            Logger.log("Quest start blocked. Waiting some more");
            this.var_550.reset();
            this.var_550.start();
         }
         else
         {
            this._questEngine.questController.questDetails.openForNextQuest = this._questEngine.configuration.getKey("questing.showDetailsForNextQuest") == "UserTypingMessageEvent";
            this._questEngine.send(new StartCampaignMessageComposer(this.getDefaultCampaign(),this._questEngine.configuration.getBoolean("questing.useWing",false)));
         }
      }
      
      private function getDefaultCampaign() : String
      {
         var _loc1_:String = this._questEngine.configuration.getKey("questing.defaultCampaign");
         return _loc1_ == null ? "" : _loc1_;
      }
      
      private function hasBlockingWindow() : Boolean
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ <= 2)
         {
            _loc2_ = this._questEngine.windowManager.getDesktop(_loc1_);
            if(_loc2_ != null && this.hasBlockingWindowInLayer(_loc2_))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      private function hasBlockingWindowInLayer(param1:IWindowContainer) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_);
            if(_loc3_ != null && _loc3_.visible)
            {
               if(_loc3_ as IFrameWindow != null)
               {
                  if(_loc3_.name != "mod_start_panel")
                  {
                     return true;
                  }
               }
               else if(_loc3_.name == "welcome_screen")
               {
                  return true;
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      private function setQuestImageVisible(param1:Boolean) : void
      {
         this._window.findChildByName("quest_pic_bitmap").visible = param1;
      }
      
      private function clearPrompt() : void
      {
         this.setupPrompt(const_685,0,false);
      }
      
      private function setupPrompt(param1:int, param2:int, param3:Boolean) : void
      {
         this.setQuestImageVisible(true);
         this.hidePromptFrames();
         this.var_809 = param1;
         this.var_1519 = param2;
         this.var_2602 = param3;
      }
      
      private function startNudge() : void
      {
         this.var_1025 = 0;
         this.var_328 = const_1076;
      }
   }
}
