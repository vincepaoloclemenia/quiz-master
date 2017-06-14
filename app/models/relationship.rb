class Relationship < ApplicationRecord

    belongs_to :enroller, class_name: "User"
	belongs_to :enrolled, class_name: "User"
	validates :enroller_id, presence: true
	validates :enrolled_id, presence: true

end
