var loss = false;
if argument0 != false loss = true;
var hazzard = 0;
if argument1 = 0
{hazzard = instance_nearest(x,y,obj_hazzard_base);}
else
{hazzard = instance_nearest(x,y,obj_master_enemy);}
		if loss
		{
			if ring > 0
			{
				ring_loss = true;	
				
				hurt = true;
				action = "hurt"
				ground = false;
				gsp = 0;
				vsp = -4;
				hsp = 2*sign(x-hazzard.x)
				if hsp = 0 hsp = 1;
				invulnerability = 120;
			}
			else
			{
				sdeath = true;	
				gsp = 0;
				vsp = -7;
				hsp = 0;
				ground = false;
			}
		}
		else
		{
				hurt = true;
				ground = false;
				action = "hurt"
				gsp = 0;
				vsp = -4;
				hsp = 2*sign(x-hazzard.x)
				if hsp = 0 hsp = 1;	
				invulnerability = 120;
		}