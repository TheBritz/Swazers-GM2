/// @description draw_rectangle_by_lines(x1, y1, x2, y2, color)
/// @param x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  color

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var color = argument4;

var w = x2 - x1;
var h = y2 - y1;

draw_line_colour(x1, y1, x2, y1, color, color);
draw_line_colour(x2, y1, x2, y2, color, color);
draw_line_colour(x2, y2, x1, y2, color, color);
draw_line_colour(x1, y2, x1, y1, color, color);
