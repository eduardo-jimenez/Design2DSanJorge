// when drawing the hook the first thing we do is draw ourselves
draw_self();

// now let's draw all the parts necessary
cableHeight = 32;//sprHookCable.sprite_height;
for (hookY = y + (cableHeight / 2); hookY < initialY; hookY += cableHeight)
{
    draw_sprite_ext(sprHookCable, 0, x, hookY, hookMirrorFactor, 1, 0, c_white, 1);
}

// inverse hookMirrorFactor
hookMirrorFactor = -hookMirrorFactor;
