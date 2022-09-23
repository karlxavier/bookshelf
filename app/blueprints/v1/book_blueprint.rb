# frozen_string_literal: true

module V1
  class BookBlueprint < Blueprinter::Base
    identifier :id

    fields :title,
           :description,
           :author,
           :image

    field :finished_reading do |book|
      book.user_books.first&.finished || false
    end

    association :users, blueprint: ::V1::UserBlueprint
  end
end
