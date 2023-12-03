# frozen_string_literal: true

class Day03
  def solve(lines)
    visited = Array.new(lines.size) do
      Array.new(lines[0].size, false)
    end

    lines.each_with_index do |line, i|
      line.chars.each_with_index do |c, j|
        find_nums(lines, visited, i, j) if symbol?(c)
      end
    end

    nums = convert_nums(lines, visited)

    [nums.sum, -2]
  end

  private

  DELTA = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]
  ].freeze

  def symbol?(character)
    character !~ /(\.|\d)/
  end

  def find_nums(lines, visited, row, col)
    DELTA.each do |(di, dj)|
      new_i = row + di
      new_j = col + dj
      next if new_i.negative? || new_i >= lines.size
      next if new_j.negative? || new_j >= lines[0].size

      mark_nums(lines, visited, new_i, new_j)
    end
  end

  def mark_nums(lines, visited, row, col)
    return if lines[row][col] !~ /\d/ || visited[row][col]

    visited[row][col] = true

    mark_nums(lines, visited, row, col - 1)
    mark_nums(lines, visited, row, col + 1)
  end

  def convert_nums(lines, visited) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    nums = []
    num = String.new

    lines.each_with_index do |line, i|
      line.chars.each_with_index do |c, j|
        num << c if visited[i][j]

        if (j + 1 == line.size || !visited[i][j + 1]) && num != ''
          nums << num.to_i
          num = String.new
        end
      end
    end

    nums
  end
end
