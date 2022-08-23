class Book < ApplicationRecord
  has_many :user_books
  has_many :users, through: :user_books

  validates :title, :description, :author, presence: true

  scope :unread_books, -> (user) { 
    where.not(id: user.books.pluck(:book_id))
  }
end
