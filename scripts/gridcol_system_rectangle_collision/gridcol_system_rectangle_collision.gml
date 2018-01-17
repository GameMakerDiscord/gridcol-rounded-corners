/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param height_index
var _x1 = argument0,
	_y1 = argument1,
	_x2 = argument2,
	_y2 = argument3,
	_height_index = argument4,

if(gridcol_system_point_collision(_x1,_y1,_height_index)){
	return [true, EGridcol_Corners.top_left];	
}

if(gridcol_system_point_collision(_x2,_y1,_height_index)){
	return [true, EGridcol_Corners.top_right];	
}

if(gridcol_system_point_collision(_x2,_y2,_height_index)){
	return [true, EGridcol_Corners.bottom_right];	
}

if(gridcol_system_point_collision(_x1,_y2,_height_index)){
	return [true, EGridcol_Corners.bottom_left];	
}

return [ false, false ];