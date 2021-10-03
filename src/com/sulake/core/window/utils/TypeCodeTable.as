package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_826;
         param1["bitmap"] = const_574;
         param1["border"] = const_787;
         param1["border_notify"] = const_1747;
         param1["bubble"] = const_937;
         param1["bubble_pointer_up"] = const_1357;
         param1["bubble_pointer_right"] = const_1174;
         param1["bubble_pointer_down"] = const_1254;
         param1["bubble_pointer_left"] = const_1147;
         param1["button"] = const_566;
         param1["button_thick"] = const_758;
         param1["button_icon"] = const_1698;
         param1["button_group_left"] = const_853;
         param1["button_group_center"] = const_962;
         param1["button_group_right"] = const_720;
         param1["canvas"] = const_867;
         param1["checkbox"] = const_723;
         param1["closebutton"] = const_1293;
         param1["container"] = const_388;
         param1["container_button"] = const_773;
         param1["display_object_wrapper"] = const_771;
         param1["dropmenu"] = const_632;
         param1["dropmenu_item"] = const_565;
         param1["frame"] = const_455;
         param1["frame_notify"] = const_1835;
         param1["header"] = const_810;
         param1["html"] = const_1284;
         param1["icon"] = const_1142;
         param1["itemgrid"] = const_1369;
         param1["itemgrid_horizontal"] = const_653;
         param1["itemgrid_vertical"] = const_906;
         param1["itemlist"] = const_1343;
         param1["itemlist_horizontal"] = const_427;
         param1["itemlist_vertical"] = const_405;
         param1["label"] = const_739;
         param1["maximizebox"] = const_1688;
         param1["menu"] = const_1857;
         param1["menu_item"] = const_1840;
         param1["submenu"] = const_1353;
         param1["minimizebox"] = const_1930;
         param1["notify"] = const_1955;
         param1["null"] = const_800;
         param1["password"] = const_778;
         param1["radiobutton"] = const_845;
         param1["region"] = const_401;
         param1["restorebox"] = const_1905;
         param1["scaler"] = const_569;
         param1["scaler_horizontal"] = const_1782;
         param1["scaler_vertical"] = const_1762;
         param1["scrollbar_horizontal"] = const_615;
         param1["scrollbar_vertical"] = const_940;
         param1["scrollbar_slider_button_up"] = const_1187;
         param1["scrollbar_slider_button_down"] = const_1307;
         param1["scrollbar_slider_button_left"] = const_1188;
         param1["scrollbar_slider_button_right"] = const_1145;
         param1["scrollbar_slider_bar_horizontal"] = const_1315;
         param1["scrollbar_slider_bar_vertical"] = const_1240;
         param1["scrollbar_slider_track_horizontal"] = const_1322;
         param1["scrollbar_slider_track_vertical"] = const_1194;
         param1["scrollable_itemlist"] = const_1933;
         param1["scrollable_itemlist_vertical"] = WINDOW_TYPE_SCROLLABLE_ITEMLIST_VERTICAL;
         param1["scrollable_itemlist_horizontal"] = const_1158;
         param1["selector"] = const_791;
         param1["selector_list"] = const_759;
         param1["submenu"] = const_1353;
         param1["tab_button"] = const_783;
         param1["tab_container_button"] = const_1325;
         param1["tab_context"] = const_398;
         param1["tab_content"] = const_1178;
         param1["tab_selector"] = const_767;
         param1["text"] = const_838;
         param1["input"] = const_952;
         param1["toolbar"] = const_1875;
         param1["tooltip"] = const_452;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
