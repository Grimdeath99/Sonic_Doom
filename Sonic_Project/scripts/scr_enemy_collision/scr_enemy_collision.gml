/// @description scr_enemy_colision(hitID,x,y,width,height,x2,y2,radius)
/// @function scr_enemy_collision(hitID,x,y,width,height,x2,y2,radius)
/// @param  hitID
/// @param  x
/// @param  y
/// @param  width
/// @param  heghit
/// @param  X2
/// @param  Y2
/// @param  Radius

var hit = argument0;
var xi = argument1;
var yi = argument2;
var width = argument3;
var height = argument4;
var xi2 = argument5;
var yi2 = argument6;
var radius = argument7;
if (hit!= obj_player_main && hit != obj_player_partner) hit = obj_player;

//action 1 = jump, action 2 = roll, action 3 = custiom, pup[3] = super

//roll in to
if collision_rectangle(x-width/2,y-height/2,x+width/2,y+height/2,hit,true,true) && hit.action == "rolling" && sign(hit.hsp) != sign(hit.x-xi) return true;

/// spin dash charge
if collision_rectangle(x-width/2,y-height/2,x+width/2,y+height/2,hit,true,true) && hit.action == "spin_dash" return true;

//jump in to
if collision_circle(xi2,yi2,radius,hit,true,true) && hit.action == "jumping" {obj_player_main.enemy_is_hit = true; return true; }

//special in to
if collision_circle(xi2,yi2,radius,hit,true,true) && hit.action == "special" return true;

//super in to
//if collision_rectangle(x-width/2,y-height/2,x+width/2,y+height/2,hit,true,true) && hit.pup[3] !=0 && sign(hit.hsp) != sign(hit.x-xi) return true;
//if collision_circle(xi2,yi2,radius,hit,true,true) && hit.pup[3] !=0 return true;

//Hit box player
if collision_rectangle(x-width/1.3,y-height/1.3,x+width/1.3,y+height/1.3,obj_player_attack,true,true) return true;
if collision_circle(xi2,yi2,radius*1.4,obj_player_attack,true,true) return true;

return false;
