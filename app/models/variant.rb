class Variant < ActiveRecord::Base
  belongs_to :product
  belongs_to :line_item
  has_many :pictures, dependent: :destroy
end
