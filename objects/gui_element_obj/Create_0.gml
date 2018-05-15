/// @description GUI element init
container = noone;

//ui dimensions
container_w = 0;
container_h = 0;
container_w_last = 0;
container_h_last = 0;
dimensionsChanged = false;
uiPosX = 0;
uiPosY = 0;

//Relative positioning within container (0 to 1)
cont_rel_posx = undefined;
cont_rel_posy = undefined;

//Relative dimensions of the element (0 to 1)
cont_rel_w = undefined;
cont_rel_h = undefined

//Absolute positioning within the container
cont_abs_posx = undefined;
cont_abs_posy = undefined;

//Absolute dimensions of the element
cont_abs_w = undefined;
cont_abs_h = undefined;

//Obscuring (for scrollable containers)
obscureMode = OBSCURE_MODE_NONE;
obscureModeLast = undefined;
obscureLeft = undefined;
obscureTop = undefined;
obscureWidth = undefined;
obscureHeight = undefined;
obscurePartX = undefined;
obscurePartY = undefined;
obscureDirV = undefined;
obscureDirH = undefined;
obscureSurf = -1;
obscureSpr = -1;
obscureIgnore = false;
obscureDefault = true;
obscureDrawLeft = undefined;
obscureDrawTop = undefined;
obscureDrawWidth = undefined;
obscureDrawHeight = undefined;
obscureDrawX = undefined;
obscureDrawY = undefined;
obscureOffsetX = 0;
obscureOffsetY = 0;

//Drawing script
drawScript = undefined;
drawArgs = undefined;




