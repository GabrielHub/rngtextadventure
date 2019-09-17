/// @description Inventory checks and stuff

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