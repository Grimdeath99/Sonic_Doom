/// @description Insert description here
// You can write your code in this editor
if lifespan >= life_max/2
{
	draw_self();	
}
else
{
	if lifespan >= life_max/4
	{
		if lifespan mod 4!= 0
		{ draw_self(); }
	}
	else
	{
		if lifespan mod 4 = 0
		{ draw_self(); }	
	}
}