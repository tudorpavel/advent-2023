# frozen_string_literal: true

module RunDay
  def self.run(day)
    lines = ARGF.readlines.map(&:strip)

    start = Process.clock_gettime(Process::CLOCK_MONOTONIC, :millisecond)
    p1, p2 = day.solve(lines)
    elapsed = Process.clock_gettime(Process::CLOCK_MONOTONIC, :millisecond) - start

    puts "Part1: #{p1}"
    puts "Part2: #{p2}"
    puts "Execution time: #{elapsed}ms"
  end
end
