/// @param x
/// @param y
/// @param height_index
var _x = x,
	_y = y;

x = argument0;
y = argument1;

var _col = gridcol_system_rectangle_collision(
	x-bbox_width*gridcol_small_scale,y-bbox_height*gridcol_small_scale,x+bbox_width*gridcol_small_scale,y+bbox_height*gridcol_small_scale,argument2
);

x = _x;
y = _y;

return _col;
