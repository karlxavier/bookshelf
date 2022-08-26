# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :user_books, dependent: :destroy
  has_many :books, through: :user_books

  def unread_books
    Book.unread_books(self)
  end

  def finished_books
    my_reading_lists.where(finished: true)
  end
end
