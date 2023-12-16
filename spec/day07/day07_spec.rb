# frozen_string_literal: true

require_relative '../../day07/day07'

RSpec.describe Day07 do
  subject(:solve) { described_class.new.solve(lines) }

  let(:lines) do
    [
      '32T3K 765',
      'T55J5 684',
      'KK677 28',
      'KTJJT 220',
      'QQQJA 483'
    ]
  end

  describe '#solve' do
    context 'when part 1' do
      it 'returns the right result' do
        p1, _p2 = solve

        expect(p1).to eq(6440)
      end
    end

    context 'when part 2' do
      it 'returns the right result' do
        _p1, p2 = solve

        expect(p2).to eq(5905)
      end
    end
  end
end
