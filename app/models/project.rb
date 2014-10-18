class Project < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  has_many :tasks
  def self.search(search_term)
    where("title ILIKE :search_term OR description ILIKE :search_term", {search_term: '%'+search_term+'%'})
  end

  # before_save :evaluate_date_time

  # private

  # def evaluate_date_time
  #   self.due_date = self.due_date
  # end
end