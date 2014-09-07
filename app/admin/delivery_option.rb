ActiveAdmin.register DeliveryOption do
  permit_params :git_box, speeds_attributes: [:id, :days, :price], deadline_sewings_attributes: [:id, :deadline, :price]

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

  form do |f|
    f.inputs 'Git box' do
      f.input :git_box, label: 'Git box price(EUR)'
    end
    f.inputs 'Deadline sewing' do
      f.has_many :deadline_sewings do |ff|
        ff.input :deadline, as: :select, collection: ['3-4 days', '3-4 weeks'], include_blank:false
        ff.input :price
      end
    end
    f.inputs 'Delivery speed options' do
      f.has_many :speeds do |ff|
        ff.input :days
        ff.input :price
      end
    end
    f.actions
  end

  controller do
    def new
      new! do
      @delivery_option.deadline_sewings.new({deadline: '3-4 days'})
      @delivery_option.deadline_sewings.new({deadline: '3-4 weeks'})
    end
      end
  end
end
