/// @description WeaponSetProjectileAttribute_scr(weaponInstance, projectileType, attribute, value)
/// @param weaponInstance
/// @param  projectileType
/// @param  attribute
/// @param  value

var wep = argument0;

with(wep)
{
  //This should only run if the running instance is a weapon
  if(object_is(object_index, entityWeaponBase_obj))
  {
    var projType = argument1;
    var attr = argument2;
    var val = argument3;
    
    //Create the attribute map if it doesn't exist
    if(!ds_map_exists(m_ammoProjAttributes, projType))
    {
      m_ammoProjAttributes[?projType] = ds_map_create(); 
    }
    
    //Assign the attribute to the attribute map
    var projAttr = m_ammoProjAttributes[?projType];
    projAttr[?attr] = val;
  }
}
