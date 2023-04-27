class ProfilesController < ApplicationController
  def show
    @purchases = current_user.purchases
    @all_purchase_items = PurchaseItem.all
  end
end
