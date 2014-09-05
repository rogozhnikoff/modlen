class OrdersController < InheritedResources::Base
  before_action :destroy_temp_items

  def show
  end
  def index
    if current_user
      @orders = current_user.orders
    else
      @orders = [@order]
    end
  end
  def change_currency
    session[:currency] = params[:cur]
    @line_item = LineItem.find(params[:item]) unless params[:item] == ''
    @currency = Currency.find_by_code params[:cur]
    respond_to do |format|
      format.js
    end
  end
end
