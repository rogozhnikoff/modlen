class Product < ActiveRecord::Base
  has_many :variants, dependent: :destroy
  has_many :texts, dependent: :destroy
  has_many :line_items
  accepts_nested_attributes_for :texts

  CRYSTAL_TYPES = ['Basic', 'Swarowski', 'No crystals']
  STOCK_TYPES = ['On order', 'Stock and order', 'Stock for sale']
  LANGUAGES = %w(en)
end
