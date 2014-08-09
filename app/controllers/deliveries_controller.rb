class DeliveriesController < InheritedResources::Base
  include CurrentOrder
  before_action :set_order
  def new
    @delivery = @order.delivery.new
  end
end
