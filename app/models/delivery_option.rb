class DeliveryOption < ActiveRecord::Base
  has_many :speeds
  accepts_nested_attributes_for :speeds
  has_many :deadline_sewings
  accepts_nested_attributes_for :deadline_sewings
end
