class Api::ShipmentsController < ApplicationController

  respond_to :json

  def index
    respond_with ShipmentDecorator.all
  end

  def show
    @shipment = Shipment.find params[:id]
    respond_with @shipment
  end

  # PUT /api/shipments/1.json
  def update
    @shipment= Shipment.find params[:id]

    if @shipment.update_attributes params[:shipment]
      head :no_content
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end

  # POST /api/shipments.json
  def create
    @shipment = Shipment.new params[:shipment]

    if @shipment.save
      render json: @shipment, status: :created, location: @shipment
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end
end
