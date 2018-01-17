///@function sr_drawlist_push_line(_x1, _y1, _x2, _y2, [_color=c_white], [_alpha=1])
///@desc Pushes a line to the drawlist
///@param {Real} _x1
///@param {Real} _y1
///@param {Real} _x2
///@param {Real} _y2
///@param {Real} [_color=c_white]
///@param {Real} [_alpha=1]
__sr_drawlist_ensure();

var _elem = array_create(ERousrDrawlist_Element.Num);
_elem[@ ERousrDrawlist_Element.X1] = argument[0];
_elem[@ ERousrDrawlist_Element.Y1] = argument[1];
_elem[@ ERousrDrawlist_Element.X2] = argument[2];
_elem[@ ERousrDrawlist_Element.Y2] = argument[3];
_elem[@ ERousrDrawlist_Element.Colour] = (argument_count > 4) ? argument[4] : c_white;
_elem[@ ERousrDrawlist_Element.Alpha] = (argument_count > 5) ? argument[5] : 1;
_elem[@ ERousrDrawlist_Element.Type] = ERousrDrawlist_Type.Line;
sr_stack_array_push(__RousrDrawlist.stack, _elem);
