ActiveAdmin.register Question do
  permit_params :title, :text
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
    f.inputs do
      f.input :title
      f.input :text
      f.input :category
      f.input :user
      f.input :image,      as: :file
      f.input :start_date, as: :datetime
      f.input :end_date,   as: :datetime
    end
    f.actions
  end
end
