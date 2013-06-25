class Account < ActiveRecord::Base
  attr_accessible :name,  :user_accounts_attributes
  has_many :user_accounts, :dependent => :destroy
  has_many :users, :through => :user_accounts
  has_many :user_without_accounts, :class_name => 'User', :finder_sql => Proc.new {
           %Q{
             SELECT *
             FROM users where id NOT IN (Select user_id from user_accounts where account_id = #{id})
           }
       }

  accepts_nested_attributes_for :user_accounts, reject_if:  proc { |attributes| attributes['user_id'] == '0' }

  def without_accounts
     new_record? ? User.all :  user_without_accounts
  end
end
