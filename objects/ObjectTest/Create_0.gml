var _layer = layer_get_id("Tiles_1");
var _tilemap = layer_tilemap_get_id(_layer);
gridcol_system_create();
gridcol_system_reset(tilemap_get_width(_tilemap), tilemap_get_height(_tilemap), 1);

gridcol_layer = 0;

var _x = 0;
repeat(tilemap_get_width(_tilemap)){
	var _y = 0;
	repeat(tilemap_get_height(_tilemap)){
		var _tiledata = tilemap_get(_tilemap, _x, _y);
		if(tile_get_index(_tiledata) == 1){
			gridcol_system_set_grid_cell(_x, _y, gridcol_layer, EGridcol_CollisionTypes.Solid);
		}else if(tile_get_index(_tiledata) == 2){
			gridcol_system_set_grid_cell(_x, _y, gridcol_layer, EGridcol_CollisionTypes.Free);
		}
		++_y;
	}
	++_x;
}
vx = 0;
vy = 0;
accel = 0.5;
max_speed = 2;

corner_offset = 8;

bbox_corners = [];

cx = 0;
cy = 0;