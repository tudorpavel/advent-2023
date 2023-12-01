# frozen_string_literal: true

class Day01
  def solve(lines)
    nums = lines.map do |str|
      digits = str.chars.filter { |c| c =~ /[0-9]/ }
      [digits.first, digits.last].join.to_i
    end
    p1 = nums.reduce(&:+)

    [p1, 2]
  end
end
