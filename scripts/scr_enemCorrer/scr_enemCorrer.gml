image_speed = 0.6;
/*if (image_index == 0){//Un tipo mejor de animacion para el sprite, se salta la primera imagen
	image_index++
}*/

switch (direccion){
	case"arriba":
		sprite_index = spr_enemCamArri;
		break;
	case"abajo":
		sprite_index = spr_enemCamAba;
		break;
	case"izquierda":
		sprite_index = spr_enemCamIzq;
		break;
	case"derecha":
		sprite_index = spr_enemCamDer;
		break;
}