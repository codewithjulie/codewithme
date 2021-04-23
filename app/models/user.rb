class User < ApplicationRecord
  attr_accessor :activation_token
  before_save :downcase_email
  before_create :create_activation_digest

  has_many :posts
  has_many :comments
  has_many :submissions
  has_many :user_courses
  has_many :courses, through: :user_courses

  validates :first_name, :last_name, :password_confirmation, presence: true
  validates :username, presence: true, 
                        confirmation: true,
                        uniqueness: {case_sensitive: false}, 
                        length: {minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                      uniqueness: {case_sensitive: false}, 
                      length: {maximum: 255},
                      format: {with: VALID_EMAIL_REGEX}

  validates :password, presence: true,
                        length: {minimum: 8, maximum: 255}    

  has_secure_password

  def self.search(search)
    if search
      users = User.where("first_name LIKE ?", "%" + search + "%")
      users += User.where("last_name LIKE ?", "%" + search + "%")
      users += User.where("username LIKE ?", "%" + search + "%")
      users += User.where("email LIKE ?", "%" + search + "%")
      users = users.uniq
      if !users.empty?
        users
      else
        User.all
      end
    else
      User.all
    end
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def enrolled?(course)
    unless course.nil? || self.user_courses.find_by(course_id: course.id).nil?
      user_course = self.user_courses.find_by(course_id: course.id)
      return user_course.enrolled
    end
  end

  def pending_enrollment?(course)
    user_course = UserCourse.where(user_id: self.id, course_id: course.id).first
    return user_course && !user_course.enrolled?
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_mail
    UserMailer.account_activation(self).deliver_now
  end 

  private

  def downcase_email
    self.email = email.downcase
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
  end

  #Returns a random token for session
  def User.new_token
      SecureRandom.urlsafe_base64
  end

  def create_activation_digest
    # Create the token
    self.activation_token = User.new_token
    # Create the digest
    self.activation_digest = User.digest(activation_token)
  end

end
