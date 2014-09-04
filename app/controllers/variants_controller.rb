class VariantsController < ApplicationController
  load_and_authorize_resource
  def show
    @variant = Variant.find params[:id]
    @product = @variant.product
    @line_item = LineItem.new()
    @line_item.variant = @variant
    @line_item.crystal_type = @line_item.variant.product.crystal_type
    @line_item.crystal_amount = @line_item.variant.product.crystal_amount

    @line_item.sleeves_present =@line_item.variant.product.sleeves_present
    @line_item.skirt_present =@line_item.variant.product.skirt_present
    @line_item.collar_present =@line_item.variant.product.collar_present
    @line_item.order = @order
    @line_item.status = 'temp'
    @line_item.save
  end
  def like
    @variant =  Variant.find params[:id]
    @guest.variants << @variant
    respond_to do |format|
      format.html {redirect_to root_path, alert: 'item was liked'}
      format.js
    end
  end

  def dislike
    @variant =  Variant.find params[:id]
    @guest.variants.delete(params[:id])
    respond_to do |format|
      format.html {redirect_to root_path, alert: 'item was liked'}
      format.js {render 'variants/like'}
    end
  end

  def change_color
    @variant = Variant.find params[:id]
    @block = params[:block]
    respond_to do |format|
      format.js
    end
  end

  def change_variant
    @variant = Variant.find params[:id]
    respond_to do |format|
      format.js
    end
  end
  def index
    @variants = @guest.variants
  end
end
