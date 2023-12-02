# frozen_string_literal: true

class Day02
  def solve(lines)
    p1 = part1(lines)
    p2 = part2(lines)

    [p1, p2]
  end

  private

  MAX_COUNT = {
    'red' => 12,
    'green' => 13,
    'blue' => 14
  }.freeze

  def part1(lines)
    lines.map do |line|
      game_id, subsets = line.scan(/Game (\d+): (.+)/).flatten
      next 0 if impossible?(subsets)

      game_id.to_i
    end.sum
  end

  def impossible?(subsets)
    subsets.split(';').each do |subset|
      subset.scan(/(\d+) (red|green|blue)/).each do |(count, cube)|
        return true if count.to_i > MAX_COUNT[cube]
      end
    end

    false
  end

  def part2(lines)
    lines.map do |line|
      _game_id, subsets = line.scan(/Game (\d+): (.+)/).flatten

      power(subsets)
    end.sum
  end

  def power(subsets)
    max_seen = { 'red' => 0, 'green' => 0, 'blue' => 0 }

    subsets.split(';').each do |subset|
      subset.scan(/(\d+) (red|green|blue)/).each do |(count, cube)|
        max_seen[cube] = [count.to_i, max_seen[cube]].max
      end
    end

    max_seen.values.reduce(:*)
  end
end
