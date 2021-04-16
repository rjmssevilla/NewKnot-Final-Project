class BuyersController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
    @categories = Service.distinct.pluck(:category)
    @categories_array = []
    @categories.each do |category|
      count = Service.where(category: category).count
      average_price = Service.where(category: category).average(:price)
      @categories_array << { category: category, count: count, average_price: average_price }
    end
  end

  def filter
    @services = Service.where('lower(category) = ?', params[:category].downcase)
    @unique_category = @services.distinct.pluck(:category).join
  end

  def profile
    @buyer = Buyer.find(params[:id])
    @services = @buyer.services
    prices = []
    @services.each do |service|
      prices << service.price
    end
    @total = prices.sum
  end
end
