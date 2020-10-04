function TMASEffectTreasure(){
	oTMAS.screen_transition = FADE.OUT;
	oTMAS.did_win = true;
}

function TMASEffectApple(){
	oTMASPlayer.walk_sp = 2;
}

function TMASEffectShake(){
	// will shake screen when near treasure
	// done in oTMAS step
}

function TMASEffectColor(){
	// will change color depending on near treasure
	// done in oTMAS step
}

function TMASEffectClock(){
	oTMAS.time_left += 5 * room_speed;
}