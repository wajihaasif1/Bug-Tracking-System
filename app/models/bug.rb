class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :developer, class_name: :User, optional: true
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'

  validates :title, presence: true, uniqueness: { scope: :project_id, case_sensitive: false }
  validates :deadline, :bug_type, :status, presence: true

  mount_uploader :screenshot, ImageUploader
end
