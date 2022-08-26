# frozen_string_literal: true

module V1
  class BooksController < ApplicationController
    def reading_lists
      reading_books = current_user.books

      render_blueprint_api(
        data: reading_books,
        blueprint: Blueprinters::V1::BookBlueprint
      )
    end

    def finished_books
      finished_books = current_user.finished_books

      render_blueprint_api(
        data: finished_books,
        blueprint: Blueprinters::V1::BookBlueprint
      )
    end

    def discover
      discover_books = current_user.unread_books

      render_blueprint_api(
        data: discover_books,
        blueprint: Blueprinters::V1::BookBlueprint
      )
    end
  end
end
