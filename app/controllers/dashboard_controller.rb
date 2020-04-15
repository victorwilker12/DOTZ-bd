class DashboardController < ApplicationController
  def index
    @purchases = Purchase.all
    @products = Product.all
  end
end
