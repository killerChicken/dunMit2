/// @description Inserte aquí la descripción
if(doTransiton){
	//handle black fade/ room transition
	if(room != spawnroom){
	 blackAlpha += 0.1;
	 if(blackAlpha >= 1) {room_goto(spawnroom)}
	 
	}else {
	 blackAlpha -= 0.1;
	 if(blackAlpha <= 0){doTransiton = false;}
	}
	
	// draw black fade
	draw_set_alpha(blackAlpha);
	draw_rectangle_color(0,0, guiHeight, guiWidth,c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}