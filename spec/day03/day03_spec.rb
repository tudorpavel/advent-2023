# frozen_string_literal: true

require_relative '../../day03/day03'

RSpec.describe Day03 do
  subject(:solve) { described_class.new.solve(lines) }

  let(:lines) do
    %w[
      467..114..
      ...*......
      ..35..633.
      ......#...
      617*......
      .....+.58.
      ..592.....
      ......755.
      ...$.*....
      .664.598..
    ]
  end

  describe '#solve' do
    context 'when part 1' do
      it 'returns the right result' do
        p1, _p2 = solve

        expect(p1).to eq(4361)
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
