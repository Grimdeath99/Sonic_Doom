/// @description Insert description here
// You can write your code in this editor

	if physics {scr_player_physics(16,10,0);}
	
	if ground {
	 if (gsp>0) gsp-=frc; if (gsp<0) gsp+=frc; if (gsp>0 && gsp<frc) gsp=0; if (gsp<0 && gsp>-frc) gsp=0;
	}
	if ground
	{
		physics = false;	
	}


