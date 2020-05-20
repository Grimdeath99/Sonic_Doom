/// @description scr_player_movemant(height,width)
/// @function scr_player_movment(height,width)
/// @param height
/// @param width
var height = argument0;
var width = argument1;

if key_b key_a = true;
if key_bp key_ap = true;
if key_br key_ar = true;

if key_x key_a = true;
if key_xp key_ap = true;
if key_xr key_ar = true;

////////////////////////////////////////
////// Basic movemant//////////////////////
////////////////////////////////

#region

///movement

//left and right moving
if (action == "default" || action == "jumping") && hcl = 0
{
    if (key_left) xdir=-1;
   if (key_right) xdir=1;
   }
   
   if hcl > 0
   {
	   if ground
	   {
		    if gsp <0 xdir=-1;
			if gsp >0 xdir=1;
	   }
	   else
	   {
			if hsp <0 xdir=-1;
			if hsp >0 xdir=1;   
	   }
  
   }
   
//H_MOVE
if (action == "default" || action == "jumping" || action == "spring" || action == 5) && hcl == 0  
{
    if ground
    {
        if (key_left) {  if (gsp>=0) gsp-=dcc; if (gsp<0 && gsp>-gsp_top) gsp-=acc; } 
        if (key_right) { if (gsp<=0) gsp+=dcc; if (gsp>0 && gsp<gsp_top) gsp+=acc; } 
        if !key_left && !key_right {if (gsp>0) gsp-=frc; if (gsp<0) gsp+=frc; if (gsp>0 && gsp<frc) gsp=0; if (gsp<0 && gsp>-frc) gsp=0; }
    } 
else 
{
        if (key_left) { if hsp>-gsp_top hsp-=aacc; } 
        if (key_right) { if hsp<gsp_top hsp+=aacc; } 
        if !key_left && !key_right { if (hsp>0) hsp-=frc; if (hsp<0) hsp+=frc; if (hsp>0 && hsp<frc) hsp=0; if (hsp<0 && hsp>-frc) hsp=0; }
    } 
}
   
   if action == "rolling" && hcl = 0 && ground
   {
        if gsp > bfr { gsp-=bfr; if key_left  gsp-=bdcc;}
        if gsp <-bfr { gsp+=bfr; if key_right gsp+=bdcc;}
        if gsp < bfr*2 && gsp > -bfr*2 gsp = 0;
   }
if action == "rolling" && !ground
{
        if (key_left) { if hsp>-gsp_top hsp-=aacc; } 
        if (key_right) { if hsp<gsp_top hsp+=aacc; } 
}

///ducking
if key_down && ground && action = "default"
    {
    if abs(gsp) < 1.03125 {gsp=0; action = "ducking";}
    }
	if action == "ducking" && ground 
	{
		if (gsp>0) gsp-=frc; if (gsp<0) gsp+=frc; if (gsp>0 && gsp<frc) gsp=0; if (gsp<0 && gsp>-frc) gsp=0;	
	}

if action== "ducking" &&!key_down {action="default";}///un duck

///looking up
if key_up && ground && action == "default"
{
if abs(gsp) < 0.2 {gsp =0; action ="looking_up"};
}
if action == "looking_up" {if (gsp>0) gsp-=frc; if (gsp<0) gsp+=frc; if (gsp>0 && gsp<frc) gsp=0; if (gsp<0 && gsp>-frc) gsp=0;}
if (!key_up||!ground||key_right||key_left)&& action=="looking_up" action="default";


//air drag
if vsp<0 && vsp>-4 && !ground
{
if abs(hsp) >=0.125 { hsp=hsp*adrag};
}

//landing
if ground && (action == "jumping" || action == "spring" )
    {action = "default";}

if ground || action == "spring"
{
	if hcl > 0 hcl --;
	if hcl < 0 hcl = 0;
}




#endregion

////////////////////////////////////////
////// Jumping//////////////////////
////////////////////////////////

#region

 ///smal jump
    if key_ar && vsp <= sjmp && action == "jumping"
    {
        vsp = sjmp;
    } 
     
///jumping
    if key_ap && ground && (action = "default" || action = "rolling")
    {
         ground=0;
		 if gravangle = 0
		 {
         vsp=-gsp*asin-jmp*acos;
         hsp= gsp*acos-jmp*asin;
		 }
		 else
		 {
		 vsp=gsp*asin-jmp*acos;
         hsp= -gsp*acos-jmp*asin; 
		 }
		 gsp = 0;
         angle=gravangle;
		 gcos = cos(degtorad(gravangle));
		 gsin = sin(degtorad(gravangle));
         acos=gcos;
         asin=gsin;
         action="jumping";
		 key_ap = false;
    
    }


#endregion

////////////////////////////////////////
////// Rolling //////////////////////
////////////////////////////////

#region

///rolling
if key_down && ground && action = "default"
{
if abs(gsp) >= 1.03125 {action = "rolling";}
}
if action == "rolling" && abs(gsp) <0.5 && ground {action = "default";}///un roll
if action == "rolling" && ground && !last_on_ground //un roll on ground
{action = "default";}

#endregion

////////////////////////////////////////
////// peel out //////////////////////
////////////////////////////////

#region

///peel out
if action="looking_up" && key_a action ="peel_out";
if action!="peel_out" spot = 30;

if action="peel_out"
{
if (gsp>0) gsp-=frc; if (gsp<0) gsp+=frc; if (gsp>0 && gsp<frc) gsp=0; if (gsp<0 && gsp>-frc) gsp=0;
if key_ar
{
action ="default"; if spot=0 {gsp=xdir*12;}
}
if spot!=0 spot-=1;
}



#endregion


////////////////////////////////////////
////// drop dash //////////////////////
////////////////////////////////

#region

if ground && ddash == 21
{
    ddash = 0; action = "rolling";
	if abs(gsp) < 8 || xdir != sign(gsp)	gsp = xdir*8.5;
}
	if ground ddash_can = false;
	if key_ap && action == "jumping" ddash_can = true;

if action = "jumping" && key_a && ddash_can
{
    if ddash < 21 ddash ++;
}        
else
{
    if ddash > 0 ddash --;
}


#endregion


////////////////////////////////////////
////// spin dash //////////////////////
////////////////////////////////

#region

///spin dash
if sp > 0 {sp = sp-((sp div 1)/265)}
if sp > 64 sp = 64;
if action == "spin_dash" {if (gsp>0) gsp-=frc; if (gsp<0) gsp+=frc; if (gsp>0 && gsp<frc) gsp=0; if (gsp<0 && gsp>-frc) gsp=0;}
if action = "spin_dash" && key_ap {sp+=8;}
if action = "spin_dash" && !key_down {gsp = xdir*(8+floor(sp)/16);action = "rolling"; sp =0;}
if action = "ducking" && key_a {sp=0;action="spin_dash";}




#endregion






////////////////////////////////////////////
////// Misc //////////////////////////////////////
/////////////////////////////////////////////


if ground {last_on_ground = true;} else {last_on_ground = false;}


////////////////////////////////////////////
//////  water //////////////////////////////////////
/////////////////////////////////////////////

if in_water && !collision_circle(x,y,6,obj_water,false,false)
{
	in_water = false;	
	vsp = vsp*2;
	acc = nacc;
	aacc = naacc;
	dcc = ndcc;
	bfr = nbfr;
	frc = nfrc;
	jmp = njmp;
	sjmp = nsjmp;
	grv = grv_normal;
	gsp_top = gsp_normal;
	
}

if !in_water && collision_circle(x,y,6,obj_water,false,false)
{
	in_water = true;	
	hsp = hsp*0.5;
	vsp = vsp*.25;
	acc = nacc;
	aacc = waacc;
	dcc = wdcc;
	bfr = wbfr;
	frc = wfrc;
	jmp = wjmp;
	sjmp = wsjmp;
	grv = grv_water;
	gsp_top = gsp_water;
	
	
}