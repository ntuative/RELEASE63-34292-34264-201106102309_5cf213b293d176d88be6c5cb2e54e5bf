package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1037:BigInteger;
      
      private var var_2287:BigInteger;
      
      private var var_1719:BigInteger;
      
      private var var_2288:BigInteger;
      
      private var var_1421:BigInteger;
      
      private var var_1718:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1421 = param1;
         this.var_1718 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1421.toString() + ",generator: " + this.var_1718.toString() + ",secret: " + param1);
         this.var_1037 = new BigInteger();
         this.var_1037.fromRadix(param1,param2);
         this.var_2287 = this.var_1718.modPow(this.var_1037,this.var_1421);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1719 = new BigInteger();
         this.var_1719.fromRadix(param1,param2);
         this.var_2288 = this.var_1719.modPow(this.var_1037,this.var_1421);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2287.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2288.toRadix(param1);
      }
   }
}
