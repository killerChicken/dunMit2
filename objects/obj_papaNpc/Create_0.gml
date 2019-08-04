colision = false;

//Creacion de Maquina de estados
enum estadosEnem{
	parado = scr_enemParado,
	correr = scr_enemCorrer,
	atacar = scr_enemAtacar,
	muerte = scr_enemMuerte
}

//Valores por defecto en las variables
direccion = "abajo";
estado = estadosEnem.parado;

vida        = 3;
radioVision = 128;
radioAtaque = 48;
puedeAtacar = true;



