class Quiz < ApplicationRecord

    belongs_to :user
    has_many :answers, dependent: :destroy, autosave: true
    validates_presence_of :user_id
    validates_presence_of :question
    validates_presence_of :answer

  def self.search search
    if search
      find(:all, conditions: ['quiz LIKE ?', "%#{search}%"])
    end
  end
    

end
