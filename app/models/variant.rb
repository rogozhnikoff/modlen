class Variant < ActiveRecord::Base
  belongs_to :product
  has_many :line_items
  has_many :pictures, dependent: :destroy
  has_and_belongs_to_many :colors
  accepts_nested_attributes_for :colors
  belongs_to :color
end
