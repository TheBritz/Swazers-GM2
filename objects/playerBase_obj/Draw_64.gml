/// @description Draw hud - empty health slots
var X, Y;
X = m_drawHealthStartX;
Y = m_drawHealthStartY;
var healthHeight = round(window_get_height() * .03);
var healthWidth = round(window_get_height() * .03);
for(var i = 0; i < m_hpMax; i++)
{
  draw_rectangle_colour(X, Y, X + healthWidth, Y + healthHeight, 
    c_gray, c_gray, c_gray, c_gray, false);
  X += (m_drawHealthMargin + healthWidth);
}

X = m_drawHealthStartX;
for(var i = 0; i < m_hp; i++)
{
  draw_rectangle_colour(X, Y, X + healthWidth, Y + healthHeight, 
    c_red, c_red, c_red, c_red, false);
  X += (m_drawHealthMargin + healthWidth);
}

//Draw ammo
var wep = m_weaponsActive[|0];
if(!is_undefined(wep))
{
  var clip = m_weaponsActive[|0].ammoClip;
  if(!is_undefined(clip))
  {
    X = m_drawAmmoStartX;
    Y = m_drawAmmoStartY;
    for(var i = 0; i < ds_list_size(clip); i++)
    {
      var proj = clip[|i];
      var dispSpr = AmmoGetDisplaySpriteForProjectileObject_scr(proj);
      draw_sprite(dispSpr, 0, X, Y);
      Y += (sprite_get_height(dispSpr) + m_drawAmmoMargin)*m_drawAmmoDirection;
    }
  }
}

