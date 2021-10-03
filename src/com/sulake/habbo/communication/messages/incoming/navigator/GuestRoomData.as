package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_414:int;
      
      private var var_803:Boolean;
      
      private var var_962:String;
      
      private var _ownerName:String;
      
      private var var_2280:int;
      
      private var var_2309:int;
      
      private var var_2871:int;
      
      private var var_1785:String;
      
      private var var_2870:int;
      
      private var var_2739:Boolean;
      
      private var var_814:int;
      
      private var var_1461:int;
      
      private var var_2873:String;
      
      private var var_910:Array;
      
      private var var_2874:RoomThumbnailData;
      
      private var var_2273:Boolean;
      
      private var var_2872:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_910 = new Array();
         super();
         this.var_414 = param1.readInteger();
         this.var_803 = param1.readBoolean();
         this.var_962 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2280 = param1.readInteger();
         this.var_2309 = param1.readInteger();
         this.var_2871 = param1.readInteger();
         this.var_1785 = param1.readString();
         this.var_2870 = param1.readInteger();
         this.var_2739 = param1.readBoolean();
         this.var_814 = param1.readInteger();
         this.var_1461 = param1.readInteger();
         this.var_2873 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_910.push(_loc4_);
            _loc3_++;
         }
         this.var_2874 = new RoomThumbnailData(param1);
         this.var_2273 = param1.readBoolean();
         this.var_2872 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_910 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_414;
      }
      
      public function get event() : Boolean
      {
         return this.var_803;
      }
      
      public function get roomName() : String
      {
         return this.var_962;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2280;
      }
      
      public function get userCount() : int
      {
         return this.var_2309;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2871;
      }
      
      public function get description() : String
      {
         return this.var_1785;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2870;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2739;
      }
      
      public function get score() : int
      {
         return this.var_814;
      }
      
      public function get categoryId() : int
      {
         return this.var_1461;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2873;
      }
      
      public function get tags() : Array
      {
         return this.var_910;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2874;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2273;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2872;
      }
   }
}
