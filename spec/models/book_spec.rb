require "rails_helper"

RSpec.configure do |c|
  c.use_transactional_examples = true
end

RSpec.describe Book, :type => :model do

  describe 'associations' do
    it 'should have many users' do
      u = described_class.reflect_on_association(:users)
      expect(u.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :author }
  end

  describe 'scopes' do
    let(:books) { create_list(:book, 3) }
    let(:user) { create(:user) }
    let(:user_reading_book) { books.first }

    before(:example) do
      UserBook.create!(
        book_id: user_reading_book.id,
        user:
      )
    end

    context '.reading_list' do
      it 'will only get user books' do
        expect(
          user.books.map(&:title)
        ).to include(user_reading_book.title)
      end
    end

    context '.unread_books' do
      it 'will get user unread books' do
        expect(
          described_class.unread_books(user).map(&:title)
        ).not_to include(user_reading_book.title)
      end
    end
  end

end