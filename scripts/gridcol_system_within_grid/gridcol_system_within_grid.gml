/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param height_index
var _x = floor(argument0 / global._gridcol_cell_size),
	_y = floor(argument1 / global._gridcol_cell_size),
	_height_index = argument2;	
return (
	_x >= 0 && _x < global._gridcol_rows &&
	_y >= 0 && _y < global._gridcol_cols && 
	_height_index >= 0 && _height_index < global._gridcol_height
); 