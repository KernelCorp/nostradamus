ActiveAdmin.register Category do
  permit_params :name, :image

  form do |f|
    f.inputs do
      f.input :name
      f.input :image, as: :file
      f.input :priority
    end
    f.actions
  end
end
