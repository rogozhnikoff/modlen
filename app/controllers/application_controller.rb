class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_guest_or_user
  before_filter :current_currency
  before_filter :set_order
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password)
    }
  end

  #called by last route matching unmatched routes.  Raises RoutingError which will be rescued from in the same way as other exceptions.
  def raise_not_found!
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end

  #render 500 error
  def render_error
    respond_to do |f|
      f.html{ render :template => "errors/500", :status => 500 }
      f.js{ render :partial => "errors/ajax_500", :status => 500 }
    end
  end

  #render 404 error
  def render_not_found
    respond_to do |f|
      f.html{ render :template => "errors/404", :status => 404 }
      f.js{ render :partial => "errors/ajax_404", :status => 404 }
    end
  end


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
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
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
