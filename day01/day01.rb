# frozen_string_literal: true

class Day01
  def solve(lines)
    p1 = part1(lines)
    p2 = part2(lines)

    [p1, p2]
  end

  private

  DIGITS = %w[zero one two three four five six seven eight nine].freeze
  # Spelled out digits can overlap for example 'oneight' -> 18
  # This regex uses a positive lookahead to find overlapping matches
  # Sauce: https://stackoverflow.com/a/41028635/2707376
  REGEX2 = /(?=(#{DIGITS.join('|')}|\d))/

  def part1(lines)
    nums = lines.map do |str|
      digits = str.chars.filter { |c| c =~ /[0-9]/ }
      [digits.first, digits.last].join.to_i
    end

    nums.sum
  end

  def part2(lines)
    nums = lines.map do |str|
      digits = str.scan(REGEX2).flatten
      [
        to_digit(digits.first),
        to_digit(digits.last)
      ].join.to_i
    end

    nums.sum
  end

  def to_digit(str)
    (DIGITS.index(str) || str).to_s
  end
end
