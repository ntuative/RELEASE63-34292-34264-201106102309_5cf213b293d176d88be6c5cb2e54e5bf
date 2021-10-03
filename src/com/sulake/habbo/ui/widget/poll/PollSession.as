package com.sulake.habbo.ui.widget.poll
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   
   public class PollSession implements IDisposable
   {
       
      
      private var _id:int = -1;
      
      private var var_1190:PollWidget;
      
      private var var_528:IPollDialog;
      
      private var var_527:IPollDialog;
      
      private var var_1876:String = "";
      
      private var _disposed:Boolean = false;
      
      public function PollSession(param1:int, param2:PollWidget)
      {
         super();
         this._id = param1;
         this.var_1190 = param2;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_528 != null)
         {
            this.var_528.dispose();
            this.var_528 = null;
         }
         if(this.var_527 != null)
         {
            this.var_527.dispose();
            this.var_527 = null;
         }
         this.var_1190 = null;
         this._disposed = true;
      }
      
      public function showOffer(param1:String) : void
      {
         this.hideOffer();
         this.var_528 = new PollOfferDialog(this._id,param1,this.var_1190);
         this.var_528.start();
      }
      
      public function hideOffer() : void
      {
         if(this.var_528 is PollOfferDialog)
         {
            if(!this.var_528.disposed)
            {
               this.var_528.dispose();
            }
            this.var_528 = null;
         }
      }
      
      public function showContent(param1:String, param2:String, param3:Array) : void
      {
         this.hideOffer();
         this.hideContent();
         this.var_1876 = param2;
         this.var_527 = new PollContentDialog(this._id,param1,param3,this.var_1190);
         this.var_527.start();
      }
      
      public function hideContent() : void
      {
         if(this.var_527 is PollContentDialog)
         {
            if(!this.var_527.disposed)
            {
               this.var_527.dispose();
            }
            this.var_527 = null;
         }
      }
      
      public function showThanks() : void
      {
         this.var_1190.windowManager.alert("${poll_thanks_title}",this.var_1876,0,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         });
      }
   }
}
