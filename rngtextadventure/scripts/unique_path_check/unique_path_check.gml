/// @description conditionals checking for unique paths
/// @param currentStoryID , unique key of the current story
/// @param pathNumber, whether path 1 or 2 was chosen

var currentStoryID = argument0;
var pathNumber = argument1;
var ret = "ERROR: No text returned in unique_path_check";

//unique id 2: lobster eaten path
if (currentStoryID == 2) {
	ret = "Its flesh is delicious and you feel satisfied. You place the shell on your hip and feel midly safer. \n\n";	
	CureStarving();
	AddWeapon(0);
}
else if (currentStoryID == 3) {
	//Unique id 3: lobster monster man thing path
	if (pathNumber == 1) {
		//check player inventory for lobster shell, weapon id 0
		if (ds_list_find_index(inventory_weapons, 0) == -1) {
			ret = "The lobster man brews a cup of tea, demonstrates a tasteful Viennese waltz, and you discuss the political climate for an hour. You carry on, feeling inspired. \n\n";
		}
		else {
			ret = "The lobster man notices the shell of its brother on your hip, and promptly crushes you into a juice. \n\n";
			IsGameEnded = true;
		}
	}
	else if (pathNumber == 2) {
		var str = "A massive claw pinches your neck and tosses you back, you're going nowhere. \n\n";
		//check player inventory for lobster shell, weapon id 0
		if (ds_list_find_index(inventory_weapons, 0) == -1) {
			ret = str + "The lobster man is offended, and walks off in a huff. You feel guilty. \n\n";
		}
		else {
			ret = str + "The lobster man notices the shell of its brother on your hip, and promptly crushes you into a juice. \n\n";
			IsGameEnded = true;	
		}
	}
	else {
		ret = "ERROR: story 3 has an invalid path number";	
	}
}
else if (currentStoryID == 4) {
	ret = "You grab the object and recoil in pain. A sea urchin is violently attached to your hand. You slap it off and hope it isn't poisonous... \n\n";
	ret += AddPoison(ds_list_find_index(obj_player.afflictions, affliction.poison));
}
else if (currentStoryID == 5) {
	ret = "The man thanks you, and leaves with a skip to his step. You just poisoned yourself, and limp on. \n\n";
	ret += AddPoison(ds_list_find_index(obj_player.afflictions, affliction.poison));
}
else if (currentStoryID == 6) {
	ret = "You tap her shoulder and ask her if she’s ok. She bites down hard and toxic black blood leaks from your hand. You look around, but she's gone. You keep walking. \n\n";	
	ret += AddPoison(ds_list_find_index(obj_player.afflictions, affliction.poison));
}
else if (currentStoryID == 9) {
	if (CurePoison(ds_list_find_index(obj_player.afflictions, affliction.poison))) {
		ret = "The bottle's smile turns into a silent scream as you consume the liquid within. Your poison is cured! \n\n";
	}
	else {
		ret = "You pocket the bottle. It whispers sweet nothings. \n\n";
	}
}
else if (currentStoryID == 11) {
	var i = UseWeapon(bestWeapon, 7);
	//if i[1] is true, you have defeated the minotaur
	if (i[1]) {
		ret = "With a mighty strike the minotaur collapses, showering you in it’s juice. You walk on, every step a squish. \n\n";
	}
	else {
		ret = "You go in for an attack, but the minotaur blocks it with ease, and smashes you to a pulp. You exist now and for eternity as a pile of mush on the floor of a dungeon. \n\n";
		IsGameEnded = true;
	}
}
else {
	ret = "ERROR: currentStoryID did not match any known value, unique_path_check";
}

return ret;