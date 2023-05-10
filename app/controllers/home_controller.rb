class HomeController < ApplicationController
  # Prevents CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  def index
    @products = Product.all
  end
end
