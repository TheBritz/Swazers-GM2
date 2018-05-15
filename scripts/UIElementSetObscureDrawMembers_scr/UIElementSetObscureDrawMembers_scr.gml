/// @description UIElementSetObscureDrawMembers_scr()

if(obscureDirH == OBSCURE_DIR_LEFT)
{
  obscureDrawLeft = obscurePartX;
  obscureDrawWidth = container_w - obscurePartX;
  obscureDrawX = obscurePartX;
}
else if(obscureDirH == OBSCURE_DIR_RIGHT)
{
  obscureDrawLeft = 0;
  obscureDrawWidth = obscurePartX;
  obscureDrawX = 0;
}
else
{
  //Not obscuring horizontally
  obscureDrawLeft = 0;
  obscureDrawWidth = container_w;
  obscureDrawX = 0;
}

if(obscureDirV == OBSCURE_DIR_UP)
{
  obscureDrawTop = obscurePartY;
  obscureDrawHeight = container_h - obscurePartY;
  obscureDrawY = obscurePartY;
}
else if(obscureDirV == OBSCURE_DIR_DOWN)
{
  obscureDrawTop = 0;
  obscureDrawHeight = obscurePartY;
  obscureDrawY = 0;
}
else
{
  //Not obscuring vertically
  obscureDrawTop = 0;
  obscureDrawHeight = container_h;
  obscureDrawY = 0;
}
