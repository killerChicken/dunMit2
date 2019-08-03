//------------entrada de actualización
input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);
input_walk = keyboard_check(vk_control);
input_run = keyboard_check(vk_shift);

//-------------- alter speed
if(input_walk or input_run) {
	spd = abs((input_walk *w_spd) - (input_run * r_spd));
} else {
	spd = n_spd;
}

//------------restablecer las variables de movimiento
moveX = 0;
moveY = 0;

//--------------intended movement
moveY = (input_down - input_up) * spd;
if(moveY ==0){moveX = ( input_right - input_left ) * spd; }
 
 // get direction player is facing
 if(moveX != 0){
	switch(sign(moveX)){
		case 1: Facing = dir.right; break;
		case -1: Facing = dir.left; break;
	}
 }else if(moveY != 0){
	switch(sign(moveY)){
		case 1: Facing = dir.down; break;
		case -1: Facing = dir.up; break;
	}
 }else {
	Facing = -1;	 
 }
//------------- colision checks
// horizoltal
if(moveX != 0){
	if(place_meeting(x+moveX, y, obj_collision)){
		repeat(abs(moveY)){
			if(!place_meeting(x+sign(moveX), y, obj_collision)){ x += sign(moveX); }	
			else { break; }
		}
		 moveX = 0;
	}
}
//vertical
if(moveY != 0){
	if(place_meeting(x, y+moveY, obj_collision)){
		repeat(abs(moveY)){
			if(!place_meeting(x, y+sign(moveY), obj_collision)){ y += sign(moveY); }	
			else { break; }
		}
		 moveY = 0;
	}
}
//obtetos
var inst = instance_place(x, y, obj_transition);
if(inst != noone and Facing == inst.playerFacingBefore){
	with(game){
		if(!doTransiton){
			spawnroom = inst.targetRoom;	
			spawnX = inst.targetX;
			spawnY = inst.targetY;
			spwanPlayerFacing = inst.playerFacingAfter;
			doTransiton = true;
		}
	}
}

//----------------- apply movement
x += moveX;
y += moveY; 