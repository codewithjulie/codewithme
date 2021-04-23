class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :assignment

  validate :body_or_url_must_not_be_blank

  def self.search(search)
    if search
      users = User.where("first_name LIKE ?", "%" + search + "%")
      users += User.where("last_name LIKE ?", "%" + search + "%")
      users += User.where("username LIKE ?", "%" + search + "%")
      users = users.uniq


      if !users.empty?
        submissions = []
        Submission.all.each do |submission|
          users.each do |user|
            submissions << submission if submission.user_id == user.id
          end
        end
        return submissions
      else
        Submission.all
      end
    else
      Submission.all
    end
  end

  def body_or_url_must_not_be_blank
    if body.blank? && url.blank?
      errors.add(:submission, "must fill out at least one field")
    end
  end
end
