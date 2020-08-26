function DialogueResponses(_responses){
	switch(_responses)
	{
		case 0: break;
		case 1: NewTextBox("Bring it to me when you have it."); break;
		case 2: NewTextBox("Fine then!"); break;
		default: Print("error: something went wrong in dialogue responses"); break;
	}
}