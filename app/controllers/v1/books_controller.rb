# frozen_string_literal: true

module V1
  class BooksController < ApplicationController
    def index
      books = Book.all

      render_blueprint_api(
        data: books,
        blueprint: ::V1::BookBlueprint
      )
    end

    def show
      book = Book.find(params[:id])

      render_blueprint_api(
        data: book,
        blueprint: ::V1::BookBlueprint
      )
    end

    def reading_lists
      reading_books = current_user.books

      render_blueprint_api(
        data: reading_books,
        blueprint: ::V1::BookBlueprint
      )
    end

    def finished_books
      finished_books = current_user.finished_books

      render_blueprint_api(
        data: finished_books,
        blueprint: ::V1::BookBlueprint
      )
    end

    def discover
      discover_books = User.first.unread_books

      render_blueprint_api(
        data: discover_books,
        blueprint: ::V1::BookBlueprint
      )
    end

    def add_reading_list
      book = Book.find(params[:id])
      current_user.add_to_my_list!(book)

      render_blueprint_api(
        data: book,
        blueprint: ::V1::BookBlueprint
      )
    end
  end
end
