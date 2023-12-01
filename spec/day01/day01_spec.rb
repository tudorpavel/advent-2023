# frozen_string_literal: true

require_relative '../../day01/day01'

RSpec.describe Day01 do
  subject(:solve) { described_class.new.solve(lines) }

  describe '#solve' do
    context 'when part 1' do
      let(:lines) do
        %w[
          1abc2
          pqr3stu8vwx
          a1b2c3d4e5f
          treb7uchet
        ]
      end

      it 'returns the right result' do
        p1, _p2 = solve

        expect(p1).to eq(142)
      end
    end

    context 'when part 2' do
      let(:lines) do
        %w[
          two1nine
          eightwothree
          abcone2threexyz
          xtwone3four
          4nineeightseven2
          zoneight234
          7pqrstsixteen
          oneight
        ]
      end

      it 'returns the right result' do
        _p1, p2 = solve

        expect(p2).to eq(299)
      end
    end
  end
end
