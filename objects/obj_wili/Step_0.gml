/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(keyboard_check(vk_left)){x-=3}
if(keyboard_check(vk_right)){x+=3}
if(keyboard_check(vk_up)){y-=3}
if(keyboard_check(vk_down)){y+=3}

if(mouse_check_button_pressed(mb_left)){
	instance_create_layer(mouse_x, mouse_y, "text", obj_textbox);
}