/// @description FormsGetMasterContainerElement_scr(element)
/// @param element
//The master container element is the container element at the "end" of the 
//chain. The master container has no container element.

var element = argument0;
var contX = FormsGetContainerX_scr(element);
var contY = FormsGetContainerY_scr(element);
var contWidth = FormsGetContainerWidth_scr(element);
var contHeight = FormsGetContainerHeight_scr(element);
var boundaries = array(contX + contWidth, contY + contHeight);
var boundaryRight, boundaryBottom;

while(instance_exists(element.m_containerElement))
{
  element = element.m_containerElement;

  contX = FormsGetContainerX_scr(element);
  contWidth = FormsGetContainerWidth_scr(element);
  boundaryRight = contX + contWidth;

  contY = FormsGetContainerY_scr(element);
  contHeight = FormsGetContainerHeight_scr(element);
  boundaryBottom = contY + contHeight;
  
  if(boundaryRight < boundaries[0])
  {
    boundaries[0] = boundaryRight;
  }
  
  if(boundaryBottom < boundaries[1])
  {
    boundaries[1] = boundaryBottom;
  }
}

return boundaries;
