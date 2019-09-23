/// @description conditionals checking for unique paths
/// @param currentStoryID , unique key of the current story
/// @param pathNumber, whether path 1 or 2 was chosen

var currentStoryID = argument0;
var pathNumber = argument1;
var ret = "ERROR: No text returned in unique_path_check";

//unique id 2: lobster eaten path
if (currentStoryID == 2) {
	ret = "Its flesh is delicious and you feel satisfied. You place the shell on your hip and keep the leftover meat. \n\n";	
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
		var str = "A massive claw pinches your neck and tosses you back, you`re going nowhere. \n\n";
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
	ret = "You grab the object and recoil in pain. A sea urchin is violently attached to your hand. You slap it off and hope it isn`t poisonous... \n\n";
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
	var i = UseWeapon(7);
	//if i[1] is true, you have defeated the minotaur
	if (i[1]) {
		ret = "The minotaur collapses under the strength of the " + ret[0] + ", showering you in its juice. You walk on, every step a squish. \n\n";
	}
	else {
		ret = "You go in for an attack, but the minotaur blocks it with ease, and smashes you to a pulp. You exist now and for eternity as a pile of mush on the floor of a dungeon. \n\n";
		IsGameEnded = true;
	}
}
else if (currentStoryID == 16) {
	AddWeapon(2);
	ret = "The rhyme seems to work as you watch the words slide off the wall, folding itself into a weapon in your hands. \n\n";
}
else if (currentStoryID == 17) {
	AddWeapon(3);
	ret = "You find a mysterious sword hidden among the cobwebs. You pocket it and move on. \n\n";
}
else if (currentStoryID == 18) {
	if (CureBleeding(ds_list_find_index(obj_player.afflictions, affliction.bleed))) {
		ret = "You sigh with relief as you wrap the bandages around your bleeding gashes. \n\n";
	}
	else {
		ret = "You pocket the bandages, they might come in handy later! \n\n";
	}
}
else if (currentStoryID == 19) {
	if (pathNumber == 1) {
		if (CurePoison(ds_list_find_index(obj_player.afflictions, affliction.poison))) {
			ret = "You down it in one gulp. You start to feel a bit better and move on. \n\n";
		}
		else {
			ret = "You put the bottle away. The air grows colder as you carry on. \n\n";
		}
	}
	else if (pathNumber == 2) {
		ret = "You stomp down on the little glass bottle. Glass shards pierce your boots and you start bleeding. \n\n";
		ret += AddBleeding(ds_list_find_index(obj_player.afflictions, affliction.bleed));
	}
	else {
		ret = "ERROR: story 19 has an invalid path number";
	}
}
else if (currentStoryID == 20) {
	ret = "Your stomach growls louder. You're so hungry you would even eat at the dining hall. That's a sad thought. \n\n";	
	ret += AddStarving(ds_list_find_index(obj_player.afflictions, affliction.starving));
}
else if (currentStoryID == 24) {
	CureStarving();
	ret = "You filet the fish. It tastes just alright. You pocket the leftovers and move on. \n\n";
}
else if (currentStoryID == 26) {
	ret = "You carry on your way with your trusty keg, each step a little less stable than the last. \n\n";
}
else if (currentStoryID == 27) {
	AddWeapon(4);
	ret = "With a hefty tug you tear the sign from the corpse. This could make a fine weapon. You lean it on your shoulder and carry on. \n\n";	
}
else if (currentStoryID == 28) {
	var i = UseWeapon(4);
	//if i[1] is true, you have defeated the monster
	if (i[1]) {
		ret = "You swing your " + ret[0] + " and smash the glass on the screen. A key lies within it. You pocket the it and move on. \n\n";
		AddWeapon(5);
	}
	else {
		ret = "You swing your " + ret[0] + " but the monster grabs. The weapon splinters in its hands, killing you and breaking the TV. A murder-suicide has ended your story. \n\n";
		IsGameEnded = true;
	}
}
else if (currentStoryID == 29) {
	//this story requires the golden key 'weapon' to be in the inventory
	if (ds_list_find_index(inventory_weapons, 5) == -1) {
		ret = "The doorknob won't turn. Maybe it needs a key? You decide to move on. \n\n";
	}
	else {
		ret = "You unlock the door with the Golden Key, and find a supply closet. Goodbye afflictions! \n\n";
		CureStarving();
		CurePoison(ds_list_find_index(obj_player.afflictions, affliction.poison));
		CureBleeding(ds_list_find_index(obj_player.afflictions, affliction.bleed));
	}
}
else if (currentStoryID == 30) {
	ret = "You grab the hatchet and swing at the tree. You cry with each swing. The tree does too. After 7 hours you finally fell the tree. Your hands and soul bloody, you walk across the ravine. \n\n";
	ret += AddBleeding(ds_list_find_index(obj_player.afflictions, affliction.bleed));
}
else if (currentStoryID == 31) {
	ret = "The dog yelps and runs away. Not before biting a significant chunk out of your left thigh. You limp on. \n\n";
	ret += AddBleeding(ds_list_find_index(obj_player.afflictions, affliction.bleed));
}
else if (currentStoryID == 32) {
	AddWeapon(6);
	ret = "You find a massive pen. You agree the pen can be mightier than the sword and move on. \n\n";
}
else if (currentStoryID == 33) {
	var i = UseWeapon(3);
	//if i[1] is true, you have defeated the monster
	if (i[1]) {
		ret = "A massive centipede jumps out at you! You whip out your " + ret[0] + " and kill it, spraying toxic black blood everywhere. \n\n";
		ret += AddPoison(ds_list_find_index(obj_player.afflictions, affliction.poison));
	}
	else {
		ret = "A massive centipede jumps out at you! You whip out your " + ret[0] + " and the rest is history. As in you are history. You're dead. \n\n";
		IsGameEnded = true;
	}
}
else if (currentStoryID == 34) {
	ret = "You pick the dice up. " + string(irandom_range(2, 24)) + "! You don't know what that means. \n\n";	
}
else {
	ret = "ERROR: currentStoryID did not match any known value, unique_path_check";
}

return ret;