require 'spec_helper'

describe Post do
	it 'New post' do
		@post = FactoryGirl.build(:post)
		expect(@post.title).to eq("title")
    	expect(@post.body).to eq("post")
    end

    context 'valid' do
	    subject { FactoryGirl.create(:post) } 
	    it { should be_valid(:title ) }
	    it { should be_valid(:body) }
	    it { should be_valid(:image) }
	    it { should be_valid(:author) }
   end
end
