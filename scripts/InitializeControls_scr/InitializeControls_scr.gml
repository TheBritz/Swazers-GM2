/// @description InitializeControls_scr()
var kcm, gpcm;
global.KeyboardControlsList = ds_list_create();
global.GamepadControlsList = ds_list_create();
for(var i = 0; i < PLAYER_NUMBER_LOCAL; i++) 
{
  kcm = ds_map_create();
  global.KeyboardControlsList[|i] = kcm;
  
  gpcm = ds_map_create();
  global.GamepadControlsList[|i] = gpcm;
  
  //Check for controls file
  //TODO: Add script to check for serialized controls settings
  
  //Controls file(s) don't exist, initialize controls
  InitializeDefaultKeyboardControls_scr(kcm);
  InitializeDefaultGamepadControls_scr(gpcm);
}





