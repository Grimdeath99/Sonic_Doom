/// @description scr_collision_right(x,y,mask,sine,cosine,down)
/// @function scr_collision_right(x,y,mask,sine,cosine,down)
/// @param x
/// @param y
/// @param mask
/// @param sine
/// @param cosine
/// @param down

var ix = argument0;

var iy = argument1;

var mask = argument2;

var isin = argument3;

var icos = argument4;

var down = 2;
if argument5 == true && ground down = -8;

if collision_circle(ix+(icos*mask)-isin*down,iy-(isin*mask)-icos*down,3,obj_wall,true,true) return true;

if xlayer == 0 && collision_circle(ix+(icos*mask)-isin*down,iy-(isin*mask)-icos*down,3,obj_wall_back,true,true) return true;
if xlayer == 1 && collision_circle(ix+(icos*mask)-isin*down,iy-(isin*mask)-icos*down,3,obj_wall_fore,true,true) return true;
if tlayer == 1 && collision_circle(ix+(icos*mask)-isin*down,iy-(isin*mask)-icos*down,3,obj_wall_temp,true,true) return true;

/// add more layers for each collision layer

return false;
