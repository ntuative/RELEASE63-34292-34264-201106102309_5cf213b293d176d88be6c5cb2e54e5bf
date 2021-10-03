package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2641:String;
      
      private var var_2643:Class;
      
      private var var_2642:Class;
      
      private var var_1932:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2641 = param1;
         this.var_2643 = param2;
         this.var_2642 = param3;
         if(rest == null)
         {
            this.var_1932 = new Array();
         }
         else
         {
            this.var_1932 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2641;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2643;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2642;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1932;
      }
   }
}
