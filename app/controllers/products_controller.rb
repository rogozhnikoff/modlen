class ProductsController < InheritedResources::Base
  before_action :current_user
  before_action :destroy_temp_items
  def index
    @variants = Variant.all
    @products = Product.all
  end

end
