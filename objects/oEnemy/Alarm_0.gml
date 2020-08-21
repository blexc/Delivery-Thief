/// @description shoot projectile
with(instance_create_layer(center_x, center_y, "Projectile", oProjectile))
{
	x = other.center_x;
	y = other.center_y;
	who_shot_me = other.id; // this enemy id is passed to the projectile
	px = instance_nearest(x, y, oPlayer).center_x;
	py = instance_nearest(x, y, oPlayer).center_y;
}
can_shoot = true;