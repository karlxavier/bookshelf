# frozen_string_literal: true

require 'rails_helper'
require 'shared_contexts'

RSpec.describe 'Books', type: :request do
  describe '#reading_lists' do
    let(:user) { create(:user) }
    let(:url) { '/v1/books/reading_lists' }
    let(:request) { get url, params: params }
    let(:params) { {} }

    before(:each) do
      sign_in(user)
    end

    it 'will fetch all users readling lists' do
      request
      expect(response).to be_ok
      expect(response).to contain_serialized([]).by(Blueprinters::V1::BookBlueprint)
    end
  end
end