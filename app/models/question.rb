class Question < ActiveRecord::Base
  attr_accessible :content, :user_id
  has_many :responses
end
