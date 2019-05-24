FactoryGirl.define do
	factory :post do
	    title "title" 
	    body "post"
	    image { File.new("#{Rails.root}/spec/photos/background.jpg") } 
	    association :author
	end
end 