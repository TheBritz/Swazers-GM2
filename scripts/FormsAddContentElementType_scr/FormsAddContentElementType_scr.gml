/// @description FormsAddContentElementType_scr(containerElement, contentElementType, xPosition, yPosition)
/// @param containerElement
/// @param  contentElementType
/// @param  xPosition
/// @param  yPosition

var containerElement = argument0;
var contentElementType = argument1;

if(object_is(contentElementType, FormsElementBase_obj))
{
  var contentElement = instance_create(0, 0, contentElementType);
  var xPos = argument2;
  var yPos = argument3;
  FormsSetElementPosition_scr(contentElement, xPos, yPos);
  FormsAddContentElementInstance_scr(containerElement, contentElement);
  return contentElement;
}


