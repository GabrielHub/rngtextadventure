/// @description items, inventory, dynamic functions
globalvar bestWeapon; //holds highest strength value of owned weapon
globalvar inventory_weapons;
bestWeapon = 0;
inventory_weapons = ds_list_create();

//poison attributes
globalvar isPoisoned;
globalvar poisonTimer; //make sure to return this to -1 when player is no longer poisoned
globalvar poisonTimerMax; //how many turns it takes to kill the player
isPoisoned = false;
poisonTimer = -1;
poisonTimerMax = 8;