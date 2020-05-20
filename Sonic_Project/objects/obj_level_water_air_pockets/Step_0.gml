/// @description Insert description here
// You can write your code in this editor
time ++;

if time == time_max
{
	instance_create_layer(x+8,y+8,layer,obj_level_water_air_bubbles);
	time = 0;
}