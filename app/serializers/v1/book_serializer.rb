module V1
  class BookSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :author

    def book
      {
        id: object.id,
        title: object.title,
        description: object.description,
        author: object.author
      }
    end
  end
end