/// @description Editor Init
m_active = false;
if(instance_number(object_index) > 1)
{
  instance_destroy();
}
else
{
  BuildAssetLists_scr();
  m_objectList = global.AssetLists[? asset_object];
  m_selectedList = ds_list_create();
  m_instanceCornersMap = ds_map_create();
  global.RoomEditor = id;
  m_selectColor = c_green;
  mask_index = ClickMask_spr;
}

