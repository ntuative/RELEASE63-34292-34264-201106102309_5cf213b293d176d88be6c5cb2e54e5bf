package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_181;
         param1["bound_to_parent_rect"] = const_105;
         param1["child_window"] = const_1156;
         param1["embedded_controller"] = const_1310;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_718;
         param1["mouse_dragging_target"] = const_241;
         param1["mouse_dragging_trigger"] = const_426;
         param1["mouse_scaling_target"] = const_353;
         param1["mouse_scaling_trigger"] = const_582;
         param1["horizontal_mouse_scaling_trigger"] = const_261;
         param1["vertical_mouse_scaling_trigger"] = const_281;
         param1["observe_parent_input_events"] = const_1365;
         param1["optimize_region_to_layout_size"] = const_548;
         param1["parent_window"] = const_1172;
         param1["relative_horizontal_scale_center"] = const_206;
         param1["relative_horizontal_scale_fixed"] = const_170;
         param1["relative_horizontal_scale_move"] = const_386;
         param1["relative_horizontal_scale_strech"] = const_420;
         param1["relative_scale_center"] = const_1268;
         param1["relative_scale_fixed"] = const_922;
         param1["relative_scale_move"] = const_1146;
         param1["relative_scale_strech"] = const_1203;
         param1["relative_vertical_scale_center"] = const_215;
         param1["relative_vertical_scale_fixed"] = const_161;
         param1["relative_vertical_scale_move"] = const_240;
         param1["relative_vertical_scale_strech"] = const_367;
         param1["on_resize_align_left"] = const_875;
         param1["on_resize_align_right"] = const_589;
         param1["on_resize_align_center"] = const_587;
         param1["on_resize_align_top"] = const_965;
         param1["on_resize_align_bottom"] = const_570;
         param1["on_resize_align_middle"] = const_512;
         param1["on_accommodate_align_left"] = const_1260;
         param1["on_accommodate_align_right"] = const_528;
         param1["on_accommodate_align_center"] = const_893;
         param1["on_accommodate_align_top"] = const_1288;
         param1["on_accommodate_align_bottom"] = const_611;
         param1["on_accommodate_align_middle"] = const_822;
         param1["route_input_events_to_parent"] = const_604;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1134;
         param1["scalable_with_mouse"] = const_1189;
         param1["reflect_horizontal_resize_to_parent"] = const_491;
         param1["reflect_vertical_resize_to_parent"] = const_531;
         param1["reflect_resize_to_parent"] = const_346;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1304;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
