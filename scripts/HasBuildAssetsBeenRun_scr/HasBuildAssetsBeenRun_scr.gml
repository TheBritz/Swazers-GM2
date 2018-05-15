/// @description HasBuildAssetListsBeenRun_scr()

//BuildAssetLists_scr has been run if any of the following LeftHand.GM components exist:
//LeftHand.GM.Console_obj
//LeftHand.GM.Editor_obj

var leftHandComps = array("Console_obj", "Editor_obj");
var comp, objInd;
for(var i = 0; i < array_length_1d(leftHandComps); i++)
{
  comp = leftHandComps[i];
  if(asset_get_type(comp) == asset_object)
  {
    objInd = asset_get_index(comp);
    if(!object_is(object_index, objInd) && instance_exists(objInd))
    {
      return true;
    }
  } 
}

return false;
