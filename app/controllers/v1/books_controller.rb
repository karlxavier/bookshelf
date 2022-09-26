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
      reading_books = current_user.reading_lists
      books = current_user.books.where(id: reading_books.pluck(:book_id))

      render_blueprint_api(
        data: books,
        blueprint: ::V1::BookBlueprint
      )
    end

    def finished_books
      finished_books = current_user.finished_books
      books = current_user.books.where(id: finished_books.pluck(:book_id))

      render_blueprint_api(
        data: books,
        blueprint: ::V1::BookBlueprint
      )
    end

    def discover
      discover_books = current_user.unread_books

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

    def mark_as_read
      user_book = current_user.user_books.find_by(book_id: params[:id])
      user_book.update!(finished: true)

      render_blueprint_api(
        data: user_book.book,
        blueprint: ::V1::BookBlueprint
      )
    end

    def mark_as_unread
      finished_book = current_user.finished_books.find_by(book_id: params[:id])
      finished_book.update!(finished: false)

      render_blueprint_api(
        data: finished_book.book,
        blueprint: ::V1::BookBlueprint
      )
    end

    def remove_from_list
      book = Book.find(params[:id])
      current_user.user_books.find_by(book_id: book.id).destroy

      render_blueprint_api(
        data: book,
        blueprint: ::V1::BookBlueprint
      )
    end

    def search
      query = params['query'] || ''
      res = Book.search(query)

      render_blueprint_api(
        data: res.response['hits']['hits'],
        blueprint: ::V1::SearchResultsBlueprint
      )
    end
  end
end
