class Order < ActiveRecord::Base
  has_many :line_items
  has_one :delivery
  has_one :payment
  belongs_to :user

  def full_price (cur)
    price = 0
    self.line_items.each do |item|
      price += item.price unless (item.status == 'canceled' || item.status == 'temp')
    end
    (price * cur.rate).ceil
  end
  def cart_length
    lng = 0
    self.line_items.each do |item|
      lng+=1 unless (item.status == 'canceled' || item.status == 'temp')
    end
    lng
  end
end
