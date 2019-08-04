gradosPj = point_direction(x, y, obj_link2.x, obj_link2.y);
if (gradosPj < 45 or gradosPj > 315){
	//direccion = "derecha";
	obj_link2.x += 32;
}
else if (gradosPj >= 45 and gradosPj < 135){
	//direccion = "arriba";
	obj_link2.y -= 32;
	}
else if (gradosPj >= 135 and gradosPj < 255){
	//direccion = "izquierda";
	obj_link2.x -= 32;
}
else if (gradosPj >= 225 and gradosPj <= 315){
	//direccion = "abajo";
	obj_link2.y += 32;
}