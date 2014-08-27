ActiveAdmin.register Crystal do

  permit_params :name, :amount, :price
  form do |f|
    f.inputs do
      f.input :name, as: :select, collection: %w(Basic Swarowski), include_blank: false
      f.input :amount, as: :select, collection: [0, 500, 1000, 1500, 2000, 2500], include_blank: false
      f.input :price
    end
    f.actions
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
