/// @description Control Resizing

if(mouse_check_button_released(mb_left))
{
  m_resizingWidth = WidthResizeTypes.None;
  m_resizingHeight = HeightResizeTypes.None;
}

if(m_resizingWidth == WidthResizeTypes.None &&
   m_resizingHeight == HeightResizeTypes.None)
{
  if(!instance_exists(m_containerElement))
  {
    var resizeTypes = FormsGetResizeTypes_scr
      (id, mouse_x - __view_get( e__VW.XView, 0 ), mouse_y - __view_get( e__VW.YView, 0 ));
    window_set_cursor(FormsGetResizeCursor_scr(id, resizeTypes[0], resizeTypes[1]));
    
    if(mouse_check_button_pressed(mb_left))
    {
      m_resizingWidth = resizeTypes[0];
      m_resizingHeight = resizeTypes[1];
    }
  }
}
else
{
  window_set_cursor(FormsGetResizeCursor_scr(id, m_resizingWidth, m_resizingHeight));
  
  //Left/Right
  var mouseX = mouse_x - __view_get( e__VW.XView, 0 );
  if(m_resizingWidth == WidthResizeTypes.Left)
  {
    var widthNew = x + m_width - mouseX;
    var shift = mouseX - x;
    if(widthNew >= m_widthMinimum)
    {
      if(widthNew <= m_widthMaximum)
      {
        FormsSetElementPositionByRawCoords_scr(id, mouseX, undefined);
        m_width = widthNew;
      }
      else
      {
        var rightBoundary = x + m_width;
        m_width = m_widthMaximum;
        var newX = rightBoundary - m_width;
        FormsSetElementPositionByRawCoords_scr(id, newX, undefined);
      }
    }
    else
    {
      var rightBoundaryOld = x + m_width;
      m_width = m_widthMinimum;
      var newX = rightBoundaryOld - m_width;
      FormsSetElementPositionByRawCoords_scr(id, newX, undefined);
    }
  }
  else if(m_resizingWidth == WidthResizeTypes.Right)
  {
    var widthNew = mouseX - x;
    if(widthNew >= m_widthMinimum)
    {
      m_width = widthNew;
      if(widthNew >= m_widthMaximum)
      {
        m_width = m_widthMaximum;
      }
    }
    else
    {
      m_width = m_widthMinimum;
    }
  }
  
  //Top/Bottom
  var mouseY = mouse_y - __view_get( e__VW.YView, 0 );
  if(m_resizingHeight == HeightResizeTypes.Top)
  {
    var heightNew = y + m_height - mouseY;
    if(heightNew >= m_widthMinimum)
    {
      if(heightNew <= m_heightMaximum)
      {
        FormsSetElementPositionByRawCoords_scr(id, undefined, mouseY);
        m_height = heightNew;
      }
      else
      {
        var topBoundary = y + m_height;
        m_height = m_heightMaximum;
        var newY = topBoundary - m_height;
        FormsSetElementPositionByRawCoords_scr(id, undefined, newY);
      }
    }
    else
    {
      var topBoundaryOld = y + m_height;
      m_height = m_heightMinimum;
      var newY = topBoundaryOld - m_height;
      FormsSetElementPositionByRawCoords_scr(id, undefined, newY);
    }
  }
  else if(m_resizingHeight == HeightResizeTypes.Bottom)
  {
    var heightNew = mouseY - y;
    if(heightNew >= m_heightMinimum)
    {
      m_height = heightNew;
      if(heightNew >= m_heightMaximum)
      {
        m_height = m_heightMaximum;
      }
    }
    else
    {
      m_height = m_heightMinimum;
    }
  }
}

///Position Content Elements and check for overflow

//Placeholder values always set to reposition and check for overflow
m_contentIsRepositionNeeded = true;
m_isContentOverflowCheckNeeded = true;

if(!is_undefined(m_contentElementsList))
{
  var element;
  var contentIsOverflowHor = false;
  var contentIsOverflowVert = false;

  for(var i = 0; i < ds_list_size(m_contentElementsList); i++)
  {
    element = m_contentElementsList[| i];
    element.depth = depth - 1;
    
    if(m_contentIsRepositionNeeded)
    {
      //X Position
      if(element.m_xPosType == DimensionTypes.Absolute)
      {
        element.x = FormsGetContainerX_scr(id) + element.m_xPos;
      }
      else if(element.m_xPosType == DimensionTypes.Relative)
      {
        element.x = FormsGetContainerX_scr(id) + 
          element.m_xPos * FormsGetContainerWidth_scr(id);
      } 
      
      //Y Position
      if(element.m_yPosType == DimensionTypes.Absolute)
      {
        element.y = FormsGetContainerY_scr(id) + element.m_yPos;
      }
      else if(element.m_yPosType == DimensionTypes.Relative)
      {
        element.y = FormsGetContainerY_scr(id) + element.m_yPos * m_height;
      }
    }
    
    if(m_contentIsOverflowCheckNeeded)
    {
      //Check if any content is outside of the drawing area
      var containerBoundaryHor = FormsGetContainerX_scr(id) + FormsGetContainerWidth_scr(id);
      var contentBoundaryHor = element.x + element.m_width;
      if(contentBoundaryHor > containerBoundaryHor)
      {
        contentIsOverflowHor = true;
        m_contentIsOverflowHor = true;
        if(contentBoundaryHor > m_contentWidth)
        {
          m_contentWidth = contentBoundaryHor;
        }
      }
      
      var containerBoundaryVert = FormsGetContainerY_scr(id) + FormsGetContainerHeight_scr(id);
      var contentBoundaryVert = element.y + element.m_height;
      if(contentBoundaryVert > containerBoundaryVert)
      {
        contentIsOverflowVert = true;
        m_contentIsOverflowVert = true;
        if(contentBoundaryVert > m_contentHeight)
        {
          m_contentHeight = contentBoundaryHeight;
        }
      } 
    } 
  }
  
  m_contentIsOverflowHor = contentIsOverflowHor;
  m_contentIsOverflowVert = contentIsOverflowVert;
}



///Handle Overflow
if(m_contentIsOverflowHor || m_contentIsOverflowVert)
{
  var contWidth = FormsGetContainerWidth_scr(id);
  if(!is_undefined(m_contentWidth)) contWidth = m_contentWidth;
  var contHeight = FormsGetContainerHeight_scr(id);
  if(!is_undefined(m_contentHeight)) contHeight = m_contentHeight;
  
  if(!surface_exists(m_contentOverflowSurface))
  {
    var surfWidth = next_power_of(contWidth, 2);
    var surfHeight = next_power_of(contHeight, 2);
    
    m_contentOverflowSurface = surface_create(surfWidth, surfHeight);
  }
  else if(surface_get_width(m_contentOverflowSurface) < contWidth ||
          surface_get_height(m_contentOverflowSurface) < contHeight)
  {
    var surfWidth = next_power_of(contWidth, 2);
    var surfHeight = next_power_of(contHeight, 2);
    surface_resize(m_contentOverflowSurface, surfWidth, surfHeight);
  }
  
  surface_set_target(m_contentOverflowSurface);
  draw_clear_alpha(c_black, 0);

  for(var i = 0; i < ds_list_size(m_contentElementsList); i++)
  {
    with(m_contentElementsList[| i])
    {
      FormsRunDrawScripts_scr(m_xPos, m_yPos);
    }
  }
  surface_reset_target();
}

///Configure Mask

FormsConfigureMask_scr(id);



///Position Self

if(!instance_exists(m_containerElement))
{
  if(m_xPosType == DimensionTypes.Absolute)
  {
    x = m_xPos;
  }
  else if(m_xPosType == DimensionType.Relative)
  {
    x = m_xPos * __view_get( e__VW.WView, 0 );
  }
}

