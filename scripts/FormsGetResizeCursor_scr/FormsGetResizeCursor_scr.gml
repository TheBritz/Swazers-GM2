/// @description FormsGetResizeCursor_scr(element, widthResizeType, heightResizeType)
/// @param element
/// @param  widthResizeType
/// @param  heightResizeType

var element = argument0;
var widthResizeType = argument1;
var heightResizeType = argument2;

with(element)
{  
  if(heightResizeType == HeightResizeTypes.None)
  {
    if(widthResizeType == WidthResizeTypes.None)
    {
      return cr_default;
    }
    else
    {
      return cr_size_we;
    }
  }
  else if(heightResizeType == HeightResizeTypes.Top)
  {
    if(widthResizeType == WidthResizeTypes.None)
    {
      return cr_size_ns;
    }
    else if(widthResizeType == WidthResizeTypes.Right)
    {
      return cr_size_nesw;
    }
    else if(widthResizeType == WidthResizeTypes.Left)
    {
      return cr_size_nwse;
    }
  }
  else if(heightResizeType == HeightResizeTypes.Bottom)
  {
    if(widthResizeType == WidthResizeTypes.None)
    {
      return cr_size_ns;
    }
    else if(widthResizeType == WidthResizeTypes.Right)
    {
      return cr_size_nwse;
    }
    else if(widthResizeType == WidthResizeTypes.Left)
    {
      return cr_size_nesw;
    }
  }
}

return cr_default;
