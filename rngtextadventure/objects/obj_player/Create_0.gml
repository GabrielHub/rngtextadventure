/// @description items, inventory, dynamic functions
globalvar bestWeapon; //holds highest strength value of owned weapon
globalvar inventory_weapons;
bestWeapon = 0;
inventory_weapons = ds_list_create();

//poison attributes
isPoisoned = false;
poisonTimer = -1; //make sure to return this to -1 when player is no longer poisoned
poisonTimerMax = 10; //how many turns it takes to kill the player