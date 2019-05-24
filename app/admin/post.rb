ActiveAdmin.register Post do
	controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).last!
    rescue ActiveRecord::RecordNotFound
      scoped_collection.find(params[:id])
    end
  end

	permit_params :title, :body, :image, :author_id, :author

  index do
    selectable_column
    column :title
    column :author
    actions
  end

		show do |t|
			attributes_table do
				row :title
				row :body
				row :author
				row :image do
					post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, "No photo yet")
				end
			end
		end

		form :html => { :enctype => "multipart/form-data" } do |f|
			f.inputs 'Post Editing' do
				f.input :title
				f.input :body, :as => :ckeditor
				f.input :author 
				f.input :image, hint: f.post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
			end
			f.actions
		end
end

