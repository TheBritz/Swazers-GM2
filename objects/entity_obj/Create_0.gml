/// @description entity_obj Init

//This object is the base class for all entities

event_inherited();

//Shadow stuff
m_drawShadow = true;
m_shadowWidth = 0;
m_shadowWidthModifier = .8;
m_shadowHeight = 12;
m_shadowAlpha = .2;
m_shadowAdjust = undefined;
m_shadowCoords1 = undefined;
m_shadowCoords2 = undefined;

enum EntityAutoDepthType
{
  None,
  Position,
  Bottom,
  Top
}

m_autoDepthType = EntityAutoDepthType.Position;

m_groundPositionX = 0;
m_groundPositionY = 0;
m_z = 0;
m_zCoef = .5;
m_zSpeed = 0;
m_gravity = undefined;
m_bounceCoef = 0;
m_y = y;
m_zSpeed = 0;
m_zAccel = 0;


m_moving = false;
m_movingHor = false;
m_movingVert = false;
accel = undefined;
deccel = undefined;
speedMax = undefined;
speedMaxModAdd = undefined;
speedMaxModMult = undefined;
rotationSpeed = undefined;
timeSpeedOverride = undefined; //1 is 100% speed
timeSpeedHolderSpeed = undefined;
timeSpeedHolderAnimation = undefined;

//Members to support event serving - eventsMap stores event lists, eventsTypes
//is a list that stores the supported eventType(s)
enum EventMembers
{
  Script,
  Args,
  ID
}

eventsMap = undefined;
eventsSupported = undefined;

//Member to support animation events
m_animationEventsMap = undefined;
m_lastImageIndex = 0;
m_lastSpriteIndex = undefined;

//Members to support speed distortion
m_useRaw = false;
m_speedRaw = 0;
m_speedHorRaw = 0;
m_speedVertRaw = 0;
m_imageSpeedRaw = image_speed;

//Coords Previous
m_coordsPrevious = ds_list_create();
m_coordsPrevious[|0] = array(x, y);
//Maximum number of previous coordinates recorded
m_coordsPreviousMax = 2;

m_maskMidpointCoords = undefined;

//Boolean that marks this entity to be destroyed in the Post Draw event. Use
//this instead of instance_destroy if the entity should be drawn one more time
//or needs to finish out the frame.
m_destroyMe = false;

//When entities are moving very rapidly they may move through things they
//aren't supposed to when using standard collision. To alleviate this, many
//children of entity_obj will break their movment down into steps, checking for
//collision along the way. The m_movementStepSize member designates the 
//distance each individual sub-step should be.
m_movementStepSize = 20;

m_logName = object_get_name(object_index) + "Log.txt";

