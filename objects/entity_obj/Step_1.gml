/// @description Update non GM built-in elements

//Rotation
if(!is_undefined(rotationSpeed))
{
  image_angle += rotationSpeed * global.timeSpeed;
}

//Increment internal y member
m_y += vspeed;

///Enforce max speed

var spd = EntityGetEffectiveSpeedMax_scr(id);
if(!is_undefined(spd))
{
  if(speed > spd)
  {
    if(object_is(object_index, playerBase_obj))
    {
      var test = "test";
    }  

    speed = spd;
  }
}


///Enforce deccel - single speed
/*

if(!m_moving && m_z == 0)
{
  if(!is_undefined(deccel))
  {
    if(object_is(object_index, CollidingMover_obj))
    {
      var test = "test";
    }
    if(speed >= deccel)
    {
      speed -= deccel;
    }
    else
    {
      speed = 0;
    }
  }
}

/* */
///Enforce deccel - horizontal and vertical

if(m_z == 0)
{
  if(!is_undefined(deccel))
  {
    if(object_is(object_index, CollidingMover_obj))
    {
      var test = "test";
    }
    
    if(!m_movingHor)
    {
      hspeed -= sign(hspeed)*deccel*.5;
      if(abs(hspeed) < deccel*.5)
      {
        hspeed = 0;
      }
    }
    
    if(!m_movingVert)
    {
      vspeed -= sign(vspeed)*deccel*.5;
      if(abs(vspeed) < deccel*.5)
      {
        vspeed = 0;
      }
    }
  }
}

/* */
///Apply speed distortion
var tSpdVal;
if(!is_undefined(timeSpeedOverride))
{
  tSpdVal = timeSpeedOverride;
}
else
{
  tSpdVal = global.timeSpeed;
}

//Modify speed based on time and framerate for update
m_useRaw = true;
m_speedRaw = speed;
m_speedHorRaw = hspeed;
m_speedVertRaw = vspeed;
m_imageSpeedRaw = image_speed;
if(object_is(object_index, entityEnemyTest_obj))
{
  var test = "test";
}
speed = speed * tSpdVal * global.FrameSpeedMod;
image_speed = image_speed * tSpdVal * global.FrameSpeedMod;


/* */
///Capture Previous Coords

var coords = array(x, y);
ds_list_insert(m_coordsPrevious, 0, coords);
var listSize = ds_list_size(m_coordsPrevious);
if(listSize > m_coordsPreviousMax)
{
  ds_list_delete(m_coordsPrevious, listSize - 1);
}

/* */
/*  */
