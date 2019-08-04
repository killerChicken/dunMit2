///Cambia los sprites segun hacia donde este mirando (dirección)

image_speed = 0;
image_index = 0;

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
