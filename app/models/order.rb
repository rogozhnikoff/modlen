class Order < ActiveRecord::Base
  has_many :line_items
  has_one :delivery
end
