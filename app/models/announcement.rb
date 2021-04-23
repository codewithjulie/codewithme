class Announcement < ApplicationRecord
  belongs_to :course
  validates :title, :body, presence: true
end
