class SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find(params[:id])
    @services = @supplier.services
  end
end
