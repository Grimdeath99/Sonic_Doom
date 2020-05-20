/// @description scr_collision_line_right(x,y,mask,sine,cosine,distance)
/// @function scr_collision_line_right(x,y,mask,sine,cosine,distance)
/// @param x
/// @param y
/// @param mask
/// @param sine
/// @param cosine
/// @param distance

var ix = argument0;

var iy = argument1;

var mask = argument2;

var isin = argument3;

var icos = argument4;

var down = argument5;

var line = mask+down;

if collision_line(ix+(icos*mask)+(isin*mask),iy-(isin*mask)+(icos*mask),ix+(icos*mask)+(isin*line),y-(isin*mask)+(icos*line),obj_wall,true,true   ) return true;

if xlayer == 0 && collision_line(ix+(icos*mask)+(isin*mask),iy-(isin*mask)+(icos*mask),ix+(icos*mask)+(isin*line),y-(isin*mask)+(icos*line),obj_wall_back,true,true   ) return true;

if xlayer == 1 && collision_line(ix+(icos*mask)+(isin*mask),iy-(isin*mask)+(icos*mask),ix+(icos*mask)+(isin*line),y-(isin*mask)+(icos*line),obj_wall_fore,true,true   ) return true;

if tlayer == 1 && collision_line(ix+(icos*mask)+(isin*mask),iy-(isin*mask)+(icos*mask),ix+(icos*mask)+(isin*line),y-(isin*mask)+(icos*line),obj_wall_temp,true,true   ) return true;

/// add more layers for each collision layer

return false;
