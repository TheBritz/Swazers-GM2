/// @description Game Session Container Create
event_inherited();

container_w = 0;
container_h = 0;

for(var i = 0; i < 4; i++){color[i] = c_navy;}

gameNameLabel = instance_create(0, 0, uiLabel_obj);
gameNameLabel.text = "Game Name";
gameNameLabel.container = id;
gameNameLabel.cont_rel_w = .25;
gameNameLabel.cont_rel_posx = .05;
gameNameLabel.cont_rel_posy = .25;

hostNameLabel = instance_create(0, 0, uiLabel_obj);
hostNameLabel.text = "Host: Host Name";
hostNameLabel.container = id;
hostNameLabel.cont_rel_w = .25;
hostNameLabel.cont_rel_posx = .05;
hostNameLabel.cont_rel_posy = .5;





