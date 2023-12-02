# frozen_string_literal: true

require_relative '../../day02/day02'

RSpec.describe Day02 do
  subject(:solve) { described_class.new.solve(lines) }

  let(:lines) do
    [
      'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green',
      'Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue',
      'Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red',
      'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red',
      'Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green'
    ]
  end

  describe '#solve' do
    context 'when part 1' do
      it 'returns the right result' do
        p1, _p2 = solve

        expect(p1).to eq(8)
      end
    end

    context 'when part 2' do
      it 'returns the right result' do
        _p1, p2 = solve

        expect(p2).to eq(-2)
      end
    end
  end
end
