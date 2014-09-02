class PaymentNotification < ActiveRecord::Base
  belongs_to :order
  serialize :params
  after_create :mark_cart_as_purchased

  private

  def mark_cart_as_purchased
    if status == "Completed"
      order.update_attribute(:status, 'Purchased')
      unless order.user
        user = User.create!(email: order.delivery.email, name: order.delivery.full_name, role: 'customer',
                            password: 'password', password_confirmation: 'password')
        order.user = user
        order.save
      end
    end
    end
end
