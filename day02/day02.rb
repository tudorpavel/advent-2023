# frozen_string_literal: true

class Day02
  def solve(lines)
    p1 = lines.map do |line|
      game_id, subsets = line.scan(/Game (\d+): (.+)/).flatten
      next 0 if impossible?(subsets)

      game_id.to_i
    end.sum

    [p1, -2]
  end

  private

  MAX_COUNT = {
    'red' => 12,
    'green' => 13,
    'blue' => 14
  }.freeze

  def impossible?(subsets)
    subsets.split(';').each do |subset|
      subset.scan(/(\d+) (red|green|blue)/).each do |(count, cube)|
        return true if count.to_i > MAX_COUNT[cube]
      end
    end

    false
  end
end
