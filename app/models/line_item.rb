class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :variant
  belongs_to :order
end
