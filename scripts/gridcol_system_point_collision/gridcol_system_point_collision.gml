/// @param x 
/// @param y 
/// @param height_index


if(is_undefined(global._gridcol_grids[| argument2])){
	return false;
}

var _grid = global._gridcol_grids[| argument2],
	_cx = floor(argument0 / global._gridcol_cell_size), 
	_cy = floor(argument1 / global._gridcol_cell_size);
	

if(_cx < 0 || _cx > global._gridcol_cols-1 || _cy < 0 || _cy > global._gridcol_rows - 1){
	return false;
}

return (_grid[# floor(argument0 / global._gridcol_cell_size), floor(argument1 / global._gridcol_cell_size)] == EGridcol_CollisionTypes.Solid);
