# frozen_string_literal: true

class Day05
  def solve(lines)
    @seeds = nums(lines[0])
    init_mappings(lines)

    [part1, part2]
  end

  private

  def part1
    @seeds.map { |s| location(s) }.min
  end

  def part2
    @seeds.each_slice(2).flat_map do |(start, length)|
      start.upto(start + length - 1).map { |s| location(s) }
    end.min
  end

  def location(seed)
    @mappings.reduce(seed) do |acc, mapping|
      mapping.destination(acc)
    end
  end

  def init_mappings(lines)
    @mappings = []

    lines[2..].each do |line|
      next if line.empty?

      if line.end_with?(':')
        @mappings << Mapping.new
        next
      end

      @mappings.last.ranges << Range.new(*nums(line))
    end
  end

  def nums(str)
    str.scan(/(\d+)/).flatten.map(&:to_i)
  end

  class Mapping
    attr_accessor :ranges

    def initialize
      @ranges = []
    end

    def destination(source)
      ranges.each do |range|
        return range.destination(source) if range.contains?(source)
      end

      source
    end
  end

  class Range
    def initialize(destination, source, length)
      @min = source
      @max = source + length - 1
      @diff = destination - source
    end

    def contains?(source)
      @min <= source && source <= @max
    end

    def destination(source)
      source + @diff
    end
  end
end
