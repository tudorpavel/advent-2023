# frozen_string_literal: true

class Day07
  def solve(lines)
    @hands = lines.map { |l| Hand.new(l) }

    [part1, -2]
  end

  def part1
    sorted = @hands.sort do |x, y|
      xtr = x.type_rank
      ytr = y.type_rank

      next y.hand <=> x.hand if xtr == ytr

      ytr <=> xtr
    end

    sorted.map.with_index do |hand, i|
      hand.bid * (i + 1)
    end.sum
  end

  class Hand
    RANK = 'AKQJT98765432'

    attr_reader :hand, :bid

    def initialize(line)
      hand_str, bid_str = line.split
      @hand = hand_str.chars.map { |c| RANK.index(c) }
      @bid = bid_str.to_i
    end

    def type_rank # rubocop:disable Metrics
      counts = @hand.tally.values

      if counts.include?(5)
        0
      elsif counts.include?(4)
        1
      elsif counts.include?(3) && counts.include?(2)
        2
      elsif counts.include?(3)
        3
      elsif counts.filter { |c| c == 2 }.size == 2
        4
      elsif counts.include?(2)
        5
      else
        6
      end
    end
  end
end
