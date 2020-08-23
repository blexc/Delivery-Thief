spawner_num = 3;

if (oPlayer.can_move) oPlayer.can_move = false;
SlideTransition(TRANS_MODE.GOTO, target);
oGameManager.spawner = spawner_num;