class Forum < ApplicationRecord
  has_many :posts

  validates :title, presence: true, length: {minimum: 1, maximum: 20}
end
