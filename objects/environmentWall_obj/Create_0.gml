/// @description Wall init
mask_index = sprite_index;

farPointX = undefined;
farPointY = undefined;

//Create the corner points
m_corners = ds_list_create();

//Side angles
m_sideAngles = ds_list_create();
ds_list_add(m_sideAngles, 90, 0, 270, 180);

//Define extremity properties
m_extremityLeft = undefined;
m_extremityRight = undefined;
m_extremityUp = undefined;
m_extremityDown = undefined;

m_corners = EnvironmentWall_BuildCornerList_scr(0, true);
m_cornersInternal = EnvironmentWall_BuildCornerList_scr(-6);
m_cornersExternal = EnvironmentWall_BuildCornerList_scr(3);

