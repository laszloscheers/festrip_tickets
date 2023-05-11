class WorldMapController < ApplicationController
  # Prevents CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end
end
