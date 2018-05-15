/// @description Revert to raw speed
if(object_is(object_index, CollidingMover_obj)&& speed != 0)
{
  var test = "test";
}
speed = m_speedRaw;
image_speed = m_imageSpeedRaw;
m_useRaw = false;

///Set depth
if(m_autoDepthType == EntityAutoDepthType.Position)
{  
  depth = -y;
}
else if(m_autoDepthType == EntityAutoDepthType.Bottom)
{
  var bottomY = y - sprite_yoffset + sprite_height;
  depth = -bottomY;
}
else if(m_autoDepthType == EntityAutoDepthType.Top)
{
  var topY = y - sprite_yoffset;
  depth = -topY;
}

///Prepare shadow-drawing data
if(m_drawShadow)
{
  //Get the bottom Y point of the sprite
  var offsetY = sprite_get_yoffset(sprite_index);
  var bottomY = y + sprite_get_height(sprite_index) - offsetY;
  
  //Get the adjustment values for the shadow
  var adjustY = 0;
  var adjustX = 0;
  if(is_array(m_shadowAdjust))
  {
    adjustX = m_shadowAdjust[0];
    adjustY = m_shadowAdjust[1];
  }
  
  //Set the shadow position
  var shadowCenterY = bottomY + adjustY;
  var shadowCenterX = x + adjustX;
  
  //Set shadow width (shadow height is already set)
  m_shadowWidth = sprite_get_width(sprite_index) * m_shadowWidthModifier;
  var halfWidth = m_shadowWidth/2;
  var halfHeight = m_shadowHeight/2;
  
  //Set the shadow coords
  m_shadowCoords1 = 
    array(shadowCenterX - halfWidth, shadowCenterY - halfHeight);
  m_shadowCoords2 = 
    array(shadowCenterX + halfWidth, shadowCenterY + halfHeight);
}

///Adjust for height level
if(m_z <= 0 || m_zSpeed != 0)
{
  m_z += m_zSpeed;
  if(m_z >= 0)
  {
    //Just hit the ground - bounce
    var grav = EntityGetGravity_scr();
    m_zSpeed += grav;
    m_zSpeed = -1 * m_zSpeed * m_bounceCoef;
    m_z = 0;
  }
  var grav = EntityGetGravity_scr();
  m_zSpeed += grav;
}

///Monitor for animation events
//Check to see if the image index has changed (this doesn't need to run unless
//the image index has iterated
/*
var effectiveIndex = floor(image_index);
if(effectiveIndex != m_lastImageIndex)
{ 
  if(!is_undefined(m_animationEventsMap))
  {
    if(ds_map_size(m_animationEventsMap) > 0)
    {
      if(ds_map_exists(m_animationEventsMap, sprite_index))
      {
        var indexMap = m_animationEventsMap[? sprite_index];
        //Build up imageIndexList
        var imageIndexList = ds_list_create();
        var diff = effectiveIndex - m_lastImageIndex;
        if(abs(diff) > 1)
        {
          var addVal = sign(image_speed);
          var value = effectiveIndex
          do
          {
            ds_list_add(imageIndexList, value);
            value += addVal;
            if(value < 0)
            {
              //Go back to the sprite max
              value = sprite_get_number(sprite_index) - 1;
            }
            else if(value >= sprite_get_number(sprite_index))
            {
              //Go back down to zero
              value = 0;
            } 
          }until(effectiveIndex == m_lastImageIndex) 
        }
        else
        {
          //We only shifted by one, just add the effective image index
          ds_list_add(imageIndexList, effectiveIndex);
        }
        
        var thisIndex;
        for(var n = 0; n < ds_list_size(imageIndexList); n++)
        { 
          thisIndex = imageIndexList[| n];
          if(ds_map_exists(indexMap, thisIndex))
          {           
            //Execute every image index event we moved through
            var eventList;
            
            eventList = indexMap[? thisIndex];
            //Execute each event for the sprite/image index combination
            for(var i = 0; i < ds_list_size(eventList); i++)
            {
              var eventMap = eventList[|i];
              script_execute(eventMap[? EVENT_ARRAY_SCRIPT], 
                eventMap[? EVENT_ARRAY_ARGS]);
            }            
          }
        }
        //Destroy the list to conserve resources
        ds_list_destroy(imageIndexList);
      }
    }
  }
  
  m_lastImageIndex = floor(image_index);
}

/* */
///Monitor for animation events
//Check to see if the image index has changed (this doesn't need to run unless
//the image index has iterated
//Check to see if the image index has changed (this doesn't need to run unless
//the image index or the sprite index has iterated)
var effectiveIndex = floor(image_index);
var isNewSpriteIndex = sprite_index != m_lastSpriteIndex;
if(isNewSpriteIndex)
{
  //Reset the last sprite index snince the sprite has changed
  m_lastImageIndex = effectiveIndex;
}

if(effectiveIndex != m_lastImageIndex || isNewSpriteIndex)
{ 
  if(!is_undefined(m_animationEventsMap))
  {
    if(ds_map_size(m_animationEventsMap) > 0)
    {
      if(ds_map_exists(m_animationEventsMap, sprite_index))
      {
        var indexMap = m_animationEventsMap[? sprite_index];
        //Build up imageIndexList
        var imageIndexList = ds_list_create();
        var diff = effectiveIndex - m_lastImageIndex;
        if(abs(diff) > 1)
        {
          var addVal = sign(image_speed);
          var value = m_lastImageIndex
          do
          {
            ds_list_add(imageIndexList, value);
            value += addVal;
            if(value < 0)
            {
              //Go back to the sprite max
              value = sprite_get_number(sprite_index) - 1;
            }
            else if(value >= sprite_get_number(sprite_index))
            {
              //Go back down to zero
              value = 0;
            } 
          }until(value == effectiveIndex) 
        }
        else
        {
          //We only shifted by one, just add the effective image index
          ds_list_add(imageIndexList, effectiveIndex);
        }
        
        var thisIndex;
        for(var n = 0; n < ds_list_size(imageIndexList); n++)
        { 
          thisIndex = imageIndexList[| n];
          if(ds_map_exists(indexMap, thisIndex))
          {           
            //Execute every image index event we moved through
            var eventList;
            
            eventList = indexMap[? thisIndex];
            //Execute each event for the sprite/image index combination
            for(var i = 0; i < ds_list_size(eventList); i++)
            {
              var eventMap = eventList[|i];
              script_execute(eventMap[? EventMembers.Script], 
                eventMap[? EventMembers.Args]);
            }            
          }
        }
        //Destroy the list to conserve resources
        ds_list_destroy(imageIndexList);
      }
    }
  }
  
  m_lastImageIndex = floor(image_index);
  m_lastSpriteIndex = sprite_index;
}

/* */
/*  */
