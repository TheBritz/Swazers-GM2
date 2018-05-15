/// @description EntityGetEffectiveSpeedMax_scr(entityInstance)
/// @param entityInstance

var ent = argument0;

if(!is_undefined(speedMax))
{
  if(is_undefined(speedMaxModMult)) speedMaxModMult = 0;
  if(is_undefined(speedMaxModAdd)) speedMaxModAdd = 0;
  return speedMax*speedMaxModMult + speedMaxModAdd;
}
else
{
  return undefined;
}
