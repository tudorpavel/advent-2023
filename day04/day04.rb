# frozen_string_literal: true

class Day04
  def solve(lines)
    p1 = 0

    lines.each do |line|
      _card, winning, mine = line.split(/:|\|/)
      win_count = nums(winning).intersection(nums(mine)).size

      p1 += 2**(win_count - 1) unless win_count.zero?
    end

    [p1, -2]
  end

  private

  def nums(str)
    str.scan(/(\d+)/).flatten.map(&:to_i)
  end
end
