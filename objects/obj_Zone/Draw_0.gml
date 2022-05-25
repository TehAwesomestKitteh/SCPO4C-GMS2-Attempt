/// @description Insert description here
// You can write your code in this editor

// Timers
timer_0++;

// Run timed events
if (timer_0 >= game_get_speed(gamespeed_fps) * 3) {
	timer_0 -= game_get_speed(gamespeed_fps) * 3
}

// Draw Zone - TODO: Remove, replace with new zone-drawing code
draw_set_color($aaaaaa);
draw_rectangle(x1-6, y1-6, x2+6, y2+6, false);
draw_set_color($bbbbbb);
draw_rectangle(x1-4, y1-4, x2+4, y2+4, false);
draw_set_color($cccccc);
draw_rectangle(x1-2, y1-2, x2+2, y2+2, false);

// Change Cursor + Room Highlight
if (collision_rectangle(x1, y1, x2, y2, obj_cursor, false, true)) {
	cursor_sprite = spr_cursor_small_sel;
		draw_set_color(c_white)
		draw_rectangle(x1, y1, x2, y2, false);
}

// Draw Zone Status
if (status != "") {
	// Zone Highlight always-on
	if (status == "COMBAT") {
		draw_set_color($0000ff)
		draw_set_alpha(0.5)
		draw_rectangle(x1, y1, x2, y2, false);
	}
	
	draw_set_font(fnt_c)
	draw_set_alpha(0.5)
	draw_set_color($808080)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text(x, y, status)
	
	draw_set_alpha(1)
	draw_set_color(c_white)
}