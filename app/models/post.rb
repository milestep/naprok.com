class Post < ApplicationRecord
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, :image, :author, presence: true
	belongs_to :author

	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def self.search(search)
  	where("title ILIKE ?", "%#{search}%") 
	end

	extend FriendlyId
  	friendly_id :title, use: :slugged
end
