/// @description HitSpine Init

//The spine is comprised of a series of nodes with interconnecting lines. Each
//node is a relative x/y coordinate. The nodes are positioned relative to the
//HitSpine's built-in x/y values 
m_nodeList = ds_list_create();

//Draw spine for debug purposes
m_drawSpine = debug_mode;
m_drawSpineColor = c_aqua;
m_drawSpineNodeSize = 5;

//Bool - whether or not the spine connects back onto itself (last point to 
//first point)
m_isCyclical = false;

