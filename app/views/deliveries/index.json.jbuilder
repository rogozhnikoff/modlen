json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :delivery_date, :deadline, :speed, :full_name, :street, :city, :state, :country, :zip, :email, :tel, :info, :git_box
  json.url delivery_url(delivery, format: :json)
end
