/// @description instance_place_list(x, y, object_index, hit_limit [optional], checkSolid [optional], list [optional], allowDuplicates [optional])
/// @param x
/// @param  y
/// @param  object_index
/// @param  hit_limit [optional]
/// @param  checkSolid [optional]
/// @param  list [optional]
/// @param  allowDuplicates [optional]
//This script should be called in scope of the colliding instance

var hits,inst,list,x1,y1,obj,limit;
hits = 0;
x1 = argument[0];
y1 = argument[1];
obj = argument[2];

if(argument_count > 3)
{
  limit = argument[3];
}
else
{
  limit = 1;
}

var checkSolid = false;
if(argument_count > 4)
{
  checkSolid = argument[4];
}

if(argument_count > 5)
{
  list = argument[5];
}
else
{
  list = global.ReusableHitList;
  ds_list_clear(list);
}

var allowDuplicates = true;
if(argument_count > 6)
{
  allowDuplicates = argument[6];  
}

//Perform an instance_place to see if there's actually something we're hitting
var hit = instance_place(x1, y1, obj);
if(instance_exists(hit))
{
  if(++hits < limit)
  {
    if(hit.solid || !checkSolid)
    {
      ds_list_add(list, hit);
    }
    with(obj)
    {
      if(id != other.id && id != hit)
      {
        if(hit.solid || !checkSolid)
        {
          if(place_meeting(x1,y1,other.id))
          {
            if(allowDuplicates || ds_list_find_index(list, id) == -1)
            {
              ds_list_add(list,id);
            }
            if(++hits >= limit)
            {
              break;
            }
          }
        }
      }
    }
  }
}

return(list);
