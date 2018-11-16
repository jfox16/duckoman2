/// @function instantiate_duck(x,y)
/// @description Creates an instance of duck at position x, y.
/// @param {integer} x location.
/// @param {integer} y location.

var duck = instance_create_depth(argument0, argument1, "Instances", obj_duck);
return duck;