///@description Adds a weapon to the player inventory
///@param weapon_id id of the weapon to be added

var weapon_id = argument0;

ds_list_add(inventory_weapons, weapon_id);
globalWeapons[weapon_id, weapon.inInventory] = true;
if (bestWeapon < globalWeapons[weapon_id, weapon.strength]) {
	bestWeapon = globalWeapons[weapon_id, weapon.strength];
}