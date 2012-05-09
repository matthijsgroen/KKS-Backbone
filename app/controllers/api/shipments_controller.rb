class Api::ShipmentsController < ApplicationController

  respond_to :json

  def index
    respond_with ShipmentDecorator.all
  end
end
