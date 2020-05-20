/// @description scr_collision_main(x,y,mask)
/// @function scr_collision_main(x,y,mask)
/// @param x
/// @param y
/// @param mask

var ix = argument0;

var iy = argument1;

var mask = argument2;

if collision_circle(ix,iy,mask,obj_wall,true,true) return true;
if xlayer == 0 && collision_circle(ix,iy,mask,obj_wall_back,true,true) return true;
if xlayer == 1 && collision_circle(ix,iy,mask,obj_wall_fore,true,true) return true;
if tlayer == 1 && collision_circle(ix,iy,mask,obj_wall_temp,true,true) return true;
/// add more layers for each collision layer

return false;
