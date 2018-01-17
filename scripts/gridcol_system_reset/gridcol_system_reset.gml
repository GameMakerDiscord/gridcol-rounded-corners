/// @param cols
/// @param rows 
/// @param height 
var _i=0;
repeat(ds_list_size(global._gridcol_grids)){
	ds_grid_destroy(global._gridcol_grids[| _i]);
	++_i;
}

ds_list_clear(global._gridcol_grids);

var _i=0;
repeat(argument2){
	var _grid = ds_grid_create(argument0,argument1);
	ds_grid_clear(_grid,EGridcol_CollisionTypes.Free);
	ds_list_add(global._gridcol_grids, _grid);
	++_i;
}

global._gridcol_cols = argument0;
global._gridcol_rows = argument1;
global._gridcol_height = argument2;