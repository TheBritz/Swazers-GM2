/// @description NetMsgSessionClientRead_scr(type, ip, port, buffer)
/// @param type
/// @param  ip
/// @param  port
/// @param  buffer

var type = argument0;
var ip = argument1;
var port = argument2;
var buff = argument3;

switch(type)
{
  case MESSAGE_HOLEPUNCH:
    ClientSessionHandleHolepunch_scr(ip, port, buff);
    break;
  case MESSAGE_UPDATE_BASIC:
    ClientSessionHandleUpdateBasic_scr(buff);
    break;
  case MESSAGE_NET_ID_REQUEST:
    ClientSessionHostHandleNetIDRequest_scr(buff);
    break;
  case MESSAGE_NET_ID_ASSIGN:
    ClientSessionHandleNetIDAssign_scr(buff);
    break;
  case MESSAGE_PLAYER_DATA:
    ClientSessionHandlePlayerData_scr(buff);
    break;
  case MESSAGE_SESSION_DISCONNECT:
    ClientSessionHandleSessionDisconnect_scr(buff);
    break;
  case MESSAGE_EXECUTE_SCRIPT:
    ClientSessionHandleScriptExecute_scr(buff);
    break;
  case MESSAGE_ENV_GEN_REQUEST:
    ClientSessionHandleEnvironmentGenRequest_scr(buff);
    break;
  case MESSAGE_ENV_PREGEN_DATA:
    ClientSessionHandleEnvironmentPregenData_scr(buff);
    break;
  case MESSAGE_ENV_GEN_READY:
    
    break;
}

