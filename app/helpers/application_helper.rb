module ApplicationHelper
  def resource_name
    :user
  end

  def user_resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def cart_url
    edit_delivery_path(@order.delivery)
  rescue
    new_delivery_path
  end

  def get_price (price, cur)
    return (price*cur.rate).ceil
  end

end

