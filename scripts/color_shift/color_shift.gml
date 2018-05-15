col = argument0;
shift_what = argument1; //accepts "h", "s", or "v"
shift_by = argument2;

var col_h, col_s, col_v, col_ret;
col_h = color_get_hue(col);
col_s = color_get_saturation(col);
col_v = color_get_value(col);

switch(shift_what)
{
    case "h":
    {
        col_h += shift_by;
        break;
    }
    
    case "s":
    {
        col_s += shift_by;
        break;
    }
    
    case "v":
    {
        col_v += shift_by;
        break;
    }
}

return(make_colour_hsv(col_h, col_s, col_v));
