class Task < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  belongs_to :project
end
