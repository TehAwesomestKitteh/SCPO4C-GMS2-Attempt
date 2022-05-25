/// @description Insert description here
// You can write your code in this editor

// Change Cursor
var col = c_white;
var col2 = #dddddd;

if (collision_point(mouse_x, mouse_y, id, false, false)
	&& (obj_control.gameState != obj_control.GameState.PAUSED)) { // TODO: Check why this doesn't work for ENEMY
	// If the game's not paused AND mouse hovering on it, allow unit selection
	
	if (user == obj_control.user) {
		// Own Unit Cursor
		cursor_sprite = spr_cursor_small_sel;
		if (mouse_check_button_pressed(mb_left)) {
			selected = !selected;
		}
	} else if (user == "ENEMY") {
		// Enemy Unit Cursor
		cursor_sprite = spr_cursor_small_enemy;
		col = c_red
	} else {
		// Generic Cursor
		cursor_sprite = spr_cursor_small;
	}
	
	// Range Circle
	draw_set_alpha(0.5)
	draw_circle_color(x, y, range, c_white, col, false);
	
	draw_set_alpha(1)
    // draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
	draw_circle_color(x, y, 8, col, col, false);
	
	draw_set_color(c_white)
} else {
	// If not, then don't do anything
	// draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, $dddddd, 1);
	
	if (user == "ENEMY") {
		col2 = #dd8080
	}
	draw_circle_color(x, y, 8, col2, col2, false);
}

// Busy Highlight
if (busy) {
	selected = false;
	draw_set_color(c_red)
	draw_line_width(x, y - sprite_height, x + sprite_width, y - sprite_height, 3);
	draw_line_width(x + sprite_width, y - sprite_height, x + sprite_width / 2, y, 3);
	draw_line_width(x + sprite_width / 2, y, x, y - sprite_height, 3);
}

// Selection Highlight
if (selected) {
	draw_set_color(c_lime)
	draw_line_width(x, y, x, y - sprite_height, 3);
	draw_line_width(x, y - sprite_height, x + sprite_width, y - sprite_height, 3);
	draw_line_width(x + sprite_width, y - sprite_height, x + sprite_width, y, 3);
	draw_line_width(x + sprite_width, y, x, y, 3);
}

// HP Highlight
if (hp < max_hp) {
	draw_set_color(c_red)
	draw_line_width(x, y - sprite_height - 6, x + (hp / max_hp * sprite_width), y - sprite_height - 6, 4)
}