class PurchasesController < ApplicationController

  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def show
    @purchases = current_user.purchases
    @all_purchase_items = PurchaseItem.all
  end

  def create
    @@ticket = [current_order.subtotal, current_order.order_items, current_user.email,current_order.total]
    TicketMailer.new_ticket(@@ticket).deliver_now
    purchase()
  end

  private

  def purchase

    @@purchase = Purchase.new(
      :subtotal => current_order.subtotal,
      :total => current_order.total,
      :user_id => current_user.id,
    )
    current_order.order_items.each do |order_item|
      @@purchase.purchase_items.new(
        :quantity => order_item.quantity,
        :product_id => order_item.product_id, 
        :purchase_id => @@purchase.id,
        :total => order_item.total,
        :unit_price => order_item.unit_price,
      )
      order_item.destroy
      end
      @@purchase.save
      current_order.destroy
      session[:order_id] = nil
      redirect_to(profiles_path)
  end

end
