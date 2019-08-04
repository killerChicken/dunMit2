///Variables basicas

//Movimiento
multi = 1 * global.pausa; //Multiplicador
moviH = 0; //Factor de movimiento horizontal, 1 o 0 o -1
moviV = 0; //Factor de movimiento vertical, 1 o 0 o -1
velCaminar = 5 * multi; //Velocidad al caminar
velCorrer  = velCaminar * 1.5; //Velocidad al correr
velSigilo  = velCaminar * 0.5; //Velocidad de sigilo
acele = 1.0 * multi //Aceleración
fricc = 1.9 * multi //Fricción

//Orientación
miraX = 0; // 1 = derecha, 0 = izquierda
miraY = 0; // 1 = arriba, 0 = abajo
direccion = "abajo";

//Velocidad the rial
vX = 0;
vY = 0;

//Escalado del sprite
image_xscale = 2;
image_yscale = 2;

enum estados{ //Se enumera una variable que solo puede tener sierto valores en las variables
	parado  = scr_pjParado,
	caminar = scr_pjCaminar,
	correr  = scr_pjCorrer
}
estadoPj = estados.parado;
