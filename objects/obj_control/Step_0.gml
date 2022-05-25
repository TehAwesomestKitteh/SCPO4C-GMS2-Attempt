/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_DISCORD) && room == (rm_INIT)) {
	room_goto(rm_MainMenu);
}

cursor_sprite = spr_cursor_small;

if (keyboard_check_pressed(96)) { // When "`" is pressed
	show_debug_message("dbg pressed")
}

if (dbg) {
	// DEBUG: Spawn MTF
	if (keyboard_check_pressed(vk_space) && (room == rm_Tutorial)) {
		var mtf_unit = instance_create_depth(mouse_x, mouse_y, 100, obj_MTF_E11_Controllable);
		with (mtf_unit) {
			user = obj_control.user
		}
		dbg_txt = "Spawned MTF Unit (Controllable)";
		dbg_txt_o = 2;
	}
	
	// DEBUG: Move to tutorial room
	if (keyboard_check_pressed(ord(1)) && (room == rm_MainMenu)) {
		dbg_txt = "Teleported to Tutorial Room";
		dbg_txt_o = 2;
		room_goto(rm_Tutorial);
	}
	
	// DEBUG: Spawn 173
	if (keyboard_check_pressed(ord(2)) && (room == rm_Tutorial)) {
		instance_create_depth(mouse_x, mouse_y, 100, obj_SCP_173);
		dbg_txt = "Spawned 173";
		dbg_txt_o = 2;
	}
}