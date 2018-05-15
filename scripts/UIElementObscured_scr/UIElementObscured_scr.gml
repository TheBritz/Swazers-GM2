/// @description UIElementObscured_scr(container, element, [offsetCoords] {coord array})
/// @param container
/// @param  element
/// @param  [offsetCoords] {coord array}

/*
This function retrieves obscuring data from a container
for a specific ui element
return array: [obscureMode, obscureLeft, obscureTop, obscureWidth, obscureHeight]
*/

var i = 0;
var cont = argument[i++];
var element = argument[i++];
var offsetCoords;
if(argument_count > i)
{
  offsetCoords = argument[i]; 
}
else
{
  offsetCoords = array(0, 0);
}

var offsetX = offsetCoords[0];
var offsetY = offsetCoords[1];
var borderL = element.x - offsetX;
var borderU = element.y - offsetY;
var borderR = borderL + element.container_w;
var borderD = borderU + element.container_h;

var retArr, obscMode, obscPtX, obscPtY, obscDirH, obscDirV;
retArr = array(undefined, 0, 0, element.container_w, element.container_h);

with(cont)
{
  /*
  Verify this element belongs to this container and that the
  display container is smaller than the container
  */
  if(true)
  {
    //Element belongs to the container, proceed with evaluation
    
    /*
    First, check for vertical obscuring (complete vertical 
    obscuring is more likely to occur and therefore it's
    more effecient to check first since it may result in
    early function exit in the case of full obscuring)
    */
    if(borderL > x + UIContainerDisplayWidth_scr(id))
    {
      //Element is completely obscured, no other data needed
      retArr[OBSCURE_MODE] = OBSCURE_MODE_FULL;
      return retArr;
      exit;
    }
    else if(borderL < x)
    {
      //Left-most part of element is outside... check right-most part
      if(borderR <= x )
      {
        //Element is completely obscured, no other data needed
        retArr[OBSCURE_MODE] = OBSCURE_MODE_FULL;
        return retArr;
        exit;
      }
      else
      {
        //Element's left side is partially obscured horizontally
        retArr[OBSCURE_LEFT] = x - borderL;
        contCanScrollH = true;
      }
    }
    
    if(borderR > x + UIContainerDisplayWidth_scr(id))
    {
      //Element's right side is partially obscured horizontally
      retArr[OBSCURE_WIDTH] = x + UIContainerDisplayWidth_scr(id) - borderL - retArr[OBSCURE_LEFT];
      contCanScrollH = true;
    }
    
    //Check for horizontal obscuring
    if(borderU > y + UIContainerDisplayHeight_scr(id))
    {
      //Element is completely obscured, no other data needed
      retArr[OBSCURE_MODE] = OBSCURE_MODE_FULL;
      return retArr;
      exit;
    }
    else if(borderU < y)
    {
      //Left-most part of element is outside... check bottom-most part
      if(borderD <= y )
      {
        //Element is completely obscured, no other data needed
        retArr[OBSCURE_MODE] = OBSCURE_MODE_FULL;
        return retArr;
        exit;
      }
      else
      {
        //Element's top side is partially obscured vertically
        retArr[OBSCURE_TOP] = y - borderU;
        contCanScrollV = true;
      }
    }
    
    if(borderD > y + UIContainerDisplayHeight_scr(id))
    {
      //Element's right side is partially obscured horizontally 
      retArr[OBSCURE_HEIGHT] = y + UIContainerDisplayHeight_scr(id) - borderU - retArr[OBSCURE_TOP]
      contCanScrollV = true;
    }
    
    //Check to see if this element is not obscured
    if(retArr[OBSCURE_WIDTH] != element.container_w || retArr[OBSCURE_HEIGHT] != element.container_h
       || retArr[OBSCURE_LEFT] != 0 || retArr[OBSCURE_TOP] != 0)
    {
      retArr[OBSCURE_MODE] = OBSCURE_MODE_PART;
    }    
    else
    {
      retArr[OBSCURE_MODE] = OBSCURE_MODE_NONE;
    }    
  }
  else
  {
    //Element is not obscured
    retArr[OBSCURE_MODE] = OBSCURE_MODE_NONE;
  }  
  return retArr;
}

