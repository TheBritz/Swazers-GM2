/// @description FormsGetContainerCenterVert_scr(element)
/// @param element

var element = argument0;
if(IsLegalFormsElement_scr(element))
{
  with(element)
  {
    var containerCenter = FormsGetContainerY_scr(element) + FormsGetContainerHeight_scr(element)/2;
    return containerCenter;
  }
} 
