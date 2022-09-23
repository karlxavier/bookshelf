module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :title, type: :text
      indexes :author, type: :text
      indexes :description, type: :text
    end

    def self.search(query)
      params = {
        query: {
          bool: {
            should: [
              { match: { title: { query: query, boost: 5, fuzziness: "AUTO" } }},
              { match: { description: query }},
              { match: { author: { query: query, fuzziness: "AUTO" } }},
            ],
          }
        },
        highlight: { fields: { title: {}, description: {}, author: {} } }
      }
  
      self.__elasticsearch__.search(params)
    end
  end
end