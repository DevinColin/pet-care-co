class Walker < ApplicationRecord
	has_attached_file :avatar
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def short_bio
			bio.truncate(75)
	end

end
