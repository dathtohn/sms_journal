# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :topic

  validates :content, presence: true
  validates :user_id, presence: true
  validates :topic_id, presence: true, uniqueness: { scope: :user_id }

  default_scope order: 'posts.created_at DESC'
end
