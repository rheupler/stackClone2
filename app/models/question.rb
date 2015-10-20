class Question < ActiveRecord::Base
  acts_as_votable
  has_many :answers
  validates :title, presence: true
  validates :content, presence: true
  default_scope {order('created_at DESC') }
end
