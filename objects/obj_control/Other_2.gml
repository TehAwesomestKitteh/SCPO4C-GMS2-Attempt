/// @description Initial Game Settings and Master Game/Function Variables
// You can write your code in this editor

// Game Version and Speed
g_version = 0.01;
game_set_speed(60, gamespeed_fps);

// Set Cursor
defaultCursor = spr_cursor_small;
window_set_cursor(cr_none);
cursor_sprite = defaultCursor;

// Game State Variables
enum GameState {PAUSED, PLAYING, QUITTING}
gameState = GameState.PLAYING;

user = "O4-0001" // TODO: Change User Dynamic

// Camera Variables
cam_w = 1280;
cam_h = 720;
cam_zoom = 1.0;
cam_zoomadjust = false;
cam_zoomin = 0;

// Debug Variables
dbg = true;
dbg_txt_o = 0;
dbg_txt = "";