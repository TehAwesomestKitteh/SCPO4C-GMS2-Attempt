/// @description Insert description here
// You can write your code in this editor

if (dbg) {
	dbg_txt_o = clamp(dbg_txt_o - 1 / game_get_speed(gamespeed_fps), 0, 2);
	draw_set_font(fnt_game);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(0.5);
	draw_set_color(c_red);
	draw_text(view_xport[0] + 4, view_yport[0] + 4, "MOUSE X: " + str(mouse_x) +
			  "\nMOUSE Y: " + str(mouse_y));
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_alpha(dbg_txt_o)
	draw_text(view_wport[0] / 2, (view_hport[0] / 3 * 2), dbg_txt)
	draw_set_alpha(1);
}

// Global UI
if (room != rm_INIT) {
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_right);
	draw_set_color(c_black);
	draw_set_font(fnt_a);
	if (view_visible[0]) {
		draw_text(view_xport[0] + view_wport[0] - view_txt_margin, view_yport[0] + view_hport[0] - view_txt_margin, "v" + string(g_version) + " ALPHA");
	} else {
		draw_text(room_width - view_txt_margin, room_height - view_txt_margin, "v" + string(g_version) + " ALPHA");
	}
}

// Room-specific UI
if (room == rm_MainMenu) {
	// Main Menu text
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_set_font(fnt_b);
	draw_text(room_width / 2, view_txt_margin, "SCP: O4 Command");
	
	draw_text(room_width / 2, room_height * 0.75, "still nowhere close to demo");
	
	// Top Right Profile
	draw_set_valign(fa_top);
	draw_set_halign(fa_right);
	draw_set_color(c_black);
	draw_set_font(fnt_a);
	draw_text(room_width - view_txt_margin, view_txt_margin, "Logged in as: " + user + "\nPerformance: Okay");
	
	
} else if (room == rm_Tutorial) {
	// Camera Controls - Movement
	if (keyboard_check(vk_left)) {
		cam_x -= cam_movspd;
	}
	if (keyboard_check(vk_right)) {
		cam_x += cam_movspd;
	}
	if (keyboard_check(vk_up)) {
		cam_y -= cam_movspd;
	}
	if (keyboard_check(vk_down)) {
		cam_y += cam_movspd;
	}
	
	// Camera Controls - Zoom
	var mw = mouse_wheel_up() - mouse_wheel_down();
	repeat (1) {
		if (mw != 0) {
			if (mw < 0) {
				if (cam_zoom * sqrt(2) < 1) { break; }
			} else {
				if (cam_zoom / sqrt(2) > 2) { break; }
			}
			
		    var mx = mouse_x, my = mouse_y;
		    var cx = (mx - cam_x) / cam_zoom;
		    var cy = (my - cam_y) / cam_zoom;
		    if (mw < 0) {
		        cam_zoom *= sqrt(2);
		    } else cam_zoom /= sqrt(2);
		    //cam_adjusted_w = camera_get_view_width(view_camera[0]) * cam_zoom; // CamGetView might be wrong
		    //cam_adjusted_h = camera_get_view_height(view_camera[0]) * cam_zoom; // CamGetView might be wrong
		    cam_x = mx - cx * cam_zoom;
		    cam_y = my - cy * cam_zoom;
			
			//camera_set_view_size(view_camera[0], cam_adjusted_w, cam_adjusted_h);
		}
	}
	/*repeat (1) {
		if (mouse_wheel_up()) {
			if (cam_zoom >= 2) { break; }
			cam_zoomadjust = true;
			cam_zoom += 0.25;
			cam_zoomin = 1;
		} else if (mouse_wheel_down()) {
			if (cam_zoom <= 1) { break; }
			cam_zoom -= 0.25;
			cam_zoomadjust = true;
			cam_zoomin = -1;
		}
	}
	cam_zoom = clamp(cam_zoom, 1, 2)
	
	// Camera Controls - Apply	
	
	if (cam_zoomadjust) {
		//Step 1: get the current ratio of the mouse to the view
		var mx = (mouse_x-cam_x)/cam_w;
		var my = (mouse_y-cam_y)/cam_h;

		//Step 2: Update view widths and height.
		cam_adjusted_w = cam_w / cam_zoom;
		cam_adjusted_h = cam_h / cam_zoom;
	
		//Step 3: Update position of view based on ratio and mouse position. - TODO: FIX THIS, Cuz its offset is wrong/bad
		cam_x = (mouse_x * cam_zoomin) - (cam_adjusted_w * mx);
		cam_y = (mouse_y * cam_zoomin) - (cam_adjusted_h * my);
	}*/
	cam_x = clamp(cam_x, 0, room_width - camera_get_view_width(view_camera[0]));
	cam_y = clamp(cam_y, 0, room_height - camera_get_view_height(view_camera[0]));

	// Cam Debug Text
	/* dbg_txt = "zm:" + 
			  str(cam_zoom) +
			  " camcord:" +
			  str(cam_x) + "," + str(cam_y) +
			  " camsize:" + str(camera_get_view_width(view_camera[0])) + "," + str(camera_get_view_height(view_camera[0]));
	dbg_txt_o = 2; */
	
	camera_set_view_pos(view_camera[0], cam_x, cam_y);
	/*if (cam_zoomadjust) {
		camera_set_view_size(view_camera[0], cam_adjusted_w, cam_adjusted_h);
		cam_zoomadjust = false;
		cam_zoomin = 0;
	}*/
	
	// Squad View
	var squads = [];
	squads[0][0] = "";
	squads[0][1] = 0;
	var i1 = 0;
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	for (var i = 0; i < instance_number(obj_Unit); i++) {
		unit = instance_find(obj_Unit,i);
		if (unit.squad != "") && (unit.user == user) {
			// TODO: Graphicalize
			for (var ii = 0; ii < array_length(squads); ii++) {
				draw_text(16, (64 * ii) + 16, unit.squad)
				if (squads[ii][0] == unit.squad) {
					draw_text(16, (16 * ii) + (16 * i1) + 32, str(unit.squad) + "-" + str(i1) + "-" + str(array_length(squads)))
					i1++
				} else if (squads[ii][0] == "") {
					squads[ii][0] = unit.squad
					i1 = 0;
					draw_text(16, (16 * ii) + (16 * i1) + 32, str(unit.squad) + "-" + str(i1) + "-" + str(array_length(squads)))
					i1++
				} else if (squads[ii][0] != "" && squads[ii][0] != unit.squad) {
					squads[ii+1][0] = unit.squad
				}
			}
		}
	}
	
	// Bars
	draw_set_color(c_white);
	// TODO: Clean/Fix
	draw_rectangle(view_xport[0] + view_txt_margin, view_yport[0] + view_hport[0] - view_txt_margin - 16, view_xport[0] + view_txt_margin + 100, view_yport[0] + view_hport[0] - view_txt_margin, false);
	draw_set_color(c_red);
	draw_rectangle(view_xport[0] + view_txt_margin, view_yport[0] + view_hport[0] - view_txt_margin - 32, view_xport[0] + view_txt_margin + 250, view_yport[0] + view_hport[0] - view_txt_margin - 16, false);
	
	
}