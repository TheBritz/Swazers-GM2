with (MovableTest_obj) {
var accelX = .15;
var accelY = .15;
var speedX = 0;
var speedY = 0;

if(keyboard_check(vk_left))
{
  speedX -= 5;
  accelX = .25;
}

if(keyboard_check(vk_right))
{
  speedX += 5;
  accelX = .25;
}

if(keyboard_check(vk_up))
{
  speedY -= 5;
  accelY = .25;
}

if(keyboard_check(vk_down))
{
  speedY += 5;
  accelY = .25;
}

Movable_AccelTowardsSpeedVector_scr(id, speedX, accelX, speedY, accelY, 5);

}
