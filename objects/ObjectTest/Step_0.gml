//Get input 
var _dx = keyboard_check(ord("D")) - keyboard_check(ord("A")),
	_dy = keyboard_check(ord("S")) - keyboard_check(ord("W"));

//Normalize input 
var _len_squared = _dx * _dx + _dy * _dy;
if(_len_squared > 1){
	var _len = sqrt(_len_squared);
	_dx/=_len;
	_dy/=_len;
}

//Add to velocity 
vx += _dx;
vy += _dy;


//Limit velocity to max speed 
var _len_squared = vx * vx + vy * vy;
if(_len_squared > max_speed * max_speed){
	var _len = sqrt(_len_squared);
	vx/=_len;
	vy/=_len;
	vx*=max_speed;
	vy*=max_speed;
}


var //Sign
	_svx = sign(vx),
	_svy = sign(vy),
	//Original
	_ovx = vx,
	_ovy = vy,
	//To Delete
	_col_x = -1,
	_col_y = -1;


/////Raycast
//Round and add 1 giving the benifit of the doubt of collision check to a collision
var _xx = round(x) + sign(vx), 
	_yy = round(y) + sign(vy),
	_col = gridcol_system_place_meeting(_xx + vx, _yy + vy, gridcol_layer);

//If found a gridcol collision 
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



//Rendering 
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


//Lookup cardinal direction - we want to find which direction our player is closest moving towards
//north, south, east, or west 
var _cardinal = gridcol_vector_to_cardinal(_dx, _dy),
	_cardinalv = gridcol_cardinal_to_vector(_cardinal);

if(_col[0]){
	//The collision will return an array [ collision_found, corner_index_of_collision ] 
	//The lookup will return the opposite corner in that cardinal direction. This is the corner 
	//We want to test for collisions as demonstrated by the yellow line in the demo.
	var _lookup = global._gridcol_corner_lookup[# _cardinal, _col[1]]; 
	
	if(is_array(_lookup)){	
		var _directions = _lookup[1],
			_corner_x = bbox_get_corner_x(_lookup[0]) - _directions[0] * corner_offset,
			_corner_y = bbox_get_corner_y(_lookup[0]) - _directions[1] * corner_offset;
		
		
		if(!gridcol_system_point_collision(_corner_x + _cardinalv[0], _corner_y + _cardinalv[1], gridcol_layer)){
			//We are free to move in this direction
			sr_drawlist_push_circle(_corner_x, _corner_y, 3, false, c_yellow);
			sr_drawlist_push_line(_corner_x, _corner_y, _corner_x + _cardinalv[0] * 32, _corner_y + _cardinalv[1] * 32, c_yellow);
			
			vx += _directions[0];
			vy += _directions[1];
			
		}
	}
}


//Draw the collision grid
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

if(_dx == 0){
	vx*=0.6;
}

if(_dy == 0){
	vy*=0.6;
}
cx = _dx;
cy = _dy;