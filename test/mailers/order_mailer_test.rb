require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "western_union" do
    mail = OrderMailer.western_union
    assert_equal "Western union", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "bank_transfer" do
    mail = OrderMailer.bank_transfer
    assert_equal "Bank transfer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "confirm_payment" do
    mail = OrderMailer.confirm_payment
    assert_equal "Confirm payment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
