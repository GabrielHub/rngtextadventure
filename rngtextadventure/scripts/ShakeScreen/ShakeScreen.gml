///@description call this function to activate a screen shake
///@param _amt = amount of screen shake you want
///@param _dur = duration of the shake

_amt = argument0;
_dur = argument1;

obj_shakemanager.isShaking = true;
obj_shakemanager.shakeAmt = _amt;
obj_shakemanager.shakeTimer = _dur;