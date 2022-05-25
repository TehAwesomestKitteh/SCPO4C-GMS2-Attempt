/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(object_get_sprite(object_index), subimg, x, y, image_xscale, image_yscale, rotcurrent, c_white, alpha);
rotcurrent += rotspd / game_get_speed(gamespeed_fps);
rotcurrent = rotcurrent % 360;