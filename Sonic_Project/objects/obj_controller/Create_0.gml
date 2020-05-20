/// @description Camera setup
// You can write your code in this editor
camera = camera_create();

var viewmat = matrix_build_lookat(x,y,-100,x,y,0,0,1,0);
var promat = matrix_build_projection_ortho(400,224,-255.0,10000.0);

camera_set_view_mat(camera,viewmat);
camera_set_proj_mat(camera,promat);

view_camera[0] = camera;

if view_get_wport(0) != (400*global.screen_size)
   {
   view_set_wport(0, 400*global.screen_size);
   }
  if view_get_hport(0) != (224*global.screen_size)
   {
   view_set_hport(0, 224*global.screen_size);
   }
   
   if window_get_width() != 400*global.screen_size
   {
		window_set_size(400*global.screen_size,224*global.screen_size)   
   }

//display_set_gui_size(400,224);


/// varibles

cam_lock = 0;
cam_mode = 1;
if instance_exists(obj_player_main) follow = obj_player_main;
look_cont = 0;
look_y = 0;

dead_zone_x = 12;
dead_zone_top = 50;
dead_zone_bottom = 16;

