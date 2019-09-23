///@description Adds a weapon to the player inventory
///@param weapon_id id of the weapon to be added

var weapon_id = argument0;

ds_list_add(inventory_weapons, weapon_id);
globalWeapons[weapon_id, weapon.inInventory] = true;

show_debug_message("Adding Weapon.strength= " + string(globalWeapons[bestWeapon, weapon.strength]));
show_debug_message("Best Weapon= " + globalWeapons[bestWeapon, weapon.name]);

//check if it is the new best weapon
if (globalWeapons[bestWeapon, weapon.strength] < globalWeapons[weapon_id, weapon.strength]) {
	bestWeapon = weapon_id;
	show_debug_message("New Best Weapon added!");
}
show_debug_message("Weapon added: " + string(weapon_id));