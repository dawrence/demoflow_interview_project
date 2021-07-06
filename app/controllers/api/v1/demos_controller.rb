# frozen_string_literal: true

# Demos Controller class
module Api
  module V1
    #:nodoc:
    class DemosController < ApiController
      def index
        render json: Demo.all # TODO: Update this to active demos.
      end

      def show
        render json: Demo.find(params[:id])
      end
    end
  end
end
