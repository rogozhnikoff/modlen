ActiveAdmin.register Variant do
  menu parent: 'Products'
  permit_params :name, :default, :product_id, :color_id, :images, colors_attributes: [:name, :id], color_ids: [:id]
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
      f.input :color, label: 'Main color'
      f.input :default
    end
    f.inputs 'Colors' do
      f.input :colors, as: :check_boxes
=begin
      f.input :id, as: :check_boxes, multiple: true, collection: Color.all, selected: @colors
      f.input :colors_variants, as: :check_boxes, collection: Color.all.map{|c| c.name}
=end
    end
    f.inputs do
      file_field_tag("images[]", multiple: true, name: "images[]")
    end

    f.actions
    f.inputs do
      button_to 'Save and add more variants'
    end
  end
  show do |variant|
    h2 "#{variant.name}"
    attributes_table do
      row 'Main color' do variant.color.name end
      row 'Default' do variant.default end
    variant.colors.each do |color|
      row 'Color' do color.name end
    end
      rows :created_at, :updated_at
      end
  end
  index do
    column :name
    column :color
    column :product
    actions
  end

  controller do
    def create
      create! do |format|

        add_images

        ch_default

        unless params[:commit]
          format.html {redirect_to new_admin_variant_url({product_id: @variant.product.id})}
        end
        end
    end
    def update
      update! do |format|
      add_images
      ch_default

        unless params[:commit]
          format.html {redirect_to new_admin_variant_url({product_id: @variant.product.id})}
        end
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

private
def ch_default
  if @variant.default
    @variant.product.variants.each do |v|
      puts v.name
      v.default = false if v != @variant
      v.save
      puts "#{v.name} = #{v.default}"
    end
  end
end

def add_images
  if params[:images]
    #===== The magic is here ;)
    params[:images].each { |image|
      pic = Picture.new(image: image)
      pic.variant = @variant
      pic.save
    }
  end
  @variant.colors.delete_all
  colors = params[:variant][:color_ids]
  colors.shift
  colors.each do |s|
    @variant.colors << Color.find(s.to_i)
  end
end