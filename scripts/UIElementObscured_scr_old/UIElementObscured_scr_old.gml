/// @description UIElementObscured_scr(container, element)
/// @param container
/// @param  element

/*
This function retrieves obscuring data from a container
for a specific ui element
return array: [obscureMode, obscurePartX, obscurePartY, obscureDirH, obscureDirV]
*/

var cont = argument0;
var element = argument1;

var retArr, obscMode, obscPtX, obscPtY, obscDirH, obscDirV;
retArr = array(undefined, undefined, undefined, undefined, undefined);

with(cont)
{
  /*
  Verify this element belongs to this container and that the
  display container is smaller than the container
  */
  if(ds_list_find_index(elementsList, element) != -1)
  {
    //Element belongs to the container, proceed with evaluation
    
    /*
    First, check for vertical obscuring (complete vertical 
    obscuring is more likely to occur and therefore it's
    more effecient to check first since it may result in
    early function exit in the case of full obscuring)
    */
    if(element.x > x + UIContainerDisplayWidth_scr(id))
    {
      //Element is completely obscured, no other data needed
      retArr[OBSCURE_MODE] = OBSCURE_MODE_FULL;
      return retArr;
      exit;
    }
    else if(element.x < x)
    {
      //Left-most part of element is outside... check right-most part
      if(element.x + element.container_w <= x )
      {
        //Element is completely obscured, no other data needed
        retArr[OBSCURE_MODE] = OBSCURE_MODE_FULL;
        return retArr;
        exit;
      }
      else
      {
        //Element's left side is partially obscured horizontally
        retArr[OBSCURE_DIR_H] = OBSCURE_DIR_LEFT;
        retArr[OBSCURE_PART_X] = x - element.x;
        contCanScrollH = true;
      }
    }
    else if(element.x + element.container_w > x + UIContainerDisplayWidth_scr(id))
    {
      //Element's right side is partially obscured horizontally
      retArr[OBSCURE_DIR_H] = OBSCURE_DIR_RIGHT;
      retArr[OBSCURE_PART_X] = x + UIContainerDisplayWidth_scr(id) - element.x;
      contCanScrollH = true;
    }
    
    //Check for horizontal obscuring
    if(element.y > y + UIContainerDisplayHeight_scr(id))
    {
      //Element is completely obscured, no other data needed
      retArr[OBSCURE_MODE] = OBSCURE_MODE_FULL;
      return retArr;
      exit;
    }
    else if(element.y < y)
    {
      //Left-most part of element is outside... check right-most part
      if(element.y + element.container_h <= y )
      {
        //Element is completely obscured, no other data needed
        retArr[OBSCURE_MODE] = OBSCURE_MODE_FULL;
        return retArr;
        exit;
      }
      else
      {
        //Element's left side is partially obscured vertically
        retArr[OBSCURE_DIR_H] = OBSCURE_DIR_UP;
        retArr[OBSCURE_PART_Y] = y - element.y;
        contCanScrollV = true;
      }
    }
    else if(element.y + element.container_h > y + UIContainerDisplayHeight_scr(id))
    {
      //Element's right side is partially obscured horizontally
      retArr[OBSCURE_DIR_H] = OBSCURE_DIR_DOWN;
      retArr[OBSCURE_PART_Y] = y + UIContainerDisplayHeight_scr(id) - element.y;
      contCanScrollV = true;
    }
    
    //Check to see if this element is not obscured
    if(!is_undefined(retArr[OBSCURE_DIR_H]) || !is_undefined(retArr[OBSCURE_DIR_V]))
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

