/// @description gamemanager

//check for input, number keys will select the choices
var input = -1;
for (var i = 0; i < choices; i++) {
	if (keyboard_check_pressed(ord(string(i + 1)))) {
		input = i;
		break;
	}
}

//str_len will store the # of characters in the current story event
var str_len = string_length(storyBook[ds_list_find_value(storyOrder, currentStory), story.text]);
if (input != -1 && char >= str_len) {
	//moving to the next story
	currentStory++;
	char = 0;
}