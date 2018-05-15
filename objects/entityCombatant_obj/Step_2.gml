/// @description Ancestor events
event_inherited();



///place weapons on self
if(aimDir <= 90 || aimDir >= 270)
{
  image_xscale = abs(image_xscale);
}
else
{
  image_xscale = -abs(image_xscale);
}

var wep;
for(var i = 0; i < ds_list_size(m_weaponsActive); i++)
{
  wep = m_weaponsActive[|i];
  var X = 0;
  var Y = 0;
  var coords;
  if(!is_undefined(wep.m_handPrimary))
  {
    m_handPrimary = wep.m_handPrimary;
    X = m_handPrimary[0] * sign(image_xscale);
    Y = m_handPrimary[1];
    if(instance_exists(m_hands))
    {
      EntityHandsAddPositions_scr(m_hands, array(x + X, y + Y)); 
    }
  }
  
  wep.x = x + X;
  wep.y = y + Y;  
  
  if(!is_undefined(wep.m_handSecondary))
  {
    m_handSecondary = relative_coordinates(wep.x, wep.y, 
      wep.m_handSecondary[0], wep.m_handSecondary[1] * sign(image_xscale), aimDir);
    EntityHandsAddPositions_scr(m_hands, m_handSecondary);
  }
  
  wep.depth = depth - 1;
  wep.image_angle = aimDir;
  if(instance_exists(m_hands))
  {
    m_hands.depth = wep.depth - 1;
  }
}


///Wall Collision - commented out
/*
mask_index = movementMask;
var hitList = instance_place_list(x, y, environmentWall_obj, 4, true);
if(ds_list_size(hitList) > 1)
{
  var test = "catch";
}

var angleMove;
if(ds_list_size(hitList) == 1)
{
  angleMove = EntityCombatantGetWallCollisionDirection_scr(hitList[|0]);
  if(!is_undefined(angleMove))
  {
    move_outside(hitList[|0], angleMove, 20);
    //move_outside_solid(angleMove, 1);
    //x += lengthdir_x(.3, angleMove - 180);
    //y += lengthdir_y(.3, angleMove - 180);
    //Eliminate the speed going into the wall
    var angleDeg = abs(angle_difference((angleMove + 180), direction));
    var angleRad = degtorad(angleDeg);
    var vectorMag = cos(angleRad) * speed;
    motion_add(angleMove, vectorMag);
  }
}
else if(ds_list_size(hitList) > 1)
{
  var dirSpdPairList = ds_list_create();
  var angleList = ds_list_create();
  var angleWallMap = ds_map_create();
  for(var i = 0; i < ds_list_size(hitList); i++)
  {
    var angle = EntityCombatantGetWallCollisionDirection_scr(hitList[|i]);
    if(!is_undefined(angle))
    {
      move_outside(hitList[|i], angle, 10);
      //x += lengthdir_x(.3, angle - 180);
      //y += lengthdir_y(.3, angle - 180);
    }
    
    if(is_undefined(angle))
    {
      var test = "catch";
    }
    var dirSpdPair;
    if(!is_undefined(angle) && ds_list_find_index(angleList, angle) == -1)
    {
      //Add this angle only if it doesn't already exist since duplicate angles
      //will have the unintended effect of having a greater impact on friction
      dirSpdPair = array(angle, 1);
      ds_list_add(dirSpdPairList, dirSpdPair);
      ds_list_add(angleList, angle);
    }
  }
  
  var vectorArr = vectors_combine_list(dirSpdPairList);
  var angleMove = vectorArr[0];
  m_angleMoveback = angleMove;
  //move_outside_solid(angleMove, 2);
  
  //x += lengthdir_x(.9, angleMove - 180);
  //y += lengthdir_y(.9, angleMove - 180);
  var angleDeg = abs(angle_difference((angleMove + 180), direction));
  var angleRad = degtorad(angleDeg);
  var vectorMag = cos(angleRad) * speed;
  motion_add(angleMove, vectorMag);
  
  ds_list_destroy(angleList);
  ds_list_destroy(dirSpdPairList);
}

//Reset the current mask
mask_index = combatMask;



/* */
/*  */
