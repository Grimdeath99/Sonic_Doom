/// @description scr_collision_top(x,y,mask,sine,cosine)
/// @function scr_collision_top(x,y,mask,sine,cosine)
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

if collision_circle(x-isin*mask,y-icos*mask,3,obj_wall,true,true) return true;

if xlayer == 0 && collision_circle(x-isin*mask,y-icos*mask,3,obj_wall_back,true,true) return true;
if xlayer == 1 && collision_circle(x-isin*mask,y-icos*mask,3,obj_wall_fore,true,true) return true;
if tlayer == 1 && collision_circle(x-isin*mask,y-icos*mask,3,obj_wall_temp,true,true) return true;
/// add more layers for each collision layer

return false;
