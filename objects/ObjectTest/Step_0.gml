var _dx = keyboard_check(ord("D")) - keyboard_check(ord("A")),
	_dy = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var _len_squared = _dx * _dx + _dy * _dy;
if(_len_squared > 1){
	var _len = sqrt(_len_squared);
	_dx/=_len;
	_dy/=_len;
}

vx += _dx;
vy += _dy;


var _len_squared = vx * vx + vy * vy;
if(_len_squared > max_speed * max_speed){
	var _len = sqrt(_len_squared);
	vx/=_len;
	vy/=_len;
	vx*=max_speed;
	vy*=max_speed;
}

var _len = sqrt(vx * vx + vy * vy);
var _nx = vx/_len,
	_ny = vy/_len;

var //Sign
	_svx = sign(vx),
	_svy = sign(vy),
	//Original
	_ovx = vx,
	_ovy = vy,
	//To Delete
	_col_x = -1,
	_col_y = -1;


bbox_corners = [
	[bbox_left, bbox_top],
	[bbox_right, bbox_top],
	[bbox_left, bbox_bottom],
	[bbox_right, bbox_bottom]
]



/////Raycast
var _xx = round(x) + sign(vx),
	_yy = round(y) + sign(vy),
	_col = gridcol_system_place_meeting(_xx + vx, _yy + vy, gridcol_layer);

if(_col[0]){ 
	repeat(abs(vx)+1){
		var _inner_col = gridcol_system_place_meeting(_xx, y, gridcol_layer);
		if(_inner_col[0]){
			x = _xx-sign(vx);
			vx = 0;
			break;		
		}
		_xx+=sign(vx);
	}
	x += vx;
	
	repeat(abs(vy)+1){
		var _inner_col = gridcol_system_place_meeting(x, _yy, gridcol_layer);
		if(_inner_col[0]){
			y = _yy-sign(vy);
			vy = 0;
			break;		
		}
		_yy+=sign(vy);
	}

	y += vy;
}else{
	x += vx;
	y += vy;
}








sr_drawlist_set_depth(depth-2);
//bbox_hard
sr_drawlist_push_circle(bbox_left, bbox_top, 3, false, c_purple, 0.7);
sr_drawlist_push_circle(bbox_right, bbox_top, 3, false, c_purple, 0.7);
sr_drawlist_push_circle(bbox_right, bbox_bottom, 3, false, c_purple, 0.7);
sr_drawlist_push_circle(bbox_left, bbox_bottom, 3, false, c_purple, 0.7);

//bbox_corners
//left
sr_drawlist_push_circle(bbox_left, bbox_top + corner_offset, 2, false, c_gray, 0.7);
sr_drawlist_push_circle(bbox_left, bbox_bottom - corner_offset, 2, false, c_gray, 0.7);
//right
sr_drawlist_push_circle(bbox_right, bbox_top + corner_offset, 2, false, c_gray, 0.7);
sr_drawlist_push_circle(bbox_right, bbox_bottom - corner_offset, 3, false, c_gray, 0.7);
//top
sr_drawlist_push_circle(bbox_left + corner_offset, bbox_top, 2, false, c_gray, 0.7);
sr_drawlist_push_circle(bbox_right - corner_offset, bbox_top, 2, false, c_gray, 0.7);
//bottom
sr_drawlist_push_circle(bbox_left + corner_offset, bbox_bottom, 2, false, c_gray, 0.7);
sr_drawlist_push_circle(bbox_right - corner_offset, bbox_bottom, 2, false, c_gray, 0.7);



var _cardinal = gridcol_vector_to_cardinal(_dx, _dy),
	_cardinalv = gridcol_cardinal_to_vector(_cardinal);

if(_col[0]){
	var _lookup = global._gridcol_corner_lookup[# _cardinal, _col[1]]; 
	
	if(is_array(_lookup)){
		
		var _directions = _lookup[1],
			_corner_x = bbox_get_corner_x(_lookup[0]) - _directions[0] * corner_offset,
			_corner_y = bbox_get_corner_y(_lookup[0]) - _directions[1] * corner_offset;
		
		
		if(!gridcol_system_point_collision(_corner_x + _cardinalv[0], _corner_y + _cardinalv[1], gridcol_layer)){
			sr_drawlist_push_circle(_corner_x, _corner_y, 3, false, c_yellow);
			sr_drawlist_push_line(_corner_x, _corner_y, _corner_x + _cardinalv[0] * 32, _corner_y + _cardinalv[1] * 32, c_yellow);
			
			vx += _directions[0];
			vy += _directions[1];
			
			//show_message("Is working!");
		}
	}
}

//if(_col_y >= 0 && (_cardinal == EGridcol_CardinalDirection.north || _cardinal == EGridcol_CardinalDirection.south)){
//	var _corner = bbox_corners[_col_y];
//	sr_drawlist_push_circle(_corner[0], _corner[1], 3, false, c_red, 1);
//	_top_left[@ 0] += corner_offset;
//	_top_right[@ 0] -= corner_offset;
//	_bottom_left[@ 0] += corner_offset;
//	_bottom_right[@ 0] -= corner_offset;
	

//		var _lookup = global._gridcol_corner_lookup[# _cardinal, _col_y],
//			_col_y = _lookup[0],
//			_dirs = _lookup[1],
//			_corner = bbox_corners[_col_y];

//		sr_drawlist_push_circle(_corner[0], _corner[1], 3, false, c_yellow, 1);
//		if(!gridcol_system_point_collision(_corner[0], _corner[1] + sign(_ovy), gridcol_layer)){
//			vx += _dirs[0];	
//		}
//}

//if(_col_x >= 0 && (_cardinal == EGridcol_CardinalDirection.west || _cardinal == EGridcol_CardinalDirection.east)){
//	var _corner = bbox_corners[_col_x];
//	sr_drawlist_push_circle(_corner[0], _corner[1], 3, false, c_red, 1);
//	_top_left[@ 1] += corner_offset;
//	_top_right[@ 1] += corner_offset;
//	_bottom_left[@ 1] -= corner_offset;
//	_bottom_right[@ 1] -= corner_offset;
	

//		var _lookup = global._gridcol_corner_lookup[# _cardinal, _col_x],
//			_col_x = _lookup[0],
//			_dirs = _lookup[1],
//			_corner = bbox_corners[_col_x];

//		sr_drawlist_push_circle(_corner[0], _corner[1], 3, false, c_yellow, 1);
//		if(!gridcol_system_point_collision(_corner[0] + sign(_ovx), _corner[1], gridcol_layer)){
//			vy += _dirs[1];	
//		}
//}
//if(_col_x >= 0){
//	//Find corner point 
//	var _corner = bbox_corners[_col_x];
//	sr_drawlist_push_circle(_corner[0], _corner[1], 3, false, c_red, 1);
//}

//if(_col_y >= 0){
//	//Find corner point 
//	var _corner = bbox_corners[_col_y];
//	sr_drawlist_push_circle(_corner[0], _corner[1], 3, false, c_red, 1);	
//}


//sr_drawlist_push_line(room_width, room_height, 0, 0, c_red, 1);

var _grid = global._gridcol_grids[| gridcol_layer];
var _x = 0;
repeat(global._gridcol_cols){
	var _y=0;
	repeat(global._gridcol_rows){
		var _value = _grid[# _x, _y],
			_x1 = _x * global._gridcol_cell_size,
			_y1 = _y * global._gridcol_cell_size,
			_x2 = _x1 + global._gridcol_cell_size,
			_y2 = _y1 + global._gridcol_cell_size,
			_colour = (_value == EGridcol_CollisionTypes.Free) ? c_black : c_red,
			_alpha = (_value == EGridcol_CollisionTypes.Free) ? 0.2 : 0.5;
		

		sr_drawlist_push_rectangle(_x1, _y1, _x2, _y2, true, _colour, _alpha);
		++_y;
	}
	++_x;
}



//while(_col[0]){
//	x -= sign(vx);
//	y -= sign(vy);
//	_col = gridcol_system_place_meeting(x, y, gridcol_layer);
//}

//if(_col[0]){
//	var _dir = 0;
//	repeat(2){
//		var _speed = (_dir == 0) ? abs(vx) : abs(vy),
//			_sign_x = (_dir == 0) ? sign(vx) : 0,
//			_sign_y = (_dir == 0) ? 0 : sign(vy),
//			_dif_x = 0,
//			_dif_y = 0;
			
//		repeat(_speed){
//			var _col = gridcol_system_place_meeting(x + _dif_x, y + _dif_y, gridcol_layer); //gridcol_system_rectangle_collision(_top_left[0] + _dif_x, _top_left[1] + _dif_y, _bottom_right[0] + _dif_x, _bottom_right[1] + _dif_y, gridcol_layer);
//			if(_col[0]){
//				break;
//			}
			
//			_dif_x += _sign_x;
//			_dif_y += _sign_y;
			
//		}
		
//		x += _dif_x;
//		y += _dif_y;	
		
//		_top_left[@ 0] =     bbox_left;
//		_top_left[@ 1] =     bbox_top;
//		_top_right[@ 0] =    bbox_right;
//		_top_right[@ 1] =    bbox_top;
//		_bottom_left[@ 0] =  bbox_left;
//		_bottom_left[@ 1] =  bbox_bottom;
//		_bottom_right[@ 0] = bbox_right;
//		_bottom_right[@ 1] = bbox_bottom;
		
//		++_dir;
//		_dif_x = 0;
//		_dif_y = 0;
//	}
//}else{
//	x+=vx;
//	y+=vy;
//}



//var _cdirection = gridcol_vector_to_cardinal(_dx, _dy);

//var _col = gridcol_system_rectangle_collision(_top_left[0] + vx, _top_left[1], _bottom_right[0] + vx, _bottom_right[1], gridcol_layer);
//if(_col[0]){
//	var _corner = bbox_corners[_col[1]],
//		_ox = _corner[0],
//		_oy = _corner[1],
//		_ovx = vx,
//		_svx = sign(vx),
//		_dif = 0;
		
//	repeat(ceil(abs(vx))){
//		if(gridcol_system_point_collision(_ox + _svx, _oy, gridcol_layer)){
//			break;	
//		}
		
//		_dif += _svx;	
//		_ox += _svx;
//	}
	
//	vx = 0;
//	x += _dif;
	
//	var _corner_data = global._gridcol_corner_lookup[# _cdirection, _col[1]];
//	if(is_array(_corner_data)){
//		//show_message(_corner_data);
//		var _corner = bbox_corners[_corner_data[0]],
//			_direction = _corner_data[1];

//		if(!gridcol_system_point_collision(_corner[0] + _ovx, _corner[1], gridcol_layer)){
//			vx += _direction[0] * abs(_dy);
//			vy += _direction[1] * abs(_dx);
//		}
//	}
//}

//var _col = gridcol_system_rectangle_collision(_top_left[0], _top_left[1] + vy, _bottom_right[0], _bottom_right[1] + vy, gridcol_layer);
//if(_col[0]){
//	var _corner = bbox_corners[_col[1]],
//		_ox = _corner[0],
//		_oy = _corner[1],
//		_ovy = vy,
//		_svy = sign(vy),
//		_dif = 0;
		
//	repeat(ceil(abs(vy))){
//		if(gridcol_system_point_collision(_ox, _oy + _svy, gridcol_layer)){
//			break;	
//		}
		
//		_dif += _svy;	
//		_oy += _svy;
//	}
	
//	vy = 0;
//	y += _dif;
	
//	var _corner_data = global._gridcol_corner_lookup[# _cdirection, _col[1]];
//	if(is_array(_corner_data)){
//		var _corner = bbox_corners[_corner_data[0]],
//			_direction = _corner_data[1];

//		if(!gridcol_system_point_collision(_corner[0], _corner[1] + _ovy, gridcol_layer)){
//			vx += _direction[0] * abs(_dy);
//			vy += _direction[1] * abs(_dx);
//		}
//	}
//}

//x+=vx;
//y+=vy;

if(_dx == 0){
	vx*=0.6;
}

if(_dy == 0){
	vy*=0.6;
}

//_top_left[@ 0] =     bbox_left;
//_top_left[@ 1] =     bbox_top;
//_top_right[@ 0] =    bbox_right;
//_top_right[@ 1] =    bbox_top;
//_bottom_left[@ 0] =  bbox_left;
//_bottom_left[@ 1] =  bbox_bottom;
//_bottom_right[@ 0] = bbox_right;
//_bottom_right[@ 1] = bbox_bottom;

cx = _dx;
cy = _dy;