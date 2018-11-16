/// @function instantiate_worldmap_duck(x,y)
/// @description Creates an instance of worldmap_duck at position x, y.
/// @param {integer} x location.
/// @param {integer} y location.

var worldmap_duck = instance_create_depth(argument0, argument1, "Instances", 
obj_worldmap_duck);
return worldmap_duck;