module V1
  module Response
    extend ActiveSupport::Concern

    def render_blueprint_api(data:, blueprint: nil, scope: {}, params: {}, status: nil, view: nil)
      return render(json: data, adapter: :json, root: :data) if blueprint.nil?

      render(
        json: blueprint.render(
          data,
          root: :data,
          scope:,
          params:,
          view:
        ),
        status: status
      )
    end
  end
end