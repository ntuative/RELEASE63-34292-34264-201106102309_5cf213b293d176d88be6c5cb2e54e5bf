package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_342:int = 1;
      
      public static const const_228:int = 2;
      
      public static const const_245:int = 3;
      
      public static const const_335:int = 4;
      
      public static const const_208:int = 5;
      
      public static const const_400:int = 1;
      
      public static const const_876:int = 2;
      
      public static const const_860:int = 3;
      
      public static const const_799:int = 4;
      
      public static const const_269:int = 5;
      
      public static const const_812:int = 6;
      
      public static const const_842:int = 7;
      
      public static const const_242:int = 8;
      
      public static const const_389:int = 9;
      
      public static const const_2218:int = 10;
      
      public static const const_870:int = 11;
      
      public static const const_529:int = 12;
       
      
      private var var_427:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_427 = new Array();
         this.var_427.push(new Tab(this._navigator,const_342,const_529,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_490));
         this.var_427.push(new Tab(this._navigator,const_228,const_400,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_490));
         this.var_427.push(new Tab(this._navigator,const_335,const_870,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1321));
         this.var_427.push(new Tab(this._navigator,const_245,const_269,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_490));
         this.var_427.push(new Tab(this._navigator,const_208,const_242,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_732));
         this.setSelectedTab(const_342);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_335;
      }
      
      public function get tabs() : Array
      {
         return this.var_427;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_427)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_427)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_427)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
