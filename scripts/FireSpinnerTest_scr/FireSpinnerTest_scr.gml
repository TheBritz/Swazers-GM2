var clipIndex = ds_list_size(ammoClip) - 1;
if(clipIndex >= 0)
{
  //Calculate lateral speed (relative to aim)
  var angDiff;
  angDiff[0] = abs(angle_difference(combatant.aimDir + 90, combatant.direction));
  angDiff[1] = abs(angle_difference(combatant.aimDir - 90, combatant.direction));
  if(angDiff[0] < angDiff[1])
  {
    var angDiffFinal = angDiff[0];
    var spinSign = 1;
  }
  else
  {
    var angDiffFinal = angDiff[1];
    var spinSign = -1;
  }
  if(angDiffFinal < 5)
  {
    angDiffFinal = 5;
  }
  var spinFactor = sqr(combatant.speed)/angDiffFinal;
  var projType = ammoClip[|clipIndex];
  ds_list_delete(ammoClip, clipIndex);
  repeat(ammoProjNumberMap[?projType])
  {    
    var fireDispersion = fireDispersionMap[?projType];
    var muzzleCoords = relative_coordinates(x, y, muzzleOrigin[0], muzzleOrigin[1]*sign(image_yscale), image_angle);
    var proj = instance_create(muzzleCoords[0], muzzleCoords[1], projType);
    var disp = random_range(fireDispersion[0], fireDispersion[1]);
    proj.image_angle = image_angle + disp;
    proj.rotationSpeed = spinFactor * spinSign * 3;
    proj.image_yscale = 1 + spinFactor * .75;
    proj.image_xscale = 1 + spinFactor * .25;
    proj.direction = proj.image_angle;
  }
}


