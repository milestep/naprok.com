require 'spec_helper'

describe Author do
	it 'New author' do
		@author = FactoryGirl.build(:author)
		expect(@author.name).to eq("user")
    	expect(@author.position).to eq("example")
    end

    context 'valid' do
	    subject { FactoryGirl.create(:author) } 
	    it { should be_valid(:name ) }
	    it { should be_valid(:position) }
	    it { should be_valid(:avatar) }
   end
end
