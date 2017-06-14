class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  validates :user_id, presence: true
  validates :quiz_id, presence: true
  validates_presence_of :ans, message: "Answer it first before you proceed", allow_nil: false
end
