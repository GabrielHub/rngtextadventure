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
storyBook[13, story.txtresponse1] = "\"Then start running\" it hisses with disdain. You continue at an average pace. \n\n";
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
storyBook[16, story.txtresponse2] = "Nothing happens. You move on. \n\n";
ds_list_add(storyOrder, 16);

storyBook[17, story.text] = "The corridor leads into a room and you notice a chest in the corner. It's wooden finish gleams from the light of a nearby lantern.";
storyBook[17, story.choice1] = "Open the chest.";
storyBook[17, story.choice2] = "Attack the chest.";
storyBook[17, story.path1] = 2;
storyBook[17, story.path2] = 1;
storyBook[17, story.txtresponse2] = "It must be a trick! You swing your weapon and furiously hack into the chest, grinding it and its contents to dust. It was not a trick. You slink away embarrassed and continue to the next corridor. \n\n";
ds_list_add(storyOrder, 17);

storyBook[18, story.text] = "A pile of bandages are stacked neatly on a shelf by the wall.";
storyBook[18, story.choice1] = "Ignore them.";
storyBook[18, story.choice2] = "Bandage your wounds.";
storyBook[18, story.path1] = 1;
storyBook[18, story.path2] = 2;
storyBook[18, story.txtresponse1] = "You eye them suspiciously before moving further down the hall. \n\n";
ds_list_add(storyOrder, 18);

storyBook[19, story.text] = "The air grows warmer on the next step. A small bottle full of green liquid glimmers on the floor.";
storyBook[19, story.choice1] = "Drink it.";
storyBook[19, story.choice2] = "Smash it.";
storyBook[19, story.path1] = 2;
storyBook[19, story.path2] = 2;
ds_list_add(storyOrder, 19);

storyBook[20, story.text] = "You feel your stomach grumble. The hunger and exhaustion is making you nauseous.";
storyBook[20, story.choice1] = "Think about something else.";
storyBook[20, story.choice2] = "Think about food.";
storyBook[20, story.path1] = 2;
storyBook[20, story.path2] = 2;
ds_list_add(storyOrder, 20);

storyBook[21, story.text] = "Everything in this place come from different times, maybe different worlds. So why do they all feel so familiar?";
storyBook[21, story.choice1] = "Forget about it and keep going.";
storyBook[21, story.choice2] = "Forget about it and turn around.";
storyBook[21, story.path1] = 0;
storyBook[21, story.path2] = 0;
ds_list_add(storyOrder, 21);

storyBook[22, story.text] = "As you walk you realize you've come across this segment before.";
storyBook[22, story.choice1] = "Leave a mark on the wall.";
storyBook[22, story.choice2] = "Turn around.";
storyBook[22, story.path1] = 1;
storyBook[22, story.path2] = 1;
storyBook[22, story.txtresponse1] = "You mark the wall on your left and keep going. \n\n";
storyBook[22, story.txtresponse2] = "Could you be going in circles? \n\n";
ds_list_add(storyOrder, 22);

storyBook[23, story.text] = "You stumble upon a statue blocking your way.";
storyBook[23, story.choice1] = "Observe the statue.";
storyBook[23, story.choice2] = "Ignore the statue.";
storyBook[23, story.path1] = 3;
storyBook[23, story.path2] = 1;
storyBook[23, story.txtresponse1] = "You marvel the detail of the statue and note it appears Greek. You lean in and dust off some of the lettering when the statue topples over you, breaking your neck. \n\n";
storyBook[23, story.txtresponse2] = "Who cares? You squeeze between the legs of the statue and continue on your way. \n\n";
ds_list_add(storyOrder, 23);

storyBook[24, story.text] = "A fish lies in front of you. You wonder if it's sushi grade.";
storyBook[24, story.choice1] = "It sure is.";
storyBook[24, story.choice2] = "Fish are friends, not food.";
storyBook[24, story.path1] = 2;
storyBook[24, story.path2] = 1;
storyBook[24, story.txtresponse2] = "You step over the fish, leaving its silent screams for help behind. \n\n";
ds_list_add(storyOrder, 24);

storyBook[25, story.text] = "The path in front of you splits in two.";
storyBook[25, story.choice1] = "Go right.";
storyBook[25, story.choice2] = "Go left.";
storyBook[25, story.path1] = 0;
storyBook[25, story.path2] = 0;
ds_list_add(storyOrder, 25);

storyBook[26, story.text] = "Two pedestals appear in front of you. On the left is a keg of beer. On the right is a gleaming sword.";
storyBook[26, story.choice1] = "You refuse to take one more step sober.";
storyBook[26, story.choice2] = "Who wouldn't pick up a shiny new sword?";
storyBook[26, story.path1] = 2;
storyBook[26, story.path2] = 3;
storyBook[26, story.txtresponse2] = "You grip the sword tight and swing it from the pedestal. The flickering, dim lights that fill these halls shine brighter, acting like a spotlight on this glorious weapon. In fact, it's so bright it blinds you. You drop the sword, trip on the golden handle, and fall upon it. You attempt a dying breath but your lung is punctured and you die, a beautiful sword jutting out your back. \n\n";
ds_list_add(storyOrder, 26);

storyBook[27, story.text] = "A skeleton lies in front of you. You notice a sign hanging from its neck: \"Don't follow the noise\".";
storyBook[27, story.choice1] = "Take the sign.";
storyBook[27, story.choice2] = "Continue on.";
storyBook[27, story.path1] = 2;
storyBook[27, story.path2] = 1;
storyBook[27, story.txtresponse2] = "You thank the skeleton for the advice and keep walking. \n\n";
ds_list_add(storyOrder, 27);

storyBook[28, story.text] = "Heavy footsteps kill the silence. What appears to be an old TV walks up to you, a golden key displayed on the screen. It cracks its knuckles.";
storyBook[28, story.choice1] = "Ask it for a key.";
storyBook[28, story.choice2] = "Attack this monster.";
storyBook[28, story.path1] = 1;
storyBook[28, story.path2] = 2;
storyBook[28, story.txtresponse1] = "There is nothing but the crackle of static. You turn around and walk away. \n\n";
ds_list_add(storyOrder, 28);

storyBook[29, story.text] = "A door appears on your right. You notice a golden lock on the doorknob.";
storyBook[29, story.choice1] = "Try to enter.";
storyBook[29, story.choice2] = "Kick the door down.";
storyBook[29, story.path1] = 2;
storyBook[29, story.path2] = 3;
storyBook[29, story.txtresponse2] = "You wind yourself up, and unleash a furious kick. The door responds in kind, kicking you into oblivion. You died kicking a door. \n\n";
ds_list_add(storyOrder, 29);

storyBook[30, story.text] = "You come across a great ravine, a giant tree, and a green hatchet. \"Take a leap of faith\", the tree says.";
storyBook[30, story.choice1] = "Take a leap.";
storyBook[30, story.choice2] = "Cut the tree down and use it as a bridge.";
storyBook[30, story.path1] = 3;
storyBook[30, story.path2] = 2;
storyBook[30, story.txtresponse1] = "You leap off the edge of the tree and fall to your death. \n\n";
ds_list_add(storyOrder, 30);

storyBook[31, story.text] = "A scuttling noise causes you to jump. You turn around to see a cute puppy nuzzling your leg.";
storyBook[31, story.choice1] = "Pet the dog.";
storyBook[31, story.choice2] = "Kick the bitch.";
storyBook[31, story.path1] = 2;
storyBook[31, story.path2] = 2;
ds_list_add(storyOrder, 31);

storyBook[32, story.text] = "You come across a large chest.";
storyBook[32, story.choice1] = "Carry on.";
storyBook[32, story.choice2] = "Open the chest.";
storyBook[32, story.path1] = 0;
storyBook[32, story.path2] = 2;
ds_list_add(storyOrder, 32);

storyBook[33, story.text] = "A rattling chest appears to your left.";
storyBook[33, story.choice1] = "Open the chest.";
storyBook[33, story.choice2] = "Ignore the rattling.";
storyBook[33, story.path1] = 2;
storyBook[33, story.path2] = 1;
storyBook[33, story.txtresponse2] = "You decide not to bother and keep walking on. \n\n";
ds_list_add(storyOrder, 33);

storyBook[34, story.text] = "A pair of dice roll past you.";
storyBook[34, story.choice1] = "Stop the dice and pick them up.";
storyBook[34, story.choice2] = "Keep walking.";
storyBook[34, story.path1] = 2;
storyBook[34, story.path2] = 0;
ds_list_add(storyOrder, 34);

storyBook[35, story.text] = "Nothing interesting happening here.";
storyBook[35, story.choice1] = "Continue walking.";
storyBook[35, story.choice2] = "Christopher Walken.";
storyBook[35, story.path1] = 0;
storyBook[35, story.path2] = 1;
storyBook[35, story.txtresponse2] = "You feel like you've seen that dude in movies. But you can't really name any of them. You shrug and keep walking. \n\n";
ds_list_add(storyOrder, 35);

/* Template
storyBook[3, story.text] = "";
storyBook[3, story.choice1] = "";
storyBook[3, story.choice2] = "";
storyBook[3, story.path1] = 2;
storyBook[3, story.path2] = 1;
storyBook[3, story.txtresponse1] = " \n\n";
storyBook[3, story.txtresponse2] = " \n\n";
ds_list_add(storyOrder, 3);
*/

ds_list_shuffle(storyOrder);
//Initial event, make sure to add this to the list last and AFTER THE SHUFFLE
storyBook[0, story.text] = "You find yourself in a dimly lit hallway, extending far in front and behind you.";
storyBook[0, story.choice1] = "Walk forward.";
storyBook[0, story.choice2] = "Walk backward.";
storyBook[0, story.path1] = 0;
storyBook[0, story.path2] = 0;
ds_list_insert(storyOrder, 0, 0);