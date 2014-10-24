class Discussion < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :project
  has_many :comments
end
