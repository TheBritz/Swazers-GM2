/// @description RemoteScriptProjectileImpact_scr(args)
/// @param args

var args = argument0;
var netID = args[|0];

var localInstance = global.clientSession.localByNetMap[? netID];

with(localInstance)
{
  ProjImpact_scr(args[|1], args[|2], args[|3], args[|4], args[|5]);
}
