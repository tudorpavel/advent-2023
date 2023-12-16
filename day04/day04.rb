# frozen_string_literal: true

class Day04
  def solve(lines)
    p1 = 0
    cards = []

    lines.each do |line|
      _, winning, mine = line.split(/:|\|/)
      win_count = nums(winning).intersection(nums(mine)).size
      cards << Card.new(win_count)

      p1 += 2**(win_count - 1) unless win_count.zero?
    end

    [p1, part2(cards)]
  end

  private

  def part2(cards)
    cards.each_with_index do |card, i|
      next if card.win_count.zero?

      cards[(i + 1)..(i + card.win_count)].each do |c|
        c.add(card.card_count)
      end
    end

    cards.map(&:card_count).sum
  end

  def nums(str)
    str.scan(/(\d+)/).flatten.map(&:to_i)
  end

  class Card
    attr_accessor :win_count, :card_count

    def initialize(win_count)
      @win_count = win_count
      @card_count = 1
    end

    def add(count)
      @card_count += count
    end
  end
end
