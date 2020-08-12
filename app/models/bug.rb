class Bug < ApplicationRecord

	belongs_to :project
	belongs_to :user
	# belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
	# belongs_to :assign_to, foreign_key: 'assign_to_id', class_name: 'User'

	validates :title, presence: true, uniqueness: { scope: :project_id, case_sensitive: false }
	validates :deadline, :bug_type, :status, presence: true

	# validates :screenshot, content_type: ['image/png', 'image/gif']
	mount_uploader :screenshot, ImageUploader
end
