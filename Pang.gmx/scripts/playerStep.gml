// if we're already on top of an object there's no need to apply gravity
if (place_free(x, y - 1))
{
    // we're in the air, let's apply gravity
    yspeed += playerGrav;
    
    // now let's apply the y speed
    newY = y + yspeed;
    if (place_free(x, newY))
    {
        // we're still in the air after moving
        y = newY;
    }
    else
    {
        // we've collided against something!
        // find the position touching the wall/floor
        distY = newY - y;
        while (abs(distY) > 1)
        {
            // calculate the new distance    
            distY *= 0.5;
            
            // find the mid point
            midY = y + distY;
            
            // check this new mid point and act accordingly
            if (place_free(x, midY))
                y = midY;
            else
                newY = midY;
        }
        
        // there's a collision so we change directions (in this axis)
        yspeed = 0;
    }
}

// now let's handle the x movement
if (targetSpeedX != xspeed)
{
    // first we get the difference to the target speed
    speedDiff = targetSpeedX - xspeed;
    
    // we limit the speed inc to the acceleration
    speedInc = clamp(speedDiff, -acceleration, acceleration);
    
    // update the speed
    xspeed += speedInc;
}

// update the x position
newX = x + xspeed;

// check for collisions
if (place_free(newX, y))
{
    // we're still in the air after moving
    x = newX;
}
else
{
    // we've collided against something!
    // find the position touching the wall/floor
    distX = newX - x;
    while (abs(distX) > 1)
    {
        // calculate the new distance    
        distX *= 0.5;
        
        // find the mid point
        midX = x + distX;
        
        // check this new mid point and act accordingly
        if (place_free(midX, y))
            x = midX;
        else
            newX = midX;
    }
    
    // there's a collision so we change directions (in this axis)
    xspeed = 0;
}

if (targetSpeedX == 0 && sprite_index != sprPlayerIdle)
{
    // set the idle sprite
    sprite_index = sprPlayerIdle;
}
else if (targetSpeedX != 0 && sprite_index != sprPlayerWalk)
{
    // set the walk sprite
    sprite_index = sprPlayerWalk;
}

// change the sprite xscale based on the target speed
if (targetSpeedX != 0)
{
    image_xscale = targetSpeedX / abs(targetSpeedX);
}

