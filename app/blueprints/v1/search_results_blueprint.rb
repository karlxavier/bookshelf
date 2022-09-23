# frozen_string_literal: true

module V1
  class SearchResultsBlueprint < Blueprinter::Base
    identifier :id

    fields :id,
           :title,
           :description,
           :author,
           :image

  end
end
