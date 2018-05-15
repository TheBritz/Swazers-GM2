/// @description Player keyboard/mouse Controls

//Set the movement axis member variables to their default state if keyboard
//controls are being used (false)
m_movingHor = false;
m_movingVert = false;

//Set keyboard control boolean to false
kbdControl = false;

var controlMapKbd = global.KeyboardControlsList[| m_playerIndex];
var moveDirVert = 0;
var moveDirHor = 0;
//Keyboard Controls
//Movement
var keyUp, keyDown, keyLeft, keyRight, keyReload, tempArr, keyInteract, keyDrop;
tempArr = controlMapKbd[?CONTROLS_MOVE_UP];
keyUp = tempArr[0];
tempArr = controlMapKbd[?CONTROLS_MOVE_DOWN];
keyDown = tempArr[0];
tempArr = controlMapKbd[?CONTROLS_MOVE_LEFT];
keyLeft = tempArr[0];
tempArr = controlMapKbd[?CONTROLS_MOVE_RIGHT];
keyRight = tempArr[0];
tempArr = controlMapKbd[?CONTROLS_RELOAD];
keyReload = tempArr[0];
tempArr = controlMapKbd[?CONTROLS_INTERACT];
keyInteract = tempArr[0];
tempArr = controlMapKbd[?CONTROLS_DROP];
keyDrop = tempArr[0];

if(keyboard_check(keyUp)
  && !keyboard_check(keyDown))
{
  //Move up logic
  moveDirVert = -1;
}
else if(keyboard_check(keyDown)
  && !keyboard_check(keyUp))
{
  //Move down logic
  moveDirVert = 1;
}
else
{
  //Slow down logic
  moveDirVert = 0;
}

if(keyboard_check(keyLeft)
  && !keyboard_check(keyRight))
{
  //Move left logic
  moveDirHor = -1;
}
else if(keyboard_check(keyRight)
  && !keyboard_check(keyLeft))
{
  //Move right logic
  moveDirHor = 1;
}
else
{
  //Slow down logic
  moveDirHor = 0;
}

//Revert to raw speed for this part
//var tempSpeed = speed;
//speed = m_speedRaw;

m_moving = false;
var acc = m_accelKbd;
if(moveDirHor != 0 && moveDirVert != 0)
{
  acc = m_accelKbd/2;
}

if(moveDirHor != 0)
{
  hspeed += moveDirHor * acc;
  m_moving = true;
  m_movingHor = true;
  kbdControl = true;
  image_speed = .35;
}
else
{
  /*
  hspeed -= sign(hspeed) * deccelKbd;
  if(abs(hspeed) <= deccelKbd)
  {
    hspeed = 0;
  }
  */
}

if(moveDirVert != 0)
{
  m_moving = true;
  m_movingVert = true;
  kbdControl = true;
  vspeed += moveDirVert * acc;
}

if(m_moving)
{
  if(abs(hspeed) > abs(vspeed))
  {
    sprite_index = PlayerRunEW_spr;
    if(sign(image_xscale) != sign(hspeed))
    {
      image_speed = abs(image_speed) * -1; 
    }
    else
    {
      image_speed = abs(image_speed);
    }
  }
  else
  {
    sprite_index = PlayerRunS_spr;
  }
}
else
{
  sprite_index = playerPlaceholder_spr;
}


//m_speedRaw = speed;
//speed = tempSpeed;

//Interact
if(keyboard_check_pressed(keyInteract))
{
  m_interactRunPressTimer = true;
  m_interactPressTimer = -1;
}
else if(keyboard_check_released(keyInteract))
{
  if(instance_exists(m_interactible))
  { 
    InteractibleInteract_scr(id, m_interactible);
  }
  
  m_interactRunPressTimer = false;
  
  if(m_interactPressTimer < m_interactSwitchTimer)
  {
    //Switch interactible focus
  }
}

//Fire weapon
var btnFireArr = controlMapKbd[?CONTROLS_FIRE];
var btnFire = btnFireArr[0];
m_weaponTriggerJustPulled = mouse_check_button_pressed(btnFire);
m_weaponTriggerPulled = mouse_check_button(btnFire);

//Switch weapon
if(mouse_wheel_up())
{
  CombatantSwitchWeapon_scr(id, -1);
}
else if(mouse_wheel_down())
{
  CombatantSwitchWeapon_scr(id, 1);
}

//Drop weapon
if(keyboard_check_released(keyDrop))
{
  //Drop weapon
}

//Reload
ControlsReadReload_scr(keyboard_check_pressed(keyReload));

//Aim
if(mouse_has_moved())
{
  if(false)//(ds_list_size(m_weaponsActive) > 0)
  {
    var wep = m_weaponsActive[|0];
    with(wep)
    {
      var muzzleCoords = relative_coordinates(x, y, 0,
        fireMuzzleOrigin[1]*sign(image_yscale), image_angle);
    }
    aimDir = point_direction
      (muzzleCoords[0], muzzleCoords[1], mouse_x, mouse_y);
  }
  else
  {
    aimDir = point_direction(x, y, mouse_x, mouse_y);
  }
}




/* */
///Player Gamepad Controls

//Movement
if(!kbdControl)
{
  //Set the movement axis member variables to their default state if keyboard
  //controls are NOT being used (undefined)
  m_movingHor = undefined;
  m_movingVert = undefined;
  
  var controlMap = global.GamepadControlsList[| m_playerIndex];
  var moveHor = controlMap[?CONTROLS_MOVE_HORIZONTAL];
  var moveVert = controlMap[?CONTROLS_MOVE_VERTICAL];
  var axisMoveH = gamepad_axis_value(m_playerIndex, moveHor[0]);
  var axisMoveV = gamepad_axis_value(m_playerIndex, moveVert[0]);
  m_gpdAxisH = axisMoveH;
  m_gpdAxisV = axisMoveV;
  
  var deadzone = m_deadzoneStatic;
  if(abs(axisMoveH) > deadzone || abs(axisMoveV) > deadzone)
  {
    deadzone = m_deadzoneKinetic; 
  }
  
  var axisSum = 0;
  if(abs(axisMoveH) > deadzone) axisSum += abs(axisMoveH)
  if(abs(axisMoveV) > deadzone) axisSum +=  abs(axisMoveV)
  var axisRatio;
  m_moving = false;
  var spdMax = EntityGetEffectiveSpeedMax_scr(id);
  var spdMaxRatio;
  m_movingHor = false;
  if(abs(axisMoveH) >= deadzone)
  {
    axisRatio = abs(axisMoveH) / axisSum;
    spdMaxRatio = spdMax * abs(axisMoveH);
    hspeed += m_accelGpd * sign(axisMoveH);
    m_movingHor = true;
    if(abs(hspeed) > spdMaxRatio)
    {
      hspeed = spdMaxRatio * sign(hspeed);
    }
  }
  
  m_movingVert = false;
  if(abs(axisMoveV) >= deadzone)
  {
    axisRatio = abs(axisMoveV) / axisSum; 
    spdMaxRatio = spdMax * abs(axisMoveV);
    vspeed += m_accelGpd * sign(axisMoveV);
    m_movingVert = true;
    if(abs(vspeed) > spdMaxRatio)
    {
      vspeed = spdMaxRatio * sign(vspeed);
    }
  }
  
  //Aiming
  var aimHor = controlMap[?CONTROLS_AIM_HORIZONTAL];
  var aimVert = controlMap[?CONTROLS_AIM_VERTICAL];
  
  var axisAimH = gamepad_axis_value(m_playerIndex, aimHor[0]);
  var axisAimV = gamepad_axis_value(m_playerIndex, aimVert[0]);
  if(abs(axisAimH) >= deadzone || abs(axisAimV) >= deadzone)
  {
    aimDir = ControlsDirectionFromGamepadAxes_scr(axisAimH, axisAimV);
  }
  
  //Firing
  var contFire = controlMap[? CONTROLS_FIRE];
  if(!m_weaponTriggerPulled)
  {
    m_weaponTriggerPulled = gamepad_button_check(m_playerIndex, contFire[0]);
  }
  
  //Reload
  var contReload = controlMap[? CONTROLS_RELOAD];
  ControlsReadReload_scr(gamepad_button_check(m_playerIndex, contReload[0]));
  
  //Interact
  var contInteract = controlMap[? CONTROLS_INTERACT];
  //Interact
  if(gamepad_button_check_pressed(m_playerIndex, contInteract[0]))
  {
    m_interactRunPressTimer = true;
    m_interactPressTimer = -1;
  }
  else if(gamepad_button_check_released(m_playerIndex, contInteract[0]))
  {
    if(instance_exists(m_interactible))
    { 
      InteractibleInteract_scr(id, m_interactible);
    }
    
    m_interactRunPressTimer = false;
    
    if(m_interactPressTimer < m_interactSwitchTimer)
    {
      //Switch interactible focus
    }
  }
}


/* */
///Ancestor Events
event_inherited();

/* */
/*  */
