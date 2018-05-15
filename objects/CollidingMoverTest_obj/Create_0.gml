/// @description Init

event_inherited();

//Add wall collision
CollidingMover_AddCollisionTarget_scr
  (id, environmentWall_obj, CollidingMover_BasicWallCollision_scr, true);

