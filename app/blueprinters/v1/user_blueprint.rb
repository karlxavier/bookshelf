# frozen_string_literal: true

module Blueprinters
  module V2
    class UserBlueprint < Blueprinter::Base
      identifier :id

      field :email
    end
  end
end
