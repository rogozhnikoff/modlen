class VariantsController < ApplicationController
  def show
    @variant = Variant.find params[:id]
    @product = @variant.product
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
end
