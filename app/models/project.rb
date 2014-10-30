class Project < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  has_many :tasks
  has_many :discussions
  belongs_to :category
  belongs_to :user

  mount_uploader :resource, ResourceUploader

  def self.search(search_term)
    where("title ILIKE :search_term OR description ILIKE :search_term", {search_term: '%'+search_term+'%'})
  end
end