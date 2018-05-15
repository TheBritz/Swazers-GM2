/// @description WeaponGetProjectileAttributeDamage_scr(weaponInstance, projectileType)
/// @param weaponInstance
/// @param  projectileType

var wep = argument0;
var projType = argument1;

if(instance_exists(wep) && object_exists(projType))
{
  with(wep)
  {
    //Member variables for projectile attributes take first priority so look
    //there first 
    var dmg = m_ammoProjDamage;
    
    if(is_undefined(dmg))
    {
      //Values in the projectile attribute set takes second priority
      //and will override projectile member variable properties
      dmg = WeaponGetProjectileAttribute_scr(id, projType, PROJ_ATTR_DMG);
      
      if(is_undefined(dmg))
      {
        //Projectile member variables are the lowest priority - instantiate a
        //dummy projectile instance to read its properties as set in its Create
        //Event
        var dummyProj = instance_create(-10000000, 10000000, projType);
        dmg = dummyProj.m_damage;
        with(dummyProj)
        {
          instance_destroy();
        }
      }
    }
    
    return dmg;
  }
}
else
{
  return 0;
}
