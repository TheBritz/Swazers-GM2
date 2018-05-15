/// @description CollidingMover init

//This class represents an entity who's movement can be effected by collision
//with another type

event_inherited();

//When entities are moving very rapidly they may move through things they
//aren't supposed to when using standard collision. To alleviate this, 
//CollidingMover will break their movment down into steps, checking for 
//collision along the way. The m_movementStepSize member designates the 
//distance each individual sub-step should be.
m_movementStepSize = 1;

//Map that contains the object types that can effect this colliding mover via
//collision and the script that is run when collision occurs.
m_colliderTargetScriptMap = -1;
//Map that contains information for whether or not a collision target should be
//treated as solid or not. For targets to be treated as solid, when collision
//occurs, the mover is placed as if it ran into a solid object (ideally no 
//clipping)
m_colliderTreatAsSolidMap = -1;
//Buffer list to facilitate faster looping
m_colliderTargetList = -1;

m_clippingResolutionMap = -1;

m_sweepInterval = 10;
m_sweepAngleMax = 80;

m_speed = 0;
m_direction = 0;

m_speedX = 0;
m_speedY = 0;

m_debugBasicWallCollisionCalls = 0;



