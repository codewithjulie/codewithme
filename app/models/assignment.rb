class Assignment < ApplicationRecord
  has_many :submissions
  belongs_to :course

  validates :name, :content, presence: true
end
