# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  included do
    SEARCHABLE_FIELDS = %w(title description author)

    SEARCHABLE_FIELDS.each do |attr|
      scope "search_by_#{attr}".to_sym, ->(value) do
        where("#{attr} LIKE ?", "%#{value}%")
      end
    end
  end

  module ClassMethods
    def search(keyword:)
      outcome = []

      SEARCHABLE_FIELDS.each do |key|
        results = self.public_send("search_by_#{key}", keyword).as_json
        next if results.blank?

        results.each { |result| outcome << result }
      end
      outcome
    end
  end
end