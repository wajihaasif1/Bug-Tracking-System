class Project < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'

  has_many :user_projects 
  has_many :users, through: :user_projects
  #has_many :bugs, dependent: :destroy


  validates :title, presence: true, uniqueness: { case_sensitive: false }
  
end
