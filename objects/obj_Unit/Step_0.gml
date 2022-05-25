/// @description Insert description here
// You can write your code in this editor

die = function() {
	// TODO: Add kill event code here
	instance_destroy();
}

kill = function(victim) {
	with (victim) {
		instance_destroy();
	}
	stat_kills++;
}

if (hp <= 0) {
	die();
}