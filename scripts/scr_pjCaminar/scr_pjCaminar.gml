///Cambios de sprites cuando camina segun su direccion

image_speed = 0.75;

switch (direccion){
	case"arriba":
		sprite_index = spr_linkArri;
		break;
	case"abajo":
		sprite_index = spr_linkAba;
		break;
	case"izquierda":
		sprite_index = spr_linkIzq;
		break;
	case"derecha":
		sprite_index = spr_linkDer;
		break;
}
