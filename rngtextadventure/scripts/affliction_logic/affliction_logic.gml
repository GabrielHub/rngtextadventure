//show_debug_message("isPoisoned= " + string(isPoisoned));
show_debug_message("Afflicted! Turns until death: " + string(obj_player.deathTimer));

//return the type of affliction that has killed you. -1 means there isn't a game ending affliction effect
var ret = -1;

var isAfflicted = !ds_list_empty(obj_player.afflictions);

//affliction checks. If != -1, then affliction is true
var isPoisoned = ds_list_find_index(obj_player.afflictions, affliction.poison);
var isStarving = ds_list_find_index(obj_player.afflictions, affliction.starving);

//if cures have been applied, so conditionals work at the end of the code
var _poisonCured = false;
var _starvingCured = false;


if (isAfflicted) {
	//If the affliction has been applied in a fresh state
	if (obj_player.deathTimer == -1) {
		obj_player.deathTimer = obj_player.deathTimer_default;
	}
	
	//apply poison effects if poisoned
	if (isPoisoned != -1) {
		if (obj_player.poisonCure > 0) {
			//Check for a cure in your inventory, if it exists, then cure.
			_poisonCured = true;
		}
		else if (obj_player.deathTimer == 0) {
			//player has died, so make sure the return string is for poison
			ret = affliction.poison;
		}
		else {
			//only reduce timer if not paused
			if (!obj_player.deathTimer_pause) {
				show_debug_message("Poisoned! Turns until death: " + string(obj_player.deathTimer));
				obj_player.deathTimer--;
			}
		}
	}
	//apply poison cure if poisoned and a cure if available
	if (_poisonCured) {
		show_debug_message("Poison Cured!");
		//poison pauses the timer if there is another affliction, but removes the timer if it is the only affliction
		if (ds_list_empty(obj_player.afflictions)) {
			obj_player.deathTimer = -1;
		}
		else {
			obj_player.deathTimer_pause = true;
		}
		obj_player.poisonCure--;
		ds_list_delete(obj_player.afflictions, affliction.poison);
	}
	
	//apply starving effects if starving
	if (isStarving != -1) {
		if (obj_player.food > 0) {
			//Check for a cure in your inventory, if it exists, then cure.
			_starvingCured = true;
		}
		else if (obj_player.deathTimer == 0) {
			//player has died, so make sure the return string is for poison
			ret = affliction.starving;
		}
		else {
			//only reduce timer if not paused
			if (!obj_player.deathTimer_pause) {
				show_debug_message("Starving! Turns until death: " + string(obj_player.deathTimer));
				obj_player.deathTimer--;
			}
		}
	}
	//apply starving cure if starving and food is > 0
	if (_starvingCured) {
		show_debug_message("Starving Cured!");
		//starving adds to the timer if there is another affliction, but removes the timer if it is the only affliction
		if (ds_list_empty(obj_player.afflictions)) {
			obj_player.deathTimer = -1;
		}
		else {
			obj_player.deathTimer += 10; //add 10 turns to the deathtimer if there's another affliction
		}
		obj_player.food--;
		ds_list_delete(obj_player.afflictions, affliction.starving);
	}
}

return ret;