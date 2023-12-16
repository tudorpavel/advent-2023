# frozen_string_literal: true

require_relative '../../day06/day06'

RSpec.describe Day06 do
  subject(:solve) { described_class.new.solve(lines) }

  let(:lines) do
    [
      'Time:      7  15   30',
      'Distance:  9  40  200'
    ]
  end

  describe '#solve' do
    context 'when part 1' do
      it 'returns the right result' do
        p1, _p2 = solve

        expect(p1).to eq(288)
      end
    end

    context 'when part 2' do
      it 'returns the right result' do
        _p1, p2 = solve

        expect(p2).to eq(71_503)
      end
    end
  end
end
