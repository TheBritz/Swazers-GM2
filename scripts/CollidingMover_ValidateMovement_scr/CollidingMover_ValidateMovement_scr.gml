/// @description CollidingMover_ValidateMovement_scr(collidingMover, collidingMoverHitboxType, previousX, previousY, newX, newY, maxStepDistance, collisionTarget, collisionTargetHitboxType, treatAsSolid)
/// @param collidingMover
/// @param  collidingMoverHitboxType
/// @param  previousX
/// @param  previousY
/// @param  newX
/// @param  newY
/// @param  maxStepDistance
/// @param  collisionTarget
/// @param  collisionTargetHitboxType
/// @param  treatAsSolid

//This function determines what a colliding mover might've run into moving from
//their previous position to the new position
global.CollidingMoverCallCounter++;
var logName = "CollidingMover.txt";

enum ValidateMovementReturnValues
{
  MoverX,
  MoverY,
  CollidedTarget,
  UnusedSpeed,
}

var i = 0;
var collMover = argument[i++];
//var collHitboxType = argument[i++];
var prevX = argument[i++];
var prevY = argument[i++];
var newX = argument[i++];
var newY = argument[i++];
var stepDist = argument[i++];
if(stepDist < 1)
{
  stepDist = 1;
  Log_scr("ValidateMovement parameter error: stepDist cannot be less than 1; using 1 instead of the provided value.", logName);
}
var collMover, collTarget = argument[i++];
//var collMover, collTargetHitboxType = argument[i++];
var treatAsSolid = argument[i++];

var travelDistance = point_distance(prevX, prevY, newX, newY);
var travelDirection = point_direction(prevX, prevY, newX, newY);
var stepNumber = ceil(travelDistance/1) + 1;
if(travelDistance == 0) stepNumber = 0;

var xx = prevX;
var yy = prevY;
var lastX = prevX; 
var lastY = prevY;
var hit = noone;
var stepSizeX = lengthdir_x(stepDist, travelDirection);
var stepSizeY = lengthdir_y(stepDist, travelDirection);
var testHit = Collidable_PlaceMeeting_scr(prevX, prevY, collMover, collTarget);
var collided = false;
if(instance_exists(testHit))
{
  Log_scr("ValidateMovement (" + string(global.CollidingMoverCallCounter) + ")" +
    "Clipping at Previous Position error: collision " +
    "occured with the target type at the previous position. This should not " +
    "happen unless the collision target is also moving. Designate a resolving " +
    "action for this target in the m_clippingResolutionMap.", logName);
  Log_scr("ValidateMovement Clipping error info: prevX=" 
    + string(prevX) + " prevY=" + string(prevY), logName);
}
for(var i = 0; i < stepNumber; i++)
{
  if(i == stepNumber - 1)
  { 
    //On the last step, set location to the new values    
    xx = newX;
    yy = newY;
  }
  
  var hit = Collidable_PlaceMeeting_scr(xx, yy, collMover, collTarget);
  var originalHit = hit;
  if(instance_exists(hit) && treatAsSolid)
  {
    var microStepDist = .2;
    if(stepDist > microStepDist)
    {
      //We hit, now we need to determine where collision should have initially 
      //happened - go back to the last (theoretically free) spot
      xx = lastX;
      yy = lastY;
      var microLastX = lastX;
      var microLastY = lastY;
      var microStepNumber = ceil(stepDist/microStepDist) + 1;
      var microStepSizeX = lengthdir_x(microStepDist, travelDirection);
      var microStepSizeY = lengthdir_y(microStepDist, travelDirection);
      for(var ii = 0; ii < microStepNumber; ii++)
      {
        hit = Collidable_PlaceMeeting_scr(xx, yy, collMover, collTarget);
        if(instance_exists(hit))
        {
           if(ii == 0)
           {
             //We just hit at the very first spot - we need to resolve this clip.
             //First, give the collision target a chance to resolve.
             var test = "test";          
             //If the collision target cannot resolve, the collider will attempt 
             //to resolve.         
           }
           
           xx = microLastX;
           yy = microLastY;
           var testHit = Collidable_PlaceMeeting_scr(xx, yy, collMover, collTarget);
           if(instance_exists(testHit))
           {
             Log_scr("ValidateMovement (" + string(global.CollidingMoverCallCounter) + ")" +
               " Clipping at Final Position error: " + 
               "collision occured with the target type at the final position. " +
               "This should not happen.", logName);
           }
           break;           
        }
        else
        {
          xx+=microStepSizeX;
          yy+=microStepSizeY;
        }     
      }
    }
    else
    {
      xx = lastX;
      yy = lastY;
    }
    Log_scr("ValidateMovement (" + string(global.CollidingMoverCallCounter) + ") " +
      "resulted in a collision at x=" + string(xx) + " and y=" + string(yy), logName);    
    collided = true;
    if(!instance_exists(hit))
    {
      var test = "test";
    }
    break;
  }
  else
  {
    //Update location
    lastX = xx;
    lastY = yy;
    xx+=stepSizeX;
    yy+=stepSizeY;
  }
}

//Validate results
if(Collidable_PlaceMeeting_scr(xx, yy, collMover, collTarget))
{
  var test = "test";
  xx = lastX;
  yy = lastY;
}

//Populate the return map
map = global.ReusableReturnMap;  
ds_map_clear(map);
map[? ValidateMovementReturnValues.MoverX] = xx;
map[? ValidateMovementReturnValues.MoverY] = yy;
map[? ValidateMovementReturnValues.CollidedTarget] = hit;
map[? ValidateMovementReturnValues.UnusedSpeed] = 
  point_distance(xx, yy, newX, newY); 
return map;

