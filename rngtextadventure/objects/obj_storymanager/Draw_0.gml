/// @description interface

//draw variables
var margin = 32;
var width = room_width - margin * 2;
var choicePositions = room_height * 0.7;

if (room == rm_playing) {
	if (currentStory < ds_list_size(storyOrder)) {
		//drawing event
		var textDraw = string_copy(responseText + storyBook[ds_list_find_value(storyOrder, currentStory), story.text], 1, char);
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
		//show_debug_message("OUT OF STORIES OUT OF INDEX");
		draw_text_ext(margin, margin, "You've walked a long time but see a light at the end of the corridor. \n Maybe it is time to finally rest... \n but why can't you? Are you destined to walk this path for the rest of your life? \n You've evaded death at every corner, made it so far... \n And these choices of yours have led to an unending torture. \n\n You must walk these halls of purgatory, not alive, not quite dead either. Just you and your thoughts. \n\n *Press 'Spacebar' to restart!", -1, width);
	}
}
else {
	if (endGameText) {
		draw_text_ext(margin, margin, "You've walked through your life, and have finally reached the end. You remember what happened before you ended up here, your entire life. This choice lead to death, but the alternative would have been making choices to survive an eternal walk in purgatory." + "\n *Press 'R' to restart!", -1, width);
	}
	else {
		draw_text_ext(margin, margin, responseText + "\n *Press 'R' to restart!", -1, width);
	}
	
	if (keyboard_check_pressed(vk_space)) {
		endGameText = true;
	}
}