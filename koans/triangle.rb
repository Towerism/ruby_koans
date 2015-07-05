# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

def triangle(a, b, c)
  assert_triangle_is_sane(a, b, c)
  type_of_triangle(a, b, c)
end

def assert_triangle_is_sane(a, b, c)
  raise TriangleError unless all_are_positive(a, b, c)
  raise TriangleError unless triangle_inequality_is_satisfied(a, b, c)
end

def all_are_positive(*items)
  non_positives = items.count { |x| x <= 0 }
  return non_positives == 0
end

def triangle_inequality_is_satisfied(a, b, c)
  permutations = [a, b, c].permutation
  return !permutations.any? { |p| p[0] + p[1] <= p[2] }
end

def type_of_triangle(a, b, c)
  unique_permutations = unique_permutations_of(a, b, c)
  return :equilateral if unique_permutations == 1
  return :isosceles if unique_permutations == 3
  return :scalene
end

def unique_permutations_of(*items)
  permutations = items.permutation.to_a
  unique_permutations = permutations.uniq
  return unique_permutations.length
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
