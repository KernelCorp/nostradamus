ActiveAdmin.register Question do
  permit_params :title, :text, :image, :user, :category, :start_date, :end_date
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
  index do
    selectable_column
    column :title
    column :text
    column :end_date
    column :right_answer
    column :answers_count do |q|
      q.answers.count
    end
  end

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

  controller do
    include DateTimeParams
    before_action only: [:create, :update] do
      set_datetime :question, :start_date
      set_datetime :question, :end_date
    end
  end
end
