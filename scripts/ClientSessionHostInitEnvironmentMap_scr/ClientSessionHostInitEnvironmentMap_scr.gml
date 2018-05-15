/// @description ClientSessionHostInitEnvironmentMap_scr()

var envInst;
for(var i = 0; i < instance_number(environmentBase_obj); i++)
{
  envInst = instance_find(environmentBase_obj, i);
  environmentMap[? i] = envInst;
}
