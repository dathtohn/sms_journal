class Response < ActiveRecord::Base
  attr_accessible :content, :question_id, :user_id
  belongs_to :user
  belongs_to :question
end
