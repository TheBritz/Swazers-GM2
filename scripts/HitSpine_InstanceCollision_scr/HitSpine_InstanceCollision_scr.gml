/// @description HitSpine_InstanceCollision_scr(collidingInstance, hitSpineInstance, x, y, specificSegment [optional])
/// @param collidingInstance
/// @param  hitSpineInstance
/// @param  x
/// @param  y
/// @param  specificSegment [optional]

var collInst = argument0;
var hitSpine = argument1;
var xx = argument2;
var yy = argument3;

var tempX = collInst.x;
var tempY = collInst.y;

with(hitSpine)
{
  //Loop through each node
  var node, nextNode, hit;
  var size = ds_list_size(m_nodeList);
  for(var i = 0; i < size; i++)
  {
    node = m_nodeList[| i];
    //First check node collision
    hit = collision_point(x + node[0], y + node[1], collInst, false, false);
    if(instance_exists(hit))
    {
      //Handle corner collision
    }
    else if(i < size - 1)
    {
      //Check for line collision with the next node
      nextNode = m_nodeList[| i + 1];
      hit = collision_line(x + node[0], y + node[1], 
        x + nextNode[0], y + nextNode[1], collInst, false, false); 
      if(instance_exists(hit))
      {
        //Handle line collision
      }
    }
  }
}

collInst.x = tempX;
collInst.y = tempY;
