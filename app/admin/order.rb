ActiveAdmin.register Order do
item_params = [:status, :size, :age, :height, :chest, :waist, :hips, :biceps, :elbow, :wrist,
               :collar, :shoulder, :neck_circle, :from_neck, :to_waist, :to_skirt, :sleeves,
               :skirt, :body, :crystal_type, :crystal_amount, :special_request, :model_name,
               :price, :colors_additions, :collar_present, :skirt_present, :sleeves_present]
delivery_params = [:delivery_date, :deadline, :speed, :full_name, :street, :city, :state, :zip, :email,
                   :tel, :info, :git_box]
permit_params :status, :user_id
  show do |order|
      attributes_table do
        row 'Cost' do order.full_price Currency.find_by_code('usd') end
      end
    div class: 'panel' do
      h3 do "Delivery:" end
      table do
        delivery_params.each do |del|
          tr do
          td do del.to_s end
          td do
            "#{order.delivery[del]}"
          end
            end
        end
      end
    end

    order.line_items.each do |item|
    div class: 'panel' do
      h3 do "Product:   #{item.variant.product.name}" end
      h3 do "Variant:   #{item.variant.color.name}" end
      table do
      item_params.each do |var|
          tr do
            td do
              var.to_s
            end
            td do
              item[var]
            end
          end
      end
        end
      end
    end

  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end


end
