/// @description next_power_of(value, power)
/// @param value
/// @param  power

var value = argument0;
var pow = argument1;
var next = power(pow, ceil(log10(value)/log10(pow)));
return next;

