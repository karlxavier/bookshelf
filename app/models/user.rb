# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :user_books, dependent: :destroy
  has_many :books, through: :user_books

  def unread_books
    Book.unread_books(self)
  end

  def finished_books
    my_reading_lists.where(finished: true)
  end

  def to_token_payload
    {
      sub: id,
      name: name
    }
  end

  def add_to_my_list!(book)
    user_books.create!(
      book:,
    )
  end
end
