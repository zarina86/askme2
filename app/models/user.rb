class User < ApplicationRecord
  has_secure_password

  before_validation  :capitalize_name, :downcase_nickname, :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  VALID_NAME_REGEX = /\A[a-zA-Z]+\z/.freeze
  
  VALID_NICKNAME_REGEX = /\A[a-z0-9_]+\z/.freeze

  VALID_COLOR_REGEX = /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/i.freeze


  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, format: {with: VALID_NAME_REGEX}, length: {maximum: 40}
  validates :nickname, presence: true, uniqueness: true, length: {maximum: 40}, format: { with: VALID_NICKNAME_REGEX }
  validates :navbar_color, presence: true, uniqueness: true, format: { with: VALID_COLOR_REGEX }
  has_many :questions, dependent: :delete_all
  
  private

  def capitalize_name
    name.capitalize!
  end
  
  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
