package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1302:Sound = null;
      
      private var var_471:SoundChannel = null;
      
      private var var_944:Number;
      
      private var _complete:Boolean;
      
      public function HabboSound(param1:Sound)
      {
         super();
         this.var_1302 = param1;
         this.var_1302.addEventListener(Event.COMPLETE,this.onComplete);
         this.var_944 = 1;
         this._complete = false;
      }
      
      public function play(param1:Number = 0.0) : Boolean
      {
         this._complete = false;
         this.var_471 = this.var_1302.play(0);
         this.volume = this.var_944;
         return true;
      }
      
      public function stop() : Boolean
      {
         this.var_471.stop();
         return true;
      }
      
      public function get volume() : Number
      {
         return this.var_944;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_944 = param1;
         if(this.var_471 != null)
         {
            this.var_471.soundTransform = new SoundTransform(this.var_944);
         }
      }
      
      public function get position() : Number
      {
         return this.var_471.position;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get length() : Number
      {
         return this.var_1302.length;
      }
      
      public function get ready() : Boolean
      {
         return !this.var_1302.isBuffering;
      }
      
      public function get finished() : Boolean
      {
         return !this._complete;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return 0;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
      }
      
      public function get fadeInSeconds() : Number
      {
         return 0;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
      }
      
      private function onComplete(param1:Event) : void
      {
         this._complete = true;
      }
   }
}
