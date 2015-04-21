// check if it collides against a ball
hookTop = y - sprite_height;
hitId = collision_line(x, hookTop, x, initialY, objBallBig, false, false);

if (hitId != noone)
{
    // we have collided with a ball, first let's tell the ball
    with (hitId)
    {
        instance_destroy();
    }
    
    // destroy ourselves
    instance_destroy();
}
else
{
    // let's check if it collides against a solid object
    if (!place_free(x, y))
    {
        instance_destroy();
    }
}

