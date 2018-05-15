/// @description FormsGetContainerCenterHor_scr(element)
/// @param element

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  with(element)
  {
    var containerCenter = FormsGetContainerX_scr(element) + FormsGetContainerWidth_scr(element)/2;
    return containerCenter;  
  }
} 
