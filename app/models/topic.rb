# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ActiveRecord::Base
  attr_accessible :content
  has_many :posts

  validates :content, presence: true

  default_scope order: 'topics.created_at DESC'
end
