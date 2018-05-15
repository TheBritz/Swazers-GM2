/// @description Game session client
event_inherited();

//Test
testStepCounter = 0;

//Local to net and net to local maps
//Store local id values against net id keys
localByNetMap = ds_map_create();
//Store net id values against local id keys
netByLocalMap = ds_map_create();

//outboxMap stores all messages to be delivered
outboxMap = ds_map_create();

//inboxMap stores all messages to be received
inboxMap = ds_map_create();

//recipient list is iterated through each end step event
//to send all messages in the outboxMap
recipientList = ds_list_create();

//The unique id of the host - will be used to request instance network ids
hostUID = -1;
hostData = undefined;

//Peer map
peerMap = undefined;

//Host boolean
isHost = false;

//Environment generation
environmentInstanceNumber = undefined;
environmentMap = undefined;

//Heartbeat rate
heartbeatRate = 45;

netID = 0;

testButtonY = 100;

buffer = buffer_create(256, buffer_grow, 1);

inLobby = false;

hello_alarm_ind = 0;
hello_ping_rate = room_speed/4;
socket = -1;
clientPort = undefined;
uid = undefined;

