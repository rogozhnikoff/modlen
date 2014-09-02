class DeliveriesController < InheritedResources::Base
  before_action :destroy_temp_items
  before_action :get_delivery, except: [:new, :create, :index]
  def index
    @deliveries = Delivery.all
  end
  def new
    @delivery = Delivery.new
    @delivery.order = @order
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.order = @order
    @delivery.save
    respond_to do |format|
      format.html {redirect_to checkout_order_path @order}
    end
  end

  def edit
  end
  def update
    @delivery.update! delivery_params
    respond_to do |format|
      format.html {redirect_to checkout_order_path @order}
    end
  end
  private
  def get_delivery
    @delivery = Delivery.find params[:id]
  end
  def delivery_params
    params.require(:delivery).permit(:delivery_date, :deadline, :speed, :full_name, :street, :city, :state, :zip, :email,
                                     :tel, :info, :git_box)
  end

end
