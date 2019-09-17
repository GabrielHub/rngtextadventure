/// @description code executing logic from paths
/// @param currentStoryID , unique key of the current story
/// @param pathNumber , whether it's path 1 or path 2
/// @param pathType , whether it's 0 - 3

var currentStoryID = argument0;
var pathNumber = argument1;
var pathType = argument2;
var ret; //return value is the reponse text string

show_debug_message("script working")
 
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

//check poison logic
if (poisonTimer) {
	if (poisonTimer == -1) {
		poisonTimer = poisonTimerMax;
	}
	else if (poisonTimer == 0) {
		IsGameEnded = true;
		responseText = "The poison has killed you.";
	}
	else {
		poisonTimer--;
	}
}
else {
	//if you've been healed, reset the timer
	if (poisonTimer >= 0) {
		poisonTimer = -1;
	}
}

return ret;