# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do

  describe 'associations' do
    it 'should have many books' do
      b = described_class.reflect_on_association(:books)
      expect(b.macro).to eq(:has_many)
    end
  end

end