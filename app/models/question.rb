class Question < ActiveRecord::Base
  has_many :answers
  validates :title, presence: true
  validates :content, presence: true
  default_scope {order('created_at DESC') }
end
