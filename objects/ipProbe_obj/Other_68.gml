var evID = async_load[?"id"];

if(evID == socket)
{
  global.LocalIP = async_load[?"ip"];
  instance_destroy();
}

