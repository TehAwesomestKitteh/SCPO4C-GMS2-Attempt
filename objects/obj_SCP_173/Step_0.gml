/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Timer tickdown
timer_0--;

// Timer Event
if (timer_0 <= 0) {
	if (stat_kills < 5) { // If 173 has less than 5 kills, 3s windup
		timer_0 = game_get_speed(gamespeed_fps) * 3
	} else { // Otherwise, 5s windup (this makes it so 173 is less dangerous the more bodies it counts)
		timer_0 = game_get_speed(gamespeed_fps) * 5
	}
	
	var targets = ds_list_create();
	
	if collision_circle_list(x, y, range, obj_Unit, false, true, targets, true) > 0 { // If there are targets in range
		var checking = true;
		for (var i = 0; i < ds_list_size(targets); i++) { // Sift thru targets
			if (targets[| i].user != "ENEMY") { // If the target isn't a generic enemy
				// Kill them and TP + Break Loop
				x = targets[| i].x;
				y = targets[| i].y;
				self.kill(targets[| i]);
				
				checking = false;
				break;
			}
		}
		
		if (checking) {
			// If none are killable, wander
			dir = random_range(0, 360);
			x += lengthdir_x(range, dir);
			y += lengthdir_y(range, dir);
		
			x = clamp(x, 0, room_width);
			y = clamp(y, 0, room_height);
		}
		
	} else { // No targets in range
		// Wander
		dir = random_range(0, 360);
		x += lengthdir_x(range, dir);
		y += lengthdir_y(range, dir);
		
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
	}
	
	// GC
	ds_list_destroy(targets);
}