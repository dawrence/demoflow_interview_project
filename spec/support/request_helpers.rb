# frozen_string_literal: true

module RequestHelpers
  # In a request spec, use json_body in place of request.body`
  def json_body
    JSON.parse(response.body)
  end
end
