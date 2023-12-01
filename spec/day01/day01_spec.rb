# frozen_string_literal: true

require_relative '../../day01/day01'

RSpec.describe Day01 do
  subject(:solve) { described_class.new.solve(lines) }

  let(:lines) do
    %w[
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
    ]
  end

  describe '#solve' do
    it 'solves both parts', :aggregate_failures do
      p1, p2 = solve

      expect(p1).to eq(142)
      expect(p2).to eq(2)
    end
  end
end
