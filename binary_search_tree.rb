class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def each(&block)
    return enum_for(__method__) unless block_given?
    left.each(&block) if left
    yield data
    right.each(&block) if right
  end

  def insert(other)
    if other <= data
      insert_left(other)
    else
      insert_right(other)
    end
  end

  private

  def insert_left(other)
    if left.nil?
      @left = Bst.new other
    else
      left.insert other
    end
  end

  def insert_right(other)
    if right.nil?
      @right = Bst.new other
    else
      right.insert other
    end
  end
end


module BookKeeping
  VERSION = 1
end
