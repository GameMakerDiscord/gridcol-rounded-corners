var _i=0;
repeat(ds_list_size(global._gridcol_grids)){
	ds_grid_destroy(global._gridcol_grids[| _i]);
	++_i;
}

ds_list_destroy(global._gridcol_grids);
ds_grid_destroy(global._gridcol_corner_lookup);
ds_grid_destroy(global._gridcol_direction_lookup);
ds_list_destroy(global._gridcol_direction_lookup_reverse);