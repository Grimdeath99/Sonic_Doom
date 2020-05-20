/// @description scr_player_physics
/// @function scr_player_physics(height,width,ajust)
/// @param height
/// @param width
/// @param ajust
var height = argument0;
var width = argument1;
var ajust = argument2;
var hspace = 14;
var dwchech = 38;

var mask = 9;
if ajust == 2 mask = 7;

/// speed limmits 1
if(hsp>spd_limmit) hsp = spd_limmit;
if(hsp<-spd_limmit) hsp =-spd_limmit;
if(vsp>spd_limmit) vsp =spd_limmit;
if(vsp<-spd_limmit) vsp =-spd_limmit;
if(gsp>spd_limmit) gsp =spd_limmit;
if(gsp<-spd_limmit) gsp =-spd_limmit;

//////////////////////////////////////////////////////////
////// movement        ///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
#region

///// Ground Speed

if ground
{
		//move right
		if gsp > 0
		{
			var ix = x;
			var iy = y;
			var isin = asin;
			var icos = acos;
			var i = 0;
			var iangle = angle;
			var done1 = false;
			var done2 = false;
			var down = false
			
			while !done1
			{
					if i < gsp
					{
						if icos == 1 down = true;
						if !scr_collision_right(ix,iy,width,isin,icos,down)	
						{
							if scr_collision_line_left(ix,iy,mask,isin,icos,height)	&& scr_collision_line_right(ix,iy,mask,isin,icos,height)
							{
									ix+=icos;
									iy-=isin;
									i++;
							}
							else
							{
								if collision_circle(ix+isin*10,iy+icos*10,4,obj_collision_06_no_change,true,true)
								{
										var io = instance_nearest(ix+isin*10,iy+icos*10,obj_collision_06_no_change)
										iangle = io.angle;
								}
								else
								{
									iangle = scr_find_angle(ix,iy,iangle,hspace,dwchech);
									if abs(angle_difference(iangle,angle)) < 15
									{
										isin = sin(degtorad(iangle));
										icos = cos(degtorad(iangle));
										ix+=icos;
										iy-=isin;
										i++;	
									}
									else {done1 = true; done2 = true;}
								}
							}
						}
						else {done1 = true;}
					}
					else {done1 = true;}
			}
			if i >= gsp || done2 || collision_circle(x,y,4,obj_collision_06_no_change,true,true)
			{
				x+=gsp*acos;
				y-=gsp*asin;
			}
			else
			{
				x=ix;
				y=iy;
				angle = iangle;
				asin = isin;
				acos = icos;
			}
		}
		
		//move left
		if gsp < 0
		{
			var ix = x;
			var iy = y;
			var isin = asin;
			var icos = acos;
			var i = 0;
			var iangle = angle;
			var done1 = false;
			var done2 = false;
			var down = false
			
			while !done1
			{
					if i > gsp
					{
						if icos == 1 down = true;
						if !scr_collision_left(ix,iy,width,isin,icos,down)	
						{
							if scr_collision_line_left(ix,iy,mask,isin,icos,height)	&& scr_collision_line_right(ix,iy,mask,isin,icos,height)
							{
									ix-=icos;
									iy+=isin;
									i--;
							}
							else
							{
								if collision_circle(ix+isin*10,iy+icos*10,4,obj_collision_06_no_change,true,true)
								{
										var io = instance_nearest(ix+isin*10,iy+icos*10,obj_collision_06_no_change)
										iangle = io.angle;
								}
								else
								{
									iangle = scr_find_angle(ix,iy,iangle,hspace,dwchech);
									if abs(angle_difference(iangle,angle)) < 15
									{
										isin = sin(degtorad(iangle));
										icos = cos(degtorad(iangle));
										ix-=icos;
										iy+=isin;
										i--;	
									}
									else {done1 = true; done2 = true;}
								}
							}
						}
						else {done1 = true;}
					}
					else {done1 = true;}
			}
			if i <= gsp || done2 || collision_circle(x,y,4,obj_collision_06_no_change,true,true)
			{
				x+=gsp*acos;
				y-=gsp*asin;
			}
			else
			{
				x=ix;
				y=iy;
				angle = iangle;
				asin = isin;
				acos = icos;
			}
		}
}
else
{
	/////// horizontal speed
	
	if hsp >0
		{
			var ix = x;
			var iy = y;
			var isin = gsin;
			var icos = gcos;
			var i = 0;
			var iangle = gravangle;
			var done1 = false;
			var down = false
			
			while !done1
			{
					if i < hsp
					{
						if icos == 1 down = true;
						if !scr_collision_right(ix,iy,width,isin,icos,down)	
						{

									ix+=icos;
									iy-=isin;
									i++;
						}
						else done1 = true;
					}
					else {done1 = true;}
			}
			if i >= hsp
			{
				x+=hsp*gcos;
				y-=hsp*gsin;
			}
			else
			{
				x=ix;
				y=iy;
			}
		}
		
		if hsp < 0
		{
			var ix = x;
			var iy = y;
			var isin = gsin;
			var icos = gcos;
			var i = 0;
			var iangle = gravangle;
			var done1 = false;
			var down = false
			
			while !done1
			{
					if i > hsp
					{
						if icos == 1 down = true;
						if !scr_collision_right(ix,iy,width,isin,icos,down)	
						{

									ix-=icos;
									iy+=isin;
									i--;
						}
						else done1 = true;
					}
					else {done1 = true;}
			}
			if i >= hsp
			{
				x+=hsp*gcos;
				y-=hsp*gsin;
			}
			else
			{
				x=ix;
				y=iy;
			}
		}
		
		/////// vertical speed
	
	if vsp > 0
		{
			var ix = x;
			var iy = y;
			var isin = gsin;
			var icos = gcos;
			var i = 0;
			var iangle = gravangle;
			var done1 = false;
			var down = false
			
			while !done1
			{
					if i < vsp
					{
						if !scr_collision_under(ix,iy,width,isin,icos)	
						{
									ix+=isin;
									iy-=icos;
									i++;
						} else done1 = true;
					}
					else {done1 = true;}
			}
			if i >= vsp
			{
				x+=vsp*gsin;
				y+=vsp*gcos;
			}
			else
			{
				x=ix;
				y=iy;
			}
		}
		
		if vsp < 0
		{
			var ix = x;
			var iy = y;
			var isin = gsin;
			var icos = gcos;
			var i = 0;
			var iangle = gravangle;
			var done1 = false;
			var down = false
			
			while !done1
			{
					if i > vsp
					{
						if !scr_collision_top(ix,iy,width,isin,icos)	
						{
									ix-=isin;
									iy-=icos;
									i--;
						}
						else done1 = true;
					}
					else {done1 = true;}
			}
			if i <= vsp
			{
				x-=vsp*gsin;
				y+=vsp*gcos;
			}
			else
			{
				x=ix;
				y=iy;
			}
		}
		

}
#endregion

//////////////////////////////////////////////////////////
////// wall collision        ///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

///  Comment to take out
#region

	var down = false
	if angle == 0 down = true;

	while scr_collision_right(x,y,width+6,asin,acos,down) && (hsp > 0 || gsp > 0)
{
    x-=acos;
    y+=asin;
    if hsp > 0 hsp=hsp/2;  
	if gsp > 0 && scr_collision_under(x,y,height,asin,acos) gsp=gsp/2;  

}
while scr_collision_left(x,y,width+6,asin,acos,down) && (hsp < 0 || gsp < 0)
{
    x+=acos;
    y-=asin;
    if hsp <0 hsp = hsp/2 
	if gsp <0  && scr_collision_under(x,y,height,asin,acos) gsp = gsp/2 

}


#endregion
///*/

//////////////////////////////////////////////////////////////////////
////// Ground touch/ landing       ///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

#region



if !ground
{
	if vsp >= 0  /// landing below
	{
			/// land left side
			var iangle = gravangle;
			if !ground && scr_collision_line_left(x,y,width,gsin,gcos,height) && !scr_collision_line_right(x,y,width,gsin,gcos,height)
			{
					iangle = scr_find_angle(x,y,gravangle-45,hspace*2,dwchech*2);
					var temp_angle = angle_difference(iangle,gravangle)
					if abs(temp_angle) < 85
					{
							if abs(temp_angle) >=22.5 && abs(temp_angle) < 45
							{
								if abs(hsp) > abs(vsp) {gsp = hsp}
								else
								{
									
									angle = iangle;
									asin = sin(degtorad(angle));
									acos = cos(degtorad(angle));
									gsp = -vsp*.5*asin;
									hsp = 0;
									vsp = 0;
									ground = true;
								}
							}
							if abs(temp_angle) >=45 && abs(temp_angle) < 90
							{
								if abs(hsp) > abs(vsp) {gsp = hsp}
								else
								{
									
									angle = iangle;
									asin = sin(degtorad(angle));
									acos = cos(degtorad(angle));
									gsp = -vsp*asin;
									hsp = 0;
									vsp = 0;
									ground = true;
								}
							}
					}
			}
			/// land right side
			var iangle = gravangle;
			if !ground && !scr_collision_line_left(x,y,width,gsin,gcos,height) && scr_collision_line_right(x,y,width,gsin,gcos,height)
			{
					iangle = scr_find_angle(x,y,gravangle+45,hspace*2,dwchech*2);
					var temp_angle = angle_difference(iangle,gravangle)
					if abs(temp_angle) < 85
					{
							if abs(temp_angle) >=22.5 && abs(temp_angle) < 45
							{
								if abs(hsp) > abs(vsp) {gsp = hsp}
								else
								{
									
									angle = iangle;
									asin = sin(degtorad(angle));
									acos = cos(degtorad(angle));
									gsp = -abs(vsp)*.5*asin;
									hsp = 0;
									vsp = 0;
									ground = true;
								}
							}
							if abs(temp_angle) >=45 && abs(temp_angle) < 90
							{
								if abs(hsp) > abs(vsp) {gsp = hsp}
								else
								{
									
									angle = iangle;
									asin = sin(degtorad(angle));
									acos = cos(degtorad(angle));
									gsp = -abs(vsp)*asin;
									hsp = 0;
									vsp = 0;
									ground = true;
								}
							}
					}
			}
			
			var iangle = gravangle;
			if !ground && (scr_collision_line_left(x,y,width,gsin,gcos,height) || scr_collision_line_right(x,y,width,gsin,gcos,height)) && scr_collision_under(x,y,height+4,asin,acos)
			{
					angle = gravangle;
					asin = sin(degtorad(angle));
					acos = cos(degtorad(angle));
					gsp = hsp;
					hsp = 0;
					vsp = 0;
					ground = true;
			}
	}
	
	/////////////////////////////
	//// Land above /////////////////////////////////
	/////////////////////////////
	no_collide = false;
	if vsp < -4 
	{
			/// land left side 
			var iangle = gravangle-180;
			if !ground && !scr_collision_line_left(x,y,height+6,-gsin,-gcos,6) && scr_collision_line_right(x,y,height+6,-gsin,-gcos,6)
			{
					no_collide = true;
					iangle = scr_find_angle(x,y,iangle+45,hspace*2,dwchech*2);
					var temp_angle = angle_difference(iangle,gravangle-180)
					show_angle  = temp_angle;
					if abs(temp_angle) < 85
					{
							if abs(temp_angle) >= 45 && abs(temp_angle) < 85
							{
		
									angle = iangle;
									asin = sin(degtorad(angle));
									acos = cos(degtorad(angle));
									gsp = vsp*-asin;
									hsp = 0;
									vsp = 0;
									ground = true;
							}
					}
			}
			/// land right side
			var iangle = gravangle-180;
			if !ground && scr_collision_line_left(x,y,height,-gsin,-gcos,6) && !scr_collision_line_right(x,y,height,-gsin,-gcos,6)
			{
					no_collide = true;
					iangle = scr_find_angle(x,y,iangle-45,hspace*2,dwchech*2);
					var temp_angle = angle_difference(iangle,gravangle-180)
					show_angle  = temp_angle;
					if abs(temp_angle) < 85
					{
							if abs(temp_angle) >=45 && abs(temp_angle) < 85
							{
								
									angle = iangle;
									asin = sin(degtorad(angle));
									acos = cos(degtorad(angle));
									gsp = vsp*-asin;
									hsp = 0;
									vsp = 0;
									ground = true;
							}
					}
			}
			
				var iangle = gravangle-180;
			if !ground && scr_collision_line_left(x,y,height,-gsin,-gcos,6) && scr_collision_line_right(x,y,height,-gsin,-gcos,6) && scr_collision_top(x,y,height*0.6,gsin,gcos)
			{
					no_collide = true;
					iangle = scr_find_angle(x,y,iangle-45,hspace*2,dwchech*2);
					var temp_angle = angle_difference(iangle,gravangle-180)
					show_angle  = temp_angle;
					if abs(temp_angle) < 55
					{
						vsp = 0;
					}
			}
			
	}
	
	
}


#endregion

//////////////////////////////////////////////////////////////////////
////// Leave Ground       ///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

#region

	if ground
	{
			if (!scr_collision_line_left(x,y,height,asin,acos,height) || !scr_collision_line_right(x,y,height,asin,acos,height) ) && !scr_collision_under(x,y,height+4,asin,acos)
			{
				
				vsp = -asin*gsp;
				hsp =  acos*gsp;
				angle = gravangle;
				gsp = 0;
				ground = false;
			}
	}

#endregion


//////////////////////////////////////////////////////////////////////
////// Gravity      ///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

if !ground vsp+=grv;

//////////////////////////////////////////////////////////////////////
////// angle speed      ///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

#region

var temp_angle = angle_difference(angle,gravangle)
if abs(temp_angle) > 55   && ground && abs(gsp) < 2.5 
{
	if sign(temp_angle) == sign(gsp) || abs(temp_angle) > 90 
	{
		angle=gravangle;
		vsp = -asin*gsp;
		hsp = acos*gsp;
		gsp = 0;
		ground = 0;
		hcl = 30;
	}

}


#endregion

//////////////////////////////////////////////////////////////////////
////// Slope factor     ///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

#region
	
	var temp_angle = angle_difference(angle,gravangle);
	var isin = sin(degtorad(temp_angle));
	if action == "rolling" 
	{
	if sign(gsp) == sign(isin) slope = slprollup else slope = splrolldown;
	}
	else {slope = slp;}
	if ground gsp-=slope*isin;

#endregion

//////////////////////////////////////////////////////////////////////
////// Lock to ground      ///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

#region

/*  alt 1
if ground
{
	while scr_collision_under(x,y,height-4,asin,acos) 
	{
		x-=asin;
		y-=acos;	
	}
	while !scr_collision_under(x,y,height-4,asin,acos) && scr_collision_under(x,y,height+8,asin,acos)
	{
		x+=asin;
		y+=acos;	
	}
	
}
*/
if ground
{
	while !scr_collision_under(x,y,height-4,asin,acos) //&& scr_collision_line_left(x,y,height,asin,acos,30) && scr_collision_line_right(x,y,height,asin,acos,30)
	{
		x+=asin;
		y+=acos;	
	}
	while scr_collision_under(x,y,height-4,asin,acos)
	{
		x-=asin;
		y-=acos;	
	}
	
}

#endregion



//////////////////////////////////////////////////////////////////////
////// Find angle     ///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

#region
	if !collision_circle(x,y,4,obj_collision_06_no_change,true,true) && !collision_circle(x,y,4,obj_collision_07_dev_angle_force,true,true)
	{
		if ground && scr_collision_line_left(x,y,hspace,asin,acos,38) && scr_collision_line_right(x,y,16,asin,acos,38) && (!scr_collision_right(x,y,width+8,asin,acos,0) || !scr_collision_left(x,y,width+8,asin,acos,0))
		{
			angle = scr_find_angle(x,y,angle,hspace,dwchech);	
			gr = grm;
		}
	}
	if collision_circle(x+asin*10,y+acos*10,4,obj_collision_06_no_change,true,true) && ground
	{
			var io = instance_nearest(x+asin*10,y+acos*10,obj_collision_06_no_change)
			angle = io.angle;
	}
	if !ground
	{
		if gr == 0 angle = gravangle; else gr --;	
	}
	if ground && scr_collision_ground(x,y,height,asin,acos) // no angle_chech collision
	{
		angle = gravangle;	
		gr = grm;
	}

	acos = cos(degtorad(angle));
	asin = sin(degtorad(angle));
	
	gcos = cos(degtorad(gravangle));
	gsin = sin(degtorad(gravangle));



#endregion



/// speed limmits 2
if(hsp>spd_limmit) hsp = spd_limmit;
if(hsp<-spd_limmit) hsp =-spd_limmit;
if(vsp>spd_limmit) vsp =spd_limmit;
if(vsp<-spd_limmit) vsp =-spd_limmit;
if(gsp>spd_limmit) gsp =spd_limmit;
if(gsp<-spd_limmit) gsp =-spd_limmit;