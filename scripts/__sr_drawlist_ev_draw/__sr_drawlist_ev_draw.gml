///@function __sr_drawlist_ev_draw()
///@extensionizer { "docs" : false } 
if(sr_stack_array_empty(stack)){
	instance_destroy();	
}

while(!sr_stack_array_empty(stack)){
	var _elem = sr_stack_array_pop(stack);
	draw_set_colour(_elem[@ ERousrDrawlist_Element.Colour]);
	draw_set_alpha(_elem[@ ERousrDrawlist_Element.Alpha]);
	switch(_elem[ERousrDrawlist_Element.Type]){
		case ERousrDrawlist_Type.Line:
			draw_line(
				_elem[ERousrDrawlist_Element.X1],
				_elem[ERousrDrawlist_Element.Y1],
				_elem[ERousrDrawlist_Element.X2],
				_elem[ERousrDrawlist_Element.Y2]
			);
		break;
		case ERousrDrawlist_Type.Rectangle:
			draw_rectangle(
				_elem[ERousrDrawlist_Element.X1],
				_elem[ERousrDrawlist_Element.Y1],
				_elem[ERousrDrawlist_Element.X2],
				_elem[ERousrDrawlist_Element.Y2],
				_elem[ERousrDrawlist_Element.Bordered]
			);
		break;
		case ERousrDrawlist_Type.Circle:
			draw_circle(
				_elem[ERousrDrawlist_Element.X1],
				_elem[ERousrDrawlist_Element.Y1],
				_elem[ERousrDrawlist_Element.Radius],
				_elem[ERousrDrawlist_Element.Bordered]
			);
		break;
	}
}

draw_set_colour(c_white);
draw_set_alpha(1);