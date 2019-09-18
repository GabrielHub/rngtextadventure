/// @description items, inventory, dynamic functions
globalvar bestWeapon; //holds highest strength value of owned weapon
globalvar inventory_weapons;
bestWeapon = 0;
inventory_weapons = ds_list_create();

//death timer code
enum affliction {
	poison,
	bleed,
	starving,
	dehydrated
}
deathTimer = -1; //how many turns until the player dies. -1 means there are no afflictions
deathTimer_default = 15; //the default amount of turns until you die, if previously unafflicted by anything
deathTimer_pause = false; //if you've been cured of one affliction, but another is still applied, then the timer is simply paused
afflictions = ds_list_create();

//affliction cures
poisonCure = 0; //if you don't have a cure, it is 0. Cure's stack so it's an int
food = 0; //note that food works as a 'cure' to starvation. it doesn't actually go down over time 