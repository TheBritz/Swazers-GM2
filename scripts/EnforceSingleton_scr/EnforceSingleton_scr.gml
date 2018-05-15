/// @description EnforceSingleton_scr()

//There shouldn't be more than 1
var instNum = instance_number(object_index);
if(instNum > 1)
{
  var otherInst = instance_find(object_index, 0);
  with(otherInst)
  {
    instance_destroy();
  }
}
