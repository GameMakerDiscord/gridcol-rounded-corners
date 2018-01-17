///@param corner
switch(argument0){
	case EGridcol_Corners.top_left:
	case EGridcol_Corners.top_right:
		return bbox_top;
	break;
	case EGridcol_Corners.bottom_left:
	case EGridcol_Corners.bottom_right:
		return bbox_bottom;
	break;
}