class ProfilesController < ApplicationController
  # Prevents CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  def show
    @purchases = current_user.purchases
    @all_purchase_items = PurchaseItem.all
  end
end
