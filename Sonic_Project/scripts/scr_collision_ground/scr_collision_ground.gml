/// @description scr_collision_under(x,y,mask,sine,cosine)
/// @function scr_collision_under(x,y,mask,sine,cosine)
/// @param x
/// @param y
/// @param mask
/// @param sine
/// @param cosine

var ix = argument0;

var iy = argument1;

var mask = argument2;

var isin = argument3;

var icos = argument4;

if collision_circle(x+isin*mask,y+icos*mask,4,obj_wall_flat,true,true) return true;
/// add more layers for each collision layer

return false;
