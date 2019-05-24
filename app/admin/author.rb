ActiveAdmin.register Author do
	permit_params :name, :position, :avatar 

  index do
    selectable_column
    column :name
    column :position
    actions
  end

  show do
    p author.name
    p author.position
  end

  form do |f|
    f.inputs 'Author Editing' do
      f.input :name
      f.input :position
      f.input :avatar, hint: f.author.avatar? ? image_tag(author.avatar.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end