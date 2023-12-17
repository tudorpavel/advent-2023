# frozen_string_literal: true

require_relative '../../day09/day09'

RSpec.describe Day09 do
  subject(:solve) { described_class.new.solve(lines) }

  let(:lines) do
    [
      '0 3 6 9 12 15',
      '1 3 6 10 15 21',
      '10 13 16 21 30 45'
    ]
  end

  describe '#solve' do
    context 'when part 1' do
      it 'returns the right result' do
        p1, _p2 = solve

        expect(p1).to eq(114)
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
