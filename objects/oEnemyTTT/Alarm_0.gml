/// @description shoot projectile
with(instance_create_layer(center_x, center_y, "Projectile", oProjectileTTT))
{
	who_shot_me = other.id; // this enemy id is passed to the projectile
	px = instance_nearest(x, y, oPlayer).x;
	py = instance_nearest(x, y, oPlayer).y;
}
alarm[0] = -1;