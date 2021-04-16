class BuyerServicesController < ApplicationController
  def create
    @service = Service.find(params[:id])
    @buyer = current_buyer
    @buyer.services << @service
    redirect_to buyers_profile_path(id: current_buyer.id)
  end

  def destroy
    @service = BuyerService.find(params[:id])
    @service.destroy
    redirect_to buyers_profile_path(id: current_buyer.id)
  end
end
