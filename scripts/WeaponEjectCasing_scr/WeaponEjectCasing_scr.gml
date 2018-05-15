/// @description WeaponEjectCasing_scr(shellObj, xSpeedLower, xSpeedUpper, ySpeedLower, ySpeedUpper, zSpeedLower, zSpeedUpper, rotSpeedLower, rotSpeedUpper, relativeX [optional], relativeY [optional])
/// @param shellObj
/// @param  xSpeedLower
/// @param  xSpeedUpper
/// @param  ySpeedLower
/// @param  ySpeedUpper
/// @param  zSpeedLower
/// @param  zSpeedUpper
/// @param  rotSpeedLower
/// @param  rotSpeedUpper
/// @param  relativeX [optional]
/// @param  relativeY [optional]

var args = argument0;
var i = 0;
var shellObj = args[i++];
var xSpeedLower = args[i++];
var xSpeedUpper = args[i++];
var ySpeedLower = args[i++];
var ySpeedUpper = args[i++];
var zSpeedLower = args[i++];
var zSpeedUpper = args[i++];
var rotSpeedLower = args[i++];
var rotSpeedUpper = args[i++];

var relativeX = true;
if(argument_count > i)
{
  relativeX = args[i++];
}

var relativeY = true;
if(argument_count > i)
{
  relativeY = args[i++];
}

//Get the ejection point
var casingCoords = relative_coordinates(x, y, m_casingEjectOrigin[0], 
  m_casingEjectOrigin[1]*sign(image_yscale), image_angle);
var casing = instance_create(casingCoords[0], casingCoords[1], shellObj);

//Adjust for the Z component
if(instance_exists(combatant))
{
  var feetPosY = combatant.y + 10 +
    sprite_get_height(combatant.sprite_index) - sprite_get_yoffset(combatant.sprite_index);
  casing.m_z = EntityGetZRelativePosition_scr(feetPosY, casingCoords[1]);
  casing.y = feetPosY; 
}

var hspd = random_range(xSpeedLower, xSpeedUpper);
if(relativeX)
{
  var angle = image_angle;
  with(casing)
  {
    motion_add(angle, hspd);  
  }
}
else
{
  casing.hspeed = hspd;
}

var vspd = random_range(ySpeedLower, ySpeedUpper);
if(relativeY)
{
  var angle = image_angle + sign(image_yscale) * 90;
  with(casing)
  {
    motion_add(angle, vspd);
  }
}
else
{
  casing.vspeed = vspd;
}

casing.m_zSpeed = random_range(zSpeedLower, zSpeedUpper);
casing.rotationSpeed = random_range(rotSpeedLower, rotSpeedUpper);




