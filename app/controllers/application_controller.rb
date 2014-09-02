class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_guest_or_user
  before_filter :current_currency
  before_filter :set_order
  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path
    end
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.admin?
    current_user
  end
  def set_guest_or_user
    @user = current_user
    unless @user.nil?
      return @guest = @user
    end
    @guest = Guest.find(session[:guest_id])
  rescue ActiveRecord::RecordNotFound
    @guest = Guest.create!
    session[:guest_id] = @guest.id
  end

  def current_currency
    if session[:currency]
    @currency = Currency.find_by_code session[:currency]
    else
    session[:currency] = 'eur'
    @currency = Currency.find_by_code('eur')
      end
  end

  def destroy_temp_items
    @order.line_items.each do |item|
      item.delete if item.status == 'temp' or item.status == 'canceled'
    end
  end
private
  def set_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.new
    @order.user = current_user if current_user
    @order.save
    session[:order_id] = @order.id
  end
end
