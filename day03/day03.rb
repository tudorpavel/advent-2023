# frozen_string_literal: true

class Day03
  def initialize
    @components = {}
  end

  def solve(lines)
    find_all_components(lines)

    [part1, part2]
  end

  private

  class Component
    attr_accessor :symbol, :nums

    def initialize(symbol)
      @symbol = symbol
      @nums = []
    end
  end

  DELTA = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]
  ].freeze

  def part1
    @components.values.flat_map(&:nums).sum
  end

  def part2
    @components
      .values
      .filter { |c| c.symbol == '*' && c.nums.size == 2 }
      .map { |c| c.nums.reduce(&:*) }
      .sum
  end

  def find_all_components(lines) # rubocop:disable Metrics
    num = String.new
    component = nil

    lines.each_with_index do |line, i|
      line.chars.each_with_index do |ch, j|
        if ch =~ /\d/
          num << ch
          component ||= find_or_create_component(lines, i, j)
        end

        next if num == ''
        next if j + 1 < line.size && lines[i][j + 1] =~ /\d/

        component.nums << num.to_i unless component.nil?
        num = String.new
        component = nil
      end
    end
  end

  def symbol?(character)
    character !~ /(\.|\d)/
  end

  def find_or_create_component(lines, row, col) # rubocop:disable Metrics
    DELTA.each do |(di, dj)|
      i = row + di
      j = col + dj
      next if i.negative? || i >= lines.size
      next if j.negative? || j >= lines[0].size
      next unless symbol?(lines[i][j])

      return @components[[i, j]] ||= Component.new(lines[i][j])
    end

    nil
  end
end
