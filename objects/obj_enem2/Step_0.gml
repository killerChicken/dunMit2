depthEnem = -room_height - y;

show_debug_message("estado = " + string(estado));
show_debug_message("contador = " + string(contador));

if (estado == enem2Estados.parado){ //0
	//show_message("asdasdasds")
	#region Comportamiento estado parado
	contador += 1;
	if (contador >= room_speed * 3){//Trigger de transicion hacia eñ estado buscando
		var change = choose(0,1);
		switch (change){
			case 0: estado = enem2Estados.buscando;
			case 1: contador = 0; break;
		}
	}
	if (collision_circle(x, y, 164, obj_link2, false, false)){// Trigger del alerta 
		estado = enem2Estados.alerta;
	}
	//Sprites
	#endregion
}
else if (estado = enem2Estados.buscando){ //1
	#region Comportamiento estado buscando
	contador += 1;
	x += moveX;
	y += moveY;
	
	if (contador >= room_speed * 3){// Trigger de parado, espera un tiempo y elige entre 2 opciones
		var change = choose(0,1);
		switch(change){
			case 0: estado = enem2Estados.parado;
			case 1: my_dir = irandom_range(0,359);
					moveX = lengthdir_x(spd, my_dir);
					moveY = lengthdir_y(spd, my_dir);
					contador = 0;
		}
	}
	if (collision_circle(x, y, 164, obj_link2, false, false)){
		estado = enem2Estados.alerta;
	}
	//Sprites
	//image_xscale = sign(moveX);
	#endregion	
}
else if (estado = enem2Estados.alerta){ //2
	#region Comportamiento estado alerta
	//reseteo de ataque
	contador = 0;
	existeAtaque = false;
	
	my_dir = point_direction(x, y, obj_link2.x, obj_link2.y);
	moveX = lengthdir_x(spd, my_dir);
	moveY = lengthdir_y(spd, my_dir);
	x += moveX;
	y += moveY;
	
	if (!collision_circle(x, y, 164, obj_link2, false, false)){// Trigger de parado, una vez se alejo del circulo
		estado = enem2Estados.parado;
	}
	if (collision_circle(x, y, 64, obj_link2, false, false)){//Trigger de ataque
		estado = enem2Estados.ataque;
	}
	//Sprites
	//image_xscale = sign(moveX);
	#endregion	
}
else if (estado = enem2Estados.ataque){ //3
	#region Comportamiento estado ataque
	//if (my_slash == noone){
	if (existeAtaque == false){
		my_slash = instance_create_layer(
			x + image_xscale * 32, y, "Instances", obj_enemAtac2
		);
		existeAtaque = true;
		my_slash.creator = id;
		//my_slash.image_xscale = image_xscale;
		//image_index = 0;
	}
	contador += 1;
	if (contador >= 120){//Trigger de alerta
		estado = enem2Estados.alerta;
	}
	#endregion	
}