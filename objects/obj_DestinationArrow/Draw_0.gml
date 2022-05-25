/// @description Insert description here
// You can write your code in this editor
draw_line_width_color(x, y, target.x, target.y, 2, $888888, $888888)
dir = point_direction(x, y, target.x, target.y)
len = point_distance(x, y, target.x, target.y);
draw_set_color($888888)
draw_arrow(x, y, x + lengthdir_x(len, dir) * 0.6, y + lengthdir_y(len, dir) * 0.6, 20);
// draw_arrow(x, y, x + lengthdir_x(len, dir) / 3 * 2, y + lengthdir_y(len, dir) / 3 * 2, 4);