# frozen_string_literal: true

class ApplicationController < ActionController::API
  include V1::Response

  before_action :authenticate_v1_user!
end
