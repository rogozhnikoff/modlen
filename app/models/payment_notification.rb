class PaymentNotification < ActiveRecord::Base
  belongs_to :order
  serialize :params
  after_create :mark_cart_as_purchased

  private

  def mark_cart_as_purchased
    if status == "Completed"
      order.update_attribute(:status, 'Purchased')
      unless order.user
        pass = (0...8).map { (65 + rand(26)).chr }.join
        user = User.create!(email: order.delivery.email, name: order.delivery.full_name, role: 'customer',
                            password: pass, password_confirmation: pass)
        order.user = user
        order.save
      end
      OrderMailer.confirm_payment(order).deliver
    end
    end
end
