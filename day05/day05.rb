# frozen_string_literal: true

class Day05
  def solve(lines)
    seeds = nums(lines[0])
    mappings = init_mappings(lines)

    p1 = seeds.map do |seed|
      # reduce from seed to location
      mappings.reduce(seed) do |acc, mapping|
        mapping.destination(acc)
      end
    end.min

    [p1, -2]
  end

  private

  def init_mappings(lines)
    mappings = []

    lines[2..].each do |line|
      next if line.empty?

      if line.end_with?(':')
        mappings << Mapping.new
        next
      end

      mappings.last.ranges << Range.new(*nums(line))
    end

    mappings
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
