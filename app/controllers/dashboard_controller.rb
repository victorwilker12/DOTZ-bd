class DashboardController < ApplicationController
  def index
    @purchases = Purchase.all
    @products = Product.all
    @client = Client.all
  end


  #update user
  
end
