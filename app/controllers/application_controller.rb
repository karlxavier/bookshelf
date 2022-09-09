# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Knock::Authenticable
  include V1::Response

  before_action :authenticate_user, except: %i(create)

  def current_user
    if token
      @_current_user ||= begin
        Knock::AuthToken.new(token: token).entity_for(User)
      rescue
        nil
      end
    else
      super
    end
  end
end
