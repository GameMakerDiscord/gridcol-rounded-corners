///@function gridcol_system_add_layer()
ds_list_add(global._gridcol_grids, ds_grid_create(global._gridcol_cols, global._gridcol_rows));
return ds_list_size(global._gridcol_grids)-1;