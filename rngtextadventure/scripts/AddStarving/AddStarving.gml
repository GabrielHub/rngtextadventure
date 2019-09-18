///@description Adds the starving affliction
///@param index_starving gets position of affliction

var index_starving = argument0;

//don't do anything if you're already starving, so:
if (index_starving == -1) {
	ds_list_add(obj_player.afflictions, affliction.starving);
	if (ds_list_empty(obj_player.afflictions)) {
		obj_player.deathTimer = obj_player.deathTimer_default;
	}
	else {
		//if there's another affliction decrease the time to live
		obj_player.deathTimer--;
	}
}

//if the timer has been paused, unpause it
if (obj_player.deathTimer_pause) {
	obj_player.deathTimer_pause = false;
}