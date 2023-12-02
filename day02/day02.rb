# frozen_string_literal: true

class Day02
  MAX_COUNT = {
    'red' => 12,
    'green' => 13,
    'blue' => 14
  }.freeze

  def solve(lines) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    p1 = 0
    p2 = 0

    lines.map do |line|
      game_id, subsets = line.scan(/Game (\d+): (.+)/).flatten
      possible = true
      max_seen = { 'red' => 0, 'green' => 0, 'blue' => 0 }

      subsets.split(';').each do |subset|
        subset.scan(/(\d+) (red|green|blue)/).each do |(count, cube)|
          # Part 1
          possible = false if count.to_i > MAX_COUNT[cube]

          # Part 2
          max_seen[cube] = [count.to_i, max_seen[cube]].max
        end
      end

      p1 += game_id.to_i if possible
      p2 += max_seen.values.reduce(:*)
    end

    [p1, p2]
  end
end
