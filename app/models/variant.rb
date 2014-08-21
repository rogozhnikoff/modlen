class Variant < ActiveRecord::Base
  belongs_to :product
  has_many :line_items
  has_many :pictures, dependent: :destroy
  has_and_belongs_to_many :colors
  has_and_belongs_to_many :users
  has_and_belongs_to_many :guests
  accepts_nested_attributes_for :colors
  accepts_nested_attributes_for :pictures,:allow_destroy => true
  belongs_to :color
end
