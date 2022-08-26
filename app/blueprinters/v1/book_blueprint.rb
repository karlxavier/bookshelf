# frozen_string_literal: true

module Blueprinters
  module V1
    class BookBlueprint < Blueprinter::Base
      identifier :id

      fields :title,
             :description,
             :author

      field :finished_reading do |book|
        book.user_books.first.finished
      end

      association :users, blueprint: Blueprinters::V1::UserBlueprint
    end
  end
end
