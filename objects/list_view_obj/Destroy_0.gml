/// @description Destroy resources
var to_destroy = array(items, sections);
var destroy_this_list, destroy_this;
for(var i = 0; i < array_length_1d(to_destroy); i++;)
{
    destroy_this_list = to_destroy[i];
    for(var ii = 0; ii < ds_list_size(destroy_this_list); ii++;)
    {
        destroy_this = destroy_this_list[| ii];
        with(destroy_this)
        {
            instance_destroy();
        }        
    }
    ds_list_destroy(destroy_this_list);
}

