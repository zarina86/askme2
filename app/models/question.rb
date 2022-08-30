class Question < ApplicationRecord
  validates :body, presence: true, length: {maximum: 280}
  validates :user_id, presence: true

  belongs_to :user

  def hidden?
    hidden
  end
end
