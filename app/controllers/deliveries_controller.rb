class DeliveriesController < InheritedResources::Base
  before_action :destroy_temp_items
  before_action :get_delivery, except: [:new, :create, :index]
  def index
    @deliveries = Delivery.all
  end
  def new
    @opt = DeliveryOption.find(1)
    @delivery = Delivery.new
    @delivery.order = @order
    @delivery.deadline = '3-4 days'
    @delivery.speed = 7
    @delivery.price = get_del_price
    @delivery.save
    respond_to do |format|
      format.html {redirect_to edit_delivery_path @delivery}
    end

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
    @opt = DeliveryOption.find(1)
  end

  def update
    @opt = DeliveryOption.find(1)
    @delivery.update! delivery_params
    @delivery.price = get_del_price
    @delivery.save
    @commit = params[:commit]
    respond_to do |format|
        format.js
    end
    end
  private
  def get_delivery
    @delivery = Delivery.find params[:id]
  end
  def delivery_params
    params.require(:delivery).permit(:delivery_date, :deadline, :speed, :full_name, :street, :city, :country, :state, :zip, :email,
                                     :tel, :info, :git_box)
  end
  def get_del_price
    cost = @opt.deadline_sewings.find_by(deadline: @delivery.deadline).price + @opt.speeds.find_by_days(@delivery.speed).price
    cost += @opt.git_box if @delivery.git_box
    return cost
  end

end
