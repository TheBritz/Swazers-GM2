/// @description EntityHandsAddPosition_scr(handsInstance, positionCoords1, positionCoords2...)
/// @param handsInstance
/// @param  positionCoords1
/// @param  positionCoords2...
var hands = argument[0];

with hands
{
  for(var i = 1; i < argument_count; i++)
  {
    ds_list_add(m_handPositions, argument[i]);  
  }
}
