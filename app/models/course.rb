class Course < ApplicationRecord
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :announcements
  has_many :assignments
  has_many :lectures

  before_save :default_description
  
  validates :title, presence: true
  validates :short_description, presence: true, length: {maximum: 200}

  def default_description
    if self.description.empty?
      self.description = self.short_description
    end
  end
end
