module V1
  class BooksController < ApplicationController
    def reading_lists
      books = current_user.books

      render json: renderer(books)
    end

    def finished_books
      books = current_user.finished_books

      render json: renderer(books)
    end

    def discover
      books = current_user.unread_books

      render json: renderer(books)
    end

    private

    def renderer(books)
      caller_method = caller_locations.first.label

      {
        data: ActiveModelSerializers::SerializableResource.new(
          books,
          each_serializer: BookSerializer
        ),
        message: ["User #{caller_method.humanize} fetched successfully"],
        status: 200,
        type: 'Success'
      }
    end
  end
end