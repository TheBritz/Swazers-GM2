event_inherited();

var scrW = window_get_width();
var scrH = window_get_height();

var relPosX = .5;
x = scrW * relPosX;

var relPosY = .05;
y = scrH * relPosY;

var relScreenWidth = .45;
container_w = scrW * relScreenWidth;

var relScreenHeight = .9;
container_h = scrH * relScreenHeight;

for(var i = 0; i < 4; i++){color[i] = c_maroon;}


/*
var testGameSession = instance_create(x, y, uiContainerGameSession_obj);
with(testGameSession)
{
  cont_rel_posx = .5;
  cont_rel_posy = .05;
  cont_rel_w = .4;
  cont_rel_h = .1;
  container = other.id;
}

var stop = "here";
/*var testLabel = instance_create(x, y, uiLabel_obj);
testLabel.text = "Test";
for(var i = 0; i < 4; i++) {colorText[i] = c_navy;}
testLabel.drawRect = true;
testLabel.drawOutline = true;
testLabel.cont_rel_posx = .5;
testLabel.cont_rel_posy = .5;
testLabel.container = id;
ds_list_add(elementsList, testLabel);*/

/*
var testButton = instance_create(x, y, uiButtonGeneric_obj);
testButton.text = "Testilator";
testButton.my_color = c_orange;
testButton.text_color = c_orange;
testButton.cont_rel_posx = .5;
testButton.cont_rel_posy = .2;
testButton.container = id;
ds_list_add(elementsList, testButton);*/


/* */
/*  */
