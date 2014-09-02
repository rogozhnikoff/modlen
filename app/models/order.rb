class Order < ActiveRecord::Base
  has_many :line_items
  has_one :delivery
  has_one :payment
  belongs_to :user
  has_many :payment_notifications

  def full_price (cur)
    price = 0
    self.line_items.each do |item|
      price += item.price unless (item.status == 'canceled' || item.status == 'temp')
    end
    (price * cur.rate).ceil
  end
  def cart_length
    lng = 0
    self.line_items.each do |item|
      lng+=1 unless (item.status == 'canceled' || item.status == 'temp')
    end
    lng
  end
    def paypal_url(return_url, notify_url, currency)
      del = self.delivery
      values = {
          :business => 'kaboom.ua-facilitator@gmail.com',
          :cmd => '_cart',
          :upload => 1,
          :return => return_url,
          :invoice => id,
          :notify_url => notify_url,
          :currency_code => currency.code.upcase,
          :city => del.city,
          address1: del.street,
          country: del.country,
          sate: del.state,
          zip: del.zip
      }
      self.line_items.each_with_index do |item, index|
        values.merge!({
                          "amount_#{index+1}" => item.get_price(currency),
                          "item_name_#{index+1}" => item.variant.product.name,
                          "item_number_#{index+1}" => item.id,
                          "quantity_#{index+1}" => 1
                      })
      end
      "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    end
end
