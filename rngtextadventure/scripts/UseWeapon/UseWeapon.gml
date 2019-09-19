///@description given your best weapon, use it
///@param weapon_id, the weapon_id of your strongest weapon
///@param enemy_strength, power level (int) of the opposing object

var weapon_id = argument0;
var enemy_strength = argument1;

/*
return an array with 3 indices,
[0] is the weapon_name,
[1] is whether or not you succesfully used it (beaten the monster or not)
[2] is whether the weapon has broken or not (removed from inventory)
*/
var ret;
ret[0] = globalWeapons[weapon_id, weapon.name];
ret[2] = false; //default not break

//don't need to check for empty weapon, because you should always have your fists

//check to see how powerful the monster is and compare to the weapon
if (globalWeapons[weapon_id, weapon.strength] >= enemy_strength) {
	show_debug_message("Defeated enemy!");
	ret[1] = true;
}
else {
	ret[1] = false;
}

//make sure to change the best weapon if the used weapon is destroyed
if (globalWeapons[weapon_id, weapon.singleUse]) {
	ret[2] = true;
	ds_list_delete(inventory_weapons, ds_list_find_index(inventory_weapons, weapon_id));
	globalWeapons[weapon_id, weapon.inInventory] = false;
	
	bestWeapon = 0;
	for (var i = 0; i < ds_list_size(inventory_weapons); i++) {
		if (globalWeapons[ds_list_find_value(inventory_weapons, i), weapon.strength] > bestWeapon) {
			bestWeapon = globalWeapons[ds_list_find_value(inventory_weapons, i), weapon.strength];
		}
	}
}
else {
	ret[2] = false;
}

return ret;