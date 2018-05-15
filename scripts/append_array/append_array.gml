/*
This script takes an array and appends it to another given array

arg0: append array
arg1: append-to array
*/

var append_arr = argument0;
var append_to_arr = argument1;
var index_place = array_length_1d(append_to_arr);
var append_len = array_length_1d(append_arr);
var i;

for(i = 0; i < append_len; i++)
{
    append_to_arr[@ index_place++] = append_arr[i];
}

//return(append_to_arr);
