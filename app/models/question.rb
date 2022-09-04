class Question < ApplicationRecord
  VALID_BODY_REGEX = /\A[«a-zA-Zа-яА-Я0-9 ,.;'"+-?!%$»]*(?:\R[«а-яА-Я0-9 ,.;'"+-?!%$»]*)*\z/.freeze

  validates :body, presence: true, length: {maximum: 280}, format: { with: VALID_BODY_REGEX }
  validates :user_id, presence: true
  
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  def hidden?
    hidden
  end
end
