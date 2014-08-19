class Color < ActiveRecord::Base
  has_and_belongs_to_many :variants
  has_one :variant
end
