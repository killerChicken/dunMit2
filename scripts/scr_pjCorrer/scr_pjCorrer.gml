///Es lo mismo que el de caminar, pero la animacion del sprite es mas rapida

image_speed = 1.1;

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