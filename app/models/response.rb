class Response < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  def author
    if User.find_by(id: self.user_id)
      return User.find_by(id: self.user_id).username
    else
      return "deleted user"
    end
  end
end
