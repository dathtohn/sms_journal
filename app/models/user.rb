class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :verified

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true

end
