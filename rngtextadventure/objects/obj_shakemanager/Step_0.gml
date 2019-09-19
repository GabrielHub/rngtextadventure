/// @description Insert description here
// You can write your code in this editor

//check for screen shake
if (isShaking) {
	x_shake = random_range(-shakeAmt, shakeAmt);
	y_shake = random_range(-shakeAmt, shakeAmt);
	
	camera_set_view_pos(view_camera[0], x_shake, y_shake);
}
else {
	camera_set_view_pos(view_camera[0], 0, 0);
}

if (shakeTimer > 0) {
	shakeTimer--;
}
else {
	isShaking = false;
}
if keyboard_check_pressed(vk_space) {
	ShakeScreen(80, 50);
}