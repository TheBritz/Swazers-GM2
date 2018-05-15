/// @description Base Forms Element Init
depth = FormsGetUpperLayerDepth_scr(true);

display_set_gui_size(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));

//Crashing Game Maker for some reason
//m_collisionSprite = sprite_duplicate(FormsCollision_spr);
mask_index = FormsCollision_spr;

enum DimensionTypes
{
  Absolute,
  Relative
}

//Position members
m_xPosType = DimensionTypes.Absolute;
m_yPosType = DimensionTypes.Absolute;
m_xPos = undefined;
m_yPos = undefined;

//The height and width of the element. This should encompass the entire drawn
//height and width, don't draw anything beyond these as it may cause an element
//to be drawn beyond its parent's content drawing container.
m_widthType = DimensionTypes.Absolute;
m_heightType = DimensionTypes.Absolute;
m_width = undefined;
m_widthMinimum = 32;
m_widthMaximum = 4096;
m_height = undefined;
m_heightMinimum = 32;
m_heightMaximum = 2048;

//Container (Content Drawing Container): the region where content is drawn.
//By default it is the entire width and height but can be changed by modifying 
//the container margins
m_containerElement = noone; //The element instance that holds this element
m_containerWidth = undefined;
m_containerHeight = undefined;
m_containerMinimumWidth = 0;
m_containerMaximumWidth = undefined;
m_containerResizeThresh = 3;

enum Margins
{
  Left,
  Right,
  Top,
  Bottom 
}
m_containerMargins[Margins.Left] = undefined;
m_containerMargins[Margins.Right] = undefined;
m_containerMargins[Margins.Top] = undefined;
m_containerMargins[Margins.Bottom] = undefined;

//Content: Content is defined as any other Forms element that is drawn within 
//the content container of this element.  
m_contentElementsList = undefined;
m_contentWidth = undefined;
m_contentHeight = undefined;
m_contentIsRepositionNeeded = true;
m_contentIsOverflowCheckNeeded = true;
m_contentIsOverflowHor = false;
m_contentIsOverflowVert = false;
m_contentViewX = 0; //Tied in with horizontal scrolling
m_contentViewY = 0; //Tied in with vertical scrolling
m_contentOverflowSurface = -1;

m_drawScriptList = ds_list_create();
FormsRegisterDrawScript_scr(id, FormsElementDefaultDrawScript_scr);
FormsRegisterDrawScript_scr(id, FormsElementDrawScrollbars_scr);

m_colorBackground = undefined;
m_colorContainer = undefined;
m_colorOutline = undefined;
m_colorHover = undefined;
m_colorSelect = undefined;
m_colorText = c_white;
m_colorTextTitle = c_white;
m_colorTitleBar = c_white;
m_colorScrollbarVert = c_gray;
m_colorScrollbarSelectedVert = undefined;
m_colorScrollbarBackgroundVert = c_silver;
m_colorScrollbarArrowsDisabledVert = c_gray;
m_colorScrollbarArrowsEnabledVert = c_gray;
m_colorScrollbarArrowsSelectedVert = undefined;
m_colorScrollbarArrowsBackgroundVert = c_silver;
m_colorScrollbarArrowsBackgroundSelectedVert = undefined;
m_colorScrollbarHor = undefined;
m_colorScrollbarSelectedHor = undefined;
m_colorScrollbarBackgroundHor = undefined;
m_colorScrollbarArrowsHor = undefined;
m_colorScrollbarArrowsSelectedHor = undefined;


m_alphaBackground = 1;
m_alphaContainer = 1;
m_alphaOutline = 1;
m_alphaText = 1;
m_alphaTextTitle = 1;
m_alphaScrollbarHor = undefined;
m_alphaScrollbarSelectedHor = undefined;
m_alphaScrollbarBackgroundHor = undefined;
m_alphaScrollbarArrowsHor = undefined;
m_alphaScrollbarArrowsSelectedHor = undefined;
m_alphaScrollbarHor = undefined;
m_alphaScrollbarSelectedHor = undefined;
m_alphaScrollbarBackgroundHor = undefined;
m_alphaScrollbarArrowsHor = undefined;
m_alphaScrollbarArrowsSelectedHor = undefined;

m_text = undefined;
m_textTitle = undefined;
m_textFont = console_fnt;
m_textTitleFont = console_fnt;

m_scrollbarVertEnabled = true;
m_scrollbarVertWidth = 15;

m_scrollbarHorEnabled = true;
m_scrollbarHorHeight = 15;

m_resizable = true;
m_resizingWidth = WidthResizeTypes.None;
m_resizingHeight = HeightResizeTypes.None;

enum GUIEvents
{
  Click,
  Mouseover,
  MouseEnter,
  MouseLeave
}

m_guiEventsMap = undefined;

m_drawStandard = true;

m_isRepositionNeeded = true;

enum WidthResizeTypes
{
  None,
  Left,
  Right
}

enum HeightResizeTypes
{
  None,
  Top,
  Bottom
}

