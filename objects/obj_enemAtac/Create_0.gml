depth = obj_papaNpc.depthEnem - 100;

if (obj_papaNpc.direccion == "arriba"){
	sprite_index = spr_enemAtacAri;
}
else if (obj_papaNpc.direccion == "abajo"){
	sprite_index = spr_enemAtacAba;
}
else if (obj_papaNpc.direccion == "izquierda"){
	sprite_index = spr_enemAtacIzq;
}
else if (obj_papaNpc.direccion == "derecha"){
	sprite_index = spr_enemAtacDer;
}
//Alarma para destruirlo
alarm[0] = 60;
