# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/western_union
  def western_union
    OrderMailer.western_union
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/bank_transfer
  def bank_transfer
    OrderMailer.bank_transfer
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/confirm_payment
  def confirm_payment
    OrderMailer.confirm_payment
  end

end
