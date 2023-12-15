# frozen_string_literal: true

class Day05
  def solve(lines)
    @seeds = nums(lines[0])
    init_mappings(lines)

    [part1, part2]
  end

  private

  def part1
    intervals = @seeds.map do |seed|
      Interval.from_length(seed, 1)
    end

    min_location(intervals)
  end

  def part2
    intervals = @seeds.each_slice(2).map do |(start, length)|
      Interval.from_length(start, length)
    end

    min_location(intervals)
  end

  def min_location(intervals)
    intervals = @mappings.reduce(intervals) do |acc, mapping|
      mapping.process(acc)
    end

    intervals.map(&:left).min
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

    def process(intervals)
      @ranges.each do |range|
        intervals = intervals.flat_map { |int| range.split(int) }
      end

      intervals.map do |int|
        adjust_interval(int)
      end
    end

    private

    def adjust_interval(interval)
      @ranges.each do |range|
        return range.adjust(interval) if range.contains?(interval.left)
      end

      interval
    end
  end

  class Range
    def initialize(destination, source, length)
      @source = Interval.from_length(source, length)
      @diff = destination - source
    end

    def split(interval)
      intersection = interval.intersection(@source)
      return interval if intersection.nil?

      result = [intersection]
      result << Interval.new(interval.left, intersection.left - 1) if interval.left < intersection.left
      result << Interval.new(intersection.right + 1, interval.right) if intersection.right < interval.right

      result
    end

    def adjust(interval)
      Interval.new(interval.left + @diff, interval.right + @diff)
    end

    def contains?(val)
      @source.left <= val && val <= @source.right
    end
  end

  class Interval
    attr_accessor :left, :right

    def self.from_length(start, length)
      new(start, start + length - 1)
    end

    def initialize(left, right)
      @left = left
      @right = right
    end

    def intersection(other)
      l = [@left, other.left].max
      r = [@right, other.right].min

      return if l > r

      self.class.new(l, r)
    end
  end
end
