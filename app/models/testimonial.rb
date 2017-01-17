class Testimonial < ApplicationRecord
	has_attached_file :avatar
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def short_description
		content.truncate(75) 
	end
end
