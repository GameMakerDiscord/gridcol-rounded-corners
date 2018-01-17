///@function gridcol_vector_to_cardinal(x, y)
///@param x
///@param y
///@returns {EGridcol_CardinalDirection} 
var _x = argument0,
	_y = argument1;

if(abs(_x) > abs(_y)){
	_x = sign(_x);
	_y = 0;
}else{
	_y = sign(_y);
	_x = 0;
}

if(_x < 0){
	_x = 2;	
}

if(_y < 0){
	_y = 2;	
}

return global._gridcol_direction_lookup[# _x, _y];