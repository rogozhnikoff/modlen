ActiveAdmin.register Variant do

  permit_params :name, :product_id, :images
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
  form html: { multipart: true } do |f|
    f.inputs do
      f.input :name
      f.input :product
    end
    f.inputs do
      file_field_tag("images[]", multiple: true, name: "images[]")
    end

    f.actions
  end

  controller do
    def create
      super
      if params[:images]
        #===== The magic is here ;)
        params[:images].each { |image|
          pic = Picture.new(image: image)
          pic.variant = @variant
          pic.save
        }
      end
    end
    def new
      if params[:product_id]
        @variant = Product.find(params[:product_id]).variants.new()
      else
        @variant = Variant.new
      end
    end
  end
end
