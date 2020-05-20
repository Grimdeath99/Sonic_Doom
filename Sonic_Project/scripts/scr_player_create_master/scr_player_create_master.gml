/*////////////////////////////////////////////////////////////////////////
//																		//
//			  Master Create Script for player character					//
//																		//
//////////////////////////////////////////////////////////////////////////
		
	This is a Script contaioning ever variable the player will need.
		and should setup the player object for all other events.
		
		As well as ajust or set-up the other characters the
			player can be, all in this one scripts.
			
				the Script will be split in to groups
				
		The first group Will be the Physics variables
			This will hold all physics related varibles
			
		the second will be the event group.
			This will hold all varibles the player uses for actions
			
		the third group is character specific varibles
			This will hold varibles the only aply to one character.
			
		and last will be the miscellaneous group
			this will hold any varible that does not fit 
			in to any group listed above.
			
////////////////////////////////////////////////////////////////////////*/

var character = 0;

if argument_count > 0
{character = argument[0];}




//////////////////////////////////////////////////
//												//
//				Physics variables				//
//												//
//////////////////////////////////////////////////

	xlayer = 0;	/// foreground and background layering
	
	tlayer = 0;	/// temporaly layers seprate from xlayer
	
	wlayer = 0; /// water layer, if you can runn on water

	hsp = 0; /// horizontal speed
	
	vsp = 0; /// vertical speed
	
	gsp = 0; /// ground speed
	
	spd_limmit = 16;
	
	gsp_top = 6;
	
	gsp_normal = 6;
	
	slope = 0; /// the current slope factor (slp) value being used
	
	angle = 0; /// sonic's angle on the ground
	
	acos = 1;
	
	asin = 0;
	
	gravangle = 0; /// sonic current gravity angle (the angle sonics being pulled down)
	
	gcos = 1;
	
	gsin = 0;
	
	angle_mode =0;
	
	temp_angle = 0;
	
	hcl = 0;
	
	ground = true;
	
	last_on_ground = false;
	
	xdir = 1;
	
	gr = 5;
	
	grm = gr;
	
	///////////////////////////////////////////////////
	////////// Constants noraml   ////////////////////
	///////////////////////////////////////////////
	
	nacc = 0.046875;
	
	naacc = 0.09375;
	
	ndcc = 0.5;
	
	nbfr = 0.0234375;
	
	bdcc = 0.1484375;
	
	nfrc = 0.046875;
	
	njmp = 6.5;
	
	nsjmp = -4;
	
	grv_normal = 0.21875;
	
	adrag = 0.96875;
	
	slp = 0.125;
	
	slprollup = 0.078125;
	
	splrolldown = 0.3125;
	
	///////////////////////////////////////////////////
	////////// Constants underwater  ////////////////////
	///////////////////////////////////////////////
	
	wacc = 0.0234375;
	
	waacc = 0.046875;
	
	wdcc = 0.25;
	
	wbfr = 0.01171875;
	
	wfrc = 0.0234375;
	
	gsp_water = 3;
	
	wjmp = 3.5;
	
	wsjmp = -2;
	
	grv_water = 0.0625;
	

	///////////////////////////////////////////////////
	////////// Constants change   ////////////////////
	///////////////////////////////////////////////
	
	acc = nacc;
	
	aacc = naacc;
	
	dcc = ndcc;
	
	bfr = nbfr;
	
	frc = nfrc;
	
	jmp = njmp;
	
	sjmp = nsjmp;
	
	grv = grv_normal;
	


//////////////////////////////////////////////////
//												//
//				 event variables				//
//												//
//////////////////////////////////////////////////

action = "default";

ring = 0;

spot = 30;
ddash = 0;
ddash_can = false;

scoreboost = 0;

sp = 0;

hurt = false;
ring_loss = true;

invulnerability = 0;

super_form = false;


sdeath = false;
death_time = 0;
death_time_max = 120;

in_water = false;

super_inv = 0;

enum shield
{
	none = 0, inst = 1, fire = 2, bubble = 3, electro = 4	
}


//////////////////////////////////////////////////
//												//
//			 character variables				//
//												//
//////////////////////////////////////////////////






//////////////////////////////////////////////////
//												//
//			 miscellaneous variables			//
//												//
//////////////////////////////////////////////////


///sprite darw vars ////////////////////////////////////////////////////
image_index =0;
image_speed=0;

sprp = 0;
sprpt= 0;										/// extr sprite to draw
dangle = 0;
frame_count = 0;
frame_advancement = 1;
frame_duration = 1;
frame_min = 0;
frame_max = 0;
image_i = 0;
image_s = 0;
last_action= "default";
trans_frame = true;

iaskid = 3*8;
 asc = false;									/* animation spindash charge */



