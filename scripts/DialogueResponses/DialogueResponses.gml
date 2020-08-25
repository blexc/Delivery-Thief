function DialogueResponses(_responses){
	switch(_responses)
	{
		case 0: break;
		case 1: NewTextBox("You have response A!", ["0:"]); break;
		case 2: NewTextBox("You have response B!", ["0:"]); break;
		default: Print("error: something went wrong in dialogue responses"); break;
	}
}