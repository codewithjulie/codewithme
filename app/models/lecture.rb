class Lecture < ApplicationRecord
  belongs_to :course
  validates :name, :url, :description, presence: true
end
