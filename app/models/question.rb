class Question < ApplicationRecord
  VALID_BODY_REGEX = /\A[«a-zA-Zа-яА-Я0-9 ,.;'"+-?!%$»]*(?:\R[«а-яА-Я0-9 ,.;'"+-?!%$»]*)*\z/.freeze

  validates :body, presence: true, length: {maximum: 280}, format: { with: VALID_BODY_REGEX }
  validates :answer, presence: true, length: {maximum: 280}, format: { with: VALID_BODY_REGEX }, on: :update
  validates :user_id, presence: true
  
  belongs_to :user
  belongs_to :author, class_name: "User"
  
  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtaq_questions 
  
  def hidden?
    hidden
  end
end
