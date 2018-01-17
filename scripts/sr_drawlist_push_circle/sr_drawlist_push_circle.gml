///@function sr_drawlist_push_circle(_x, _y, _radius, [_bordered=true], [_colour=c_white], [_alpha=1])
///@desc Pushes a circle to the drawlist
///@param {Real} _x
///@param {Real} _y
///@param {Real} _radius
///@param {Real} [_bordered=false]
///@param {Real} [_colour=c_white]
///@param {Real} [_alpha=1]
__sr_drawlist_ensure();

var _elem = array_create(ERousrDrawlist_Element.Num);
_elem[@ ERousrDrawlist_Element.X1] = argument[0];
_elem[@ ERousrDrawlist_Element.Y1] = argument[1];
_elem[@ ERousrDrawlist_Element.Radius] = argument[2];
_elem[@ ERousrDrawlist_Element.Bordered] = (argument_count > 3) ? argument[3] : true;
_elem[@ ERousrDrawlist_Element.Colour] = (argument_count > 4) ? argument[4] : c_white;
_elem[@ ERousrDrawlist_Element.Alpha] = (argument_count > 5) ? argument[5] : 1;
_elem[@ ERousrDrawlist_Element.Type] = ERousrDrawlist_Type.Circle;
sr_stack_array_push(__RousrDrawlist.stack, _elem);
