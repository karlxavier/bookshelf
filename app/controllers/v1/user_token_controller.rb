module V1
  class UserTokenController < Knock::AuthTokenController
    skip_before_action :verify_authenticity_token, raise: false

    def create
      render json: {
        jwt: auth_token.token
      }, status: :created
    end
  end
end
