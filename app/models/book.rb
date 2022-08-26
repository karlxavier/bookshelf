# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :user_books, dependent: :destroy
  has_many :users, through: :user_books

  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true

  scope :unread_books, ->(user) { 
    where.not(id: user.books.pluck(:book_id))
  }
end