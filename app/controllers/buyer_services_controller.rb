class BuyerServicesController < ApplicationController
  def create
    @service = Service.find(params[:id])
    @buyer = current_buyer
    @buyer.services << @service
    redirect_to buyer_path(id: current_buyer.id)
  end
end
