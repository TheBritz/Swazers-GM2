BuildAssetLists_scr();

SingletonCreate_scr(0, 0, HitboxHitter_obj);
SingletonCreate_scr(0, 0, HitboxHittee_obj);

global.LogMap = ds_map_create();
global.LogEnabled = true;
global.CollidingMoverCallCounter = 0;

global.LobbyIP = network_resolve(LOBBY_IP);
//global.LobbyIP = "127.0.0.1";
global.LobbyPortRange = array(30001, 30003)
global.LobbyClientPortRanges = ds_list_create();
ds_list_add(global.LobbyClientPortRanges, array(30400, 30500));
global.LobbyPollRate = room_speed;
global.SerializableMapData = ds_map_create();
global.cursor = noone;
global.ammoDisplayMap = ds_map_create();
global.ReusableHitList = ds_list_create();
global.ReusableMetadataMap = ds_map_create();
global.ReusableReturnMap = ds_map_create();

global.eventsMapClass = ds_map_create();

//The inbox map for updates to network shadow objects
global.ClientSessionInbox = ds_map_create();

//Time distortion
global.timeSpeed = 1; //1 = 100%

//Outbox map
global.outboxMap = ds_map_create();

global.clientSession = noone;
global.ClientLobby = noone;

//The class modifiers map stores modifiers that are associated with object
//types rather than instances. An item that buffs all players, for example,
//would add a modifier entry in this map for 'playerBase_obj'
global.ClassModifierMap = ds_map_create();

global.ProjectileAttributeCache = ds_map_create();
global.HandholdColors = array(c_red, c_blue);

global.Gravity = .2;
global.CasingPartSystem = part_system_create();
global.CasingPartTypeMap = ds_map_create();

global.FrameSpeedMod = 1;
instance_create(0, 0, frameSpeedModCalculator_obj);
