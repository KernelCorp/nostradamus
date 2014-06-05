ActiveAdmin.register Category do
  permit_params :name, :image, :priority, :is_visible

  controller do
    defaults finder: :find
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :image, as: :file
      f.input :priority
      f.input :is_visible, as: :boolean
    end
    f.actions
  end
end
