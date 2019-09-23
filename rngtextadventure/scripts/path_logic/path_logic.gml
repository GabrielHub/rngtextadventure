/// @description code executing logic from paths
/// @param currentStoryID , unique key of the current story
/// @param pathNumber , whether it's path 1 or path 2
/// @param pathType , whether it's 0 - 3

var currentStoryID = argument0;
var pathNumber = argument1;
var pathType = argument2;
var ret; //return value is the reponse text string
 
if (pathType == 1) {
	//PathType implies a simple text response
	if (pathNumber == 1) {
		ret = storyBook[currentStoryID, story.txtresponse1];	
	}
	else {
		ret = storyBook[currentStoryID, story.txtresponse2];
	}
}
else if (pathType == 2) {
	//PathType implies dynamic function
	ret = unique_path_check(currentStoryID, pathNumber);
}
else if (pathType == 3) {
	//PathType implies skip to endstate
	if (pathNumber == 1) {
		ret = storyBook[currentStoryID, story.txtresponse1];
	}
	else {
		ret = storyBook[currentStoryID, story.txtresponse2];
	}
	IsGameEnded = true;
}
else if (pathType == 0) {
	//if PathType is 0, nothing will happen and an empty string will be returned
	ret = "";
}
else {
	//error has occured
	ret = "ERROR: something went wrong in the path_logic script, no reponse text was added";
}

//do affliction functions/checks every turn,
var affliction_ended = affliction_logic();
if (affliction_ended != -1) {
	//if affliction isn't -1, it means that an affliction has killed the player. Do end code here
	IsGameEnded = true;
	if (affliction_ended == affliction.poison) {
		ret += "The poison has spread to your lungs, heart, head, shoulders, knees, and toes. You die. \n\n";
	}
	if (affliction_ended == affliction.starving) {
		ret += "How long can someone starve? About this long apparently. You've died. \n\n";
	}
	if (affliction_ended == affliction.bleed) {
		ret += "You have been bleeding for too long. You succumb to your wounds and die. \n\n";
	}
}

if (ds_list_empty(inventory_weapons)) {
	AddWeapon(1);
}

//show_debug_message("Best Weapon ID Name: " + string(globalWeapons[bestWeapon, weapon.name]));
//show_debug_message("Best Weapon ID: " + string(bestWeapon));

return ret;