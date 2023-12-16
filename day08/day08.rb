# frozen_string_literal: true

class Day08
  def solve(lines)
    @dirs = lines[0]
    init_nodes(lines)

    [part1, -2]
  end

  private

  def part1
    node = @start
    dir = 0
    step_count = 0

    while node != @end
      node = @dirs[dir] == 'L' ? node.left : node.right
      dir = (dir + 1) % @dirs.size
      step_count += 1
    end

    step_count
  end

  def init_nodes(lines) # rubocop:disable Metrics
    lookup = {}

    tuples = lines[2..].map do |l|
      l.scan(/(\w+) = \((\w+), (\w+)\)/).flatten
    end

    tuples.each do |(id)|
      lookup[id] = Node.new(id)
      @start = lookup[id] if id == 'AAA'
      @end = lookup[id] if id == 'ZZZ'
    end

    tuples.each do |(id, left, right)| # rubocop:disable Style/CombinableLoops
      lookup[id].left = lookup[left]
      lookup[id].right = lookup[right]
    end
  end

  class Node
    attr_accessor :left, :right

    def initialize(id)
      @id = id
    end
  end
end
