ActiveAdmin.register Product do

  permit_params  :name, :price, :old_price, :description, :short_desc, :crystal_type, :crystal_amount,
                 :sleeves, :skirt, :collar, :stock_for_sale, :title, :public, :images
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
  form html: {multipart: true}do |f|
   f.inputs 'Main' do
     f.input :name
     f.input :description
     f.input :short_desc
     f.input :title
     f.input :stock_for_sale
     f.input :price
     f.input :old_price
     f.input :public
   end
   f.inputs 'details' do
     f.input :crystal_type
     f.input :crystal_amount
     f.input :sleeves
     f.input :skirt
     f.input :collar
   end
   f.inputs 'variant' do
     file_field_tag("images[]", multiple: true, name: "images[]")
   end
    f.actions
  end
  controller do
    def create
    create! do |format|
    if params[:images]
      @variant = @product.variants.new(name: 'main')
      #===== The magic is here ;)
      params[:images].each { |image|
        pic = Picture.new(image: image)
        pic.variant = @variant
        pic.save
      }

    end
    format.html {redirect_to new_admin_variant_url({product_id: @product.id})}
    end
    end
    end

end
