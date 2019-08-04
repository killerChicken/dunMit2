
#region //Controles
var keyArri, keyAba, keyDer, keyIzq, keyCorrer, keySigilo;

keyArri   =  -keyboard_check(vk_up);
keyAba    =  keyboard_check(vk_down);
keyIzq    = -keyboard_check(vk_left);
keyDer    =  keyboard_check(vk_right);
keyCorrer =  keyboard_check(ord("Z"));
keySigilo =  keyboard_check(ord("A"));
#endregion

#region //Tipos de velocidad: Caminar, Correr, Sigilo
if (keyCorrer){
	tipoVel = velCorrer;
}
else if (keySigilo){
	tipoVel = velSigilo; 
}
else{
	tipoVel = velCaminar;
}
#endregion

#region//Asignacion de los valores booleanos del movimiento (0. 1. -1), antes de moverse 
moviH = (keyIzq  + keyDer) * global.pausa;
moviV = (keyArri + keyAba) * global.pausa;
#endregion

#region //Dirección para donde esta mirando el Pj
if (global.pausa == 1){
	if (moviH > 0){
		direccion = "derecha";
		miraX = 1;
		miraY = 0;
	}
	else if (moviH < 0){
		direccion = "izquierda";
		miraX = -1;
		miraY = 0;
	}
	if (moviV > 0){
		direccion = "abajo";
		miraX = 0;
		miraY = 1;
	}
	else if (moviV < 0){
		direccion = "arriba";
		miraX = 0;
		miraY = -1;
	}
}
#endregion

#region //Asignacion de valores para vX y vY amtes de moverse, sumandole los valores de a poco
//Desplazamiento horizontal
if (moviH != 0){
	vX = scr_deAPoco(vX, tipoVel * moviH, acele);
}
else{
	vX = scr_deAPoco(vX, tipoVel * moviH, fricc);
}
//Desplazamiento vertical
if (moviV != 0){
	vY = scr_deAPoco(vY, tipoVel * moviV, acele);
}
else{
	vY = scr_deAPoco(vY, tipoVel * moviV, fricc);
}
#endregion

#region //Colisiones y ejecucion del movimiento
//Colisión horizontal
repeat(abs(vX)){
	if (place_meeting(x + sign(vX), y, obj_muro)){
		vX = 0;
		break;
	}
	else if ((place_meeting(x + sign(vX), y, obj_papaNpc)) and (obj_papaNpc.colision == true)) {
		vX = 0;
		break;
	}
	else{
		x += sign(vX);	
	}
}
//Colisión vertical
repeat(abs(vY)){
	if (place_meeting(x, y + sign(vY), obj_muro)){
		vY = 0;
		break;
	}
	else if ((place_meeting(x, y + sign(vY), obj_papaNpc)) and (obj_papaNpc.colision == true)){
		vY = 0;
		break;	
	}
	else{
		y += sign(vY);	
	}
}
#endregion

#region //Se elige una opcion de la maquina de estados: Normal, Correr, Caminar
if (moviH == 0) and (moviV == 0){
	estadoPj = estados.parado;
}
else if (keyCorrer){
	estadoPj = estados.correr;	
}
else{
	estadoPj = estados.caminar;	
}
script_execute(estadoPj);
#endregion

//Profundidad
depth = -room_height - y;