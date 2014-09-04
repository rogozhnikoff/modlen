class LineItemsController < InheritedResources::Base
  before_action :current_line_item, only: [:edit, :update, :destroy, :cancel, :put_back, :plus_one]
  load_and_authorize_resource

  def new
    @temp_item = LineItem.find(params[:id])
    @line_item = @order.line_items.new()
    @line_item.crystal_type = @temp_item.crystal_type
    @line_item.crystal_amount = @temp_item.crystal_amount
    @line_item.price = @temp_item.variant.product.price
    @line_item.variant = @temp_item.variant
    @line_item.collar_present = @temp_item.variant.product.collar_present
    @line_item.skirt_present = @temp_item.variant.product.skirt_present
    @line_item.sleeves_present = @temp_item.variant.product.sleeves_present
    @line_item.save
    rescue ActiveRecord::RecordNotFound
    @line_item = @order.line_items.new()
    @line_item.variant = Variant.find(params[:variant_id])
    @line_item.crystal_type = @line_item.variant.product.crystal_type
    @line_item.crystal_amount = @line_item.variant.product.crystal_amount
    @line_item.price = @line_item.variant.product.price
    @line_item.collar_present = @line_item.variant.product.collar_present
    @line_item.skirt_present = @line_item.variant.product.skirt_present
    @line_item.sleeves_present = @line_item.variant.product.sleeves_present
    @line_item.save
    respond_to do |format|
      format.html {redirect_to edit_line_item_path @line_item}
    end
  end

  def create
      @line_item = LineItem.new(item_params)
      @line_item.price = @line_item.variant.product.price
      @line_item.save

    respond_to do |format|
      if params[:commit] == 'next'
        format.html {redirect_to  my_cart_url}
      elsif params[:commit] == 'new'
        format.html {redirect_to action: 'new', id: @line_item.id}
      else
        format.html {redirect_to root_path}
      end
    end
  end

  def edit
    @line_item.order = @order
    @line_item.save
  end
  def update
    @line_item.update! item_params
    @line_item.price = make_price
    @line_item.status = '' if params[:commit] == 'new'
    @line_item.save
    @update_url = edit_line_item_path @line_item
    @cart = my_cart_url
    respond_to do |format|
      format.js
    end
    end

  def cancel
    @line_item.status = 'canceled'
    @line_item.save
    respond_to do |format|
      format.js
      format.html { redirect_to my_cart_url }
      format.json { head :no_content }
    end
  end
  def put_back
    @line_item.status = ''
    @line_item.save
    respond_to do |format|
      format.js {render 'cancel'}
    end
  end
  def plus_one
    @new_item = LineItem.create!({variant_id: @line_item.variant.id,
                                  order_id: @order.id,
                                  crystal_type: @line_item.variant.product.crystal_type,
                                  crystal_amount: @line_item.variant.product.crystal_amount,
                                  price: @line_item.variant.product.price,
                                  collar_present: @line_item.variant.product.collar_present,
                                  skirt_present: @line_item.variant.product.skirt_present,
                                  sleeves_present: @line_item.variant.product.sleeves_present})
    respond_to do |format|
      format.js
    end
  end
  def destroy
    @line_item.delete
    LineItem.delete_all
    respond_to do |format|
      format.html {redirect_to root_path}
    end
  end
  private
  def current_line_item
    @line_item = LineItem.find params[:id]
  end
  def item_params
    params.require(:line_item).permit(:units, :size, :age, :height, :chest, :waist, :hips, :biceps, :elbow, :wrist,
                                      :collar, :shoulder, :neck_circle, :from_neck, :to_waist, :to_skirt, :sleeves,
                                      :skirt, :body, :crystal_type, :crystal_amount, :special_request, :model_name,
                                      :price, :product_id, :variant_id, :order_id, :colors_additions,
                                      :collar_present, :skirt_present, :sleeves_present)
  end
  def custom_price

  end
  def my_cart_url
    if @order.delivery.nil?
      new_delivery_path
    else
      edit_delivery_path(@order.delivery)
    end
  end

  def make_price
    item = @line_item
    product = item.variant.product
    price = product.price

    options = ['collar', 'skirt', 'sleeves']
    options.each do |option|
    if product["#{option}_present".to_sym]
      price -= product["#{option}_price".to_sym] unless item["#{option}_present".to_sym]
    else
      price += product["#{option}_price".to_sym] if item["#{option}_present".to_sym]
    end
    end

    amount = (((@line_item.crystal_amount)/500).ceil) * 500
    type = @line_item.crystal_type
    unless type == 'No crystals'
    @crystal = Crystal.where('name= ?', type).select {|cr| cr.amount == amount}
    @crystal = @crystal.first
    price += @crystal.price
    end

    price
  end

end

