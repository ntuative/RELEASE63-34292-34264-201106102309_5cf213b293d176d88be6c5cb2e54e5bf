package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.tracking.HabboTracking;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2260:XML;
      
      private var var_2263:XML;
      
      private var var_2259:XML;
      
      private var var_2264:XML;
      
      private var var_2262:XML;
      
      private var var_2261:XML;
      
      private var var_925:IWindowContainer;
      
      private var var_607:IButtonWindow;
      
      private var var_3044:IButtonWindow;
      
      private var var_1709:IButtonWindow;
      
      private var var_1710:ITextWindow;
      
      private var var_1708:ITextWindow;
      
      private var var_1711:ITextWindow;
      
      private var var_3007:ITextWindow;
      
      private var var_104:Offer;
      
      private var var_1712:String = "";
      
      private var var_1419:Function;
      
      private var var_34:ISessionDataManager;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer, param2:ISessionDataManager)
      {
         super(param1);
         this.var_34 = param2;
      }
      
      override public function dispose() : void
      {
         events.removeEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.removeEventListener(WidgetEvent.const_764,this.onSetParameter);
         events.removeEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2260 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2263 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2259 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         var _loc5_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetBuyClubStub") as XmlAsset;
         if(_loc5_ != null)
         {
            this.var_2264 = _loc5_.content as XML;
         }
         var _loc6_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetBuyVipStub") as XmlAsset;
         if(_loc6_ != null)
         {
            this.var_2262 = _loc6_.content as XML;
         }
         var _loc7_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetBuyVipStub") as XmlAsset;
         if(_loc7_ != null)
         {
            this.var_2261 = _loc7_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_764,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         events.addEventListener(WidgetEvent.CWE_INIT_PURCHASE,this.initPurchase);
         return true;
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1419 = param1.callback;
      }
      
      private function attachStub(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         if(this.var_34.hasUserRight(null,param2))
         {
            switch(param1)
            {
               case Offer.const_977:
                  _loc3_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2260) as IWindowContainer;
                  break;
               case Offer.const_1266:
                  _loc3_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2263) as IWindowContainer;
                  break;
               case Offer.const_1220:
                  _loc3_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2259) as IWindowContainer;
                  break;
               default:
                  Logger.log("Unknown price-type, can\'t attach..." + this.var_104.priceType);
            }
         }
         else
         {
            switch(param2)
            {
               case HabboClubLevelEnum.const_38:
                  _loc3_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2264) as IWindowContainer;
                  break;
               case HabboClubLevelEnum.const_47:
                  if(!this.var_34.hasUserRight(null,HabboClubLevelEnum.const_38))
                  {
                     _loc3_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2262) as IWindowContainer;
                  }
                  else
                  {
                     _loc3_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2261) as IWindowContainer;
                  }
            }
         }
         if(_loc3_ != null)
         {
            if(this.var_925 != null)
            {
               _window.removeChild(this.var_925);
               this.var_925.dispose();
            }
            this.var_925 = _loc3_;
            _window.addChild(_loc3_);
            this.var_925.x = 0;
            this.var_925.y = 0;
         }
         this.var_1710 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_1708 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_1711 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_3007 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_607 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         this.var_1709 = window.findChildByName("ctlg_buy_club_button") as IButtonWindow;
         if(this.var_607 != null)
         {
            if(this.var_1419 != null)
            {
               this.var_607.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1419);
            }
            else
            {
               this.var_607.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1419);
               this.var_607.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_607.disable();
         }
         if(this.var_1709 != null)
         {
            this.var_1709.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onBuyClub);
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_104 = param1.offer;
         this.attachStub(this.var_104.priceType,this.var_104.clubLevel);
         if(this.var_1710 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_104.priceInCredits));
            this.var_1710.caption = "${catalog.purchase.price.credits}";
         }
         var _loc3_:String = this.var_104.activityPointType == ActivityPointTypeEnum.PIXEL ? "pixels" : "activitypoints";
         if(this.var_1708 != null)
         {
            _loc4_ = "catalog.purchase.price.activitypoints." + this.var_104.activityPointType;
            _loc2_.registerParameter(_loc4_,_loc3_,this.var_104.priceInActivityPoints.toString());
            this.var_1708.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_1711 != null)
         {
            _loc4_ = "catalog.purchase.price.credits+activitypoints." + this.var_104.activityPointType;
            _loc2_.registerParameter(_loc4_,"credits",String(this.var_104.priceInCredits));
            _loc2_.registerParameter(_loc4_,_loc3_,String(this.var_104.priceInActivityPoints));
            this.var_1711.caption = _loc2_.getKey(_loc4_);
         }
         var _loc5_:IWindow = _window.findChildByName("activity_points_bg");
         if(_loc5_ != null)
         {
            _loc5_.color = this.var_104.activityPointType == 0 ? 6737151 : uint(13421772);
         }
         if(this.var_607 != null)
         {
            this.var_607.enable();
         }
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_1712 = param1.parameter;
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_104 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_104,page.pageId,this.var_1712);
         }
      }
      
      private function initPurchase(param1:CatalogWidgetInitPurchaseEvent) : void
      {
         if(this.var_104 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_104,page.pageId,this.var_1712,param1.enableBuyAsGift);
         }
      }
      
      private function onBuyClub(param1:WindowMouseEvent) : void
      {
         (page.viewer.catalog as HabboCatalog).openCatalogPage(CatalogPageName.const_180,true);
         HabboTracking.getInstance().trackEventLog("Catalog","click","BUY_CLUB");
      }
   }
}
