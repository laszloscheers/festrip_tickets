class BasketsController < ApplicationController
  # Prevents CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  
  def show
    @order_items = current_order.order_items
  end
end
