/// @description Inherited Events
event_inherited();

///Arrange List items

//Check if this list has moved or changed dimensions
if((x != xprevious || y != yprevious) || (dimensionsChanged == true || listContentsChanged))
{
  //List has moved or changed - arrange items
  
  
  //Reset contents tracking boolean
  listContentsChanged = false;
}


