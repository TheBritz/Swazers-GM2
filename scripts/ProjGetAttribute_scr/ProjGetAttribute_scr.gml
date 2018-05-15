/// @description ProjGetAttribute_scr(projType, attribute)
/// @param projType
/// @param  attribute

var projType = argument0;
var attr = argument1;

var attrMap;
//Check first to see if there's an entry for this projectile type in the 
//projectile attribute cache.
if(!ds_map_exists(global.ProjectileAttributeCache, projType))
{  
  //Not yet an entry in the cache, create a dummy instance of this projectile;
  //the creation process will add data to the cache
  var dummyProj = instance_create(-10000000, -10000000, projType);
  with(dummyProj)
  {
    instance_destroy();
  }
}

attrMap = global.ProjectileAttributeCache[? projType];

var retVal = attrMap[? attr];

return retVal;
