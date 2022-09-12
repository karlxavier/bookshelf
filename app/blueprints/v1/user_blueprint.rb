# frozen_string_literal: true

module V1
  class UserBlueprint < Blueprinter::Base
    identifier :id

    field :email
  end
end
