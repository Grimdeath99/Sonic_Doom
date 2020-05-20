/// @description scr_player_damage(can_loss_ring)
/// @function scr_player_damage
/// @param can_loss_ring

var loss = false;
if argument0 != false loss = true;

/////////////-------------------------------------------------------------------------------------------------------------------------------------
if collision_circle(x,y,15,obj_hazzard_base,true,true) && !hurt && super_inv == 0 && invulnerability == 0 //// base hazzard hurt
{
		scr_player_damage_sub(loss,0);
}
if collision_circle(x,y,15,obj_master_enemy,true,true) && !hurt && super_inv == 0 && invulnerability == 0 && (action != "jumping" && action != "rolling" && action != "spin_dash") //// base hazzard hurt
{
		scr_player_damage_sub(loss,1);
}


////////////////  after damage.
if hurt && ground {hurt = false; ring_loss = false;}
if ground && action = "hurt" action = "default";
if !hurt && invulnerability > 0 {invulnerability --;}
if invulnerability < 0 invulnerability = 0;

////------------------------------------------------------------------------------------------------------------------------------------------
////---------------------------   RING LOSS   -------------------------------------------------------------------------------------------------
////------------------------------------------------------------------------------------------------------------------------------------------

if hurt && ring_loss
{
		var t = min(ring,32);
		var rt = 0;
		var ring_angle = 101.25;
		var n = false;
		var ring_speed = 4;
		ring = 0;
		
		while t > 0
		{
				var ring_obj = instance_create_layer(x,y,layer,obj_ring_drop);
				
				ring_obj.vsp = -sin(degtorad(ring_angle))*ring_speed;
				ring_obj.hsp = cos(degtorad(ring_angle))*ring_speed;
				if n {ring_obj.hsp = ring_obj.hsp*-1; ring_angle+=22.5;}
				n = !n;
				t --;
				rt ++;
				if rt == 16 {ring_angle = 101.25; ring_speed = 2;}
		}
		
}