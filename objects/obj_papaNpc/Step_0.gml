depthEnem = -room_height - y;
depth = depthEnem;
//depth = -10000

//Inicializacion del movimiento
vY = 0;
vX = 0;
enemVel  = 1;

//Generacion del movimiento segun la posicion del jugador
if (distance_to_point(obj_link2.x, obj_link2.y) < radioVision){
	vX = sign(obj_link2.x - x) * enemVel;
	vY = sign(obj_link2.y - y) * enemVel;
}
else{
	vX = sign(xstart - x) * enemVel;
	vY = sign(ystart - y) * enemVel;
}

//Determinar direccion
if (vY > 0){
	direccion = "abajo";
}
else if (vY < 0){
	direccion = "arriba";
}
else if (vX > 0){
	direccion = "derecha";
}
else if (vX < 0){
	direccion = "izquierda";
}

//Si no estamos atacando se comprueba estados de parado y caminar
if (estado != estadosEnem.atacar){
	if (direccion != ""){
		estado = estadosEnem.correr;
	}
	if (vX == 0 and vY == 0){
		estado = estadosEnem.parado;
	}
}
else {//Y si estamos atacando nos paramos
	vX = 0;
	vY = 0;
	
	//Apuntar segun la direccion al momento de atacar
	gradosPj = point_direction(x, y, obj_link2.x, obj_link2.y);
	if (gradosPj < 45 or gradosPj > 315){
		direccion = "derecha";
	}
	else if (gradosPj >= 45 and gradosPj < 135){
		direccion = "arriba";
	}
	else if (gradosPj >= 135 and gradosPj < 255){
		direccion = "izquierda";
	}
	else if (gradosPj >= 225 and gradosPj <= 315){
		direccion = "abajo";
	}
}

//Comprobar vida y muerte
if (vida <= 0){
	estado = estadosEnem.muerte;
	colision = false;
	vX = 0;
	vY = 0;
}
 //Ataque
 if ((distance_to_point(obj_link2.x, obj_link2.y) < radioAtaque) and (estado != estadosEnem.atacar) and (estado != estadosEnem.muerte)){
	 estado = estadosEnem.atacar;
	 image_index = 0;
 }

//Colisiones


//Ejecucion del movimiento y del sript
x += vX;
y += vY;
script_execute(estado);


draw_set_alpha(0.15);
draw_set_color(c_red);
draw_circle(x, y, radioVision + 5, false);
draw_circle(x, y, radioAtaque + 5, false);
draw_set_color(c_black);
draw_set_alpha(1);
draw_text(x, y + 50, string(vida));

draw_self();




