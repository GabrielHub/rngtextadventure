/// @description conditionals checking for unique paths
/// @param currentStoryID , unique key of the current story
/// @param pathNumber, whether path 1 or 2 was chosen

var currentStoryID = argument0;
var pathNumber = argument1;
var ret = "ERROR: No text returned in unique_path_check";

//unique id 2: lobster eaten path
if (currentStoryID == 2) {
	ret = "It's flesh is delicious and you feel satisfied. You place the shell on your hip and feel midly safer. \n";	
	ds_list_add(inventory_weapons, 0);
	globalWeapons[0, weapon.inInventory] = true;
	if (bestWeapon < globalWeapons[0, weapon.strength]) {
		bestWeapon = globalWeapons[0, weapon.strength];
	}
}
else if (currentStoryID == 3) {
	//Unique id 3: lobster monster man thing path
	if (pathNumber == 1) {
		//check player inventory for lobster shell, weapon id 0
		if (ds_list_find_index(inventory_weapons, 0) == -1) {
			ret = "The lobster man brews a cup of tea, demonstrates a tasteful Viennese waltz, and you discuss the political climate for an hour. You carry on, feeling inspired. \n";
		}
		else {
			ret = "The lobster man notices the shell of its brother on your hip, and promptly crushes you into a juice. \n";
			IsGameEnded = true;	
		}
	}
	else if (pathNumber == 2) {
		var str = "A massive claw pinches your neck and tosses you back, you're going nowhere. \n";
		//check player inventory for lobster shell, weapon id 0
		if (ds_list_find_index(inventory_weapons, 0) == -1) {
			ret = str + "The lobster man is offended, and walks off in a huff. You feel guilty. \n";
		}
		else {
			ret = str + "The lobster man notices the shell of its brother on your hip, and promptly crushes you into a juice. \n";
			IsGameEnded = true;	
		}
	}
	else {
		ret = "ERROR: story 3 has an invalid path number";	
	}
}
else {
	ret = "ERROR: currentStoryID did not match any known value, unique_path_check";
}

return ret;