enum EGridcol_CollisionTypes{
	Free,
	Solid
}

enum EGridcol_Corners{
	top_left,
	top_right,
	bottom_left,
	bottom_right
}

enum EGridcol_CardinalDirection{
	east,
	north,
	west,
	south
}

//Used to find the opposite corner needed for corner rounding given a cardinal direction 
global._gridcol_corner_lookup = ds_grid_create(4, 4);

//West
global._gridcol_corner_lookup[# EGridcol_CardinalDirection.west, EGridcol_Corners.top_left] = [EGridcol_Corners.bottom_left, [0, 1]];
global._gridcol_corner_lookup[# EGridcol_CardinalDirection.west, EGridcol_Corners.bottom_left] = [EGridcol_Corners.top_left, [0, -1]];

//East
global._gridcol_corner_lookup[# EGridcol_CardinalDirection.east, EGridcol_Corners.top_right] = [EGridcol_Corners.bottom_right, [0, 1]];
global._gridcol_corner_lookup[# EGridcol_CardinalDirection.east, EGridcol_Corners.bottom_right] = [EGridcol_Corners.top_right, [0, -1]];

//North
global._gridcol_corner_lookup[# EGridcol_CardinalDirection.north, EGridcol_Corners.top_left] = [EGridcol_Corners.top_right, [1, 0]];
global._gridcol_corner_lookup[# EGridcol_CardinalDirection.north, EGridcol_Corners.top_right] = [EGridcol_Corners.top_left, [-1, 0]];

//South
global._gridcol_corner_lookup[# EGridcol_CardinalDirection.south, EGridcol_Corners.bottom_left] = [EGridcol_Corners.bottom_right, [1, 0]];
global._gridcol_corner_lookup[# EGridcol_CardinalDirection.south, EGridcol_Corners.bottom_right] = [EGridcol_Corners.bottom_left, [-1, 0]];

//Lookup table for vector to enum 
global._gridcol_direction_lookup = ds_grid_create(3, 3);
global._gridcol_direction_lookup[# 1, 0] = EGridcol_CardinalDirection.east;
global._gridcol_direction_lookup[# 2, 0] = EGridcol_CardinalDirection.west;
global._gridcol_direction_lookup[# 0, 2] = EGridcol_CardinalDirection.north;
global._gridcol_direction_lookup[# 0, 1] = EGridcol_CardinalDirection.south;

global._gridcol_direction_lookup_reverse = ds_list_create();
global._gridcol_direction_lookup_reverse[| EGridcol_CardinalDirection.north] = [ 0, -1];
global._gridcol_direction_lookup_reverse[| EGridcol_CardinalDirection.south] = [ 0, 1];
global._gridcol_direction_lookup_reverse[| EGridcol_CardinalDirection.west] = [-1, 0];
global._gridcol_direction_lookup_reverse[| EGridcol_CardinalDirection.east] = [1, 0];


global._gridcol_grids = ds_list_create();  
global._gridcol_rows = 0;
global._gridcol_cols = 0;
global._gridcol_height = 0;
global._gridcol_cell_size = 32;