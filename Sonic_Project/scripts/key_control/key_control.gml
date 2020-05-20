/// @description key_control(device)
/// @function key_control(device)
/// @parm device

if !variable_instance_exists(id, "gptriggervar") gptriggervar = 0;

if gptriggervar !=1
{
gptriggervar = 1;
g_axix_upp = 0;
g_axix_downp = 0;
g_axix_rightp = 0;
g_axix_leftp = 0;
}

dvc = argument0;
dzone =0.3;
/// temp vars
var k_up , k_upp , k_left , k_right , k_rightp , k_leftp , k_down , k_downp, k_downr , k_a ,k_ap , k_ar , k_b , k_bp, k_br, k_x , k_xp , k_xr , k_y, k_yp , k_yr, k_r , k_rp , k_rr, k_l, k_lp, k_lr, k_start ;
var g_up , g_upp , g_left , g_right , g_rightp , g_leftp , g_down , g_downp, g_downr , g_a ,g_ap , g_ar , g_b , g_bp , g_br , g_x , g_xp , g_xr , g_y, g_yp , g_yr, g_r , g_rp , g_rr, g_l, g_lp, g_lr, g_start ;
g_up = 0; g_upp = 0; g_left = 0; g_right = 0; g_rightp = 0; g_leftp = 0; g_down = 0; g_downp = 0; g_downr = 0;
g_a = 0; g_ap = 0; g_ar = 0; g_b = 0; g_bp = 0; g_br = 0; g_x = 0; g_xp = 0; g_xr = 0; g_y = 0; g_yp = 0; g_yr = 0; g_start = 0;
g_r = 0; g_rp = 0; g_rr = 0; g_l = 0; g_lp = 0; g_lr = 0;

/// keyboard inputs

    k_up = keyboard_check(vk_up) ;
    k_upp = keyboard_check_pressed(vk_up) ;
    k_left = keyboard_check(vk_left);
    k_right = keyboard_check(vk_right);
    k_leftp = keyboard_check_pressed(vk_left);
    k_rightp = keyboard_check_pressed(vk_right);
    k_down = keyboard_check(vk_down);
    k_downp = keyboard_check_pressed(vk_down);
    k_downr = keyboard_check_released(vk_down);
    
    k_ap = keyboard_check_pressed(ord("S"));
    k_a = keyboard_check(ord("S"));
    k_ar = keyboard_check_released(ord("S"));
    k_b = keyboard_check(ord("D"));
    k_bp = keyboard_check_pressed(ord("D"));
    k_br = keyboard_check_released(ord("D"));
    k_x = keyboard_check(ord("A"));
    k_xp = keyboard_check_pressed(ord("A"));
    k_xr = keyboard_check_released(ord("A"));
    k_y = keyboard_check(ord("W"));
    k_yp = keyboard_check_pressed(ord("W"));
    k_yr = keyboard_check_released(ord("W"));

    k_r= keyboard_check(vk_space);
    k_rp = keyboard_check_pressed(vk_space);
    k_rr = keyboard_check_released(vk_space);

    k_l = keyboard_check(vk_shift);
    k_lp = keyboard_check_pressed(vk_shift);
    k_lr = keyboard_check_released(vk_shift);
    
    k_start = keyboard_check_pressed(vk_enter);
///////


/// game pad inputs

if (gamepad_is_connected(dvc))
{
if gamepad_axis_value(dvc,gp_axislv)<-dzone*3 g_axix_upp++; else g_axix_upp = 0; //up pressed
if gamepad_axis_value(dvc,gp_axislh)<-dzone*3 g_axix_leftp++; else g_axix_leftp = 0;
if gamepad_axis_value(dvc,gp_axislv)>dzone*3 g_axix_downp++; else g_axix_downp = 0; //down pressed
if gamepad_axis_value(dvc,gp_axislh)>dzone*3 g_axix_rightp++; else g_axix_leftp = 0;


    g_up = gamepad_button_check(dvc,gp_padu) || gamepad_axis_value(dvc,gp_axislv)<-dzone*2 ;
    g_upp = gamepad_button_check_pressed(dvc,gp_padu) || (g_axix_upp == 1 || (g_axix_upp >= 60 && g_axix_upp % 3 == 0)) ;
    g_left = gamepad_button_check(dvc,gp_padl) || gamepad_axis_value(dvc,gp_axislh)<-dzone ;
    g_right = gamepad_button_check(dvc,gp_padr) || gamepad_axis_value(dvc,gp_axislh)>dzone;
    g_leftp = gamepad_button_check_pressed(dvc,gp_padl) || (g_axix_leftp == 1 || (g_axix_leftp >= 60 && g_axix_leftp % 3 == 0));
    g_rightp = gamepad_button_check_pressed(dvc,gp_padr) || (g_axix_rightp == 1 || (g_axix_rightp >= 60 && g_axix_rightp % 3 == 0));
    g_down = gamepad_button_check(dvc,gp_padd) || gamepad_axis_value(dvc,gp_axislv)>dzone*2.5;
    g_downp = gamepad_button_check_pressed(dvc,gp_padd) || (g_axix_downp == 1 || (g_axix_downp >= 60 && g_axix_downp % 3 == 0));
    
if gamepad_button_check_released(dvc,gp_padd) || (gamepad_axis_value(dvc,gp_axislv)< dzone*3 && g_axix_downp != 0) g_downr = true;
    
    g_ap = gamepad_button_check_pressed(dvc,gp_face1);
    g_a = gamepad_button_check(dvc,gp_face1);
    g_ar = gamepad_button_check_released(dvc,gp_face1);
    g_b = gamepad_button_check(dvc,gp_face2);
    g_bp = gamepad_button_check_pressed(dvc,gp_face2);
    g_br = gamepad_button_check_released(dvc,gp_face2);
    g_x = gamepad_button_check(dvc,gp_face3);
    g_xp = gamepad_button_check_pressed(dvc,gp_face3);
    g_xr = gamepad_button_check_released(dvc,gp_face3);
    g_y = gamepad_button_check(dvc,gp_face4);
    g_yp = gamepad_button_check_pressed(dvc,gp_face4);
    g_yr = gamepad_button_check_released(dvc,gp_face4);
    
    g_r = gamepad_button_check(dvc,gp_shoulderr);
    g_rp = gamepad_button_check_pressed(dvc,gp_shoulderr);
    g_rr = gamepad_button_check_released(dvc,gp_shoulderr);
    
    g_l = gamepad_button_check(dvc,gp_shoulderl);
    g_lp = gamepad_button_check_pressed(dvc,gp_shoulderl);
    g_lr = gamepad_button_check_released(dvc,gp_shoulderl);
    
    
    
    g_start = gamepad_button_check_pressed(dvc,gp_start);

}

if global.control_type != 0 && (k_up || k_upp || k_left || k_right || k_rightp || k_leftp || k_down || k_downp || k_a || k_ap || k_ar || k_b || k_bp || k_br || k_x || k_xp || k_xr || k_y || k_yp || k_yr || k_r || k_rp || k_rr || k_l || k_lp || k_lr || k_start)
global.control_type = 0;

if global.control_type != 1 && (g_up || g_upp || g_left || g_right || g_rightp || g_leftp || g_down || g_downp || g_a || g_ap || g_ar || g_b || g_bp || g_br || g_x || g_xp || g_xr || g_y || g_yp || g_yr || g_r || g_rp || g_rr || g_l || g_lp || g_lr || g_start)
global.control_type = 1;



    key_up = k_up || g_up;
    key_upp = k_upp || g_upp ;
    key_left = k_left || g_left;
    key_right = k_right || g_right;
    key_leftp = k_leftp || g_leftp;
    key_rightp = k_rightp || g_rightp;
    key_down = k_down || g_down;
    key_downp = k_downp || g_downp;
    key_downr = k_downr || g_downr;
    
    key_ap = k_ap || g_ap;
    key_a = k_a || g_a;
    key_ar = max(k_ar,g_ar);

    key_b = k_b || g_b;
    key_bp = k_bp || g_bp;
    key_br = k_br || g_br;

    key_x = k_x || g_x;
    key_xp = k_xp || g_xp;
    key_xr = k_xr || g_xr;
    
    key_y = k_y || g_y;
    key_yp = k_yp || g_yp;
    key_y = k_yr || g_yr;
    
    key_r = k_r || g_r;
    key_rp = k_rp || g_rp;
    key_rr = k_rr || g_rr;
    
    key_l = k_l || g_l;
    key_lp = k_lp || g_lp;
    key_lr = k_lr || g_lr;
    
    key_start = k_start || g_start;



