# frozen_string_literal: true

class Day09
  def solve(lines)
    p1 = 0
    p2 = 0

    lines.each do |line|
      initials, terminals = process(nums(line))
      p1 += part1(terminals)
      p2 += part2(initials)
    end

    [p1, p2]
  end

  private

  def part1(terminals)
    terminals.sum
  end

  def part2(initials)
    initials.reverse.reduce(0) do |acc, n|
      n - acc
    end
  end

  def process(history) # rubocop:disable Metrics/MethodLength
    initials = []
    terminals = []
    current = history

    until current.sum.zero?
      initials << current.first
      terminals << current.last
      current = current.each_cons(2).map do |(a, b)|
        b - a
      end
    end

    [initials, terminals]
  end

  def nums(str)
    str.split.map(&:to_i)
  end
end
