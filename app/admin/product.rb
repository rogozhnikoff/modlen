ActiveAdmin.register Product do

  permit_params  :name, :price, :old_price, :description, :short_desc, :crystal_type, :crystal_amount,
                 :sleeves, :skirt, :collar, :stock_for_sale, :title, :public, :images,
                 texts_attributes: [:id, :language, :description, :short_desc, :title, :_destroy]
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
   f.inputs do
     f.has_many :texts, allow_destroy: true, heading: 'Add translation' do |ff|
      ff.input :language
      ff.input :title
      ff.input :description
      ff.input :short_desc
     end
   end
   f.inputs do
     submit_tag "Save and add variants"
   end
   f.actions


  end

  index do
    column :name
    column :price
    column :public
    column :crystal_type
    column :crystal_amount
    actions
  end

  filter :name
  filter :price
  filter :crystal_amount

  controller do
    def create
    create! do |format|
    if params[:commit].include? 'variant'
      format.html {redirect_to new_admin_variant_url({product_id: @product.id})}
    end
    end
    end
    def update
      update! do |format|
        if params[:commit].include? 'variant'
          format.html {redirect_to new_admin_variant_url({product_id: @product.id})}
        end
      end
    end
    end

end
