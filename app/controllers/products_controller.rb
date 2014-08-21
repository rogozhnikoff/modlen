class ProductsController < InheritedResources::Base
  before_action :current_user
  def index
    @variants = Variant.all
    @products = Product.all
  end
end
