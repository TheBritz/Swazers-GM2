var clipIndex = ds_list_size(ammoClip) - 1;
if(clipIndex >= 0)
{
  var projType = ammoClip[|clipIndex];
  ds_list_delete(ammoClip, clipIndex);
  var muzzleCoords = relative_coordinates(x, y, muzzleOrigin[0], muzzleOrigin[1]*sign(image_yscale), image_angle);
  var proj = instance_create(muzzleCoords[0], muzzleCoords[1], projType);
  var disp = random_range(fireDispersion[0], fireDispersion[1]);
  proj.image_angle = image_angle + disp;
  proj.direction = proj.image_angle;
  //proj.speed = 12;
}


