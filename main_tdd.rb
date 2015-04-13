

class Point

	attr_accessor :x, :y
	def initialize (x_init,y_init)
		raise unless x_init.is_a?(Numeric) && y_init.is_a?(Numeric)
		@x = x_init
		@y = y_init
	end
end

class Rectangle
	attr_accessor :p1, :p2
	#initializing rectangle point1 is always bottom left, point2 is alway top right corner
	def initialize (point1, point2)
		raise unless point1.is_a?(Point) && point2.is_a?(Point)
		@p1 = point1
		@p2 = point2
	end


	def area 
		return (p2.x-p1.x)*(p2.y-p1.y) 
	end

end

class Triangle

	def initialize (point1, point2, point3)
		raise unless point1.is_a?(Point) && point2.is_a?(Point) && point3.is_a?(Point)
		@p1 = point1
		@p2 = point2
		@p3 = point3
	end

	def area
		return ((@p1.x * @p2.y+@p2.x * @p3.y + @p3.x * @p1.y - @p1.y * @p2.x - @p2.y * @p3.x - @p3.y * @p1.x)/2).abs 

	end

end

class Circle

	def initialize (point1, radius)
		@p1 = point1
		@r = radius
	end

	def area
		return 3.14 * @r**2
	end

end

class Scene
	attr_accessor :shape_array
	
	def initialize 
		@shape_array = Array.new
	end

	def add_shape (shape)
		raise unless shape.is_a?(Circle) || shape.is_a?(Rectangle) || shape.is_a?(Triangle)
		@shape_array.push(shape)
	end

	def shape_count
		return @shape_array.length
	end

	def total_area
		area = 0
		@shape_array.each do |el|
			area+=el.area
		end
		
		return area
	end

	

	def remove_shape
		@shape_array.pop
	end

end



