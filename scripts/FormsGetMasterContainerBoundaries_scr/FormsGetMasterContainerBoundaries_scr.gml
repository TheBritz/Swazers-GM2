/// @description FormsGetMasterContainerBoundaries_scr(element)
/// @param element

var element = argument0; 

var masterContainer = FormsGetMasterContainerElement_scr(element);
var boundaries;
var contX = FormsGetContainerX_scr(masterContainer);
var contWidth = FormsGetContainerWidth_scr(masterContainer);
boundaries[0] = contX + contWidth;
var contY = FormsGetContainerY_scr(masterContainer);
var contHeight = FormsGetContainerHeight_scr(masterContainer);
boundaries[1] = contY + contHeight;

return boundaries;

