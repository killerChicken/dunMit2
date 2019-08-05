//Creacion de estados de la maquina de estados
enum enem2Estados {
	parado,  //0
	buscando,//1
	alerta,  //2
	ataque   //3
}
estado = enem2Estados.parado;

contador = 0;
spd = 0.5; //Tamaño del vector
my_dir = irandom_range(0,359); //Elige un valor en grados      (desde el centro del circulo)
moveX = lengthdir_x(spd, my_dir); //Valor de x en el triangulo rectangulo, coseno?
moveY = lengthdir_y(spd, my_dir); //Valor de y en el triangulo rectangulo, seno?
my_slash = noone; //Por defecto no existe ningun objeto ataque
existeAtaque = false;