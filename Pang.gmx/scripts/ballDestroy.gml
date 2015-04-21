// create the balls
leftBall = instance_create(x - 0.25 * sprite_width, y, argument0);
rightBall = instance_create(x + 0.25 * sprite_width, y, argument0);

// the left ball has a negative speed and the right ball's speed is positive
leftBall.xspeed = -abs(leftBall.xspeed);
rightBall.xspeed = abs(rightBall.xspeed);

// increase the score
//...

