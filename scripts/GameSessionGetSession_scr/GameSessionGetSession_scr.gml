/// @description GameSessionGetSession_scr(gameName, uid)
/// @param gameName
/// @param  uid
var gameName = argument0;
var uid = argument1;

var retVal = undefined;
var gameGroup = gameGroups[? GAME_NAME];
if(!is_undefined(gameGroup))
{
  var gamesMap = gameGroup[? GAME_GROUP_GAMES_MAP];
  if(!is_undefined(gamesMap))
  {
    var gameSession = gamesMap[? uid];
    return gameSession;
    exit;
  }
}

return retVal;
