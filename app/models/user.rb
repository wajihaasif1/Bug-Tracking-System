class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_projects
  has_many :projects, through: :user_projects,  dependent: :destroy
  has_many :created_projects, foreign_key: 'creator_id', class_name: 'Project', dependent: :destroy

  # has_many :created_bugs, foreign_key: 'creator_id', class_name: 'Bug', dependent: :destroy
  # has_many :assigned_bugs, foreign_key: 'assign_to_id', class_name: 'Bug', dependent: :destroy



  enum role: [:manager, :developer, :qa]

end
