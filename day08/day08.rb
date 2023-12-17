# frozen_string_literal: true

class Day08
  def solve(lines)
    @dirs = lines[0]
    init_nodes(lines)

    [part1, part2]
  end

  private

  def part1
    @start_nodes.each do |node|
      return step_count(node) if node.id == 'AAA'
    end
  end

  # Checking the input it seems each start node only ever
  # sees exactly one end node so each path likely ends in
  # a loop at some point with no intersections between them.
  #
  # Idea: find the length of each loop and find the least
  # common multiple (LCM) between the lengths.
  #
  # Caveat: the number of steps to reach the start of each
  # loop could be different but after checking the input
  # it seems Eric was nice enough to make all loops start
  # at the start node.
  def part2
    @start_nodes.map { |n| step_count(n) }.reduce(:lcm)
  end

  def step_count(start_node)
    node = start_node
    dir = 0
    step_count = 0

    until node.id.end_with?('Z')
      node = @dirs[dir] == 'L' ? node.left : node.right
      dir = (dir + 1) % @dirs.size
      step_count += 1
    end

    step_count
  end

  def init_nodes(lines) # rubocop:disable Metrics
    lookup = {}
    @start_nodes = []

    tuples = lines[2..].map do |l|
      l.scan(/(\w+) = \((\w+), (\w+)\)/).flatten
    end

    tuples.each do |(id)|
      lookup[id] = Node.new(id)
      @start_nodes << lookup[id] if id.end_with?('A')
    end

    tuples.each do |(id, left, right)| # rubocop:disable Style/CombinableLoops
      lookup[id].left = lookup[left]
      lookup[id].right = lookup[right]
    end
  end

  class Node
    attr_reader :id
    attr_accessor :left, :right

    def initialize(id)
      @id = id
    end
  end
end
