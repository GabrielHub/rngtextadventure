/// @description interface

//draw variables
var margin = 32;
var width = room_width - margin * 2;
var choicePositions = room_height * 0.7;

if (room == rm_playing) {
	if (currentStory < ds_list_size(storyOrder)) {
		//drawing event
		var textDraw = responseText + string_copy(storyBook[ds_list_find_value(storyOrder, currentStory), story.text], 1, char);
		//show_debug_message(textDraw);
		draw_text_ext(margin, margin, textDraw, -1, width);

		//drawing choices
		var length = string_length(responseText) + string_length(storyBook[ds_list_find_value(storyOrder, currentStory), story.text]);
		if (char >= length) {
			var prevHeight = 0;
	
			//alarm, choice selection, and color
			if (choiceAlarm == 0) {
				draw_set_color(c_blue);
			}
			//choice 1
			var choiceText = "(1) " + storyBook[ds_list_find_value(storyOrder, currentStory), story.choice1];
			draw_text_ext(margin, choicePositions + prevHeight, choiceText, -1, width);
			prevHeight += string_height_ext(choiceText, -1, width) + 8;
			draw_set_color(c_white);
	
			//alarm, choice selection, and color
			if (choiceAlarm == 1) {
				draw_set_color(c_blue);
			}
			//choice 2
			choiceText = "(2) " + storyBook[ds_list_find_value(storyOrder, currentStory), story.choice2];
			draw_text_ext(margin, choicePositions + prevHeight, choiceText, -1, width);
			prevHeight += string_height_ext(choiceText, -1, width) + 8;
			draw_set_color(c_white);
		}
		else {
			char += textSpeed;	
		}
	}
	else {
		show_debug_message("OUT OF STORIES OUT OF INDEX");
		draw_text(room_width / 2, room_height / 2, "Out of Stories! Game Over?");
	}
}
else {
	draw_text(room_width / 2, room_height / 2, responseText);
}