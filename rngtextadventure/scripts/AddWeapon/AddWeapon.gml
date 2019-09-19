///@description Adds a weapon to the player inventory
///@param weapon_id id of the weapon to be added

var weapon_id = argument0;

ds_list_add(inventory_weapons, weapon_id);
globalWeapons[weapon_id, weapon.inInventory] = true;

//check if it is the new best weapon
if (bestWeapon < globalWeapons[weapon_id, weapon.strength]) {
	bestWeapon = globalWeapons[weapon_id, weapon.strength];
	show_debug_message("New Best Weapon added!");
}
show_debug_message("Weapon added: " + string(weapon_id));