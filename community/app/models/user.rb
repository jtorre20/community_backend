class User < ApplicationRecord

  has_many :moods
  has_many :text
  has_many :goals
  has_secure_password

  before_save {self.email = email.downcase}
  validates :username, presence: true, length: { maximum: 50 }, case_sensitive: false
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }



  validates :password, presence: true, length: { minimum: 6 }
end
