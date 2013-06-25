class Post < ActiveRecord::Base
  attr_accessible :title, :user_id, :content, :tag_list

  acts_as_taggable
end
