///@description Poison logic if poison has been applied
///@param index_poison , get position of affliction.poison, for use if it exists or not

//check for POISON, reduce poison timer if already poisoned
var index_poison = argument0;

var ret = "";

//check if you are already poisoned
if (index_poison != -1) {
	//reduce timer by one if already poisoned and not about to die, so stacking poisons quickens death
	if (obj_player.deathTimer > 2) {
		obj_player.deathTimer--;
	}
}
else {
	//apply poison affect
	ds_list_add(obj_player.afflictions, affliction.poison);
	if (ds_list_empty(obj_player.afflictions)) {
		obj_player.deathTimer = obj_player.deathTimer_default;
	}
}

//if you have a cure, return a string 
if (obj_player.poisonCure > 0) {
	ret = "You have a cure for poison and you use it! \n\n";
	//show_debug_message("temp working")
}

//if the timer has been paused, unpause it
if (obj_player.deathTimer_pause) {
	obj_player.deathTimer_pause = false;
}

return ret;