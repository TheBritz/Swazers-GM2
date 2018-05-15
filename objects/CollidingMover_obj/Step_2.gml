/// @description Moving Collision
var collisionHandlerCalls = 0;
var previousCoords = Entity_GetPreviousCoordinates_scr(id, 0);
m_debugBasicWallCollisionCalls = 0;
for(var i = 0; i < ds_list_size(m_colliderTargetList); i++)
{
  var target = m_colliderTargetList[|i];
  var treatAsSolid = m_colliderTreatAsSolidMap[? target];
  var map = CollidingMover_ValidateMovement_scr
    (id, previousCoords[0], previousCoords[1], 
    x, y, m_movementStepSize, target, treatAsSolid);
  
  var xx = map[? ValidateMovementReturnValues.MoverX];
  var yy = map[? ValidateMovementReturnValues.MoverY];
  var hit = map[? ValidateMovementReturnValues.CollidedTarget];
  var unusedSpeed = map[? ValidateMovementReturnValues.UnusedSpeed];
  
  var dist = point_distance(xx, yy,
    previousCoords[0], previousCoords[1]);
  
  if(dist == 0)
  {
    var test = "test";
  }
    
  var script = m_colliderTargetScriptMap[? target];
  if(instance_exists(hit))
  {
    collisionHandlerCalls++;
    script_execute(script, hit, xx, yy, unusedSpeed);
  } 
}

if(m_debugBasicWallCollisionCalls > 0)
{
  //Log_scr("CollidingMover: collision handler calls = " + 
    //string(collisionHandlerCalls), "CollidingMover.txt");
  Log_scr("CollidingMover: basic wall collision calls = " + 
    string(m_debugBasicWallCollisionCalls), "CollidingMover.txt");
}
 
event_inherited(); 

