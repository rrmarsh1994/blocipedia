class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  default_scope { order('title ASC') }
  scope :visible_to, -> (user) { (user.premium? || user.admin?) ? all : where(:private => false) }

  validates :title, length: { minimum: 3 }, presence: true
  # validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true
end
