// we're going to check ourselves whether we have collisions

// first the X axis
newX = x + xspeed;
if (place_free(newX, y))
{
    // no collisions so we update the x position
    x = newX;
}
else
{
    // binary search algorithm to find the position where the ball is right against the wall
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
    xspeed = -xspeed;
}

// now the Y axis
yspeed = yspeed + ballGravity;
newY = y + yspeed;
if (place_free(x, newY))
{
    // no collisions so we update the y position
    y = newY;
}
else
{
    // find the position where the ball is just touching the solid object we're bouncing against
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
    if (yspeed > 0)
        yspeed = -groundBounceSpeed;
    else
        yspeed = -yspeed;
}

