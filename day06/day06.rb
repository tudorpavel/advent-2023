# frozen_string_literal: true

class Day06
  def solve(lines)
    @lines = lines

    [part1, part2]
  end

  private

  def part1
    races = nums(@lines[0]).zip(nums(@lines[1])).map do |(time, record_distance)|
      Race.new(time, record_distance)
    end

    races.map(&:record_beating_count).reduce(:*)
  end

  def part2
    race = Race.new(
      one_num(nums(@lines[0])),
      one_num(nums(@lines[1]))
    )

    race.record_beating_count
  end

  def nums(str)
    str.scan(/(\d+)/).flatten.map(&:to_i)
  end

  def one_num(nums)
    nums.map(&:to_s).join.to_i
  end

  class Race
    def initialize(time, record_distance)
      @time = time
      @record_distance = record_distance
    end

    def record_beating_count
      min = 0
      max = @time

      while !beats_record?(min) && !beats_record?(max)
        min += 1
        max -= 1
      end

      max - min + 1
    end

    private

    def beats_record?(time_held)
      time_held * (@time - time_held) > @record_distance
    end
  end
end
