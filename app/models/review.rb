class Review < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: {message: 'Please provide a content'}
  validates :rating, presence: true
end
