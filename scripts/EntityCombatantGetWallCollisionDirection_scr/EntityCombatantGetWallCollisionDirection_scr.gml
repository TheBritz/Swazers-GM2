/// @description EntityCombatantGetWallCollisionDirection_scr(entity, wallInstance)
/// @param entity
/// @param  wallInstance
var entity = argument0;
var wall = argument1;

//Perform line collisions around the m_cornersInternal
with(wall)
{
  var coords1, coords2, n, hit, linesHit;
  linesHit = ds_list_create();
  for(var i = 0; i < ds_list_size(m_cornersInternal); i++)
  {
    if(i == ds_list_size(m_cornersInternal) - 1)
    {
      n = 0;
    }
    else
    {
      n = i + 1;
    }
    coords1 = m_cornersExternal[|i];
    coords2 = m_cornersExternal[|n];
    hit = collision_line(coords1[0], coords1[1], 
      coords2[0], coords2[1], entity, false, false);
    if(hit != noone)
    {
      ds_list_add(linesHit, i);
    }
  }
  
  ds_list_sort(linesHit, true);
  
  var size = ds_list_size(linesHit);
  if(size == 1)
  {
    var retVal = image_angle + m_sideAngles[|linesHit[|0]];
    ds_list_destroy(linesHit);
    return retVal;
  }
  else if(size == 2)
  {
    var cornerCoords, lHit;
    if(linesHit[|1] == 3 && linesHit[|0] == 0)
    {
      lHit = 0;
      cornerCoords = m_cornersInternal[|lHit];
    }
    else
    {
      lHit = linesHit[|1];
      cornerCoords = m_cornersInternal[|lHit];
    }
    
    var correspondingCorner = lHit + 2;
    if(correspondingCorner > 3)
    {
      correspondingCorner -= 4;
    }
    
    var prevCoords = Entity_GetPreviousCoordinates_scr(entity, 1);
    var maskMidpointCoords = Entity_GetCorner_scr(entity, correspondingCorner);
    var dirToPrevious = point_direction(cornerCoords[0], cornerCoords[1], 
      prevCoords[0] + maskMidpointCoords[0], prevCoords[1] + maskMidpointCoords[1]);
    var val, dirDiffs, mindex;
    for(var i = 0; i < ds_list_size(linesHit); i++)
    {
      val = abs(angle_difference(m_sideAngles[|linesHit[|i]], dirToPrevious));
      dirDiffs[i] = val;
      if(i > 0)
      {
        if(val < dirDiffs[i - 1])
        {
          mindex = i;
        }
      }
      else
      {
        mindex = i;
      }
    }
    var retVal = image_angle + m_sideAngles[|linesHit[|mindex]];
    ds_list_destroy(linesHit);
    return retVal;
  }
  else if(size == 3)
  {
    ds_list_destroy(linesHit);
    return undefined;
  }
  else if(size == 0)
  {
    ds_list_destroy(linesHit);
    return undefined;
  }
}
