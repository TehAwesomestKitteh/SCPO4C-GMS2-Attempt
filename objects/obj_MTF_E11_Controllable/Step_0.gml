/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (selected) {
	if (keyboard_check(ord("W"))) {
		y--;
	}
	if (keyboard_check(ord("A"))) {
		x--;
	}
	if (keyboard_check(ord("S"))) {
		y++;
	}
	if (keyboard_check(ord("D"))) {
		x++;
	}
	
	image_angle = point_direction(x,y,mouse_x,mouse_y);
	
	
}
