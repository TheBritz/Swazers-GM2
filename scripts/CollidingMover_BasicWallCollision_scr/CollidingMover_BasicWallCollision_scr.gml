/// @description CollidingMover_BasicWallCollision_scr(wallInstance, x, y, remainingSpeed)
/// @param wallInstance
/// @param  x
/// @param  y
/// @param  remainingSpeed
m_debugBasicWallCollisionCalls++;
var wall = argument0;
var xx = argument1;
var yy = argument2;
var remSpd = argument3;

//Still Colliding?
var initialCollide = false;
if(Collidable_PlaceMeeting_scr(xx, yy, id, wall))
{
  initialCollide = true; 
}

var xScaleTemp = image_xscale;
var yScaleTemp = image_yscale;
image_xscale = image_xscale*2;
image_yscale = image_yscale*2;
var tempX = x;
var tempY = y;
//x = xx;
//y = yy;
var angleMove = EntityCombatantGetWallCollisionDirection_scr(id, wall);
if(is_undefined(angleMove))
{
  var test = "test";
}
else if(angleMove == 0)
{
  var test = "test";
}

x = tempX;
y = tempY;
image_xscale = xScaleTemp;
image_yscale = yScaleTemp;
var impactRatio = 1;

if(!is_undefined(angleMove))
{
  var originalSpd = Entity_GetSpeed_scr(id);
  var angleDeg = abs(angle_difference((angleMove + 180), direction));
  var angleRad = degtorad(angleDeg);
  var vectorMag = cos(angleRad) * originalSpd;
  Entity_MotionAdd_scr(id, angleMove, vectorMag);
  var newSpd = Entity_GetSpeed_scr(id);
  var impactRatio = newSpd/originalSpd;
}

if(remSpd > 0 && newSpd > 0)
{
  var impactedRemSpeed = impactRatio * remSpd;
  var newX = xx + lengthdir_x(impactedRemSpeed, direction)
  var newY = yy + lengthdir_y(impactedRemSpeed, direction);
  
  instance_deactivate_object(wall);
  var retMap = CollidingMover_ValidateMovement_scr
    (id, xx, yy, newX, newY, 1, environmentWall_obj, true);
  instance_activate_object(wall);
  var hit = retMap[? ValidateMovementReturnValues.CollidedTarget];
  if(instance_exists(hit))
  {
    var dist = point_distance(xx, yy, 
    retMap[? ValidateMovementReturnValues.MoverX],
    retMap[? ValidateMovementReturnValues.MoverY]);
    remSpd = 0;
    if(dist != 0)
    {
      remSpd = retMap[? ValidateMovementReturnValues.UnusedSpeed];
    }
    CollidingMover_BasicWallCollision_scr(hit, 
      retMap[? ValidateMovementReturnValues.MoverX], 
      retMap[? ValidateMovementReturnValues.MoverY],
      remSpd);
  }
  else
  {
    x = retMap[? ValidateMovementReturnValues.MoverX];
    y = retMap[? ValidateMovementReturnValues.MoverY];
    Log_scr("BasicWallCollision info: setting position to x=" 
      + string(x) + ", y=" + string(y), "CollidingMover.txt");
  }
}
else
{
  x = xx;
  y = yy;
}


