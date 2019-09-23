/// @description gamemanager, check for consequences

if (room == rm_playing) {
	if (IsGameEnded) {
		ShakeScreen(10, 15);
		room_goto(rm_gameover);	
		show_debug_message("Moving to game over screen");
	}

	//check for input, number keys will select the choices
	input = -1;
	for (var i = 0; i < choices; i++) {
		if (keyboard_check_pressed(ord(string(i + 1)))) {
			input = i;
			break;
		}
	}


	//str_len will store the # of characters in the current story event
	if (currentStory < ds_list_size(storyOrder)) {
		var str_len = string_length(responseText) + string_length(storyBook[ds_list_find_value(storyOrder, currentStory), story.text]);
		if (input != -1 && char >= str_len) {
			choiceAlarm = input;
			alarm[0] = 20;
		}
	}
	else {
		//show_debug_message("OUT OF STORIES OUT OF INDEX");	
		//if you run through all the stories
		if (keyboard_check_pressed(vk_space)) {
			game_end();	
		}
	}
}
else {
	//show_debug_message("Game Over");	
	if (keyboard_check_pressed(ord("R"))) {
		room_goto(rm_playing);
		game_restart();
	}
}