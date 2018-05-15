/// @description sort_list_by_distance(x, y, list, ascending [optional] = true, preferredObjectType [optional] = undefined)
/// @param x
/// @param  y
/// @param  list
/// @param  ascending [optional] = true
/// @param  preferredObjectType [optional] = undefined

//Sorts a list of object instances based on their distance from the given
//coordinates

var X = argument[0];
var Y = argument[1];
var list = argument[2];
var ascending = true;
if(argument_count > 3)
{
  ascending = argument[3];
}

var preferredType = undefined;
if(argument_count > 4)
{
  preferredType = argument[4];
}


if(ds_list_size(list) > 1)
{
  var sortList = ds_list_create();
  var distTracker = ds_map_create();
  var maxVal = -1;
  var minVal = 9999999;
  var dist, otherDist, inst, otherInst, added;
  //Add the first value
  ds_list_add(sortList, list[| 0]);
  for(var i = 0; i < ds_list_size(list); i++)
  {
    inst = list[| i];
    dist = point_distance(X, Y, inst.x, inst.y);
    distTracker[? inst] = dist;
    added = false; 
    //Find where to add this in the sorted list
    for(var ii = 0; ii < ds_list_size(sortList); ii++)
    {
      otherInst = sortList[| ii];
      otherDist = distTracker[? otherInst];
      if(ascending)
      {
        if(dist < otherDist)
        {
          ds_list_insert(sortList, ii, inst);
          added = true;
          break;
        }
        else if(dist == otherDist)
        {
          if(!is_undefined(preferredType) && 
            object_is(inst.object_index, preferredType))
          {
            ds_list_insert(sortList, ii, inst);
            added = true;
            break;
          }
        }
      }
      else
      {
        if(dist > otherDist)
        {
          ds_list_insert(sortList, ii, inst);
          added = true;
          break;
        }
        else if(dist == otherDist)
        {
          if(!is_undefined(preferredType) && 
            object_is(inst.object_index, preferredType))
          {
            ds_list_insert(sortList, ii, inst);
            added = true;
            break;
          }
        }
      }
    }
     
    if(!added)
    {
      ds_list_add(sortList, inst);  
    }         
  }
  ds_list_clear(list);
  for(var i = 0; i < ds_list_size(sortList); i++)
  {
    ds_list_add(list, sortList[| i]);
  }
  ds_list_destroy(sortList);
  ds_map_destroy(distTracker);
}

