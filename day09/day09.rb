# frozen_string_literal: true

class Day09
  def solve(lines)
    p1 = lines.map do |line|
      next_value(nums(line))
    end.sum

    [p1, -2]
  end

  private

  def next_value(history)
    terminals = []
    current = history

    until current.sum.zero?
      terminals << current.last
      current = current.each_cons(2).map do |(a, b)|
        b - a
      end
    end

    terminals.sum
  end

  def nums(str)
    str.split.map(&:to_i)
  end
end
