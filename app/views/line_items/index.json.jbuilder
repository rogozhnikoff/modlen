json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :units, :size, :age, :height, :chest, :waist, :hips, :biceps, :elbow, :wrist, :collar, :shoulder, :neck_circle, :from_neck, :to_waist, :to_skirt, :sleeves, :skirt, :body, :crystal_type, :crystal_amount, :special_request, :model_name, :price, :product_id, :variant_id, :order_id
  json.url line_item_url(line_item, format: :json)
end
