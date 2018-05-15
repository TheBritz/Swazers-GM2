event_inherited();

drawScript = UILabelDraw_scr;

///UI Label init
text = "";
drawRect = false;
drawOutline = false;
rectMarginV = 5;
rectMarginH = 5;
obscureOffsetX = rectMarginH;
obscureOffsetY = rectMarginV;
labelSizing = LABEL_SIZING_TEXT;
labelAlignH = fa_left;
labelAlignV = fa_center;
labelFont = font0;
labelScaleH = 1;
labelScaleV = 1;
xPosHolder = 0;
yPosHolder = 0;
for(var i = 0; i < 4; i++){rectColor[i] = c_navy;}
for(var i = 0; i < 4; i++){textColor[i] = c_navy;}

//Border code
borderL = 0;
borderR = 0;
borderU = 0;
borderD = 0;

drawArgs = array(rectMarginH, rectMarginV);

