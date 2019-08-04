image_speed = 0.1;

//Si estamos en el punto algido del ataque se crea el ataque
animacionAtac = image_index >= image_number - 2 and puedeAtacar;
show_debug_message(animacionAtac);

switch (direccion){
	case "abajo":
		sprite_index = spr_enemAba;
		if (animacionAtac){
			instance_create_depth(x, y + 32, depthEnem, obj_enemAtac);
			break;
		}
	case "arriba":
		sprite_index = spr_enemArri;
		if (animacionAtac){
			instance_create_depth(x, y - 32, depthEnem, obj_enemAtac);
			break;
		}
	case "izquierda":
		sprite_index = spr_enemIzq;
		if (animacionAtac){
			instance_create_depth(x - 32, y, depthEnem, obj_enemAtac);
			break;
		}
	case "derecha":
		sprite_index = spr_enemDer;
		if (animacionAtac){
			instance_create_depth(x + 32, y, depthEnem, obj_enemAtac);
			break;
		}
}
if (animacionAtac){
	puedeAtacar = false;
}
//Reiniciar el estado al final de la animacion
if (image_index >= image_number - 1){
	puedeAtacar = true;
	estado = estadosEnem.parado;
}
