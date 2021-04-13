class BuyersController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
    @categories = Service.distinct(:category).pluck(:category)
    @categories_count = []
    @categories.each do |category|
      count = Service.where(category: category).count
      @categories_count << { category: category, count: count }
    end
  end

  def filter
    @services = Service.where('lower(category) = ?', params[:category].downcase)
  end

  def profile
  end
end
