/// @description Insert description here
// You can write your code in this editor
///draw_code
draw_self();
if sonic_hit = false
image_index = 0;
else
image_index = 1;

draw_set_alpha(0.4)
draw_circle(x+lengthdir_x(distance,angle*90), y+lengthdir_y(distance,angle*90),mask,false);
draw_set_alpha(1);

draw_text(x+50,y-50,angle);