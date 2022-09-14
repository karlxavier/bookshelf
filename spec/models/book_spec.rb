# frozen_string_literal: true

require "rails_helper"

RSpec.describe Book, type: :model do

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

    before do
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
        result = described_class.unread_books(user)
        
        expect(result).not_to include(user_reading_book)
      end
    end
  end

  describe 'seachable' do
    let(:books) { create_list(:book, 3) }
    let(:book) { books.first }
    let(:result) { described_class.search(keyword:) }

    shared_examples_for 'searching books' do
      it 'will search all serachable fields' do
        expect(result).to include(book.as_json)
      end
    end

    context 'when title' do
      let(:keyword) { book.title }

      it_behaves_like 'searching books'
    end

    context 'when description' do
      let(:keyword) { book.description }

      it_behaves_like 'searching books'
    end

    context 'when author' do
      let(:keyword) { book.author }

      it_behaves_like 'searching books'
    end
  end
end