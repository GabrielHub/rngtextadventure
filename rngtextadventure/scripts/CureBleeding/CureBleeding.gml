///@description Cures bleeding affliction
///@param index_poison , get position of affliction.bleed, for use if it exists or not

var index_bleed = argument0;
obj_player.bleedCure++;

//if consuming immediately, return true
if (index_bleed != -1) {
	return true;
}
else {
	return false;
}