# frozen_string_literal: true

# Api class
module Api
  module V1
    #:nodoc:
    class ApiController < ::ApplicationController
      skip_before_action :verify_authenticity_token
    end
  end
end
