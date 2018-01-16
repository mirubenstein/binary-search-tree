class Bst
  include Enumerable

  attr_reader :data, :size

  def initialize(data)
    @data = data
    @size = 1
    @children = {}
  end

  def each(&block)
    return enum_for(__method__) { @size } unless block_given?
    left&.each(&block)
    yield data
    right&.each(&block)
    self
  end

  def insert(other)
    side = (other <= data) ? :left : :right
    @children[side] = Bst.new(other) unless @children[side]&.insert(other)
    @size += 1
  end

  def left
    @children[:left].dup.freeze
  end

  def right
    @children[:right].dup.freeze
  end
end


module BookKeeping
  VERSION = 1
end

# Allow create empty trees
#
# If you want a good challenge, than try implementing a BST with object type polymorphism
# to get rid of the explicit branching entirely.
#   I am not sure if it would lead to great code here, but it's an interesting exercise in OO.
#
# A BST is really only useful to do fast queries.
# If you like a little challenge, consider adding the missing basic operations on BSTs.
#
# Your tree is not balanced.
# I think the tests are all balanced,
# so you could try to make the tree self-balancing.
