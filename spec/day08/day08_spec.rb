# frozen_string_literal: true

require_relative '../../day08/day08'

RSpec.describe Day08 do
  subject(:solve) { described_class.new.solve(lines) }

  let(:lines) do
    [
      'RL',
      '',
      'AAA = (BBB, CCC)',
      'BBB = (DDD, EEE)',
      'CCC = (ZZZ, GGG)',
      'DDD = (DDD, DDD)',
      'EEE = (EEE, EEE)',
      'GGG = (GGG, GGG)',
      'ZZZ = (ZZZ, ZZZ)'
    ]
  end

  describe '#solve' do
    context 'when part 1' do
      it 'returns the right result' do
        p1, _p2 = solve

        expect(p1).to eq(2)
      end
    end

    context 'when part 2' do
      it 'returns the right result' do
        _p1, p2 = solve

        expect(p2).to eq(-2)
      end
    end

    context 'when part 1 repeating example' do
      let(:lines) do
        [
          'LLR',
          '',
          'AAA = (BBB, BBB)',
          'BBB = (AAA, ZZZ)',
          'ZZZ = (ZZZ, ZZZ)'
        ]
      end

      it 'returns the right result' do
        p1, _p2 = solve

        expect(p1).to eq(6)
      end
    end
  end
end
