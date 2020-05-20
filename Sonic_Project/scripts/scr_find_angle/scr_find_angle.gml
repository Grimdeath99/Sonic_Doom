/// @description collision_find_angle(x,y,angle,hspace,check)
/// @param x
/// @param y
/// @param angle
/// @param hspace
/// @param check
var ix = argument0;
var iy = argument1;
var angle=round(argument2/8)*8;
var hspace = argument3;
var check = argument4;

var acos=cos(degtorad(angle));
var asin=sin(degtorad(angle));

var x1 = round(ix-(acos*hspace));
var y1 = round(iy+(asin*hspace));

var x2 = round(ix+(acos*hspace));
var y2 = round(iy-(asin*hspace));

var done1 = 0;
var done2 = 0;

var i = check;
while(i>0)
{
if !done1
{
if collision_point(x1,y1,obj_wall,true,true) done1 = true;
if xlayer == 0 && collision_point(x1,y1,obj_wall_back,true,true) done1 = true;
if xlayer == 1 && collision_point(x1,y1,obj_wall_fore,true,true) done1 = true;
if tlayer == 1 && collision_point(x1,y1,obj_wall_temp,true,true) done1 = true;

x1 +=asin;
y1 +=acos;
}
if !done2
{
if collision_point(x2,y2,obj_wall,true,true) done2 = true;
if xlayer == 0 && collision_point(x2,y2,obj_wall_back,true,true) done2 = true;
if xlayer == 1 && collision_point(x2,y2,obj_wall_fore,true,true) done2 = true;
if tlayer == 1 && collision_point(x2,y2,obj_wall_temp,true,true) done2 = true;

x2 +=asin;
y2 +=acos;
}
if done1 && done2 break;
i-=1;
}
if !done1 || !done2  {x1 = round(ix-(acos*hspace)); y1 = round(iy+(asin*hspace)); x2 = round(ix+(acos*hspace)); y2 = round(iy-(asin*hspace));}

return round(point_direction(x1,y1,x2,y2));


