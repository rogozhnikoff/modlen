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
    (price += self.delivery.price) if self.delivery
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
          :business => ' paypal@westernbid.com',
          :cmd => '_cart',
          :upload => 1,
          :return => return_url,
          :invoice => id,
          :notify_url => notify_url,
          :currency_code => currency.code.upcase,
          :city => del.city,
          no_shipping: 1,
          address1: del.street,
          country: del.country,
          sate: del.state,
          zip: del.zip,
=begin
          address_override: 1,
=end
          first_name: del.full_name.split(' ')[0],
          last_name: del.full_name.split(' ')[1]
      }
      self.line_items.each_with_index do |item, index|
        values.merge!({
                          "amount_#{index+2}" => item.get_price(currency),
                          "item_name_#{index+2}" => item.variant.product.name,
                          "item_number_#{index+2}" => item.id,
                          "quantity_#{index+2}" => 1
                      })
      end
      values.merge!({
                        'amount_1' => get_price(self.delivery.price, currency),
                        'item_name_1' => 'Shipping'
                    })
      "https://www.paypal.com/cgi-bin/webscr?" + values.to_query
    end
  private
  def get_price (price, cur)
    return (price*cur.rate).ceil
  end

end
