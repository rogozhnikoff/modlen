class Product < ActiveRecord::Base
  has_many :variants, dependent: :destroy
  has_many :texts, dependent: :destroy
  has_many :line_items
  accepts_nested_attributes_for :texts
end
