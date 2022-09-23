# frozen_string_literal: true

class Book < ApplicationRecord
  include Searchable

  has_many :user_books, dependent: :destroy
  has_many :users, through: :user_books

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :author, presence: true

  scope :unread_books, ->(user) { 
    where.not(id: user.books.pluck(:book_id))
  }
end
