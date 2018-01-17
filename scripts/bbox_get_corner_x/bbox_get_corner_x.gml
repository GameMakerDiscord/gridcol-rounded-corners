///@param corner
switch(argument0){ 
	case EGridcol_Corners.top_left:
	case EGridcol_Corners.bottom_left:
		return bbox_left;
	break;
	case EGridcol_Corners.top_right:
	case EGridcol_Corners.bottom_right:
		return bbox_right;
	break;
}