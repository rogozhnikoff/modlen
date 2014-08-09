class Variant < ActiveRecord::Base
  belongs_to :product
  has_many :line_items
  has_many :pictures, dependent: :destroy
  has_many :colors
  accepts_nested_attributes_for :colors
end
