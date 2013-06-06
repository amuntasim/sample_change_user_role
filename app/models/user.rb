class User < ActiveRecord::Base
  attr_accessible  :name, :posts_attributes
  has_many :posts
  accepts_nested_attributes_for :posts
end
