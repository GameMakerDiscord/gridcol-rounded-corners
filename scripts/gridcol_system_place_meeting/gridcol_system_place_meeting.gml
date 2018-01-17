/// @param x
/// @param y
/// @param height_index
var _x = x,
	_y = y;

x = argument0;
y = argument1;

var _col = gridcol_system_rectangle_collision(
	bbox_left,bbox_top,bbox_right,bbox_bottom,argument2
);

x = _x;
y = _y;

return _col;
