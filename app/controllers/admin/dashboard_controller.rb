class Admin::DashboardController < ApplicationController
   http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  def show
    @products_inventory = Product.all
    @categories_inventory = Category.all
  end
end
