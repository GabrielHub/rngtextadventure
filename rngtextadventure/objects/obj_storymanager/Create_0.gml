/// @description loading story

randomize();

//init variables
currentStory = 0;
char = 0;
textSpeed = 1;
choiceAlarm = -1;
choices = 2;
input = -1;
storyOrder = ds_list_create(); //List of all the events, shuffled
responseText = "";
globalvar storyBook; //contains all the events
globalvar IsGameEnded;
IsGameEnded = false;

/* enum for use in the multidimensional array
	text is the string of the event
	each event has two choices
	story ID is the unique key for each event, which is used when executing certain responses
	there is a path for each event's choice:
		0 means there is no consequence
		1 means there is a text response
		2 means check the player for inventory/something else (requires secondary calculation)
		3 means go to endstate
		
	txtresponse1/2 are optional values that contain strings for path responses
*/

enum story {
	text = 0,
	choice1 = 1,
	choice2 = 2,
	path1 = 3,
	path2 = 4,
	txtresponse1 = 5,
	txtresponse2 = 6
}
//Build all the events below
storyBook[1, story.text] = "The stench of death hangs around you, and a violent tapping echoes ahead.";
storyBook[1, story.choice1] = "Rush towards the noise.";
storyBook[1, story.choice2] = "Turn around.";
storyBook[1, story.path1] = 3;
storyBook[1, story.path2] = 0;
storyBook[1, story.txtresponse1] = "You rush towards your death. \n";
ds_list_add(storyOrder, 1);

storyBook[2, story.text] = "A lobster appears before you.";
storyBook[2, story.choice1] = "Eat the lobster.";
storyBook[2, story.choice2] = "Talk to the lobster.";
storyBook[2, story.path1] = 2;
storyBook[2, story.path2] = 1;
storyBook[2, story.txtresponse2] = "The lobster gives you a confused look, then walks away. Your stomach grumbles. \n";
ds_list_add(storyOrder, 2);

ds_list_shuffle(storyOrder);
//Initial event, make sure to add this to the list last and AFTER THE SHUFFLE
storyBook[0, story.text] = "The hallway is dark, damp, depressing, yet classy. You need to get out of here.";
storyBook[0, story.choice1] = "Walk forward.";
storyBook[0, story.choice2] = "Walk backward.";
storyBook[0, story.path1] = 0;
storyBook[0, story.path2] = 0;
ds_list_insert(storyOrder, 0, 0);