/// @description Identify which element the mouse is over
var mouseX = mouse_x - __view_get( e__VW.XView, 0 );
var mouseY = mouse_y - __view_get( e__VW.YView, 0 );
var elements = instance_place_list(mouseX, mouseY, FormsElementBase_obj, 100000);
var element, targetElement, masterContainers;
targetElement = noone;
ds_map_clear(m_masterContainerDeepestTargetElementMap);
var tempArr, masterContainer, embedDepth, embedDepthDeepest;

for(var i = 0; i < ds_list_size(elements); i++)
{
  element = elements[| i];
  tempArr = FormsGetMasterContainerElement_scr(element, true);
  masterContainer = tempArr[0];
  embedDepth = tempArr[1];
  
  if(ds_map_exists(m_masterContainerDeepestTargetElementMap, masterContainer))
  {
    tempArr = m_masterContainerDeepestTargetElementMap[? masterContainer];
    if(embedDepth > tempArr[1])
    {
      m_masterContainerDeepestTargetElementMap[? masterContainer] = array(element, embedDepth);
    }      
  }
  
  if(i == 0)
  {
    targetElement = masterContainer;
  }
  else if(masterContainer.depth < targetElement.depth)
  {
    targetElement = masterContainer;
  }    
}

if(mouse_check_button_pressed(mb_left))
{
  //Bring selected element to front
  if(instance_exists(targetElement))
  {
    targetElement.depth = FormsGetUpperLayerDepth_scr(true);
  }
}



///Get Upper-most layer depth

var element;

with(FormsElementBase_obj)
{
  if(depth < other.m_upperLayer)
  {
    other.m_upperLayer = depth;
  }
}

