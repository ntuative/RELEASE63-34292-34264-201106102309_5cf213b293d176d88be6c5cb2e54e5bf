package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2640:String;
      
      private var var_2769:int;
      
      private var var_2311:int;
      
      private var var_2783:String;
      
      private var var_2782:int;
      
      private var var_1905:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2640 = param1.readString();
         this.var_2769 = param1.readInteger();
         this.var_2311 = param1.readInteger();
         this.var_2783 = param1.readString();
         this.var_2782 = param1.readInteger();
         this.var_1905 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2640;
      }
      
      public function get unitPort() : int
      {
         return this.var_2769;
      }
      
      public function get worldId() : int
      {
         return this.var_2311;
      }
      
      public function get castLibs() : String
      {
         return this.var_2783;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2782;
      }
      
      public function get nodeId() : int
      {
         return this.var_1905;
      }
   }
}
