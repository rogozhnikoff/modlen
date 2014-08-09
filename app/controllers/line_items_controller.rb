class LineItemsController < InheritedResources::Base
  include CurrentOrder
  before_action :set_order

  def new
    @line_item = @order.line_items.new()
    @line_item.variant = Variant.find(params[:variant_id])
  end
  def create
    @line_item = LineItem.create(item_params)
    respond_to do |format|
      format.html {redirect_to  @order}
    end
  end
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to order_path(@order), notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private

  def item_params
    params.require(:line_item).permit(:units, :size, :age, :height, :chest, :waist, :hips, :biceps, :elbow, :wrist,
                                      :collar, :shoulder, :neck_circle, :from_neck, :to_waist, :to_skirt, :sleeves,
                                      :skirt, :body, :crystal_type, :crystal_amount, :special_request, :model_name,
                                      :price, :product_id, :variant_id, :order_id)
  end
end

