/// @description FormsGetUpperLayerDepth_scr()

if(!instance_exists(FormsInputController_obj))
{
  instance_create(0, 0, FormsInputController_obj);
}

with(FormsInputController_obj)
{
  return m_upperLayer;
}
