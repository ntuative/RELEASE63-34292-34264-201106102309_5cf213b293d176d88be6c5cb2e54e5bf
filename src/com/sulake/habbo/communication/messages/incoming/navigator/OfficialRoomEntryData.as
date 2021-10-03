package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1157:int = 1;
      
      public static const const_833:int = 2;
      
      public static const const_895:int = 3;
      
      public static const const_1702:int = 4;
       
      
      private var _index:int;
      
      private var var_2413:String;
      
      private var var_2410:String;
      
      private var var_2412:Boolean;
      
      private var var_2411:String;
      
      private var var_980:String;
      
      private var var_2414:int;
      
      private var var_2309:int;
      
      private var _type:int;
      
      private var var_2415:String;
      
      private var var_974:GuestRoomData;
      
      private var var_975:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2413 = param1.readString();
         this.var_2410 = param1.readString();
         this.var_2412 = param1.readInteger() == 1;
         this.var_2411 = param1.readString();
         this.var_980 = param1.readString();
         this.var_2414 = param1.readInteger();
         this.var_2309 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1157)
         {
            this.var_2415 = param1.readString();
         }
         else if(this._type == const_895)
         {
            this.var_975 = new PublicRoomData(param1);
         }
         else if(this._type == const_833)
         {
            this.var_974 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_974 != null)
         {
            this.var_974.dispose();
            this.var_974 = null;
         }
         if(this.var_975 != null)
         {
            this.var_975.dispose();
            this.var_975 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2413;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2410;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2412;
      }
      
      public function get picText() : String
      {
         return this.var_2411;
      }
      
      public function get picRef() : String
      {
         return this.var_980;
      }
      
      public function get folderId() : int
      {
         return this.var_2414;
      }
      
      public function get tag() : String
      {
         return this.var_2415;
      }
      
      public function get userCount() : int
      {
         return this.var_2309;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_974;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_975;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1157)
         {
            return 0;
         }
         if(this.type == const_833)
         {
            return this.var_974.maxUserCount;
         }
         if(this.type == const_895)
         {
            return this.var_975.maxUsers;
         }
         return 0;
      }
   }
}
