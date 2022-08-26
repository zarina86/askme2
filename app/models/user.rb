class User < ApplicationRecord
  has_secure_password

  before_save  :capitalize_name, :downcase_nickname

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  VALID_NAME_REGEX = /\A[a-zA-Z]+\z/.freeze
  
  VALID_NICKNAME_REGEX = /\A[a-z0-9_]+\z/.freeze


  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, format: {with: VALID_NAME_REGEX},length: {maximum: 40}
  validates :nickname, presence: true, uniqueness: true, length: {maximum: 40},  format: { with: VALID_NICKNAME_REGEX }

  def downcase_nickname
    nickname.downcase!
  end

  def capitalize_name
    name.capitalize!
  end
end
