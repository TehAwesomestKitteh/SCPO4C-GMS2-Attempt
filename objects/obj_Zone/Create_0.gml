/// @description Core Zone Variables

controller = "" //- Denotes current zone controller
status = "" //- Status of the room
destination_zones = [] //- Zones that it can send Units to
destination_zone_arrows = [] //- Arrows for the destination zones
x1 = x - 32;
y1 = y - 32;
x2 = x + 32;
y2 = y + 32;

timer_0 = game_get_speed(gamespeed_fps) * 3;

/*
/// --- @function                 getSize();
/// --- @description              return a room's size;
function getController() {
	return controller;
}
*/