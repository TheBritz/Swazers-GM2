/// @description Movable_AccelTowardsSpeedVector_scr(movable, speedX, accelX, speedY, accelY, maxSpeed [optional])
/// @param movable
/// @param  speedX
/// @param  accelX
/// @param  speedY
/// @param  accelY
/// @param  maxSpeed [optional]

var movable = argument[0];
var spdX = argument[1];
var accX = argument[2];
var spdY = argument[3];
var accY = argument[4];
var maxSpeed = undefined;
if(argument_count > 5)
{
  maxSpeed = argument[5];
}

with(movable)
{
  var dir, spdDiff;
  
  //Set the built-in speed properties so we can take advantage of Gamemaker's
  //speed calculations
  Movable_SetBuiltInSpeedProperties_scr(id);
  
  spdDiff = spdX - hspeed;
  
  if(spdDiff != 0)
  {
    spdDir = sign(spdDiff);
    hspeed += accX * spdDir;
    if(abs(hspeed) > abs(spdX) && sign(hspeed) == sign(spdX))
    {
      //Don't go above the speed specified
      hspeed = spdX;
    }
  }
  
  spdDiff = spdY - vspeed;
  if(spdDiff != 0)
  {
    spdDir = sign(spdDiff); 
    vspeed += accY * spdDir;
    if(abs(vspeed) > abs(spdY) && sign(vspeed) == sign(spdY))
    {
      //Don't go above the speed specified
      vspeed = spdY;
    }
  }
  
  if(!is_undefined(maxSpeed))
  {
    if(speed > maxSpeed)
    {
      //Don't go above the speed specified
      speed = maxSpeed;
    }
  }
  
  //Unset the built-in speed properties as we don't want built-in updates
  Movable_UnsetBuiltInSpeedProperties_scr(id);
}
