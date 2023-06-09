class OrderItemsController < ApplicationController
    # Prevents CSRF attacks by raising an exception.
    protect_from_forgery with: :exception
    
    def create

        @order = current_order
        @order_item = @order.order_items.new(order_params)
        @order.save
        session[:order_id] = @order.id
        redirect_to(basket_path)
    end

    def update

        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.update(order_params)
        @order_items = current_order.order_items
        redirect_to(basket_path)
    end

    def destroy

        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        @order_items = current_order.order_items
        redirect_to(basket_path)
    end

    private

    def order_params
        params.require(:order_item).permit(:product_id, :quantity)
    end
    
end
