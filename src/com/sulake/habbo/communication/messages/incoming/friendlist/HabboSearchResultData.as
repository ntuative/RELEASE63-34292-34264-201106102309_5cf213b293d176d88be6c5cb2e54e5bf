package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2248:int;
      
      private var var_1885:String;
      
      private var var_2401:String;
      
      private var var_2404:Boolean;
      
      private var var_2400:Boolean;
      
      private var var_2402:int;
      
      private var var_2399:String;
      
      private var var_2403:String;
      
      private var var_1754:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2248 = param1.readInteger();
         this.var_1885 = param1.readString();
         this.var_2401 = param1.readString();
         this.var_2404 = param1.readBoolean();
         this.var_2400 = param1.readBoolean();
         param1.readString();
         this.var_2402 = param1.readInteger();
         this.var_2399 = param1.readString();
         this.var_2403 = param1.readString();
         this.var_1754 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2248;
      }
      
      public function get avatarName() : String
      {
         return this.var_1885;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2401;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2404;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2400;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2402;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2399;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2403;
      }
      
      public function get realName() : String
      {
         return this.var_1754;
      }
   }
}
