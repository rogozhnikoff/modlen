class ProductsController < InheritedResources::Base
  before_action :current_user
  before_action :destroy_temp_items
  load_and_authorize_resource

  def index
    @variants = Variant.all
    @products = Product.all
  end

end
