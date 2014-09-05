class OrderMailer < ActionMailer::Base
  default from: "i@roma.if.ua"

  def western_union(order)
    set_vars order
    mail to: @delivery.email
  end


  def bank_transfer(order)
    set_vars order
    mail to: @delivery.email
  end


  def confirm_payment(order)
    set_vars order
    mail to: @delivery.email
  end
  private
  def set_vars(order)
    @order = order
    @customer = order.user
    @items = order.line_items
    @delivery = order.delivery
  end
end
