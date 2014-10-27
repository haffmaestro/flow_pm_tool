class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, dependent: :nullify
  has_many :comments, dependent: :nullify

  def get_user_name
    if user_name
      "#{user_name}".strip
    else
      email
    end
  end
end
