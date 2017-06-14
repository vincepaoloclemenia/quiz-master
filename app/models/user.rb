class User < ApplicationRecord

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :user_type, presence: true
  attr_accessor :other
  has_many :quizzes, dependent: :destroy #remove user's question if his account is deleted

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  USER_TYPE = ["Teacher", "Student"]
  has_many :answers, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "enroller_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "enroller_id", dependent: :destroy
  has_many :enrolling, through: :active_relationships, source: :enrolled
  has_many :enrollers, through: :passive_relationships, source: :enroller

  def enroll(other)
  	active_relationships.create(enrolled_id: other.id)
  end

  

  def enrolling?(other)
  	enrolling.include?(other)
  end

  
end
