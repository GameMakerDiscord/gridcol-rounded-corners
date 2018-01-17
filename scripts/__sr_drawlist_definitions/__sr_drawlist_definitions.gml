#macro __RousrDrawlist global.__rousr_draw_list
#macro __RousrDrawlistDepth  global.__rousr_drawlist_depth
#macro __RousrDrawlistStack  global.__rousr_drawlist_stack
gml_pragma("global", "__RousrDrawlistDepth = 0;");
enum ERousrDrawlist_Type{
	Line,
	Circle,
	Rectangle,
}

enum ERousrDrawlist_Element{
	Type,
	X1,
	Y1,
	X2,
	Y2,
	Colour,
	Alpha,
	Radius,
	Width,
	Height,
	Bordered,
	Num
}