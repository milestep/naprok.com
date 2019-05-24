FactoryGirl.define do
	factory :author do
	  name "user" 
	  position "example"
		avatar { File.new("#{Rails.root}/spec/photos/test.png") } 
	end
end 