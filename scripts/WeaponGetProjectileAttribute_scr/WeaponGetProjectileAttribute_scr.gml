/// @description WeaponGetProjectileAttribute_scr(weaponInstance, projectileType, attribute)
/// @param weaponInstance
/// @param  projectileType
/// @param  attribute

var wep = argument0;
var projType = argument1;
var attr = argument2;

with(wep)
{
  //This should only run if the running instance is a weapon
  if(object_is(object_index, entityWeaponBase_obj))
  {
    //Check the m_ammoProjAttributes first as it overrides the other attribute
    //sources 
    var projAttr = m_ammoProjAttributes[? projType];
    if(!is_undefined(projAttr))
    {
      return projAttr[? attr];  
      exit; 
    }
    else
    {
      //Check the m_ammoProjAttributes as it has 2nd priority
      projAttr = m_ammoProjAttributesDefault[? attr];
      if(!is_undefined(projAttr))
      {
        return projAttr;
        exit; 
      }
      else
      {
        //Get the attribute from the projectile itself - instantiate a dummy
        //instance of the projectile
        projAttr = ProjGetAttribute_scr(projType, attr);
        
        if(is_undefined(projAttr))
        {
          projAttr = 0;
        }
        
        return projAttr;
      }
    }
  }
}

