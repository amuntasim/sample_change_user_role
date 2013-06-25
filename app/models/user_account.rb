class UserAccount < ActiveRecord::Base
  attr_accessible :account_admin, :account_id, :user_id
  belongs_to :user
  belongs_to :account
end
