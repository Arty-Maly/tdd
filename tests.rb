require 'test/unit'
require './main_tdd'

class Test_Point < Test::Unit::TestCase

	def test_typecheck
		assert_raise (RuntimeError) {Point.new('a', 'b')}
		assert_raise (RuntimeError) {Point.new(1, 'b')}
		assert_raise (RuntimeError) {Point.new('a', 1)}
		assert_raise (RuntimeError) {Point.new('a', 1.0)}
		assert_raise (RuntimeError) {Point.new(1.0, 'b')}
	end
end

class Test_Rectangle < Test::Unit::TestCase
	def test_typecheck
		assert_raise (RuntimeError) {Rectangle.new(1,1)}
		assert_raise (RuntimeError) {Rectangle.new(1,Point.new(1,1))}
		assert_raise (RuntimeError) {Rectangle.new(Point.new(1,1),1)}
		assert_raise (RuntimeError) {Rectangle.new(Point.new(1,1),"a")}
		assert_raise (RuntimeError) {Rectangle.new("a",Point.new(1,1))}

	end

	def test_area
		r = Rectangle.new(Point.new(0,0),Point.new(1,1))
		assert_equal(1, r.area)
	end
end

class Test_Triangle < Test::Unit::TestCase
	def test_area
		trian = Triangle.new(Point.new(0,0),Point.new(0,2),Point.new(1,2))
		assert_equal(1, trian.area)
	end
end


class Test_Circle < Test::Unit::TestCase
	def test_area
		circ = Circle.new(Point.new(0,0),1)
		assert_equal(3.14,circ.area)
	end
end

class Test_Scene < Test::Unit::TestCase
	
	def test_add_shape
		circ = Circle.new(Point.new(0,0),10)
		scene = Scene.new

		assert_raise (RuntimeError) {scene.add_shape(1)}
		assert_raise (RuntimeError) {scene.add_shape("a")}
		
		scene.add_shape(circ)
		
		assert_equal(1, scene.shape_array.length)
		assert_kind_of(Circle,scene.shape_array[0])
	end

	def test_count
		circ = Circle.new(Point.new(0,0),10)
		trian = Triangle.new(Point.new(0,0),Point.new(0,2),Point.new(1,2))
		rect = Rectangle.new(Point.new(0,0),Point.new(1,1))
		scene = Scene.new

		scene.add_shape(circ)
		scene.add_shape(trian)
		scene.add_shape(rect)

		assert_equal(3, scene.shape_array.length)
		
	end	
	
	def test_area
		circ = Circle.new(Point.new(0,0),10)
		trian = Triangle.new(Point.new(0,0),Point.new(0,2),Point.new(1,2))
		rect = Rectangle.new(Point.new(0,0),Point.new(1,1))
		scene = Scene.new
		
		scene.add_shape(circ)
		scene.add_shape(trian)
		scene.add_shape(rect)

		assert_equal(316,scene.total_area)
	end

	
end