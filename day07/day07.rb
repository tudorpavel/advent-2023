# frozen_string_literal: true

class Day07
  def solve(lines)
    @lines = lines

    [score(HandP1), score(HandP2)]
  end

  private

  def score(klass)
    hands = @lines.map { |l| klass.build(l) }
    hands.sort.reverse.map.with_index do |hand, i|
      hand.bid * (i + 1)
    end.sum
  end

  class HandP1
    RANK = 'AKQJT98765432'

    attr_reader :hand, :bid

    def self.build(line)
      hand_str, bid_str = line.split
      hand = hand_str.chars.map { |c| self::RANK.index(c) }
      bid = bid_str.to_i
      new(hand, bid)
    end

    def initialize(hand, bid)
      @hand = hand
      @bid = bid
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

    def <=>(other)
      x = self
      y = other
      xtr = x.type_rank
      ytr = y.type_rank

      return x.hand <=> y.hand if xtr == ytr

      xtr <=> ytr
    end
  end

  class HandP2 < HandP1
    RANK = 'AKQT98765432J'
    J_RANK = 12

    def type_rank
      return super unless @hand.include?(J_RANK)

      0.upto(J_RANK - 1).map do |new_rank|
        hand = @hand.map { |r| r == J_RANK ? new_rank : r }
        self.class.new(hand, @bid).type_rank
      end.min
    end
  end
end
