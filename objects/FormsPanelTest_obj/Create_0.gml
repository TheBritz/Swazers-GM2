/// @description FormsPanel Init
event_inherited();

m_widthMaximum = 400;
m_xPos = 800;
m_yPos = 10;
m_width = 100;
m_height = 250;
m_colorBackground = c_gray;
m_colorContainer = c_dkgray;
m_colorOutline = c_white;
FormsSetAllContainerMargins_scr(id, 5, 5, 5, 5);
FormsAddContentElementType_scr(id, TextDisplayTest_obj, 5, 5);

