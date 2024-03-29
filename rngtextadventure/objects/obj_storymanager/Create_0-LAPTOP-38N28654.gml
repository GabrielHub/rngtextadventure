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
endGameText = false; //whether or not to display the hidden special message to show you've beaten the game
globalvar responseText;
globalvar storyBook; //contains all the events
globalvar IsGameEnded;
IsGameEnded = false;
responseText = "";

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
storyBook[1, story.txtresponse1] = "You rush towards your death. \n\n";
ds_list_add(storyOrder, 1);

storyBook[2, story.text] = "A lobster appears before you.";
storyBook[2, story.choice1] = "Eat the lobster.";
storyBook[2, story.choice2] = "Talk to the lobster.";
storyBook[2, story.path1] = 2;
storyBook[2, story.path2] = 1;
storyBook[2, story.txtresponse2] = "The lobster gives you a confused look, then walks away. Your stomach grumbles. \n\n";
ds_list_add(storyOrder, 2);

storyBook[3, story.text] = "From the shadows, a curious creature approaches. Is it man? Is it lobster?";
storyBook[3, story.choice1] = "Confront this monster of a lobster.";
storyBook[3, story.choice2] = "Turn and run!";
storyBook[3, story.path1] = 2;
storyBook[3, story.path2] = 2;
ds_list_add(storyOrder, 3);

storyBook[4, story.text] = "On the next step a sharp pain fires through your leg.";
storyBook[4, story.choice1] = "Kick the object away.";
storyBook[4, story.choice2] = "Pull the object from your foot and toss it aside.";
storyBook[4, story.path1] = 1;
storyBook[4, story.path2] = 2;
storyBook[4, story.txtresponse1] = "The object flies through the dark. You hear a yelp of pain in front of you. You turn around and quicken your pace. \n\n";
ds_list_add(storyOrder, 4);

storyBook[5, story.text] = "A sickly man is lying on the ground. He tells you he's been bitten and asks you to suck the poison out.";
storyBook[5, story.choice1] = "Do what you gotta do.";
storyBook[5, story.choice2] = "Don`t do anything you don’t have to do.";
storyBook[5, story.path1] = 2;
storyBook[5, story.path2] = 1;
storyBook[5, story.txtresponse2] = "He tells you he will remember this slight. You remind him he's dying. \n\n";
ds_list_add(storyOrder, 5);

storyBook[6, story.text] = "Up against the wall of the hallway lies a crying girl in a tattered grey tunic, her head in her hands.";
storyBook[6, story.choice1] = "Attempt to help her.";
storyBook[6, story.choice2] = "Attack her.";
storyBook[6, story.path1] = 2;
storyBook[6, story.path2] = 1;
storyBook[6, story.txtresponse2] = "You attack swiftly and viciously, bathing the walls with black blood. There is no reward or consequence, except a little tease of judgement. You keep walking. \n\n";
ds_list_add(storyOrder, 6);

storyBook[7, story.text] = "There is nothing but the harsh walk ahead. Is anyone really living or are we all just dying forwards?";
storyBook[7, story.choice1] = "Keep walking, but lively.";
storyBook[7, story.choice2] = "Keep walking, but sadly.";
storyBook[7, story.path1] = 0;
storyBook[7, story.path2] = 0;
ds_list_add(storyOrder, 7);

storyBook[8, story.text] = "The lights on the ceiling flicker, illuminating the path in front of you as you take each step.";
storyBook[8, story.choice1] = "Keep walking, but with gusto.";
storyBook[8, story.choice2] = "Keep walking, but normally.";
storyBook[8, story.path1] = 0;
storyBook[8, story.path2] = 0;
ds_list_add(storyOrder, 8);

storyBook[9, story.text] = "The hallway feels warmer. A bottle rolls towards you. It smiles, the only way a bottle can?";
storyBook[9, story.choice1] = "Take the bottle.";
storyBook[9, story.choice2] = "Ignore the bottle.";
storyBook[9, story.path1] = 2;
storyBook[9, story.path2] = 1;
storyBook[9, story.txtresponse2] = "The bottle seems upset. You keep walking. \n\n";
ds_list_add(storyOrder, 9);

storyBook[10, story.text] = "The weight of this endless walk grows heavier with every step. Literally.";
storyBook[10, story.choice1] = "Why are your pockets so deep?";
storyBook[10, story.choice2] = "And why do you just keep everything you find?";
storyBook[10, story.path1] = 1;
storyBook[10, story.path2] = 1;
storyBook[10, story.txtresponse1] = "If someoneone has infinite pocket-space they might as well use it right? \n\n";
storyBook[10, story.txtresponse2] = "You remember how your friends made fun of you for your hoarding. You walk with a heavy heart. \n\n";
ds_list_add(storyOrder, 10);

storyBook[11, story.text] = "On the next step the lights suddenly start flickering, and a shadow towers over you. A minotaur blocks your way!";
storyBook[11, story.choice1] = "Attack the monster!";
storyBook[11, story.choice2] = "Run away!";
storyBook[11, story.path1] = 2;
storyBook[11, story.path2] = 1;
storyBook[11, story.txtresponse2] = "You narrowly evade the minotaur with cowardly strength and leave it in your dust! \n\n";
ds_list_add(storyOrder, 11);

storyBook[12, story.text] = "You step on something squishy. On further inspection, a pulsing blob of green slime tightens its grip on your foot.";
storyBook[12, story.choice1] = "Attack the monster!";
storyBook[12, story.choice2] = "Run away!";
storyBook[12, story.path1] = 1;
storyBook[12, story.path2] = 1;
storyBook[12, story.txtresponse1] = "The slime is helpless as you spread its corpse across the walls like a jam. You move on, reveling in your victory. \n\n";
storyBook[12, story.txtresponse2] = "You stagger backwards. The slime remains in place, reveling in its victory. \n\n";
ds_list_add(storyOrder, 12);

storyBook[13, story.text] = "You notice heavy breathing on your neck. A hooded figure follows your every step. \"You belong here\" it whispers.";
storyBook[13, story.choice1] = "\"Can you stop breathing on me?\"";
storyBook[13, story.choice2] = "\"Why?\"";
storyBook[13, story.path1] = 1;
storyBook[13, story.path2] = 1;
storyBook[13, story.txtresponse1] = "\"Then start running\" it hisses with disdain. \n\n";
storyBook[13, story.txtresponse2] = "\"Arrogant creature...\" the figure draws a threatening tone. Perhaps it would be best to get going. \n\n";
ds_list_add(storyOrder, 13);

storyBook[14, story.text] = "There is a crunch beneath each step. There is a taste of salt in the air.";
storyBook[14, story.choice1] = "Breathe and remember.";
storyBook[14, story.choice2] = "“Listen and remember.";
storyBook[14, story.path1] = 1;
storyBook[14, story.path2] = 1;
storyBook[14, story.txtresponse1] = "You feel the sea enter your nose. Where are you? \n\n";
storyBook[14, story.txtresponse2] = "The silence gives way to the crashing of waves. The sounds cease as you carry on. \n\n";
ds_list_add(storyOrder, 14);

storyBook[15, story.text] = "As each step grows harder, your mind wanders. What are your students doing right now? Probably not walking endlessly.";
storyBook[15, story.choice1] = "Continue the walk.";
storyBook[15, story.choice2] = "Take a breather.";
storyBook[15, story.path1] = 0;
storyBook[15, story.path2] = 1;
storyBook[15, story.txtresponse2] = "Smells like dead fish. You decide to keep moving. \n\n";
ds_list_add(storyOrder, 15);

storyBook[16, story.text] = "You come across some strange words scratched into the wall, \"What rhymes with Galifianakis?\"";
storyBook[16, story.choice1] = "\"Dialysis.\"";
storyBook[16, story.choice2] = "\"I wish I didn't pull the plug on my father.\"";
storyBook[16, story.path1] = 2;
storyBook[16, story.path2] = 1;
storyBook[16, story.txtresponse2] = "Yikes. You move on. \n\n";
ds_list_add(storyOrder, 16);

storyBook[17, story.text] = "";
storyBook[17, story.choice1] = "\"Dialysis.\"";
storyBook[17, story.choice2] = "\"I wish I didn't pull the plug on my father.\"";
storyBook[17, story.path1] = 2;
storyBook[17, story.path2] = 1;
storyBook[17, story.txtresponse2] = "Yikes. You move on. \n\n";
ds_list_add(storyOrder, 17);

ds_list_shuffle(storyOrder);
//Initial event, make sure to add this to the list last and AFTER THE SHUFFLE
storyBook[0, story.text] = "You find yourself in a dimly lit hallway, extending far in front and behind you.";
storyBook[0, story.choice1] = "Walk forward.";
storyBook[0, story.choice2] = "Walk backward.";
storyBook[0, story.path1] = 0;
storyBook[0, story.path2] = 0;
ds_list_insert(storyOrder, 0, 0);