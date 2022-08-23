module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :email, :books

    def books
      object.books.map do |book|
        {
          id: book.id,
          title: book.title,
          description: book.description,
          author: book.author
        }
      end
    end
  end
end