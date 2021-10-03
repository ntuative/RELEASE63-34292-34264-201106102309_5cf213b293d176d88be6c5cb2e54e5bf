package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2197:int = 0;
      
      public static const const_1941:int = 1;
      
      public static const const_1704:int = 2;
      
      public static const const_2205:int = 3;
      
      public static const const_2167:int = 4;
      
      public static const const_2184:int = 5;
      
      public static const const_1889:int = 10;
      
      public static const const_2200:int = 11;
      
      public static const const_2190:int = 12;
      
      public static const const_2208:int = 13;
      
      public static const const_2242:int = 16;
      
      public static const const_2147:int = 17;
      
      public static const const_2146:int = 18;
      
      public static const const_2149:int = 19;
      
      public static const const_2254:int = 20;
      
      public static const const_2186:int = 22;
      
      public static const const_2044:int = 23;
      
      public static const const_2240:int = 24;
      
      public static const const_2144:int = 25;
      
      public static const const_2113:int = 26;
      
      public static const const_2138:int = 27;
      
      public static const const_2176:int = 28;
      
      public static const const_2092:int = 29;
      
      public static const const_2082:int = 100;
      
      public static const const_2194:int = 101;
      
      public static const const_2088:int = 102;
      
      public static const const_2233:int = 103;
      
      public static const const_2135:int = 104;
      
      public static const const_2106:int = 105;
      
      public static const const_2201:int = 106;
      
      public static const const_2127:int = 107;
      
      public static const const_2063:int = 108;
      
      public static const const_2132:int = 109;
      
      public static const const_2076:int = 110;
      
      public static const const_2155:int = 111;
      
      public static const const_2115:int = 112;
      
      public static const const_2193:int = 113;
      
      public static const const_2087:int = 114;
      
      public static const const_2086:int = 115;
      
      public static const const_2165:int = 116;
      
      public static const const_2166:int = 117;
      
      public static const const_2156:int = 118;
      
      public static const const_2056:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1941:
            case const_1889:
               return "banned";
            case const_1704:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
