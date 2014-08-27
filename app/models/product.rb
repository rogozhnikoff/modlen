class Product < ActiveRecord::Base
  has_many :variants, dependent: :destroy
  has_many :texts, dependent: :destroy
  has_many :line_items
  accepts_nested_attributes_for :texts

  CRYSTAL_TYPES = ['Basic', 'Swarowski', 'No crystals']
  STOCK_TYPES = ['On order', 'Stock and order', 'Stock for sale']
  LANGUAGES = %w(en)

  def get_price (cur)
    (self.price*cur.rate).ceil
  end
  def get_old_price (cur)
    (self.old_price*cur.rate).ceil
  end
end
