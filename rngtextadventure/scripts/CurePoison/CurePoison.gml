///@description Cures poison affliction
///@param index_poison , get position of affliction.poison, for use if it exists or not

//var index_poison = argument0;
obj_player.poisonCure++;
//MOVED poison cure code to the affliction_logic
/*
//if already poisoned, (use the cure and don't add it to inventory -- now moved to affliction_logic)
if (index_poison == -1) {
	//if the player isn't already poisoned, add a cure to the inventory
	obj_player.poisonCure++;
}*/