class User < ActiveRecord::Base
  validates :username, presence: true,
            uniqueness: { case_sensitive: true },
            length: { minimum: 5, maximum: 35 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
