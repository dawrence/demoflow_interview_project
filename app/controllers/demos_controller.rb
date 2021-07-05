# frozen_string_literal: true

# Demos Controller class
class DemosController < ApplicationController
  def index
    render json: Demo.all # TODO: Update this to active demos.
  end
end
