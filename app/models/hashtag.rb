class Hashtag < ApplicationRecord
  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtaq_questions 
  
  validates: :text, presence: true
end
