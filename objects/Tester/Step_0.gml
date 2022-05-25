///@desc 
if (TEST_DISABLED || keyboard_check_pressed(ord("E"))) {
	show_debug_message("Beginning Example");
	instance_create_depth(0, 0, 0, obj_DISCORD);
	instance_destroy(id);
}