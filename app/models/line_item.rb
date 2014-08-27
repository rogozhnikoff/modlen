class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :variant
  belongs_to :order

  def get_price (cur)
    (self.price * cur.rate).ceil
  end
  def sleeves_price (cur)
    (self.variant.product.sleeves_price * cur.rate).ceil
  end
  def collar_price (cur)
    (self.variant.product.collar_price * cur.rate).ceil
  end
  def skirt_price (cur)
    (self.variant.product.skirt_price * cur.rate).ceil
  end
end
