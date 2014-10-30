class Comment < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :discussion
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def like_for(user)
    likes.find_by_user_id user
  end
end
