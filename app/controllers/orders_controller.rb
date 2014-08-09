class OrdersController < InheritedResources::Base
  include CurrentOrder
  before_action :set_order
  def show
  end
end
