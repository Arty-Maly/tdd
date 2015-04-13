# tdd
Test Driven Development Example 

Representing a Scene 

Point to represent a point on a plane (i.e. x and y coordinates, floats, representing meters from the origin)

Rectangle that represents a rectangle with two points
  Rectangle#area (in square meters)

Trangle that represents a triange with three points.
  Triangle#area (in square meters)

Circle that represents a circle by a point and a radius (float)
  Circle#area (in square meters)

Scene that represents a scene consisting of one or more rectangles, circles and triangles.
  Scene#shape_count (how many shapes there are)
  Scene#total_area (sum of all the areas even if they overlap; don’t worry about computing intersections.)
  Scene#add_shape (adds a shape to the scene)
  Scene#remove_shape (removes a shape from the scene)
