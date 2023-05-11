class PurchasesController < ApplicationController
  # Prevents CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def show
    redirect_to(profiles_path)
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
