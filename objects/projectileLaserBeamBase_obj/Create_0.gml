/// @description Laser Beam Base Init
event_inherited();
init = false;
m_suppressBasicCollision = true;
m_suppressBasicWallCollision = true;
m_beamFadeType = BEAM_FADE_TYPE_SCALE;
m_beamFadeRate = .1;
m_hits = 1;
m_projAttributes[? PROJ_ATTR_DMG] =  2;
m_projAttributes[? PROJ_ATTR_NUMBER] = 1;
m_projAttributes[? PROJ_ATTR_ROF] = 10;
m_glowSprite = projectileLaserBeamGlow_spr;
m_glowColor = c_blue;
m_impactGlowSpite = laserBeamImpactGlow_spr;
m_impactPosX = undefined;
m_impactPosY = undefined;
m_targetTypeList = undefined;
m_obstructorTypeList = undefined;
image_xscale = 0;


